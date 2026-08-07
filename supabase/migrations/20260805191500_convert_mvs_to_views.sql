-- Drop the materialized views
DROP MATERIALIZED VIEW IF EXISTS public.mv_class_mastery CASCADE;
DROP MATERIALIZED VIEW IF EXISTS public.mv_learner_summary CASCADE;
DROP MATERIALIZED VIEW IF EXISTS public.mv_question_analytics CASCADE;

-- Recreate them as standard views with security invoker
CREATE OR REPLACE VIEW public.mv_class_mastery WITH (security_invoker = on) AS
SELECT c.id AS class_id,
    c.teacher_id,
    c.school_id,
    t.id AS topic_id,
    t.name AS topic_name,
    t.code AS topic_code,
    t.class_level,
    count(DISTINCT tm.learner_id) AS learners_attempted,
    round(avg(tm.first_pass_pct), 2) AS avg_first_pass_pct,
    count(DISTINCT
        CASE
            WHEN tm.first_pass_mastered THEN tm.learner_id
            ELSE NULL::uuid
        END) AS first_pass_mastered_count,
    count(DISTINCT
        CASE
            WHEN tm.retained_mastered THEN tm.learner_id
            ELSE NULL::uuid
        END) AS retained_mastered_count,
    count(DISTINCT l.id) AS total_learners
FROM (((public.classes c
    CROSS JOIN public.topics t)
    LEFT JOIN public.learners l ON ((l.class_id = c.id)))
    LEFT JOIN public.topic_mastery tm ON (((tm.learner_id = l.id) AND (tm.topic_id = t.id))))
GROUP BY c.id, c.teacher_id, c.school_id, t.id, t.name, t.code, t.class_level;


CREATE OR REPLACE VIEW public.mv_learner_summary WITH (security_invoker = on) AS
SELECT l.id AS learner_id,
    l.display_name,
    l.learner_code,
    l.class_id,
    c.teacher_id,
    c.school_id,
    c.name AS class_name,
    count(DISTINCT
        CASE
            WHEN (tm.status = 'retained_mastered'::text) THEN tm.topic_id
            ELSE NULL::uuid
        END) AS topics_retained,
    count(DISTINCT
        CASE
            WHEN (tm.status = 'first_pass_mastered'::text) THEN tm.topic_id
            ELSE NULL::uuid
        END) AS topics_first_pass,
    count(DISTINCT
        CASE
            WHEN (tm.status = 'in_progress'::text) THEN tm.topic_id
            ELSE NULL::uuid
        END) AS topics_in_progress,
    count(DISTINCT tm.topic_id) AS topics_attempted,
    round(avg(tm.first_pass_pct), 2) AS overall_avg_pct,
    count(DISTINCT
        CASE
            WHEN (sps.id IS NOT NULL) THEN sps.id
            ELSE NULL::uuid
        END) AS self_practice_sessions_week
FROM (((public.learners l
    JOIN public.classes c ON ((l.class_id = c.id)))
    LEFT JOIN public.topic_mastery tm ON ((tm.learner_id = l.id)))
    LEFT JOIN public.self_practice_sessions sps ON (((sps.learner_id = l.id) AND (sps.started_at >= (now() - '7 days'::interval)))))
GROUP BY l.id, l.display_name, l.learner_code, l.class_id, c.teacher_id, c.school_id, c.name;


CREATE OR REPLACE VIEW public.mv_question_analytics WITH (security_invoker = on) AS
SELECT q.id AS question_id,
    q.topic_id,
    q.stem,
    q.question_type,
    q.difficulty,
    q.blooms_level,
    count(*) AS total_attempts,
    count(*) FILTER (WHERE a.is_correct) AS correct_count,
    round((((count(*) FILTER (WHERE a.is_correct))::numeric / (count(*))::numeric) * (100)::numeric), 2) AS success_rate_pct,
    round(avg(a.time_taken_seconds), 1) AS avg_time_seconds,
    round(avg(a.hints_used), 1) AS avg_hints_used
FROM (public.questions q
    LEFT JOIN public.attempts a ON ((a.question_id = q.id)))
GROUP BY q.id, q.topic_id, q.stem, q.question_type, q.difficulty, q.blooms_level;

-- Update the refresh function to be a no-op so we don't break old code trying to call it
CREATE OR REPLACE FUNCTION public.refresh_dashboard_views() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- No longer needed, views are now dynamic
    RETURN;
END;
$$;
