-- ============================================================================
-- Madifor Mastery — Migration: Fix Mastery Engine, Spaced Repetition, IRT, CAT,
--                              Dashboard Views, Indexes, and Question Bank
-- ============================================================================

-- 1. Fix review_queue.due_at NOT NULL crash (blocked ALL 'retained' transitions)
ALTER TABLE public.review_queue ALTER COLUMN due_at DROP NOT NULL;

-- 2. Server-side authoritative answer grader
CREATE OR REPLACE FUNCTION public.grade_answer(
    p_question_type TEXT,
    p_correct_answer JSONB,
    p_options JSONB,
    p_learner_answer JSONB
)
RETURNS BOOLEAN
LANGUAGE plpgsql
IMMUTABLE
SET search_path = public
AS $$
DECLARE
    v_correct_idx INTEGER;
    v_learner_idx INTEGER;
    v_correct_text TEXT;
    v_learner_str TEXT;
    v_cand TEXT;
    v_cand_raw TEXT;
    i INTEGER;
BEGIN
    IF p_learner_answer IS NULL OR p_correct_answer IS NULL THEN
        RETURN FALSE;
    END IF;

    IF p_question_type = 'multiple_choice' THEN
        -- Resolve integer index from correct_answer (number, numeric string, or 1-element array fallback)
        IF jsonb_typeof(p_correct_answer) = 'number' THEN
            v_correct_idx := FLOOR((p_correct_answer #>> '{}')::NUMERIC)::INTEGER;
        ELSIF jsonb_typeof(p_correct_answer) = 'string' AND (p_correct_answer #>> '{}') ~ '^\s*\d+\s*$' THEN
            v_correct_idx := TRIM(p_correct_answer #>> '{}')::INTEGER;
        ELSIF jsonb_typeof(p_correct_answer) = 'array' AND jsonb_array_length(p_correct_answer) > 0 AND jsonb_typeof(p_options) = 'array' THEN
            v_correct_text := LOWER(TRIM(COALESCE(p_correct_answer->>0, '')));
            FOR i IN 0 .. jsonb_array_length(p_options) - 1 LOOP
                IF LOWER(TRIM(COALESCE(p_options->>i, ''))) = v_correct_text THEN
                    v_correct_idx := i;
                    EXIT;
                END IF;
            END LOOP;
        END IF;

        IF v_correct_idx IS NULL THEN
            RETURN FALSE;
        END IF;

        IF jsonb_typeof(p_learner_answer) = 'number' THEN
            v_learner_idx := FLOOR((p_learner_answer #>> '{}')::NUMERIC)::INTEGER;
        ELSIF jsonb_typeof(p_learner_answer) = 'string' AND (p_learner_answer #>> '{}') ~ '^\s*\d+\s*$' THEN
            v_learner_idx := TRIM(p_learner_answer #>> '{}')::INTEGER;
        ELSE
            RETURN FALSE;
        END IF;

        RETURN v_learner_idx = v_correct_idx;
    END IF;

    IF p_question_type = 'fill_in_blank' THEN
        v_learner_str := LOWER(TRIM(COALESCE(p_learner_answer #>> '{}', '')));
        IF v_learner_str = '' THEN
            RETURN FALSE;
        END IF;

        IF jsonb_typeof(p_correct_answer) = 'array' THEN
            FOR v_cand_raw IN SELECT jsonb_array_elements_text(p_correct_answer) LOOP
                v_cand := LOWER(TRIM(COALESCE(v_cand_raw, '')));
                IF v_cand = '' THEN
                    CONTINUE;
                END IF;
                IF v_learner_str = v_cand THEN
                    RETURN TRUE;
                END IF;
                IF v_learner_str ~ '^-?\d+(\.\d+)?$' AND v_cand ~ '^-?\d+(\.\d+)?$' THEN
                    IF v_learner_str::NUMERIC = v_cand::NUMERIC THEN
                        RETURN TRUE;
                    END IF;
                END IF;
            END LOOP;
            RETURN FALSE;
        ELSE
            FOR v_cand_raw IN SELECT regexp_split_to_table(COALESCE(p_correct_answer #>> '{}', ''), '\|') LOOP
                v_cand := LOWER(TRIM(COALESCE(v_cand_raw, '')));
                IF v_cand = '' THEN
                    CONTINUE;
                END IF;
                IF v_learner_str = v_cand THEN
                    RETURN TRUE;
                END IF;
                IF v_learner_str ~ '^-?\d+(\.\d+)?$' AND v_cand ~ '^-?\d+(\.\d+)?$' THEN
                    IF v_learner_str::NUMERIC = v_cand::NUMERIC THEN
                        RETURN TRUE;
                    END IF;
                END IF;
            END LOOP;
            RETURN FALSE;
        END IF;
    END IF;

    -- Fallback for any other question types
    RETURN LOWER(TRIM(COALESCE(p_learner_answer #>> '{}', ''))) = LOWER(TRIM(COALESCE(p_correct_answer #>> '{}', '')));
EXCEPTION WHEN OTHERS THEN
    RETURN FALSE;
END;
$$;

-- 3. Fix check_retained_mastery (requires first-pass mastery before granting retained mastery)
CREATE OR REPLACE FUNCTION public.check_retained_mastery(
    p_learner_id UUID,
    p_topic_id UUID
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_remaining INTEGER;
BEGIN
    IF NOT (
        auth.uid() = p_learner_id
        OR public.is_teacher_of_learner(p_learner_id)
        OR public.is_admin()
    ) THEN
        RAISE EXCEPTION 'Unauthorized';
    END IF;

    SELECT COUNT(*) INTO v_remaining
    FROM public.review_queue
    WHERE learner_id = p_learner_id
      AND topic_id = p_topic_id
      AND stage != 'retained';

    IF v_remaining = 0 THEN
        UPDATE public.topic_mastery
        SET retained_mastered = TRUE,
            retained_at = COALESCE(retained_at, NOW()),
            status = 'retained_mastered',
            last_updated = NOW()
        WHERE learner_id = p_learner_id
          AND topic_id = p_topic_id
          AND (first_pass_mastered = TRUE OR first_pass_pct >= 80.0);
    END IF;
END;
$$;

-- 4. Fix submit_attempt (authoritative server grading, first_pass_mastered restored, no retained downgrade)
CREATE OR REPLACE FUNCTION public.submit_attempt(
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
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_question RECORD;
    v_authoritative_topic_id UUID;
    v_is_correct BOOLEAN;
    v_teacher_id UUID;
    v_review_stage TEXT;
    v_due_at TIMESTAMPTZ;
    v_threshold_pct NUMERIC := 80.0;
    v_topic_total_questions INTEGER;
    v_already_correct BOOLEAN := FALSE;
    v_correct_increment INTEGER := 0;
    v_hints INTEGER := GREATEST(0, COALESCE(p_hints_used, 0));
    v_time INTEGER := CASE WHEN p_time_taken IS NULL THEN NULL ELSE GREATEST(0, p_time_taken) END;
BEGIN
    IF auth.uid() IS NULL OR auth.uid() <> p_learner_id THEN
        RAISE EXCEPTION 'Unauthorized: learner mismatch';
    END IF;

    IF p_attempt_type NOT IN ('graded', 'review', 'self_practice') THEN
        RAISE EXCEPTION 'Invalid attempt_type';
    END IF;

    SELECT id, topic_id, question_type, correct_answer, options
    INTO v_question
    FROM public.questions
    WHERE id = p_question_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Question not found';
    END IF;

    v_authoritative_topic_id := v_question.topic_id;
    v_is_correct := public.grade_answer(
        v_question.question_type,
        v_question.correct_answer,
        v_question.options,
        p_learner_answer
    );

    -- Resolve learner's teacher for visibility-scoped question denominator
    SELECT c.teacher_id INTO v_teacher_id
    FROM public.learners l
    JOIN public.classes c ON c.id = l.class_id
    WHERE l.id = p_learner_id;

    SELECT COUNT(*) INTO v_topic_total_questions
    FROM public.questions q
    WHERE q.topic_id = v_authoritative_topic_id
      AND (
          q.visibility = 'shared'
          OR (v_teacher_id IS NOT NULL AND q.owner_teacher_id = v_teacher_id)
      );

    IF v_topic_total_questions = 0 THEN
        v_topic_total_questions := 1;
    END IF;

    -- Lock any existing topic_mastery row to serialize concurrent graded attempts
    PERFORM 1 FROM public.topic_mastery
    WHERE learner_id = p_learner_id AND topic_id = v_authoritative_topic_id
    FOR UPDATE;

    IF p_attempt_type = 'graded' AND v_is_correct THEN
        SELECT EXISTS (
            SELECT 1 FROM public.attempts
            WHERE learner_id = p_learner_id
              AND question_id = p_question_id
              AND is_correct = TRUE
              AND attempt_type = 'graded'
        ) INTO v_already_correct;

        IF NOT v_already_correct THEN
            v_correct_increment := 1;
        END IF;
    END IF;

    -- 1. Log the attempt using server-verified correctness and topic
    INSERT INTO public.attempts (
        learner_id, question_id, topic_id, is_correct,
        learner_answer, time_taken_seconds, hints_used,
        attempt_type, session_id, session_question_index
    ) VALUES (
        p_learner_id, p_question_id, v_authoritative_topic_id, v_is_correct,
        p_learner_answer, v_time, v_hints,
        p_attempt_type, p_session_id, p_session_question_index
    );

    -- 2. Update first-pass mastery on graded attempts
    IF p_attempt_type = 'graded' THEN
        INSERT INTO public.topic_mastery (
            learner_id, topic_id, first_pass_correct, first_pass_total,
            first_pass_pct, first_pass_mastered, status
        )
        VALUES (
            p_learner_id,
            v_authoritative_topic_id,
            v_correct_increment,
            1,
            LEAST(100.00, ROUND(v_correct_increment::NUMERIC / v_topic_total_questions::NUMERIC * 100, 2)),
            (ROUND(v_correct_increment::NUMERIC / v_topic_total_questions::NUMERIC * 100, 2) >= v_threshold_pct),
            CASE
                WHEN ROUND(v_correct_increment::NUMERIC / v_topic_total_questions::NUMERIC * 100, 2) >= v_threshold_pct
                    THEN 'first_pass_mastered'
                ELSE 'in_progress'
            END
        )
        ON CONFLICT (learner_id, topic_id) DO UPDATE SET
            first_pass_correct = LEAST(public.topic_mastery.first_pass_correct + v_correct_increment, v_topic_total_questions),
            first_pass_total = public.topic_mastery.first_pass_total + 1,
            first_pass_pct = LEAST(100.00, ROUND(
                LEAST(public.topic_mastery.first_pass_correct + v_correct_increment, v_topic_total_questions)::NUMERIC
                / v_topic_total_questions::NUMERIC * 100, 2
            )),
            first_pass_mastered = (
                public.topic_mastery.first_pass_mastered
                OR LEAST(100.00, ROUND(
                    LEAST(public.topic_mastery.first_pass_correct + v_correct_increment, v_topic_total_questions)::NUMERIC
                    / v_topic_total_questions::NUMERIC * 100, 2
                )) >= v_threshold_pct
            ),
            status = CASE
                WHEN public.topic_mastery.retained_mastered THEN 'retained_mastered'
                WHEN public.topic_mastery.first_pass_mastered
                  OR LEAST(100.00, ROUND(
                      LEAST(public.topic_mastery.first_pass_correct + v_correct_increment, v_topic_total_questions)::NUMERIC
                      / v_topic_total_questions::NUMERIC * 100, 2
                  )) >= v_threshold_pct
                    THEN 'first_pass_mastered'
                ELSE 'in_progress'
            END,
            last_updated = NOW();
    END IF;

    -- 3. Manage Spaced Repetition (Leitner) review queue
    IF NOT v_is_correct AND p_attempt_type != 'self_practice' THEN
        INSERT INTO public.review_queue (learner_id, question_id, topic_id, stage, due_at)
        VALUES (p_learner_id, p_question_id, v_authoritative_topic_id, 'missed', NOW())
        ON CONFLICT (learner_id, question_id) DO UPDATE SET
            stage = 'missed',
            due_at = NOW(),
            last_reviewed_at = NOW();

        -- Revoke retained status if learner fails during a review
        IF p_attempt_type = 'review' THEN
            UPDATE public.topic_mastery
            SET retained_mastered = FALSE,
                status = CASE WHEN first_pass_mastered THEN 'first_pass_mastered' ELSE 'in_progress' END,
                last_updated = NOW()
            WHERE learner_id = p_learner_id
              AND topic_id = v_authoritative_topic_id
              AND retained_mastered = TRUE;
        END IF;

    ELSIF v_is_correct AND p_attempt_type = 'review' THEN
        SELECT stage INTO v_review_stage
        FROM public.review_queue
        WHERE learner_id = p_learner_id AND question_id = p_question_id
        FOR UPDATE;

        -- Guard against ghost review submissions for unqueued questions
        IF FOUND THEN
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
                ELSE
                    v_review_stage := 'retained';
                    v_due_at := NULL;
            END CASE;

            UPDATE public.review_queue
            SET stage = v_review_stage,
                due_at = v_due_at,
                last_reviewed_at = NOW()
            WHERE learner_id = p_learner_id AND question_id = p_question_id;

            IF v_review_stage = 'retained' THEN
                PERFORM public.check_retained_mastery(p_learner_id, v_authoritative_topic_id);
            END IF;
        END IF;
    END IF;
END;
$$;

-- Backfill first_pass_mastered for existing records that passed >= 80%
UPDATE public.topic_mastery
SET first_pass_mastered = TRUE,
    status = CASE WHEN retained_mastered THEN 'retained_mastered' ELSE 'first_pass_mastered' END
WHERE first_pass_pct >= 80.0
  AND (first_pass_mastered = FALSE OR status = 'in_progress');

-- 5. Harden IRT Psychometric Update Trigger (concurrency safe, graded-only, decaying K, clamped)
CREATE OR REPLACE FUNCTION public.process_psychometric_update()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_subject_id UUID;
    v_q_diff_label TEXT;
    v_init_b DOUBLE PRECISION := 0.0;
    v_theta DOUBLE PRECISION;
    v_total_answered INTEGER;
    v_b DOUBLE PRECISION;
    v_q_attempts INTEGER;
    v_prob DOUBLE PRECISION;
    v_k_theta DOUBLE PRECISION;
    v_k_b DOUBLE PRECISION;
    v_s INTEGER;
BEGIN
    -- Only calibrate on unhinted graded attempts so review/practice repeats do not skew IRT
    IF NEW.attempt_type <> 'graded' OR COALESCE(NEW.hints_used, 0) > 0 THEN
        RETURN NEW;
    END IF;

    SELECT s.subject_id INTO v_subject_id
    FROM public.topics t
    JOIN public.sub_strands ss ON t.sub_strand_id = ss.id
    JOIN public.strands s ON ss.strand_id = s.id
    WHERE t.id = NEW.topic_id;

    IF v_subject_id IS NULL THEN
        RETURN NEW;
    END IF;

    SELECT difficulty INTO v_q_diff_label
    FROM public.questions
    WHERE id = NEW.question_id;

    v_init_b := CASE v_q_diff_label
        WHEN 'easy' THEN -0.75
        WHEN 'bece_level' THEN 0.75
        ELSE 0.0
    END;

    -- Atomic upsert + row lock prevents 23505 race & lost updates
    INSERT INTO public.learner_abilities (learner_id, subject_id, theta, total_answered)
    VALUES (NEW.learner_id, v_subject_id, 0.0, 0)
    ON CONFLICT (learner_id, subject_id) DO NOTHING;

    SELECT theta, total_answered INTO v_theta, v_total_answered
    FROM public.learner_abilities
    WHERE learner_id = NEW.learner_id AND subject_id = v_subject_id
    FOR UPDATE;

    INSERT INTO public.question_parameters (question_id, difficulty, discrimination, guessing, total_attempts)
    VALUES (NEW.question_id, v_init_b, 1.0, 0.0, 0)
    ON CONFLICT (question_id) DO NOTHING;

    SELECT difficulty, total_attempts INTO v_b, v_q_attempts
    FROM public.question_parameters
    WHERE question_id = NEW.question_id
    FOR UPDATE;

    v_prob := 1.0 / (1.0 + exp(GREATEST(LEAST(-(v_theta - v_b), 50.0), -50.0)));
    v_s := CASE WHEN NEW.is_correct THEN 1 ELSE 0 END;

    -- Sample-size decaying learning rates for convergence + bounds [-4, 4]
    v_k_theta := GREATEST(0.05, 0.30 / SQRT(1.0 + v_total_answered * 0.1));
    v_k_b := GREATEST(0.02, 0.15 / SQRT(1.0 + v_q_attempts * 0.05));

    UPDATE public.learner_abilities
    SET theta = GREATEST(-4.0, LEAST(4.0, v_theta + v_k_theta * (v_s - v_prob))),
        total_answered = v_total_answered + 1,
        updated_at = NOW()
    WHERE learner_id = NEW.learner_id AND subject_id = v_subject_id;

    UPDATE public.question_parameters
    SET difficulty = GREATEST(-4.0, LEAST(4.0, v_b + v_k_b * (v_prob - v_s))),
        total_attempts = v_q_attempts + 1,
        updated_at = NOW()
    WHERE question_id = NEW.question_id;

    RETURN NEW;
END;
$$;

-- 6. Fix Adaptive Testing (CAT) RPC: visibility-scoped, auth-checked, excludes session IDs
CREATE OR REPLACE FUNCTION public.get_adaptive_question(
    p_learner_id UUID,
    p_topic_id UUID,
    p_exclude_ids UUID[] DEFAULT '{}'
)
RETURNS SETOF public.questions
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
    v_subject_id UUID;
    v_theta DOUBLE PRECISION := 0.0;
    v_teacher_id UUID;
    v_q RECORD;
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

    SELECT s.subject_id INTO v_subject_id
    FROM public.topics t
    JOIN public.sub_strands ss ON t.sub_strand_id = ss.id
    JOIN public.strands s ON ss.strand_id = s.id
    WHERE t.id = p_topic_id;

    SELECT COALESCE(theta, 0.0) INTO v_theta
    FROM public.learner_abilities
    WHERE learner_id = p_learner_id AND subject_id = v_subject_id;
    v_theta := COALESCE(v_theta, 0.0);

    -- Primary: best IRT difficulty match excluding current session & 7-day graded attempts
    SELECT q.* INTO v_q
    FROM public.questions q
    LEFT JOIN public.question_parameters qp ON q.id = qp.question_id
    WHERE q.topic_id = p_topic_id
      AND (q.visibility = 'shared' OR (v_teacher_id IS NOT NULL AND q.owner_teacher_id = v_teacher_id))
      AND NOT (q.id = ANY(COALESCE(p_exclude_ids, '{}'::uuid[])))
      AND NOT EXISTS (
          SELECT 1 FROM public.attempts a
          WHERE a.question_id = q.id
            AND a.learner_id = p_learner_id
            AND a.attempt_type = 'graded'
            AND a.created_at > NOW() - INTERVAL '7 days'
      )
    ORDER BY ABS(COALESCE(qp.difficulty, 0.0) - v_theta) ASC, RANDOM()
    LIMIT 1;

    IF FOUND THEN
        RETURN NEXT v_q;
        RETURN;
    END IF;

    -- Fallback: allow recently attempted questions, still excluding current session IDs
    SELECT q.* INTO v_q
    FROM public.questions q
    LEFT JOIN public.question_parameters qp ON q.id = qp.question_id
    WHERE q.topic_id = p_topic_id
      AND (q.visibility = 'shared' OR (v_teacher_id IS NOT NULL AND q.owner_teacher_id = v_teacher_id))
      AND NOT (q.id = ANY(COALESCE(p_exclude_ids, '{}'::uuid[])))
    ORDER BY ABS(COALESCE(qp.difficulty, 0.0) - v_theta) ASC, RANDOM()
    LIMIT 1;

    IF FOUND THEN
        RETURN NEXT v_q;
        RETURN;
    END IF;
END;
$$;

-- 7. Fix Dashboard Views
CREATE OR REPLACE VIEW public.mv_class_mastery WITH (security_invoker = on) AS
SELECT c.id AS class_id,
    c.teacher_id,
    c.school_id,
    t.id AS topic_id,
    t.name AS topic_name,
    t.code AS topic_code,
    t.class_level,
    COUNT(DISTINCT tm.learner_id) AS learners_attempted,
    ROUND(AVG(tm.first_pass_pct), 2) AS avg_first_pass_pct,
    COUNT(DISTINCT CASE WHEN (tm.first_pass_mastered OR tm.status IN ('first_pass_mastered', 'retained_mastered')) THEN tm.learner_id ELSE NULL END) AS first_pass_mastered_count,
    COUNT(DISTINCT CASE WHEN (tm.retained_mastered OR tm.status = 'retained_mastered') THEN tm.learner_id ELSE NULL END) AS retained_mastered_count,
    COUNT(DISTINCT l.id) AS total_learners
FROM public.classes c
JOIN public.topics t ON t.class_level = c.class_level
LEFT JOIN public.learners l ON l.class_id = c.id
LEFT JOIN public.topic_mastery tm ON tm.learner_id = l.id AND tm.topic_id = t.id
GROUP BY c.id, c.teacher_id, c.school_id, t.id, t.name, t.code, t.class_level;

CREATE OR REPLACE VIEW public.mv_learner_summary WITH (security_invoker = on) AS
SELECT l.id AS learner_id,
    l.display_name,
    l.learner_code,
    l.class_id,
    c.teacher_id,
    c.school_id,
    c.name AS class_name,
    COALESCE(tm_agg.topics_retained, 0)::bigint AS topics_retained,
    COALESCE(tm_agg.topics_first_pass, 0)::bigint AS topics_first_pass,
    COALESCE(tm_agg.topics_in_progress, 0)::bigint AS topics_in_progress,
    COALESCE(tm_agg.topics_attempted, 0)::bigint AS topics_attempted,
    tm_agg.overall_avg_pct,
    COALESCE(sps_agg.session_count, 0)::bigint AS self_practice_sessions_week
FROM public.learners l
JOIN public.classes c ON l.class_id = c.id
LEFT JOIN LATERAL (
    SELECT
        COUNT(*) FILTER (WHERE tm.status = 'retained_mastered') AS topics_retained,
        COUNT(*) FILTER (WHERE tm.status = 'first_pass_mastered') AS topics_first_pass,
        COUNT(*) FILTER (WHERE tm.status = 'in_progress') AS topics_in_progress,
        COUNT(*) AS topics_attempted,
        ROUND(AVG(tm.first_pass_pct), 2) AS overall_avg_pct
    FROM public.topic_mastery tm
    WHERE tm.learner_id = l.id
) tm_agg ON TRUE
LEFT JOIN LATERAL (
    SELECT COUNT(*) AS session_count
    FROM public.self_practice_sessions sps
    WHERE sps.learner_id = l.id
      AND sps.started_at >= (NOW() - INTERVAL '7 days')
) sps_agg ON TRUE;

CREATE OR REPLACE VIEW public.mv_question_analytics WITH (security_invoker = on) AS
SELECT q.id AS question_id,
    q.topic_id,
    q.stem,
    q.question_type,
    q.difficulty,
    q.blooms_level,
    COUNT(a.id) AS total_attempts,
    COUNT(a.id) FILTER (WHERE a.is_correct) AS correct_count,
    CASE
        WHEN COUNT(a.id) > 0 THEN ROUND((COUNT(a.id) FILTER (WHERE a.is_correct))::NUMERIC / COUNT(a.id)::NUMERIC * 100, 2)
        ELSE NULL
    END AS success_rate_pct,
    ROUND(AVG(a.time_taken_seconds), 1) AS avg_time_seconds,
    ROUND(AVG(a.hints_used), 1) AS avg_hints_used
FROM public.questions q
LEFT JOIN public.attempts a ON a.question_id = q.id
GROUP BY q.id, q.topic_id, q.stem, q.question_type, q.difficulty, q.blooms_level;

REVOKE ALL ON public.mv_class_mastery FROM anon;
REVOKE ALL ON public.mv_learner_summary FROM anon;
REVOKE ALL ON public.mv_question_analytics FROM anon;
GRANT SELECT ON public.mv_class_mastery TO authenticated;
GRANT SELECT ON public.mv_learner_summary TO authenticated;
GRANT SELECT ON public.mv_question_analytics TO authenticated;

-- 8. Tighten RPC execute permissions
REVOKE ALL ON FUNCTION public.grade_answer(TEXT, JSONB, JSONB, JSONB) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.grade_answer(TEXT, JSONB, JSONB, JSONB) TO authenticated;

REVOKE ALL ON FUNCTION public.check_retained_mastery(UUID, UUID) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.check_retained_mastery(UUID, UUID) TO authenticated;

REVOKE ALL ON FUNCTION public.submit_attempt(UUID, UUID, UUID, BOOLEAN, JSONB, INTEGER, INTEGER, TEXT, UUID, INTEGER) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.submit_attempt(UUID, UUID, UUID, BOOLEAN, JSONB, INTEGER, INTEGER, TEXT, UUID, INTEGER) TO authenticated;

REVOKE ALL ON FUNCTION public.get_adaptive_question(UUID, UUID, UUID[]) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_adaptive_question(UUID, UUID, UUID[]) TO authenticated;

-- 9. Clean up duplicate indexes and create missing FK / hot-path indexes
DROP INDEX IF EXISTS public.idx_review_queue_learner_not_retained;
DROP INDEX IF EXISTS public.idx_invite_codes_code;

CREATE INDEX IF NOT EXISTS idx_self_practice_learner_started ON public.self_practice_sessions(learner_id, started_at);
CREATE INDEX IF NOT EXISTS idx_self_practice_topic ON public.self_practice_sessions(topic_id);
CREATE INDEX IF NOT EXISTS idx_review_queue_question ON public.review_queue(question_id);
CREATE INDEX IF NOT EXISTS idx_review_queue_learner_topic_active ON public.review_queue(learner_id, topic_id) WHERE stage != 'retained';
CREATE INDEX IF NOT EXISTS idx_attempts_learner_question_created ON public.attempts(learner_id, question_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_questions_topic_visibility ON public.questions(topic_id, visibility);
CREATE INDEX IF NOT EXISTS idx_mastery_history_topic ON public.mastery_history(topic_id);
CREATE INDEX IF NOT EXISTS idx_learner_abilities_subject ON public.learner_abilities(subject_id);

-- 10. Clean & rebalance ALL 1,803 live questions atomically
-- Step 10A: Fix array-formatted correct_answer rows (from replace_materials.mjs)
DO $$
DECLARE
    q RECORD;
    v_target TEXT;
    v_found_idx INTEGER;
    i INTEGER;
BEGIN
    FOR q IN
        SELECT id, options, correct_answer
        FROM public.questions
        WHERE question_type = 'multiple_choice'
          AND jsonb_typeof(correct_answer) = 'array'
          AND jsonb_typeof(options) = 'array'
    LOOP
        v_target := LOWER(TRIM(COALESCE(q.correct_answer->>0, '')));
        v_found_idx := NULL;
        FOR i IN 0 .. jsonb_array_length(q.options) - 1 LOOP
            IF LOWER(TRIM(COALESCE(q.options->>i, ''))) = v_target THEN
                v_found_idx := i;
                EXIT;
            END IF;
        END LOOP;

        IF v_found_idx IS NOT NULL THEN
            UPDATE public.questions
            SET correct_answer = to_jsonb(v_found_idx),
                updated_at = NOW()
            WHERE id = q.id;
        END IF;
    END LOOP;
END $$;

-- Step 10B: Strip raw citation brackets [171, 172] & fix tab-mangled LaTeX ($	ext{NaCl}$)
UPDATE public.questions
SET stem = regexp_replace(stem, '\$\s*ext\{([^}]+)\}\$', '\1', 'g'),
    explanation = TRIM(
        regexp_replace(
            regexp_replace(explanation, '\$\s*ext\{([^}]+)\}\$', '\1', 'g'),
            '\s*\[\d+(?:\s*,\s*\d+)*\]',
            '',
            'g'
        )
    ),
    updated_at = NOW()
WHERE stem ~ '\$\s*ext\{'
   OR explanation ~ '\$\s*ext\{'
   OR explanation ~ '\[\d+(?:\s*,\s*\d+)*\]';

-- Step 10C: Deterministic Fisher-Yates-equivalent permutation across ALL MCQs to eliminate Option-B bias
DO $$
DECLARE
    q RECORD;
    v_old_idx INTEGER;
    v_new_options JSONB;
    v_new_idx INTEGER;
BEGIN
    FOR q IN
        SELECT id, options, correct_answer
        FROM public.questions
        WHERE question_type = 'multiple_choice'
          AND jsonb_typeof(options) = 'array'
          AND jsonb_array_length(options) >= 2
          AND jsonb_typeof(correct_answer) = 'number'
    LOOP
        v_old_idx := FLOOR((q.correct_answer #>> '{}')::NUMERIC)::INTEGER;
        IF v_old_idx < 0 OR v_old_idx >= jsonb_array_length(q.options) THEN
            CONTINUE;
        END IF;

        WITH shuffled AS (
            SELECT
                (u.ord - 1) AS orig_idx,
                u.val,
                (ROW_NUMBER() OVER (ORDER BY md5(q.id::text || '-madifor-rebalance-' || u.ord::text)) - 1)::INTEGER AS new_idx
            FROM jsonb_array_elements(q.options) WITH ORDINALITY AS u(val, ord)
        )
        SELECT
            jsonb_agg(val ORDER BY new_idx),
            MAX(CASE WHEN orig_idx = v_old_idx THEN new_idx ELSE NULL END)
        INTO v_new_options, v_new_idx
        FROM shuffled;

        IF v_new_options IS NOT NULL AND v_new_idx IS NOT NULL THEN
            UPDATE public.questions
            SET options = v_new_options,
                correct_answer = to_jsonb(v_new_idx),
                updated_at = NOW()
            WHERE id = q.id;
        END IF;
    END LOOP;
END $$;
