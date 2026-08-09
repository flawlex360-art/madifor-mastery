-- Flawlex Mastery — Fix Mastery Calculation Over 100%
-- Prevents double-counting correct answers for the same question in first_pass_pct

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
    v_topic_total_questions INTEGER;
    v_already_correct BOOLEAN := FALSE;
    v_correct_increment INTEGER := 0;
BEGIN
    -- 0. GET TOTAL QUESTIONS FOR THE TOPIC
    SELECT COUNT(*) INTO v_topic_total_questions FROM questions WHERE topic_id = p_topic_id;
    IF v_topic_total_questions = 0 THEN
        v_topic_total_questions := 1; -- Fallback to avoid division by zero
    END IF;

    -- Check if they already answered this question correctly in a graded attempt BEFORE this new attempt is inserted
    IF p_attempt_type = 'graded' AND p_is_correct THEN
        SELECT EXISTS (
            SELECT 1 FROM attempts 
            WHERE learner_id = p_learner_id 
              AND question_id = p_question_id 
              AND is_correct = TRUE 
              AND attempt_type = 'graded'
        ) INTO v_already_correct;
        
        IF NOT v_already_correct THEN
            v_correct_increment := 1;
        END IF;
    END IF;

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

    -- 2. IF GRADED ATTEMPT → UPDATE FIRST-PASS MASTERY
    IF p_attempt_type = 'graded' THEN
        INSERT INTO topic_mastery (
            learner_id, topic_id, first_pass_correct, first_pass_total,
            first_pass_pct, status
        )
        VALUES (
            p_learner_id, p_topic_id,
            v_correct_increment,
            1,
            ROUND(v_correct_increment::NUMERIC / v_topic_total_questions::NUMERIC * 100, 2),
            'in_progress'
        )
        ON CONFLICT (learner_id, topic_id) DO UPDATE SET
            first_pass_correct = LEAST(topic_mastery.first_pass_correct + v_correct_increment, v_topic_total_questions),
            first_pass_total = topic_mastery.first_pass_total + 1,
            first_pass_pct = ROUND(
                LEAST((topic_mastery.first_pass_correct + v_correct_increment), v_topic_total_questions)::NUMERIC
                / v_topic_total_questions::NUMERIC * 100, 2
            ),
            status = CASE
                WHEN ROUND(
                    LEAST((topic_mastery.first_pass_correct + v_correct_increment), v_topic_total_questions)::NUMERIC
                    / v_topic_total_questions::NUMERIC * 100, 2
                ) >= v_threshold_pct THEN 'first_pass_mastered'
                ELSE 'in_progress'
            END,
            last_updated = NOW();
    END IF;

    -- 3. MANAGE REVIEW QUEUE (Leitner system)
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


