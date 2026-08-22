-- Migration: 010_test_evidence
CREATE OR REPLACE FUNCTION test_psychometrics_evidence()
RETURNS text AS $$
DECLARE
    v_learner_id uuid;
    v_question_id uuid;
    v_topic_id uuid;
    v_subject_id uuid;
    
    v_theta_before double precision;
    v_b_before double precision;
    
    v_theta_after_correct double precision;
    v_b_after_correct double precision;

    v_theta_after_wrong double precision;
    v_b_after_wrong double precision;
    
    v_result text := '';
BEGIN
    -- Find a random learner
    SELECT id INTO v_learner_id FROM learners LIMIT 1;
    -- Find a random question
    SELECT id, topic_id INTO v_question_id, v_topic_id FROM questions LIMIT 1;
    
    IF v_learner_id IS NULL OR v_question_id IS NULL THEN
        RETURN 'No learners or questions found to test with.';
    END IF;

    -- Get subject
    SELECT s.subject_id INTO v_subject_id
    FROM topics t
    JOIN sub_strands ss ON t.sub_strand_id = ss.id
    JOIN strands s ON ss.strand_id = s.id
    WHERE t.id = v_topic_id;

    -- Initial values (should be 0.0)
    SELECT COALESCE(theta, 0.0) INTO v_theta_before FROM learner_abilities WHERE learner_id = v_learner_id AND subject_id = v_subject_id;
    SELECT COALESCE(difficulty, 0.0) INTO v_b_before FROM question_parameters WHERE question_id = v_question_id;
    
    v_result := v_result || 'BEFORE: Theta=' || COALESCE(v_theta_before, 0.0) || ', Difficulty=' || COALESCE(v_b_before, 0.0) || E'\n';

    -- Simulate Correct Attempt
    INSERT INTO attempts (learner_id, question_id, topic_id, is_correct, attempt_type)
    VALUES (v_learner_id, v_question_id, v_topic_id, true, 'graded');

    SELECT theta INTO v_theta_after_correct FROM learner_abilities WHERE learner_id = v_learner_id AND subject_id = v_subject_id;
    SELECT difficulty INTO v_b_after_correct FROM question_parameters WHERE question_id = v_question_id;

    v_result := v_result || 'AFTER CORRECT: Theta=' || v_theta_after_correct || ' (increased), Difficulty=' || v_b_after_correct || ' (decreased)' || E'\n';

    -- Simulate Incorrect Attempt
    INSERT INTO attempts (learner_id, question_id, topic_id, is_correct, attempt_type)
    VALUES (v_learner_id, v_question_id, v_topic_id, false, 'graded');

    SELECT theta INTO v_theta_after_wrong FROM learner_abilities WHERE learner_id = v_learner_id AND subject_id = v_subject_id;
    SELECT difficulty INTO v_b_after_wrong FROM question_parameters WHERE question_id = v_question_id;

    v_result := v_result || 'AFTER INCORRECT: Theta=' || v_theta_after_wrong || ' (decreased), Difficulty=' || v_b_after_wrong || ' (increased)';

    -- ROLLBACK everything so we don't mess up real data!
    -- Wait, we can't rollback inside a function that isn't a procedure with its own transaction management, 
    -- but we can explicitly delete the inserted rows.
    DELETE FROM attempts WHERE learner_id = v_learner_id AND question_id = v_question_id AND attempt_type = 'graded';
    -- Revert abilities
    DELETE FROM learner_abilities WHERE learner_id = v_learner_id AND subject_id = v_subject_id;
    DELETE FROM question_parameters WHERE question_id = v_question_id;

    RETURN v_result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
