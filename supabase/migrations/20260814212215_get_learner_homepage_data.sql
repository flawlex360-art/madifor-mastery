CREATE OR REPLACE FUNCTION get_learner_homepage_data(p_learner_id uuid, p_class_level text)
RETURNS json
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_topics json;
    v_mastery json;
    v_due_reviews int;
BEGIN
    -- 1. Get all topics for the class level with their question counts
    SELECT COALESCE(json_agg(
        json_build_object(
            'id', t.id,
            'name', t.name,
            'code', t.code,
            'class_level', t.class_level,
            'question_count', COALESCE(q.q_count, 0)
        )
    ), '[]'::json)
    INTO v_topics
    FROM topics t
    LEFT JOIN (
        SELECT topic_id, count(*) as q_count
        FROM questions
        GROUP BY topic_id
    ) q ON q.topic_id = t.id
    WHERE t.class_level = p_class_level;

    -- 2. Get mastery data for the learner
    SELECT COALESCE(json_agg(
        json_build_object(
            'topic_id', m.topic_id,
            'pct', ROUND(m.first_pass_pct),
            'status', m.status
        )
    ), '[]'::json)
    INTO v_mastery
    FROM topic_mastery m
    WHERE m.learner_id = p_learner_id;

    -- 3. Get due reviews count
    SELECT count(*)
    INTO v_due_reviews
    FROM review_queue rq
    WHERE rq.learner_id = p_learner_id
      AND rq.due_at <= now()
      AND rq.stage != 'retained';

    -- Return combined JSON
    RETURN json_build_object(
        'topics', v_topics,
        'mastery', v_mastery,
        'dueReviewCount', v_due_reviews
    );
END;
$$;
