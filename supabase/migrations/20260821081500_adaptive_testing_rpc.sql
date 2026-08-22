-- Migration: 011_adaptive_testing_rpc
-- Phase 3: Adaptive Practice (CAT)

CREATE OR REPLACE FUNCTION get_adaptive_question(
    p_learner_id uuid,
    p_topic_id uuid
)
RETURNS SETOF questions AS $$
DECLARE
    v_subject_id uuid;
    v_theta double precision;
BEGIN
    -- 1. Find the subject for the topic
    SELECT s.subject_id INTO v_subject_id
    FROM topics t
    JOIN sub_strands ss ON t.sub_strand_id = ss.id
    JOIN strands s ON ss.strand_id = s.id
    WHERE t.id = p_topic_id;

    -- 2. Get the learner's current ability (theta), default to 0.0
    SELECT COALESCE(theta, 0.0) INTO v_theta
    FROM learner_abilities
    WHERE learner_id = p_learner_id AND subject_id = v_subject_id;

    IF v_theta IS NULL THEN
        v_theta := 0.0;
    END IF;

    -- 3. Find the best matching question
    -- We want ABS(difficulty - theta) to be minimized
    -- We also want to exclude questions the learner has answered recently (e.g., in the last 7 days)
    RETURN QUERY
    SELECT q.*
    FROM questions q
    LEFT JOIN question_parameters qp ON q.id = qp.question_id
    WHERE q.topic_id = p_topic_id
      AND NOT EXISTS (
          SELECT 1 FROM attempts a
          WHERE a.question_id = q.id 
            AND a.learner_id = p_learner_id
            AND a.created_at > now() - interval '7 days'
      )
    ORDER BY abs(COALESCE(qp.difficulty, 0.0) - v_theta) ASC
    LIMIT 1;

    -- 4. Fallback if they've answered ALL questions recently
    IF NOT FOUND THEN
        RETURN QUERY
        SELECT q.*
        FROM questions q
        LEFT JOIN question_parameters qp ON q.id = qp.question_id
        WHERE q.topic_id = p_topic_id
        ORDER BY abs(COALESCE(qp.difficulty, 0.0) - v_theta) ASC
        LIMIT 1;
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
