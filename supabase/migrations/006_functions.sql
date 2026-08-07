-- Flawlex Mastery — Migration 006: Core Functions
-- Spaced repetition engine, mastery calculation, review queue management

-- ============================================================
-- FUNCTION: Submit an assessment attempt
-- Handles: attempt logging, first-pass mastery, review queue lifecycle
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
    v_new_first_pass_correct INTEGER;
    v_new_first_pass_total INTEGER;
    v_new_first_pass_pct NUMERIC;
    v_threshold_pct NUMERIC := 80.0;
BEGIN
    -- ========================================================
    -- 1. INSERT THE ATTEMPT
    -- ========================================================
    INSERT INTO attempts (
        learner_id, question_id, topic_id, is_correct,
        learner_answer, time_taken_seconds, hints_used,
        attempt_type, session_id, session_question_index
    ) VALUES (
        p_learner_id, p_question_id, p_topic_id, p_is_correct,
        p_learner_answer, p_time_taken, p_hints_used,
        p_attempt_type, p_session_id, p_session_question_index
    );

    -- ========================================================
    -- 2. IF GRADED ATTEMPT → UPDATE FIRST-PASS MASTERY
    -- ========================================================
    IF p_attempt_type = 'graded' THEN
        INSERT INTO topic_mastery (
            learner_id, topic_id, first_pass_correct, first_pass_total,
            first_pass_pct, status
        )
        VALUES (
            p_learner_id, p_topic_id,
            CASE WHEN p_is_correct THEN 1 ELSE 0 END,
            1,
            CASE WHEN p_is_correct THEN 100.0 ELSE 0.0 END,
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

    -- ========================================================
    -- 3. MANAGE REVIEW QUEUE (Leitner system)
    -- ========================================================

    -- 3a. INCORRECT (any type except self_practice) → reset to missed
    IF NOT p_is_correct AND p_attempt_type != 'self_practice' THEN
        INSERT INTO review_queue (learner_id, question_id, topic_id, stage, due_at)
        VALUES (p_learner_id, p_question_id, p_topic_id, 'missed', NOW())
        ON CONFLICT (learner_id, question_id) DO UPDATE SET
            stage = 'missed',
            due_at = NOW(),
            last_reviewed_at = NOW();

    -- 3b. CORRECT on a REVIEW attempt → advance stage
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

            -- Check if ALL questions for this topic are now retained
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
-- FUNCTION: Check if a topic has full retained mastery
-- All questions in the review queue for (learner, topic) must be 'retained'
-- ============================================================
CREATE OR REPLACE FUNCTION check_retained_mastery(
    p_learner_id UUID,
    p_topic_id UUID
)
RETURNS VOID AS $$
DECLARE
    v_remaining INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_remaining
    FROM review_queue
    WHERE learner_id = p_learner_id
      AND topic_id = p_topic_id
      AND stage != 'retained';

    IF v_remaining = 0 THEN
        UPDATE topic_mastery SET
            retained_mastered = TRUE,
            retained_at = NOW(),
            status = 'retained_mastered',
            last_updated = NOW()
        WHERE learner_id = p_learner_id AND topic_id = p_topic_id;
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- FUNCTION: Get due review questions for a learner
-- Returns up to p_limit questions whose due_at has passed
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
      AND rq.due_at <= NOW()
    ORDER BY rq.due_at ASC
    LIMIT p_limit;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- FUNCTION: Calculate BECE Readiness Score for a learner
-- Weighted: retained mastery 70%, first-pass mastery 30%
-- ============================================================
CREATE OR REPLACE FUNCTION calculate_bece_readiness(
    p_learner_id UUID,
    p_subject_id UUID
)
RETURNS NUMERIC AS $$
DECLARE
    v_total_topics INTEGER;
    v_retained_count INTEGER;
    v_first_pass_count INTEGER;
    v_readiness NUMERIC;
BEGIN
    -- Total topics for this subject
    SELECT COUNT(*) INTO v_total_topics
    FROM topics t
    JOIN sub_strands ss ON t.sub_strand_id = ss.id
    JOIN strands s ON ss.strand_id = s.id
    WHERE s.subject_id = p_subject_id;

    IF v_total_topics = 0 THEN RETURN 0; END IF;

    -- Retained mastery count
    SELECT COUNT(*) INTO v_retained_count
    FROM topic_mastery tm
    JOIN topics t ON tm.topic_id = t.id
    JOIN sub_strands ss ON t.sub_strand_id = ss.id
    JOIN strands s ON ss.strand_id = s.id
    WHERE tm.learner_id = p_learner_id
      AND s.subject_id = p_subject_id
      AND tm.retained_mastered = TRUE;

    -- First-pass mastery count (includes retained)
    SELECT COUNT(*) INTO v_first_pass_count
    FROM topic_mastery tm
    JOIN topics t ON tm.topic_id = t.id
    JOIN sub_strands ss ON t.sub_strand_id = ss.id
    JOIN strands s ON ss.strand_id = s.id
    WHERE tm.learner_id = p_learner_id
      AND s.subject_id = p_subject_id
      AND tm.first_pass_mastered = TRUE;

    v_readiness := (v_retained_count::NUMERIC / v_total_topics * 0.7)
                 + (v_first_pass_count::NUMERIC / v_total_topics * 0.3);

    RETURN ROUND(v_readiness * 100, 1);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
