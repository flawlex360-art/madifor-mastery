-- Flawlex Mastery — Migration 007: Materialized Views
-- Pre-aggregated views for fast dashboard queries

-- ============================================================
-- VIEW: Class-level mastery overview
-- One row per (class, topic) with aggregated mastery stats
-- ============================================================
CREATE MATERIALIZED VIEW mv_class_mastery AS
SELECT
    c.id AS class_id,
    c.teacher_id,
    c.school_id,
    t.id AS topic_id,
    t.name AS topic_name,
    t.code AS topic_code,
    t.class_level,
    COUNT(DISTINCT tm.learner_id) AS learners_attempted,
    ROUND(AVG(tm.first_pass_pct), 2) AS avg_first_pass_pct,
    COUNT(DISTINCT CASE WHEN tm.first_pass_mastered THEN tm.learner_id END)
        AS first_pass_mastered_count,
    COUNT(DISTINCT CASE WHEN tm.retained_mastered THEN tm.learner_id END)
        AS retained_mastered_count,
    COUNT(DISTINCT l.id) AS total_learners
FROM classes c
CROSS JOIN topics t
LEFT JOIN learners l ON l.class_id = c.id
LEFT JOIN topic_mastery tm ON tm.learner_id = l.id AND tm.topic_id = t.id
GROUP BY c.id, c.teacher_id, c.school_id, t.id, t.name, t.code, t.class_level;

CREATE UNIQUE INDEX idx_mv_class_mastery ON mv_class_mastery(class_id, topic_id);

-- ============================================================
-- VIEW: Learner-level summary
-- One row per learner with mastery counts and self-practice stats
-- ============================================================
CREATE MATERIALIZED VIEW mv_learner_summary AS
SELECT
    l.id AS learner_id,
    l.display_name,
    l.learner_code,
    l.class_id,
    c.teacher_id,
    c.school_id,
    c.name AS class_name,
    COUNT(DISTINCT CASE WHEN tm.status = 'retained_mastered' THEN tm.topic_id END)
        AS topics_retained,
    COUNT(DISTINCT CASE WHEN tm.status = 'first_pass_mastered' THEN tm.topic_id END)
        AS topics_first_pass,
    COUNT(DISTINCT CASE WHEN tm.status = 'in_progress' THEN tm.topic_id END)
        AS topics_in_progress,
    COUNT(DISTINCT tm.topic_id) AS topics_attempted,
    ROUND(AVG(tm.first_pass_pct), 2) AS overall_avg_pct,
    COUNT(DISTINCT CASE WHEN sps.id IS NOT NULL THEN sps.id END)
        AS self_practice_sessions_week
FROM learners l
JOIN classes c ON l.class_id = c.id
LEFT JOIN topic_mastery tm ON tm.learner_id = l.id
LEFT JOIN self_practice_sessions sps ON sps.learner_id = l.id
    AND sps.started_at >= NOW() - INTERVAL '7 days'
GROUP BY l.id, l.display_name, l.learner_code, l.class_id,
         c.teacher_id, c.school_id, c.name;

CREATE UNIQUE INDEX idx_mv_learner_summary ON mv_learner_summary(learner_id);

-- ============================================================
-- VIEW: Question difficulty analytics
-- Which questions the class gets wrong most often
-- ============================================================
CREATE MATERIALIZED VIEW mv_question_analytics AS
SELECT
    q.id AS question_id,
    q.topic_id,
    q.stem,
    q.question_type,
    q.difficulty,
    q.blooms_level,
    COUNT(*) AS total_attempts,
    COUNT(*) FILTER (WHERE a.is_correct) AS correct_count,
    ROUND(
        COUNT(*) FILTER (WHERE a.is_correct)::NUMERIC / COUNT(*)::NUMERIC * 100, 2
    ) AS success_rate_pct,
    ROUND(AVG(a.time_taken_seconds), 1) AS avg_time_seconds,
    ROUND(AVG(a.hints_used), 1) AS avg_hints_used
FROM questions q
LEFT JOIN attempts a ON a.question_id = q.id
GROUP BY q.id, q.topic_id, q.stem, q.question_type, q.difficulty, q.blooms_level;

CREATE UNIQUE INDEX idx_mv_question_analytics ON mv_question_analytics(question_id);

-- ============================================================
-- FUNCTION: Refresh all materialized views
-- Call via pg_cron every 15 minutes or after batch writes
-- ============================================================
CREATE OR REPLACE FUNCTION refresh_dashboard_views()
RETURNS VOID AS $$
BEGIN
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_class_mastery;
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_learner_summary;
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_question_analytics;
END;
$$ LANGUAGE plpgsql;
