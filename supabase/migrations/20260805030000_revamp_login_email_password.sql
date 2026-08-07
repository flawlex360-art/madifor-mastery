-- Revamp login: learners use email/password via Supabase Auth
-- This migration adds a function to create learner auth accounts
-- and updates RLS policies for authenticated learners

-- ============================================================
-- Create learner account function (uses service role to create auth user)
-- ============================================================
CREATE OR REPLACE FUNCTION create_learner_account(
    p_class_id UUID,
    p_display_name TEXT,
    p_email TEXT,
    p_password TEXT
)
RETURNS UUID AS $$
DECLARE
    v_user_id UUID;
    v_school_id UUID;
    v_learner_code TEXT;
BEGIN
    -- Get school_id from class
    SELECT school_id INTO v_school_id FROM classes WHERE id = p_class_id;

    -- Generate a short learner code
    v_learner_code := substr(md5(random()::text), 1, 8);

    -- Create auth user (this requires the function to be called with service role)
    -- We'll use a workaround: insert into auth.users directly
    INSERT INTO auth.users (
        instance_id,
        id,
        aud,
        role,
        email,
        encrypted_password,
        email_confirmed_at,
        raw_app_meta_data,
        raw_user_meta_data,
        created_at,
        updated_at,
        confirmation_token,
        email_change,
        email_change_token_new,
        recovery_token
    ) VALUES (
        '00000000-0000-0000-0000-000000000000',
        gen_random_uuid(),
        'authenticated',
        'authenticated',
        p_email,
        crypt(p_password, gen_salt('bf')),
        NOW(),
        '{"provider":"email","providers":["email"]}',
        '{}',
        NOW(),
        NOW(),
        '',
        '',
        '',
        ''
    )
    RETURNING id INTO v_user_id;

    -- Create learner record
    INSERT INTO learners (id, class_id, school_id, display_name, learner_code)
    VALUES (v_user_id, p_class_id, v_school_id, p_display_name, v_learner_code);

    RETURN v_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- Update RLS: learners are now authenticated, not anon
-- ============================================================

-- Drop old anon policies for learner-scoped tables
DROP POLICY IF EXISTS learners_anon_select ON learners;
DROP POLICY IF EXISTS learners_anon_insert ON learners;
DROP POLICY IF EXISTS learners_anon_update ON learners;
DROP POLICY IF EXISTS attempts_anon_select ON attempts;
DROP POLICY IF EXISTS attempts_anon_insert ON attempts;
DROP POLICY IF EXISTS review_queue_anon_select ON review_queue;
DROP POLICY IF EXISTS review_queue_anon_insert ON review_queue;
DROP POLICY IF EXISTS review_queue_anon_update ON review_queue;
DROP POLICY IF EXISTS topic_mastery_anon_select ON topic_mastery;
DROP POLICY IF EXISTS topic_mastery_anon_insert ON topic_mastery;
DROP POLICY IF EXISTS topic_mastery_anon_update ON topic_mastery;
DROP POLICY IF EXISTS self_practice_anon_select ON self_practice_sessions;
DROP POLICY IF EXISTS self_practice_anon_insert ON self_practice_sessions;

-- Drop old authenticated policies that we'll replace
DROP POLICY IF EXISTS learners_teacher_select ON learners;
DROP POLICY IF EXISTS learners_teacher_insert ON learners;
DROP POLICY IF EXISTS attempts_teacher_select ON attempts;
DROP POLICY IF EXISTS review_queue_select ON review_queue;
DROP POLICY IF EXISTS topic_mastery_select ON topic_mastery;
DROP POLICY IF EXISTS self_practice_select ON self_practice_sessions;
DROP POLICY IF EXISTS attempts_insert ON attempts;
DROP POLICY IF EXISTS review_queue_insert ON review_queue;
DROP POLICY IF EXISTS review_queue_update ON review_queue;
DROP POLICY IF EXISTS topic_mastery_insert ON topic_mastery;
DROP POLICY IF EXISTS topic_mastery_update ON topic_mastery;
DROP POLICY IF EXISTS self_practice_insert ON self_practice_sessions;

-- LEARNERS: authenticated learners can read their own record
-- Teachers can read learners in their classes
CREATE POLICY learners_select ON learners
    FOR SELECT USING (
        id = auth.uid() OR
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

CREATE POLICY learners_insert ON learners
    FOR INSERT WITH CHECK (
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

CREATE POLICY learners_update ON learners
    FOR UPDATE USING (
        id = auth.uid() OR
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

-- ATTEMPTS: learners read/write their own, teachers read their class
CREATE POLICY attempts_select ON attempts
    FOR SELECT USING (
        learner_id = auth.uid() OR
        learner_id IN (SELECT l.id FROM learners l JOIN classes c ON l.class_id = c.id WHERE c.teacher_id = auth.uid())
    );

CREATE POLICY attempts_insert ON attempts
    FOR INSERT WITH CHECK (learner_id = auth.uid());

-- REVIEW QUEUE: learners read/write their own, teachers read their class
CREATE POLICY review_queue_select ON review_queue
    FOR SELECT USING (
        learner_id = auth.uid() OR
        learner_id IN (SELECT l.id FROM learners l JOIN classes c ON l.class_id = c.id WHERE c.teacher_id = auth.uid())
    );

CREATE POLICY review_queue_insert ON review_queue
    FOR INSERT WITH CHECK (learner_id = auth.uid());

CREATE POLICY review_queue_update ON review_queue
    FOR UPDATE USING (
        learner_id = auth.uid() OR
        learner_id IN (SELECT l.id FROM learners l JOIN classes c ON l.class_id = c.id WHERE c.teacher_id = auth.uid())
    );

-- TOPIC MASTERY: learners read/write their own, teachers read their class
CREATE POLICY topic_mastery_select ON topic_mastery
    FOR SELECT USING (
        learner_id = auth.uid() OR
        learner_id IN (SELECT l.id FROM learners l JOIN classes c ON l.class_id = c.id WHERE c.teacher_id = auth.uid())
    );

CREATE POLICY topic_mastery_insert ON topic_mastery
    FOR INSERT WITH CHECK (learner_id = auth.uid());

CREATE POLICY topic_mastery_update ON topic_mastery
    FOR UPDATE USING (
        learner_id = auth.uid() OR
        learner_id IN (SELECT l.id FROM learners l JOIN classes c ON l.class_id = c.id WHERE c.teacher_id = auth.uid())
    );

-- SELF PRACTICE: learners read/write their own, teachers read their class
CREATE POLICY self_practice_select ON self_practice_sessions
    FOR SELECT USING (
        learner_id = auth.uid() OR
        learner_id IN (SELECT l.id FROM learners l JOIN classes c ON l.class_id = c.id WHERE c.teacher_id = auth.uid())
    );

CREATE POLICY self_practice_insert ON self_practice_sessions
    FOR INSERT WITH CHECK (learner_id = auth.uid());

-- MASTERY HISTORY: learners read/write their own
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'mastery_history') THEN
        DROP POLICY IF EXISTS mastery_history_anon_select ON mastery_history;
        DROP POLICY IF EXISTS mastery_history_anon_insert ON mastery_history;
        DROP POLICY IF EXISTS mastery_history_select ON mastery_history;
        DROP POLICY IF EXISTS mastery_history_insert ON mastery_history;

        CREATE POLICY mastery_history_select ON mastery_history
            FOR SELECT USING (
                learner_id = auth.uid() OR
                learner_id IN (SELECT l.id FROM learners l JOIN classes c ON l.class_id = c.id WHERE c.teacher_id = auth.uid())
            );

        CREATE POLICY mastery_history_insert ON mastery_history
            FOR INSERT WITH CHECK (learner_id = auth.uid());
    END IF;
END $$;

-- ============================================================
-- Clean up: drop unused functions from old PIN-based system
-- ============================================================
DROP FUNCTION IF EXISTS set_learner_context(UUID);
DROP FUNCTION IF EXISTS verify_learner_pin(UUID, TEXT);
DROP FUNCTION IF EXISTS hash_pin(TEXT);
DROP FUNCTION IF EXISTS find_learner_for_login(UUID, TEXT);
DROP FUNCTION IF EXISTS create_learner(UUID, TEXT, TEXT, TEXT);

-- Drop PIN column (no longer needed)
ALTER TABLE learners DROP COLUMN IF EXISTS pin;
