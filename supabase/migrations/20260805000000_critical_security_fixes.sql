-- Flawlex Mastery — Critical Security & Data Fixes
-- Fixes: C-1 (RLS isolation), C-2 (PIN hashing), C-4 (first_pass_mastered), C-5 (empty PIN), H-4 (due_at NULL)

-- ============================================================
-- C-2: Enable pgcrypto for PIN hashing
-- ============================================================
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;

-- ============================================================
-- C-2: Hash existing plaintext PINs
-- ============================================================
UPDATE learners
SET pin = crypt(pin, gen_salt('bf', 10))
WHERE pin IS NOT NULL AND pin != '' AND length(pin) = 4;

-- ============================================================
-- C-5: Fix empty PINs and add CHECK constraint
-- ============================================================
-- Set a default hashed PIN for learners with empty PINs
-- (teachers will need to reset these via the UI)
UPDATE learners
SET pin = crypt('0000', gen_salt('bf', 10))
WHERE pin IS NULL OR pin = '';

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'pin_not_empty'
    ) THEN
        ALTER TABLE learners ADD CONSTRAINT pin_not_empty CHECK (pin <> '');
    END IF;
END $$;

-- ============================================================
-- C-1: Create learner context function for RLS
-- ============================================================
CREATE OR REPLACE FUNCTION set_learner_context(p_learner_id UUID)
RETURNS VOID AS $$
BEGIN
    PERFORM set_config('app.current_learner_id', p_learner_id::TEXT, TRUE);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- C-2: Create PIN verification function
-- ============================================================
CREATE OR REPLACE FUNCTION verify_learner_pin(p_learner_id UUID, p_pin TEXT)
RETURNS BOOLEAN AS $$
DECLARE
    v_stored_pin TEXT;
BEGIN
    SELECT pin INTO v_stored_pin FROM learners WHERE id = p_learner_id;
    IF v_stored_pin IS NULL THEN RETURN FALSE; END IF;

    -- If stored pin is 60 chars, it's bcrypt-hashed
    IF length(v_stored_pin) = 60 THEN
        RETURN v_stored_pin = crypt(p_pin, v_stored_pin);
    ELSE
        -- Legacy plaintext (shouldn't exist after migration, but handle gracefully)
        RETURN v_stored_pin = p_pin;
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- C-2: Create PIN hashing function for new learners
-- ============================================================
CREATE OR REPLACE FUNCTION hash_pin(p_pin TEXT)
RETURNS TEXT AS $$
BEGIN
    RETURN crypt(p_pin, gen_salt('bf', 10));
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- C-1 (FIXED): Create login lookup function — bypasses RLS safely
-- This replaces the open SELECT policy on learners for login
-- ============================================================
CREATE OR REPLACE FUNCTION find_learner_for_login(
    p_class_id UUID,
    p_display_name TEXT
)
RETURNS TABLE (
    id UUID,
    class_id UUID,
    display_name TEXT,
    learner_code TEXT,
    pin TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT l.id, l.class_id, l.display_name, l.learner_code, l.pin
    FROM learners l
    WHERE l.class_id = p_class_id
      AND l.display_name = p_display_name;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- C-1: Drop ALL existing open RLS policies and replace with scoped ones
-- ============================================================

-- Drop existing open policies
DROP POLICY IF EXISTS classes_anon_select_by_code ON classes;
DROP POLICY IF EXISTS learners_anon_insert ON learners;
DROP POLICY IF EXISTS learners_anon_select ON learners;
DROP POLICY IF EXISTS learners_anon_update ON learners;
DROP POLICY IF EXISTS attempts_anon_insert ON attempts;
DROP POLICY IF EXISTS attempts_anon_select ON attempts;
DROP POLICY IF EXISTS review_queue_anon_select ON review_queue;
DROP POLICY IF EXISTS review_queue_anon_insert ON review_queue;
DROP POLICY IF EXISTS review_queue_anon_update ON review_queue;
DROP POLICY IF EXISTS topic_mastery_anon_select ON topic_mastery;
DROP POLICY IF EXISTS topic_mastery_anon_insert ON topic_mastery;
DROP POLICY IF EXISTS topic_mastery_anon_update ON topic_mastery;
DROP POLICY IF EXISTS self_practice_anon_select ON self_practice_sessions;
DROP POLICY IF EXISTS self_practice_anon_insert ON self_practice_sessions;

-- CLASSES: open SELECT (needed for login — class_code is the "password")
CREATE POLICY classes_anon_select_by_code ON classes
    FOR SELECT USING (true);

-- LEARNERS: FIXED — no more open SELECT
-- Login lookup uses find_learner_for_login() SECURITY DEFINER function instead
CREATE POLICY learners_anon_select ON learners
    FOR SELECT USING (
        id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

CREATE POLICY learners_anon_insert ON learners
    FOR INSERT WITH CHECK (true);
-- INSERT open because new learners don't exist yet; app validates class_code first

CREATE POLICY learners_anon_update ON learners
    FOR UPDATE USING (
        id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

-- ATTEMPTS: scoped to current learner
CREATE POLICY attempts_anon_select ON attempts
    FOR SELECT USING (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

CREATE POLICY attempts_anon_insert ON attempts
    FOR INSERT WITH CHECK (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

-- REVIEW QUEUE: scoped to current learner
CREATE POLICY review_queue_anon_select ON review_queue
    FOR SELECT USING (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

CREATE POLICY review_queue_anon_insert ON review_queue
    FOR INSERT WITH CHECK (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

CREATE POLICY review_queue_anon_update ON review_queue
    FOR UPDATE USING (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

-- TOPIC MASTERY: scoped to current learner
CREATE POLICY topic_mastery_anon_select ON topic_mastery
    FOR SELECT USING (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

CREATE POLICY topic_mastery_anon_insert ON topic_mastery
    FOR INSERT WITH CHECK (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

CREATE POLICY topic_mastery_anon_update ON topic_mastery
    FOR UPDATE USING (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

-- SELF PRACTICE: scoped to current learner
CREATE POLICY self_practice_anon_select ON self_practice_sessions
    FOR SELECT USING (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

CREATE POLICY self_practice_anon_insert ON self_practice_sessions
    FOR INSERT WITH CHECK (
        learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
    );

-- MASTERY HISTORY: scoped to current learner (if table exists)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'mastery_history') THEN
        DROP POLICY IF EXISTS mastery_history_anon_select ON mastery_history;
        DROP POLICY IF EXISTS mastery_history_anon_insert ON mastery_history;

        CREATE POLICY mastery_history_anon_select ON mastery_history
            FOR SELECT USING (
                learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
            );

        CREATE POLICY mastery_history_anon_insert ON mastery_history
            FOR INSERT WITH CHECK (
                learner_id::TEXT = current_setting('app.current_learner_id', TRUE)
            );
    END IF;
END $$;

-- ============================================================
-- C-4: Fix submit_attempt to update first_pass_mastered boolean
-- ============================================================
CREATE OR REPLACE FUNCTION submit_attempt(
    p_learner_id UUID,
    p_question_id UUID,
    p_topic_id UUID,
    p_is_correct BOOLEAN,
    p_learner_answer JSONB,
    p_time_taken INTEGER,
    p_hints_used INTEGER,
    p_attempt_type TEXT,
    p_session_id UUID DEFAULT NULL,
    p_session_question_index INTEGER DEFAULT NULL
)
RETURNS VOID AS $$
DECLARE
    v_review_stage TEXT;
    v_due_at TIMESTAMPTZ;
    v_threshold_pct NUMERIC := 80.0;
BEGIN
    -- 1. INSERT THE ATTEMPT
    INSERT INTO attempts (
        learner_id, question_id, topic_id, is_correct,
        learner_answer, time_taken_seconds, hints_used,
        attempt_type, session_id, session_question_index
    ) VALUES (
        p_learner_id, p_question_id, p_topic_id, p_is_correct,
        p_learner_answer, p_time_taken, p_hints_used,
        p_attempt_type, p_session_id, p_session_question_index
    );

    -- 2. IF GRADED → UPDATE FIRST-PASS MASTERY
    IF p_attempt_type = 'graded' THEN
        INSERT INTO topic_mastery (
            learner_id, topic_id, first_pass_correct, first_pass_total,
            first_pass_pct, first_pass_mastered, status
        )
        VALUES (
            p_learner_id, p_topic_id,
            CASE WHEN p_is_correct THEN 1 ELSE 0 END,
            1,
            CASE WHEN p_is_correct THEN 100.0 ELSE 0.0 END,
            FALSE,
            'in_progress'
        )
        ON CONFLICT (learner_id, topic_id) DO UPDATE SET
            first_pass_correct = topic_mastery.first_pass_correct
                + (CASE WHEN p_is_correct THEN 1 ELSE 0 END),
            first_pass_total = topic_mastery.first_pass_total + 1,
            first_pass_pct = ROUND(
                (topic_mastery.first_pass_correct
                    + (CASE WHEN p_is_correct THEN 1 ELSE 0 END))::NUMERIC
                / (topic_mastery.first_pass_total + 1)::NUMERIC * 100, 2
            ),
            first_pass_mastered = CASE
                WHEN ROUND(
                    (topic_mastery.first_pass_correct
                        + (CASE WHEN p_is_correct THEN 1 ELSE 0 END))::NUMERIC
                    / (topic_mastery.first_pass_total + 1)::NUMERIC * 100, 2
                ) >= v_threshold_pct THEN TRUE
                ELSE FALSE
            END,
            status = CASE
                WHEN ROUND(
                    (topic_mastery.first_pass_correct
                        + (CASE WHEN p_is_correct THEN 1 ELSE 0 END))::NUMERIC
                    / (topic_mastery.first_pass_total + 1)::NUMERIC * 100, 2
                ) >= v_threshold_pct THEN 'first_pass_mastered'
                ELSE 'in_progress'
            END,
            last_updated = NOW();
    END IF;

    -- 3. MANAGE REVIEW QUEUE (Leitner system)
    IF NOT p_is_correct AND p_attempt_type != 'self_practice' THEN
        INSERT INTO review_queue (learner_id, question_id, topic_id, stage, due_at)
        VALUES (p_learner_id, p_question_id, p_topic_id, 'missed', NOW())
        ON CONFLICT (learner_id, question_id) DO UPDATE SET
            stage = 'missed',
            due_at = NOW(),
            last_reviewed_at = NOW();

    ELSIF p_is_correct AND p_attempt_type = 'review' THEN
        SELECT stage INTO v_review_stage
        FROM review_queue
        WHERE learner_id = p_learner_id AND question_id = p_question_id;

        CASE v_review_stage
            WHEN 'missed' THEN
                v_review_stage := 'review_1';
                v_due_at := NOW() + INTERVAL '2 days';
            WHEN 'review_1' THEN
                v_review_stage := 'review_2';
                v_due_at := NOW() + INTERVAL '5 days';
            WHEN 'review_2' THEN
                v_review_stage := 'review_3';
                v_due_at := NOW() + INTERVAL '14 days';
            WHEN 'review_3' THEN
                v_review_stage := 'retained';
                v_due_at := NULL;
            ELSE
                v_review_stage := 'retained';
                v_due_at := NULL;
        END CASE;

        IF v_review_stage = 'retained' THEN
            UPDATE review_queue
            SET stage = 'retained', due_at = NULL, last_reviewed_at = NOW()
            WHERE learner_id = p_learner_id AND question_id = p_question_id;
            PERFORM check_retained_mastery(p_learner_id, p_topic_id);
        ELSE
            UPDATE review_queue
            SET stage = v_review_stage, due_at = v_due_at, last_reviewed_at = NOW()
            WHERE learner_id = p_learner_id AND question_id = p_question_id;
        END IF;
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- H-4: Fix get_due_reviews to explicitly handle NULL due_at
-- ============================================================
CREATE OR REPLACE FUNCTION get_due_reviews(
    p_learner_id UUID,
    p_limit INTEGER DEFAULT 4
)
RETURNS TABLE (
    question_id UUID,
    topic_id UUID,
    stage TEXT,
    due_at TIMESTAMPTZ
) AS $$
BEGIN
    RETURN QUERY
    SELECT rq.question_id, rq.topic_id, rq.stage, rq.due_at
    FROM review_queue rq
    WHERE rq.learner_id = p_learner_id
      AND rq.stage != 'retained'
      AND rq.due_at IS NOT NULL
      AND rq.due_at <= NOW()
    ORDER BY rq.due_at ASC
    LIMIT p_limit;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
