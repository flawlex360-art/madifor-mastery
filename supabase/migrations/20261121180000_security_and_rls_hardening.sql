-- ============================================================================
-- Madifor Mastery — Migration: Security, Auth, Trigger & RLS Hardening
-- Fixes:
--   - Removes plaintext learners.login_password column
--   - Drops destructive debug RPC test_psychometrics_evidence()
--   - Enforces NOT NULL + CHECK constraints on teachers (is_admin, status)
--   - Adds privilege-escalation prevention trigger on teachers
--   - Replaces all permissive/recursive RLS policies across all 18 tables
--   - Hardens all SECURITY DEFINER RPCs with auth checks, search_path, & REVOKE anon
--   - Restores missing update_learner_credentials & self_practice UPDATE policies
-- ============================================================================

-- 1. Schema hygiene & destructive debug cleanup
ALTER TABLE public.learners DROP COLUMN IF EXISTS login_password;
ALTER TABLE public.learners ADD COLUMN IF NOT EXISTS email TEXT;

DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT oid::regprocedure AS sig
        FROM pg_proc
        WHERE proname IN (
            'update_learner_credentials',
            'test_psychometrics_evidence',
            'get_adaptive_question'
        )
          AND pronamespace = 'public'::regnamespace
    LOOP
        EXECUTE 'DROP FUNCTION IF EXISTS ' || r.sig || ' CASCADE';
    END LOOP;
END $$;

UPDATE public.teachers SET is_admin = FALSE WHERE is_admin IS NULL;
ALTER TABLE public.teachers
    ALTER COLUMN is_admin SET DEFAULT FALSE,
    ALTER COLUMN is_admin SET NOT NULL;

UPDATE public.teachers
SET status = 'active'
WHERE status IS NULL OR status NOT IN ('active', 'suspended');

ALTER TABLE public.teachers
    ALTER COLUMN status SET DEFAULT 'active',
    ALTER COLUMN status SET NOT NULL;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
        WHERE conname = 'teachers_status_check'
          AND conrelid = 'public.teachers'::regclass
    ) THEN
        ALTER TABLE public.teachers
            ADD CONSTRAINT teachers_status_check CHECK (status IN ('active', 'suspended'));
    END IF;
END $$;

-- 2. Non-recursive SECURITY DEFINER helper functions (all with SET search_path = public)
CREATE OR REPLACE FUNCTION public.get_teacher_id()
RETURNS UUID
LANGUAGE sql
SECURITY DEFINER
STABLE
SET search_path = public
AS $$
    SELECT id FROM public.teachers WHERE id = auth.uid();
$$;

CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN
LANGUAGE sql
SECURITY DEFINER
STABLE
SET search_path = public
AS $$
    SELECT EXISTS (
        SELECT 1 FROM public.teachers
        WHERE id = auth.uid()
          AND is_admin = TRUE
          AND status = 'active'
    );
$$;

CREATE OR REPLACE FUNCTION public.is_active_teacher()
RETURNS BOOLEAN
LANGUAGE sql
SECURITY DEFINER
STABLE
SET search_path = public
AS $$
    SELECT EXISTS (
        SELECT 1 FROM public.teachers
        WHERE id = auth.uid()
          AND status = 'active'
    );
$$;

CREATE OR REPLACE FUNCTION public.get_teacher_school_id()
RETURNS UUID
LANGUAGE sql
SECURITY DEFINER
STABLE
SET search_path = public
AS $$
    SELECT school_id FROM public.teachers
    WHERE id = auth.uid()
      AND status = 'active';
$$;

CREATE OR REPLACE FUNCTION public.get_learner_class_id()
RETURNS UUID
LANGUAGE sql
SECURITY DEFINER
STABLE
SET search_path = public
AS $$
    SELECT class_id FROM public.learners WHERE id = auth.uid();
$$;

CREATE OR REPLACE FUNCTION public.get_learner_teacher_id()
RETURNS UUID
LANGUAGE sql
SECURITY DEFINER
STABLE
SET search_path = public
AS $$
    SELECT c.teacher_id
    FROM public.learners l
    JOIN public.classes c ON c.id = l.class_id
    WHERE l.id = auth.uid();
$$;

CREATE OR REPLACE FUNCTION public.is_teacher_of_learner(p_learner_id UUID)
RETURNS BOOLEAN
LANGUAGE sql
SECURITY DEFINER
STABLE
SET search_path = public
AS $$
    SELECT EXISTS (
        SELECT 1
        FROM public.learners l
        JOIN public.classes c ON c.id = l.class_id
        WHERE l.id = p_learner_id
          AND c.teacher_id = auth.uid()
          AND public.is_active_teacher()
    );
$$;

-- 3. Privilege-escalation prevention trigger on teachers
CREATE OR REPLACE FUNCTION public.protect_teacher_privileged_fields()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    IF auth.uid() IS NOT NULL THEN
        IF TG_OP = 'INSERT' THEN
            IF EXISTS (SELECT 1 FROM public.learners WHERE id = auth.uid()) THEN
                RAISE EXCEPTION 'Learners cannot register teacher profiles';
            END IF;
            NEW.is_admin := FALSE;
            NEW.status := 'active';
            NEW.role := 'teacher';
        ELSIF TG_OP = 'UPDATE' THEN
            IF NOT public.is_admin() THEN
                NEW.is_admin := OLD.is_admin;
                NEW.status := OLD.status;
                NEW.role := OLD.role;
                NEW.school_id := OLD.school_id;
            END IF;
        END IF;
    END IF;
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_protect_teacher_privileged_fields ON public.teachers;
CREATE TRIGGER trg_protect_teacher_privileged_fields
    BEFORE INSERT OR UPDATE ON public.teachers
    FOR EACH ROW
    EXECUTE FUNCTION public.protect_teacher_privileged_fields();

-- 4. Drop ALL existing policies across all 18 public tables for a clean, zero-leak baseline
DO $$
DECLARE
    pol RECORD;
BEGIN
    FOR pol IN
        SELECT schemaname, tablename, policyname
        FROM pg_policies
        WHERE schemaname = 'public'
          AND tablename IN (
              'schools', 'teachers', 'classes', 'learners',
              'subjects', 'strands', 'sub_strands', 'topics', 'questions',
              'attempts', 'review_queue', 'topic_mastery', 'class_subjects',
              'self_practice_sessions', 'mastery_history', 'teacher_invite_codes',
              'learner_abilities', 'question_parameters'
          )
    LOOP
        EXECUTE format('DROP POLICY IF EXISTS %I ON %I.%I', pol.policyname, pol.schemaname, pol.tablename);
    END LOOP;
END $$;

-- 5. Recreate strict, non-recursive, authenticated-only RLS policies
-- SCHOOLS
CREATE POLICY schools_select ON public.schools
    FOR SELECT TO authenticated USING (
        id = public.get_teacher_school_id() OR public.is_admin()
    );

CREATE POLICY schools_insert ON public.schools
    FOR INSERT TO authenticated WITH CHECK (
        public.is_active_teacher() OR public.is_admin()
    );

CREATE POLICY schools_update ON public.schools
    FOR UPDATE TO authenticated USING (
        public.is_admin()
        OR (
            public.is_active_teacher()
            AND id = public.get_teacher_school_id()
            AND EXISTS (SELECT 1 FROM public.teachers WHERE id = auth.uid() AND role = 'school_admin')
        )
    )
    WITH CHECK (
        public.is_admin()
        OR (
            public.is_active_teacher()
            AND id = public.get_teacher_school_id()
            AND EXISTS (SELECT 1 FROM public.teachers WHERE id = auth.uid() AND role = 'school_admin')
        )
    );

-- TEACHERS (suspended teachers can still read their own row so UI shows Account Suspended)
CREATE POLICY teachers_select ON public.teachers
    FOR SELECT TO authenticated USING (
        id = auth.uid()
        OR public.is_admin()
        OR (
            public.is_active_teacher()
            AND school_id IS NOT NULL
            AND school_id = public.get_teacher_school_id()
        )
    );

CREATE POLICY teachers_insert_own ON public.teachers
    FOR INSERT TO authenticated WITH CHECK (id = auth.uid());

CREATE POLICY teachers_update ON public.teachers
    FOR UPDATE TO authenticated USING (
        id = auth.uid() OR public.is_admin()
    )
    WITH CHECK (
        id = auth.uid() OR public.is_admin()
    );

-- CLASSES (uses get_learner_class_id() to prevent circular recursion with learners)
CREATE POLICY classes_select ON public.classes
    FOR SELECT TO authenticated USING (
        (public.is_active_teacher() AND teacher_id = auth.uid())
        OR id = public.get_learner_class_id()
        OR public.is_admin()
    );

CREATE POLICY classes_insert ON public.classes
    FOR INSERT TO authenticated WITH CHECK (
        (public.is_active_teacher() AND teacher_id = auth.uid())
        OR public.is_admin()
    );

CREATE POLICY classes_update ON public.classes
    FOR UPDATE TO authenticated USING (
        (public.is_active_teacher() AND teacher_id = auth.uid())
        OR public.is_admin()
    )
    WITH CHECK (
        (public.is_active_teacher() AND teacher_id = auth.uid())
        OR public.is_admin()
    );

CREATE POLICY classes_delete ON public.classes
    FOR DELETE TO authenticated USING (
        (public.is_active_teacher() AND teacher_id = auth.uid())
        OR public.is_admin()
    );

-- LEARNERS (zero anon access; teachers only manage learners in their own classes)
CREATE POLICY learners_select ON public.learners
    FOR SELECT TO authenticated USING (
        id = auth.uid()
        OR (public.is_active_teacher() AND class_id IN (SELECT id FROM public.classes WHERE teacher_id = auth.uid()))
        OR public.is_admin()
    );

CREATE POLICY learners_insert ON public.learners
    FOR INSERT TO authenticated WITH CHECK (
        (public.is_active_teacher() AND class_id IN (SELECT id FROM public.classes WHERE teacher_id = auth.uid()))
        OR public.is_admin()
    );

CREATE POLICY learners_update ON public.learners
    FOR UPDATE TO authenticated USING (
        (public.is_active_teacher() AND class_id IN (SELECT id FROM public.classes WHERE teacher_id = auth.uid()))
        OR public.is_admin()
    )
    WITH CHECK (
        (public.is_active_teacher() AND class_id IN (SELECT id FROM public.classes WHERE teacher_id = auth.uid()))
        OR public.is_admin()
    );

CREATE POLICY learners_delete ON public.learners
    FOR DELETE TO authenticated USING (
        (public.is_active_teacher() AND class_id IN (SELECT id FROM public.classes WHERE teacher_id = auth.uid()))
        OR public.is_admin()
    );

-- CURRICULUM
CREATE POLICY subjects_select ON public.subjects
    FOR SELECT TO authenticated USING (true);
CREATE POLICY subjects_admin_all ON public.subjects
    FOR ALL TO authenticated USING (public.is_admin()) WITH CHECK (public.is_admin());

CREATE POLICY strands_select ON public.strands
    FOR SELECT TO authenticated USING (true);
CREATE POLICY strands_admin_all ON public.strands
    FOR ALL TO authenticated USING (public.is_admin()) WITH CHECK (public.is_admin());

CREATE POLICY sub_strands_select ON public.sub_strands
    FOR SELECT TO authenticated USING (true);
CREATE POLICY sub_strands_admin_all ON public.sub_strands
    FOR ALL TO authenticated USING (public.is_admin()) WITH CHECK (public.is_admin());

CREATE POLICY topics_select ON public.topics
    FOR SELECT TO authenticated USING (true);
CREATE POLICY topics_insert ON public.topics
    FOR INSERT TO authenticated WITH CHECK (public.is_active_teacher() OR public.is_admin());
CREATE POLICY topics_update ON public.topics
    FOR UPDATE TO authenticated
    USING (public.is_active_teacher() OR public.is_admin())
    WITH CHECK (public.is_active_teacher() OR public.is_admin());
CREATE POLICY topics_delete ON public.topics
    FOR DELETE TO authenticated USING (public.is_admin());

-- QUESTIONS
CREATE POLICY questions_select ON public.questions
    FOR SELECT TO authenticated USING (
        visibility = 'shared'
        OR owner_teacher_id = auth.uid()
        OR owner_teacher_id = public.get_learner_teacher_id()
        OR (
            visibility = 'school'
            AND public.get_teacher_school_id() IS NOT NULL
            AND owner_teacher_id IN (
                SELECT id FROM public.teachers WHERE school_id = public.get_teacher_school_id()
            )
        )
        OR public.is_admin()
    );

CREATE POLICY questions_insert ON public.questions
    FOR INSERT TO authenticated WITH CHECK (
        (public.is_active_teacher() AND owner_teacher_id = auth.uid())
        OR public.is_admin()
    );

CREATE POLICY questions_update ON public.questions
    FOR UPDATE TO authenticated USING (
        (public.is_active_teacher() AND owner_teacher_id = auth.uid())
        OR public.is_admin()
    )
    WITH CHECK (
        (public.is_active_teacher() AND owner_teacher_id = auth.uid())
        OR public.is_admin()
    );

CREATE POLICY questions_delete ON public.questions
    FOR DELETE TO authenticated USING (
        (public.is_active_teacher() AND owner_teacher_id = auth.uid())
        OR public.is_admin()
    );

-- ATTEMPTS, REVIEW QUEUE, TOPIC MASTERY, MASTERY HISTORY, LEARNER ABILITIES
-- Reads are scoped; direct client writes are disabled (mutations go through submit_attempt & triggers)
CREATE POLICY attempts_select ON public.attempts
    FOR SELECT TO authenticated USING (
        learner_id = auth.uid()
        OR public.is_teacher_of_learner(learner_id)
        OR public.is_admin()
    );

CREATE POLICY review_queue_select ON public.review_queue
    FOR SELECT TO authenticated USING (
        learner_id = auth.uid()
        OR public.is_teacher_of_learner(learner_id)
        OR public.is_admin()
    );

CREATE POLICY topic_mastery_select ON public.topic_mastery
    FOR SELECT TO authenticated USING (
        learner_id = auth.uid()
        OR public.is_teacher_of_learner(learner_id)
        OR public.is_admin()
    );

CREATE POLICY mastery_history_select ON public.mastery_history
    FOR SELECT TO authenticated USING (
        learner_id = auth.uid()
        OR public.is_teacher_of_learner(learner_id)
        OR public.is_admin()
    );

CREATE POLICY learner_abilities_select ON public.learner_abilities
    FOR SELECT TO authenticated USING (
        learner_id = auth.uid()
        OR public.is_teacher_of_learner(learner_id)
        OR public.is_admin()
    );

-- CLASS SUBJECTS
CREATE POLICY class_subjects_all ON public.class_subjects
    FOR ALL TO authenticated USING (
        (public.is_active_teacher() AND class_id IN (SELECT id FROM public.classes WHERE teacher_id = auth.uid()))
        OR public.is_admin()
    )
    WITH CHECK (
        (public.is_active_teacher() AND class_id IN (SELECT id FROM public.classes WHERE teacher_id = auth.uid()))
        OR public.is_admin()
    );

-- SELF-PRACTICE SESSIONS (adds missing UPDATE policy for ending sessions)
CREATE POLICY self_practice_select ON public.self_practice_sessions
    FOR SELECT TO authenticated USING (
        learner_id = auth.uid()
        OR public.is_teacher_of_learner(learner_id)
        OR public.is_admin()
    );

CREATE POLICY self_practice_insert ON public.self_practice_sessions
    FOR INSERT TO authenticated WITH CHECK (
        learner_id = auth.uid()
    );

CREATE POLICY self_practice_update ON public.self_practice_sessions
    FOR UPDATE TO authenticated
    USING (learner_id = auth.uid())
    WITH CHECK (learner_id = auth.uid());

-- TEACHER INVITE CODES (no public/anon exposure)
CREATE POLICY invite_codes_select ON public.teacher_invite_codes
    FOR SELECT TO authenticated USING (
        public.is_admin()
        OR (
            public.is_active_teacher()
            AND school_id = public.get_teacher_school_id()
            AND EXISTS (SELECT 1 FROM public.teachers WHERE id = auth.uid() AND role = 'school_admin')
        )
    );

CREATE POLICY invite_codes_insert ON public.teacher_invite_codes
    FOR INSERT TO authenticated WITH CHECK (
        public.is_admin()
        OR (
            public.is_active_teacher()
            AND created_by = auth.uid()
            AND school_id = public.get_teacher_school_id()
            AND EXISTS (SELECT 1 FROM public.teachers WHERE id = auth.uid() AND role = 'school_admin')
        )
    );

CREATE POLICY invite_codes_update ON public.teacher_invite_codes
    FOR UPDATE TO authenticated USING (
        public.is_admin()
        OR (
            public.is_active_teacher()
            AND school_id = public.get_teacher_school_id()
            AND EXISTS (SELECT 1 FROM public.teachers WHERE id = auth.uid() AND role = 'school_admin')
        )
    );

CREATE POLICY invite_codes_delete ON public.teacher_invite_codes
    FOR DELETE TO authenticated USING (
        public.is_admin()
        OR (
            public.is_active_teacher()
            AND school_id = public.get_teacher_school_id()
            AND EXISTS (SELECT 1 FROM public.teachers WHERE id = auth.uid() AND role = 'school_admin')
        )
    );

-- QUESTION PARAMETERS (scoped to visible questions, authenticated only)
CREATE POLICY question_parameters_select ON public.question_parameters
    FOR SELECT TO authenticated USING (
        EXISTS (
            SELECT 1 FROM public.questions q
            WHERE q.id = question_id
              AND (
                  q.visibility = 'shared'
                  OR q.owner_teacher_id = auth.uid()
                  OR (
                      q.visibility = 'school'
                      AND public.get_teacher_school_id() IS NOT NULL
                      AND q.owner_teacher_id IN (
                          SELECT id FROM public.teachers WHERE school_id = public.get_teacher_school_id()
                      )
                  )
                  OR public.is_admin()
              )
        )
    );

-- 6. Make mastery snapshot trigger SECURITY DEFINER & fire on INSERT OR UPDATE
CREATE OR REPLACE FUNCTION public.record_mastery_snapshot()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    IF TG_OP = 'INSERT'
       OR OLD.first_pass_pct IS DISTINCT FROM NEW.first_pass_pct
       OR OLD.status IS DISTINCT FROM NEW.status THEN
        INSERT INTO public.mastery_history (learner_id, topic_id, first_pass_pct, status)
        VALUES (NEW.learner_id, NEW.topic_id, NEW.first_pass_pct, NEW.status);
    END IF;
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_mastery_snapshot ON public.topic_mastery;
CREATE TRIGGER trg_mastery_snapshot
    AFTER INSERT OR UPDATE ON public.topic_mastery
    FOR EACH ROW
    EXECUTE FUNCTION public.record_mastery_snapshot();

-- 7. Harden account management & school RPCs
CREATE OR REPLACE FUNCTION public.create_learner_account(
    p_class_id UUID,
    p_display_name TEXT,
    p_email TEXT,
    p_password TEXT
)
RETURNS UUID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, extensions
AS $$
DECLARE
    v_user_id UUID;
    v_school_id UUID;
    v_learner_code TEXT;
    v_clean_email TEXT;
    v_clean_name TEXT;
    v_teacher_id UUID;
BEGIN
    SELECT teacher_id, school_id INTO v_teacher_id, v_school_id
    FROM public.classes
    WHERE id = p_class_id;

    IF v_teacher_id IS NULL THEN
        RAISE EXCEPTION 'Class not found';
    END IF;

    IF NOT (public.is_admin() OR (public.is_active_teacher() AND v_teacher_id = auth.uid())) THEN
        RAISE EXCEPTION 'Unauthorized: you do not own this class';
    END IF;

    v_clean_name := TRIM(COALESCE(p_display_name, ''));
    v_clean_email := LOWER(TRIM(COALESCE(p_email, '')));

    IF length(v_clean_name) < 1 THEN
        RAISE EXCEPTION 'Display name is required';
    END IF;
    IF length(v_clean_email) < 3 OR position('@' IN v_clean_email) = 0 THEN
        RAISE EXCEPTION 'A valid email is required';
    END IF;
    IF length(TRIM(COALESCE(p_password, ''))) < 6 THEN
        RAISE EXCEPTION 'Password must be at least 6 characters';
    END IF;

    IF EXISTS (SELECT 1 FROM auth.users WHERE LOWER(email) = v_clean_email) THEN
        RAISE EXCEPTION 'An account with this email already exists';
    END IF;

    LOOP
        v_learner_code := encode(gen_random_bytes(4), 'hex');
        EXIT WHEN NOT EXISTS (
            SELECT 1 FROM public.learners
            WHERE class_id = p_class_id AND learner_code = v_learner_code
        );
    END LOOP;

    v_user_id := gen_random_uuid();

    INSERT INTO auth.users (
        instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
        raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
        confirmation_token, email_change, email_change_token_new, recovery_token
    ) VALUES (
        '00000000-0000-0000-0000-000000000000',
        v_user_id,
        'authenticated',
        'authenticated',
        v_clean_email,
        crypt(p_password, gen_salt('bf')),
        NOW(),
        '{"provider":"email","providers":["email"]}'::jsonb,
        jsonb_build_object('full_name', v_clean_name),
        NOW(),
        NOW(),
        '', '', '', ''
    );

    INSERT INTO auth.identities (
        id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        v_user_id,
        jsonb_build_object(
            'sub', v_user_id::text,
            'email', v_clean_email,
            'email_verified', true,
            'phone_verified', false
        ),
        'email',
        v_user_id::text,
        NOW(),
        NOW(),
        NOW()
    );

    INSERT INTO public.learners (id, class_id, school_id, display_name, learner_code, email)
    VALUES (v_user_id, p_class_id, v_school_id, v_clean_name, v_learner_code, v_clean_email);

    RETURN v_user_id;
END;
$$;

CREATE OR REPLACE FUNCTION public.update_learner_credentials(
    p_learner_id UUID,
    p_display_name TEXT DEFAULT NULL,
    p_email TEXT DEFAULT NULL,
    p_password TEXT DEFAULT NULL
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, extensions
AS $$
DECLARE
    v_clean_name TEXT;
    v_clean_email TEXT;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public.learners WHERE id = p_learner_id) THEN
        RAISE EXCEPTION 'Learner not found';
    END IF;

    IF NOT (public.is_admin() OR public.is_teacher_of_learner(p_learner_id)) THEN
        RAISE EXCEPTION 'Unauthorized: you do not manage this learner';
    END IF;

    v_clean_name := NULLIF(TRIM(COALESCE(p_display_name, '')), '');
    v_clean_email := NULLIF(LOWER(TRIM(COALESCE(p_email, ''))), '');

    IF v_clean_name IS NOT NULL THEN
        UPDATE public.learners
        SET display_name = v_clean_name
        WHERE id = p_learner_id;

        UPDATE auth.users
        SET raw_user_meta_data = COALESCE(raw_user_meta_data, '{}'::jsonb) || jsonb_build_object('full_name', v_clean_name),
            updated_at = NOW()
        WHERE id = p_learner_id;
    END IF;

    IF v_clean_email IS NOT NULL THEN
        IF position('@' IN v_clean_email) = 0 THEN
            RAISE EXCEPTION 'Invalid email format';
        END IF;
        IF EXISTS (SELECT 1 FROM auth.users WHERE LOWER(email) = v_clean_email AND id <> p_learner_id) THEN
            RAISE EXCEPTION 'Another account already uses this email';
        END IF;

        UPDATE public.learners
        SET email = v_clean_email
        WHERE id = p_learner_id;

        UPDATE auth.users
        SET email = v_clean_email,
            updated_at = NOW()
        WHERE id = p_learner_id;

        UPDATE auth.identities
        SET identity_data = COALESCE(identity_data, '{}'::jsonb) || jsonb_build_object('email', v_clean_email, 'email_verified', true),
            updated_at = NOW()
        WHERE user_id = p_learner_id AND provider = 'email';
    END IF;

    IF p_password IS NOT NULL AND length(TRIM(p_password)) > 0 THEN
        IF length(TRIM(p_password)) < 6 THEN
            RAISE EXCEPTION 'Password must be at least 6 characters';
        END IF;

        UPDATE auth.users
        SET encrypted_password = crypt(p_password, gen_salt('bf')),
            updated_at = NOW()
        WHERE id = p_learner_id;
    END IF;
END;
$$;

CREATE OR REPLACE FUNCTION public.delete_learner_account(p_learner_id UUID)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public.learners WHERE id = p_learner_id) THEN
        RAISE EXCEPTION 'Learner not found';
    END IF;

    IF NOT (public.is_admin() OR public.is_teacher_of_learner(p_learner_id)) THEN
        RAISE EXCEPTION 'Unauthorized: you do not manage this learner';
    END IF;

    DELETE FROM public.learners WHERE id = p_learner_id;
    DELETE FROM auth.identities WHERE user_id = p_learner_id;
    DELETE FROM auth.users WHERE id = p_learner_id;
END;
$$;

CREATE OR REPLACE FUNCTION public.suspend_teacher_account(p_teacher_id UUID, p_status TEXT)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    IF NOT public.is_admin() THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;
    IF p_teacher_id = auth.uid() THEN
        RAISE EXCEPTION 'Cannot suspend your own account';
    END IF;
    IF p_status NOT IN ('active', 'suspended') THEN
        RAISE EXCEPTION 'Invalid status value';
    END IF;
    IF EXISTS (SELECT 1 FROM public.teachers WHERE id = p_teacher_id AND is_admin = TRUE) THEN
        RAISE EXCEPTION 'Cannot suspend a Super Admin account';
    END IF;

    UPDATE public.teachers SET status = p_status WHERE id = p_teacher_id;
END;
$$;

CREATE OR REPLACE FUNCTION public.delete_teacher_account(p_teacher_id UUID)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_learner_id UUID;
BEGIN
    IF NOT public.is_admin() THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;
    IF p_teacher_id = auth.uid() THEN
        RAISE EXCEPTION 'Cannot delete your own account';
    END IF;
    IF EXISTS (SELECT 1 FROM public.teachers WHERE id = p_teacher_id AND is_admin = TRUE) THEN
        RAISE EXCEPTION 'Cannot delete a Super Admin account';
    END IF;

    FOR v_learner_id IN
        SELECT l.id
        FROM public.learners l
        JOIN public.classes c ON l.class_id = c.id
        WHERE c.teacher_id = p_teacher_id
    LOOP
        DELETE FROM public.learners WHERE id = v_learner_id;
        DELETE FROM auth.identities WHERE user_id = v_learner_id;
        DELETE FROM auth.users WHERE id = v_learner_id;
    END LOOP;

    DELETE FROM public.classes WHERE teacher_id = p_teacher_id;
    DELETE FROM public.teachers WHERE id = p_teacher_id;
    DELETE FROM auth.identities WHERE user_id = p_teacher_id;
    DELETE FROM auth.users WHERE id = p_teacher_id;
END;
$$;

CREATE OR REPLACE FUNCTION public.join_school_via_invite(
    p_teacher_id UUID,
    p_invite_code TEXT
)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_school_id UUID;
    v_code_id UUID;
    v_expires TIMESTAMPTZ;
BEGIN
    IF auth.uid() IS NULL OR auth.uid() <> p_teacher_id OR NOT public.is_active_teacher() THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;

    SELECT id, school_id, expires_at
    INTO v_code_id, v_school_id, v_expires
    FROM public.teacher_invite_codes
    WHERE code = p_invite_code
      AND uses_remaining > 0
    FOR UPDATE;

    IF v_school_id IS NULL THEN
        RETURN FALSE;
    END IF;

    IF v_expires IS NOT NULL AND v_expires < NOW() THEN
        RETURN FALSE;
    END IF;

    UPDATE public.teachers SET school_id = v_school_id WHERE id = p_teacher_id;
    UPDATE public.teacher_invite_codes
    SET uses_remaining = uses_remaining - 1
    WHERE id = v_code_id;

    RETURN TRUE;
END;
$$;

-- 8. Harden learner data RPCs (auth checks + search_path + enhanced homepage metadata)
CREATE OR REPLACE FUNCTION public.get_due_reviews(
    p_learner_id UUID,
    p_limit INTEGER DEFAULT 4
)
RETURNS TABLE (
    question_id UUID,
    topic_id UUID,
    stage TEXT,
    due_at TIMESTAMPTZ
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    IF NOT (
        auth.uid() = p_learner_id
        OR public.is_teacher_of_learner(p_learner_id)
        OR public.is_admin()
    ) THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;

    RETURN QUERY
    SELECT rq.question_id, rq.topic_id, rq.stage, rq.due_at
    FROM public.review_queue rq
    WHERE rq.learner_id = p_learner_id
      AND rq.stage != 'retained'
      AND rq.due_at IS NOT NULL
      AND rq.due_at <= NOW()
    ORDER BY rq.due_at ASC
    LIMIT p_limit;
END;
$$;

CREATE OR REPLACE FUNCTION public.calculate_bece_readiness(
    p_learner_id UUID,
    p_subject_id UUID
)
RETURNS NUMERIC
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_class_level TEXT;
    v_total_topics INTEGER;
    v_retained_count INTEGER;
    v_first_pass_count INTEGER;
    v_readiness NUMERIC;
BEGIN
    IF NOT (
        auth.uid() = p_learner_id
        OR public.is_teacher_of_learner(p_learner_id)
        OR public.is_admin()
    ) THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;

    SELECT c.class_level INTO v_class_level
    FROM public.learners l
    JOIN public.classes c ON c.id = l.class_id
    WHERE l.id = p_learner_id;

    SELECT COUNT(*) INTO v_total_topics
    FROM public.topics t
    JOIN public.sub_strands ss ON t.sub_strand_id = ss.id
    JOIN public.strands s ON ss.strand_id = s.id
    WHERE s.subject_id = p_subject_id
      AND (v_class_level IS NULL OR t.class_level = v_class_level);

    IF v_total_topics = 0 THEN
        RETURN 0;
    END IF;

    SELECT COUNT(*) INTO v_retained_count
    FROM public.topic_mastery tm
    JOIN public.topics t ON tm.topic_id = t.id
    JOIN public.sub_strands ss ON t.sub_strand_id = ss.id
    JOIN public.strands s ON ss.strand_id = s.id
    WHERE tm.learner_id = p_learner_id
      AND s.subject_id = p_subject_id
      AND (v_class_level IS NULL OR t.class_level = v_class_level)
      AND (tm.retained_mastered = TRUE OR tm.status = 'retained_mastered');

    SELECT COUNT(*) INTO v_first_pass_count
    FROM public.topic_mastery tm
    JOIN public.topics t ON tm.topic_id = t.id
    JOIN public.sub_strands ss ON t.sub_strand_id = ss.id
    JOIN public.strands s ON ss.strand_id = s.id
    WHERE tm.learner_id = p_learner_id
      AND s.subject_id = p_subject_id
      AND (v_class_level IS NULL OR t.class_level = v_class_level)
      AND (
          tm.first_pass_mastered = TRUE
          OR tm.retained_mastered = TRUE
          OR tm.status IN ('first_pass_mastered', 'retained_mastered')
      );

    v_readiness := (v_retained_count::NUMERIC / v_total_topics * 0.7)
                 + (v_first_pass_count::NUMERIC / v_total_topics * 0.3);

    RETURN LEAST(100.0, ROUND(v_readiness * 100, 1));
END;
$$;

CREATE OR REPLACE FUNCTION public.get_learner_homepage_data(p_learner_id UUID, p_class_level TEXT)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_topics JSON;
    v_mastery JSON;
    v_due_reviews INT;
    v_teacher_id UUID;
BEGIN
    IF NOT (
        auth.uid() = p_learner_id
        OR public.is_teacher_of_learner(p_learner_id)
        OR public.is_admin()
    ) THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;

    SELECT c.teacher_id INTO v_teacher_id
    FROM public.learners l
    JOIN public.classes c ON c.id = l.class_id
    WHERE l.id = p_learner_id;

    -- 1. Ordered topics for class_level with real strand names & visible question counts
    SELECT COALESCE(json_agg(
        json_build_object(
            'id', t.id,
            'name', t.name,
            'code', t.code,
            'class_level', t.class_level,
            'sort_order', t.sort_order,
            'strand_id', s.id,
            'strand_name', s.name,
            'strand_code', s.code,
            'sub_strand_name', ss.name,
            'question_count', COALESCE(q.q_count, 0)
        )
        ORDER BY s.sort_order, ss.sort_order, t.sort_order, t.code
    ), '[]'::json)
    INTO v_topics
    FROM public.topics t
    JOIN public.sub_strands ss ON t.sub_strand_id = ss.id
    JOIN public.strands s ON ss.strand_id = s.id
    LEFT JOIN (
        SELECT q.topic_id, COUNT(*)::int AS q_count
        FROM public.questions q
        WHERE q.visibility = 'shared'
           OR (v_teacher_id IS NOT NULL AND q.owner_teacher_id = v_teacher_id)
        GROUP BY q.topic_id
    ) q ON q.topic_id = t.id
    WHERE t.class_level = p_class_level;

    -- 2. Mastery data for the learner filtered to this class level
    SELECT COALESCE(json_agg(
        json_build_object(
            'topic_id', m.topic_id,
            'pct', LEAST(100, ROUND(m.first_pass_pct)),
            'status', m.status
        )
    ), '[]'::json)
    INTO v_mastery
    FROM public.topic_mastery m
    JOIN public.topics t ON t.id = m.topic_id
    WHERE m.learner_id = p_learner_id
      AND t.class_level = p_class_level;

    -- 3. Due reviews count
    SELECT COUNT(*)::int
    INTO v_due_reviews
    FROM public.review_queue rq
    WHERE rq.learner_id = p_learner_id
      AND rq.due_at IS NOT NULL
      AND rq.due_at <= NOW()
      AND rq.stage != 'retained';

    RETURN json_build_object(
        'topics', v_topics,
        'mastery', v_mastery,
        'dueReviewCount', v_due_reviews
    );
END;
$$;

-- 9. Revoke PUBLIC / anon execution on sensitive SECURITY DEFINER RPCs
REVOKE ALL ON FUNCTION public.get_teacher_id() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_teacher_id() TO authenticated;

REVOKE ALL ON FUNCTION public.is_admin() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.is_admin() TO authenticated;

REVOKE ALL ON FUNCTION public.is_active_teacher() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.is_active_teacher() TO authenticated;

REVOKE ALL ON FUNCTION public.get_teacher_school_id() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_teacher_school_id() TO authenticated;

REVOKE ALL ON FUNCTION public.get_learner_class_id() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_learner_class_id() TO authenticated;

REVOKE ALL ON FUNCTION public.get_learner_teacher_id() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_learner_teacher_id() TO authenticated;

REVOKE ALL ON FUNCTION public.is_teacher_of_learner(UUID) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.is_teacher_of_learner(UUID) TO authenticated;

REVOKE ALL ON FUNCTION public.create_learner_account(UUID, TEXT, TEXT, TEXT) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.create_learner_account(UUID, TEXT, TEXT, TEXT) TO authenticated;

REVOKE ALL ON FUNCTION public.update_learner_credentials(UUID, TEXT, TEXT, TEXT) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.update_learner_credentials(UUID, TEXT, TEXT, TEXT) TO authenticated;

REVOKE ALL ON FUNCTION public.delete_learner_account(UUID) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.delete_learner_account(UUID) TO authenticated;

REVOKE ALL ON FUNCTION public.suspend_teacher_account(UUID, TEXT) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.suspend_teacher_account(UUID, TEXT) TO authenticated;

REVOKE ALL ON FUNCTION public.delete_teacher_account(UUID) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.delete_teacher_account(UUID) TO authenticated;

REVOKE ALL ON FUNCTION public.join_school_via_invite(UUID, TEXT) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.join_school_via_invite(UUID, TEXT) TO authenticated;

REVOKE ALL ON FUNCTION public.get_due_reviews(UUID, INTEGER) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_due_reviews(UUID, INTEGER) TO authenticated;

REVOKE ALL ON FUNCTION public.calculate_bece_readiness(UUID, UUID) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.calculate_bece_readiness(UUID, UUID) TO authenticated;

REVOKE ALL ON FUNCTION public.get_learner_homepage_data(UUID, TEXT) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_learner_homepage_data(UUID, TEXT) TO authenticated;
