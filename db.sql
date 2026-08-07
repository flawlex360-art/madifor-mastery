


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "public";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "public";






CREATE OR REPLACE FUNCTION "public"."calculate_bece_readiness"("p_learner_id" "uuid", "p_subject_id" "uuid") RETURNS numeric
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE v_total INTEGER; v_retained INTEGER; v_first_pass INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_total FROM topics t JOIN sub_strands ss ON t.sub_strand_id = ss.id JOIN strands s ON ss.strand_id = s.id WHERE s.subject_id = p_subject_id;
    IF v_total = 0 THEN RETURN 0; END IF;
    SELECT COUNT(*) INTO v_retained FROM topic_mastery tm JOIN topics t ON tm.topic_id = t.id JOIN sub_strands ss ON t.sub_strand_id = ss.id JOIN strands s ON ss.strand_id = s.id WHERE tm.learner_id = p_learner_id AND s.subject_id = p_subject_id AND tm.retained_mastered = TRUE;
    SELECT COUNT(*) INTO v_first_pass FROM topic_mastery tm JOIN topics t ON tm.topic_id = t.id JOIN sub_strands ss ON t.sub_strand_id = ss.id JOIN strands s ON ss.strand_id = s.id WHERE tm.learner_id = p_learner_id AND s.subject_id = p_subject_id AND tm.first_pass_mastered = TRUE;
    RETURN ROUND((v_retained::NUMERIC / v_total * 0.7 + v_first_pass::NUMERIC / v_total * 0.3) * 100, 1);
END;
$$;


ALTER FUNCTION "public"."calculate_bece_readiness"("p_learner_id" "uuid", "p_subject_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."check_retained_mastery"("p_learner_id" "uuid", "p_topic_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE v_remaining INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_remaining FROM review_queue WHERE learner_id = p_learner_id AND topic_id = p_topic_id AND stage != 'retained';
    IF v_remaining = 0 THEN
        UPDATE topic_mastery SET retained_mastered = TRUE, retained_at = NOW(), status = 'retained_mastered', last_updated = NOW()
        WHERE learner_id = p_learner_id AND topic_id = p_topic_id;
    END IF;
END;
$$;


ALTER FUNCTION "public"."check_retained_mastery"("p_learner_id" "uuid", "p_topic_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."create_learner_account"("p_class_id" "uuid", "p_display_name" "text", "p_email" "text", "p_password" "text") RETURNS "uuid"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    v_user_id UUID;
    v_school_id UUID;
    v_learner_code TEXT;
BEGIN
    -- Get school_id from class
    SELECT school_id INTO v_school_id FROM classes WHERE id = p_class_id;

    -- Generate a short learner code
    v_learner_code := substr(md5(random()::text), 1, 8);
    v_user_id := gen_random_uuid();

    -- Create auth user (this requires the function to be called with service role)
    -- We insert into auth.users directly
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
        v_user_id,
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
    );

    -- FIX: Insert the corresponding identity record so signInWithPassword works
    INSERT INTO auth.identities (
        id,
        user_id,
        identity_data,
        provider,
        provider_id,
        last_sign_in_at,
        created_at,
        updated_at
    ) VALUES (
        gen_random_uuid(),
        v_user_id,
        jsonb_build_object('sub', v_user_id::text, 'email', p_email),
        'email',
        v_user_id::text,
        NOW(),
        NOW(),
        NOW()
    );

    -- Create learner record
    INSERT INTO learners (id, class_id, school_id, display_name, learner_code)
    VALUES (v_user_id, p_class_id, v_school_id, p_display_name, v_learner_code);

    RETURN v_user_id;
END;
$$;


ALTER FUNCTION "public"."create_learner_account"("p_class_id" "uuid", "p_display_name" "text", "p_email" "text", "p_password" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_due_reviews"("p_learner_id" "uuid", "p_limit" integer DEFAULT 4) RETURNS TABLE("question_id" "uuid", "topic_id" "uuid", "stage" "text", "due_at" timestamp with time zone)
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
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
$$;


ALTER FUNCTION "public"."get_due_reviews"("p_learner_id" "uuid", "p_limit" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_teacher_id"() RETURNS "uuid"
    LANGUAGE "sql" STABLE SECURITY DEFINER
    AS $$
    SELECT id FROM teachers WHERE id = auth.uid()
$$;


ALTER FUNCTION "public"."get_teacher_id"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_teacher_school_id"() RETURNS "uuid"
    LANGUAGE "sql" STABLE SECURITY DEFINER
    AS $$
    SELECT school_id FROM teachers WHERE id = auth.uid()
$$;


ALTER FUNCTION "public"."get_teacher_school_id"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."join_school_via_invite"("p_teacher_id" "uuid", "p_invite_code" "text") RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    v_school_id UUID;
    v_code_id UUID;
    v_remaining INTEGER;
    v_expires TIMESTAMPTZ;
BEGIN
    -- Find the invite code
    SELECT id, school_id, uses_remaining, expires_at
    INTO v_code_id, v_school_id, v_remaining, v_expires
    FROM teacher_invite_codes
    WHERE code = p_invite_code
      AND uses_remaining > 0;

    IF v_school_id IS NULL THEN
        RETURN FALSE; -- Invalid code
    END IF;

    IF v_expires IS NOT NULL AND v_expires < NOW() THEN
        RETURN FALSE; -- Expired
    END IF;

    -- Link teacher to school
    UPDATE teachers SET school_id = v_school_id WHERE id = p_teacher_id;

    -- Decrement uses
    UPDATE teacher_invite_codes
    SET uses_remaining = uses_remaining - 1
    WHERE id = v_code_id;

    RETURN TRUE;
END;
$$;


ALTER FUNCTION "public"."join_school_via_invite"("p_teacher_id" "uuid", "p_invite_code" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."record_mastery_snapshot"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    -- Only record if first_pass_pct actually changed
    IF OLD.first_pass_pct IS DISTINCT FROM NEW.first_pass_pct
       OR OLD.status IS DISTINCT FROM NEW.status THEN
        INSERT INTO mastery_history (learner_id, topic_id, first_pass_pct, status)
        VALUES (NEW.learner_id, NEW.topic_id, NEW.first_pass_pct, NEW.status);
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."record_mastery_snapshot"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."refresh_dashboard_views"() RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_class_mastery;
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_learner_summary;
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_question_analytics;
END;
$$;


ALTER FUNCTION "public"."refresh_dashboard_views"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."submit_attempt"("p_learner_id" "uuid", "p_question_id" "uuid", "p_topic_id" "uuid", "p_is_correct" boolean, "p_learner_answer" "jsonb", "p_time_taken" integer, "p_hints_used" integer, "p_attempt_type" "text", "p_session_id" "uuid" DEFAULT NULL::"uuid", "p_session_question_index" integer DEFAULT NULL::integer) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
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
$$;


ALTER FUNCTION "public"."submit_attempt"("p_learner_id" "uuid", "p_question_id" "uuid", "p_topic_id" "uuid", "p_is_correct" boolean, "p_learner_answer" "jsonb", "p_time_taken" integer, "p_hints_used" integer, "p_attempt_type" "text", "p_session_id" "uuid", "p_session_question_index" integer) OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."attempts" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "learner_id" "uuid" NOT NULL,
    "question_id" "uuid" NOT NULL,
    "topic_id" "uuid" NOT NULL,
    "is_correct" boolean NOT NULL,
    "learner_answer" "jsonb",
    "time_taken_seconds" integer,
    "hints_used" integer DEFAULT 0 NOT NULL,
    "attempt_type" "text" NOT NULL,
    "session_id" "uuid",
    "session_question_index" integer,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "attempts_attempt_type_check" CHECK (("attempt_type" = ANY (ARRAY['graded'::"text", 'review'::"text", 'self_practice'::"text"])))
);


ALTER TABLE "public"."attempts" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."class_subjects" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "class_id" "uuid" NOT NULL,
    "subject_id" "uuid" NOT NULL,
    "enrolled_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."class_subjects" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."classes" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "teacher_id" "uuid" NOT NULL,
    "school_id" "uuid",
    "name" "text" NOT NULL,
    "class_level" "text" NOT NULL,
    "class_code" "text" DEFAULT "encode"("public"."gen_random_bytes"(4), 'hex'::"text") NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "classes_class_level_check" CHECK (("class_level" = ANY (ARRAY['B7'::"text", 'B8'::"text", 'B9'::"text"])))
);


ALTER TABLE "public"."classes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."learners" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "class_id" "uuid" NOT NULL,
    "school_id" "uuid",
    "display_name" "text" NOT NULL,
    "learner_code" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "pin" "text" DEFAULT ''::"text" NOT NULL,
    "dummy_email" "text"
);


ALTER TABLE "public"."learners" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."mastery_history" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "learner_id" "uuid" NOT NULL,
    "topic_id" "uuid" NOT NULL,
    "first_pass_pct" numeric(5,2) NOT NULL,
    "status" "text" NOT NULL,
    "recorded_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."mastery_history" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."topic_mastery" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "learner_id" "uuid" NOT NULL,
    "topic_id" "uuid" NOT NULL,
    "first_pass_correct" integer DEFAULT 0 NOT NULL,
    "first_pass_total" integer DEFAULT 0 NOT NULL,
    "first_pass_pct" numeric(5,2) DEFAULT 0.00 NOT NULL,
    "first_pass_mastered" boolean DEFAULT false NOT NULL,
    "retained_mastered" boolean DEFAULT false NOT NULL,
    "retained_at" timestamp with time zone,
    "status" "text" DEFAULT 'not_started'::"text" NOT NULL,
    "last_updated" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "topic_mastery_status_check" CHECK (("status" = ANY (ARRAY['not_started'::"text", 'in_progress'::"text", 'first_pass_mastered'::"text", 'retained_mastered'::"text"])))
);


ALTER TABLE "public"."topic_mastery" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."topics" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "sub_strand_id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "code" "text" NOT NULL,
    "class_level" "text" NOT NULL,
    "sort_order" integer DEFAULT 0 NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "topics_class_level_check" CHECK (("class_level" = ANY (ARRAY['B7'::"text", 'B8'::"text", 'B9'::"text"])))
);


ALTER TABLE "public"."topics" OWNER TO "postgres";


CREATE MATERIALIZED VIEW "public"."mv_class_mastery" AS
 SELECT "c"."id" AS "class_id",
    "c"."teacher_id",
    "c"."school_id",
    "t"."id" AS "topic_id",
    "t"."name" AS "topic_name",
    "t"."code" AS "topic_code",
    "t"."class_level",
    "count"(DISTINCT "tm"."learner_id") AS "learners_attempted",
    "round"("avg"("tm"."first_pass_pct"), 2) AS "avg_first_pass_pct",
    "count"(DISTINCT
        CASE
            WHEN "tm"."first_pass_mastered" THEN "tm"."learner_id"
            ELSE NULL::"uuid"
        END) AS "first_pass_mastered_count",
    "count"(DISTINCT
        CASE
            WHEN "tm"."retained_mastered" THEN "tm"."learner_id"
            ELSE NULL::"uuid"
        END) AS "retained_mastered_count",
    "count"(DISTINCT "l"."id") AS "total_learners"
   FROM ((("public"."classes" "c"
     CROSS JOIN "public"."topics" "t")
     LEFT JOIN "public"."learners" "l" ON (("l"."class_id" = "c"."id")))
     LEFT JOIN "public"."topic_mastery" "tm" ON ((("tm"."learner_id" = "l"."id") AND ("tm"."topic_id" = "t"."id"))))
  GROUP BY "c"."id", "c"."teacher_id", "c"."school_id", "t"."id", "t"."name", "t"."code", "t"."class_level"
  WITH NO DATA;


ALTER MATERIALIZED VIEW "public"."mv_class_mastery" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."self_practice_sessions" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "learner_id" "uuid" NOT NULL,
    "topic_id" "uuid" NOT NULL,
    "questions_attempted" integer DEFAULT 0 NOT NULL,
    "questions_correct" integer DEFAULT 0 NOT NULL,
    "started_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "ended_at" timestamp with time zone,
    "practice_class_level" "text",
    CONSTRAINT "self_practice_sessions_practice_class_level_check" CHECK (("practice_class_level" = ANY (ARRAY['B7'::"text", 'B8'::"text", 'B9'::"text"])))
);


ALTER TABLE "public"."self_practice_sessions" OWNER TO "postgres";


CREATE MATERIALIZED VIEW "public"."mv_learner_summary" AS
 SELECT "l"."id" AS "learner_id",
    "l"."display_name",
    "l"."learner_code",
    "l"."class_id",
    "c"."teacher_id",
    "c"."school_id",
    "c"."name" AS "class_name",
    "count"(DISTINCT
        CASE
            WHEN ("tm"."status" = 'retained_mastered'::"text") THEN "tm"."topic_id"
            ELSE NULL::"uuid"
        END) AS "topics_retained",
    "count"(DISTINCT
        CASE
            WHEN ("tm"."status" = 'first_pass_mastered'::"text") THEN "tm"."topic_id"
            ELSE NULL::"uuid"
        END) AS "topics_first_pass",
    "count"(DISTINCT
        CASE
            WHEN ("tm"."status" = 'in_progress'::"text") THEN "tm"."topic_id"
            ELSE NULL::"uuid"
        END) AS "topics_in_progress",
    "count"(DISTINCT "tm"."topic_id") AS "topics_attempted",
    "round"("avg"("tm"."first_pass_pct"), 2) AS "overall_avg_pct",
    "count"(DISTINCT
        CASE
            WHEN ("sps"."id" IS NOT NULL) THEN "sps"."id"
            ELSE NULL::"uuid"
        END) AS "self_practice_sessions_week"
   FROM ((("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
     LEFT JOIN "public"."topic_mastery" "tm" ON (("tm"."learner_id" = "l"."id")))
     LEFT JOIN "public"."self_practice_sessions" "sps" ON ((("sps"."learner_id" = "l"."id") AND ("sps"."started_at" >= ("now"() - '7 days'::interval)))))
  GROUP BY "l"."id", "l"."display_name", "l"."learner_code", "l"."class_id", "c"."teacher_id", "c"."school_id", "c"."name"
  WITH NO DATA;


ALTER MATERIALIZED VIEW "public"."mv_learner_summary" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."questions" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "topic_id" "uuid" NOT NULL,
    "owner_teacher_id" "uuid",
    "question_type" "text" NOT NULL,
    "stem" "text" NOT NULL,
    "options" "jsonb",
    "correct_answer" "jsonb" NOT NULL,
    "explanation" "text" NOT NULL,
    "hints" "text"[],
    "difficulty" "text" DEFAULT 'core'::"text" NOT NULL,
    "blooms_level" "text" DEFAULT 'recall'::"text" NOT NULL,
    "diagram_url" "text",
    "visibility" "text" DEFAULT 'private'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "questions_blooms_level_check" CHECK (("blooms_level" = ANY (ARRAY['recall'::"text", 'application'::"text", 'analysis'::"text"]))),
    CONSTRAINT "questions_difficulty_check" CHECK (("difficulty" = ANY (ARRAY['easy'::"text", 'core'::"text", 'bece_level'::"text"]))),
    CONSTRAINT "questions_question_type_check" CHECK (("question_type" = ANY (ARRAY['multiple_choice'::"text", 'fill_in_blank'::"text", 'diagram_label'::"text", 'matching'::"text", 'short_structured'::"text"]))),
    CONSTRAINT "questions_visibility_check" CHECK (("visibility" = ANY (ARRAY['shared'::"text", 'private'::"text", 'school'::"text"])))
);


ALTER TABLE "public"."questions" OWNER TO "postgres";


CREATE MATERIALIZED VIEW "public"."mv_question_analytics" AS
 SELECT "q"."id" AS "question_id",
    "q"."topic_id",
    "q"."stem",
    "q"."question_type",
    "q"."difficulty",
    "q"."blooms_level",
    "count"(*) AS "total_attempts",
    "count"(*) FILTER (WHERE "a"."is_correct") AS "correct_count",
    "round"(((("count"(*) FILTER (WHERE "a"."is_correct"))::numeric / ("count"(*))::numeric) * (100)::numeric), 2) AS "success_rate_pct",
    "round"("avg"("a"."time_taken_seconds"), 1) AS "avg_time_seconds",
    "round"("avg"("a"."hints_used"), 1) AS "avg_hints_used"
   FROM ("public"."questions" "q"
     LEFT JOIN "public"."attempts" "a" ON (("a"."question_id" = "q"."id")))
  GROUP BY "q"."id", "q"."topic_id", "q"."stem", "q"."question_type", "q"."difficulty", "q"."blooms_level"
  WITH NO DATA;


ALTER MATERIALIZED VIEW "public"."mv_question_analytics" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."review_queue" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "learner_id" "uuid" NOT NULL,
    "question_id" "uuid" NOT NULL,
    "topic_id" "uuid" NOT NULL,
    "stage" "text" DEFAULT 'missed'::"text" NOT NULL,
    "due_at" timestamp with time zone NOT NULL,
    "added_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "last_reviewed_at" timestamp with time zone,
    CONSTRAINT "review_queue_stage_check" CHECK (("stage" = ANY (ARRAY['missed'::"text", 'review_1'::"text", 'review_2'::"text", 'review_3'::"text", 'retained'::"text"])))
);


ALTER TABLE "public"."review_queue" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."schools" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "invite_code" "text" DEFAULT "encode"("public"."gen_random_bytes"(6), 'hex'::"text") NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."schools" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."strands" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "subject_id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "code" "text" NOT NULL,
    "class_level" "text" NOT NULL,
    "sort_order" integer DEFAULT 0 NOT NULL,
    CONSTRAINT "strands_class_level_check" CHECK (("class_level" = ANY (ARRAY['B7'::"text", 'B8'::"text", 'B9'::"text"])))
);


ALTER TABLE "public"."strands" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."sub_strands" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "strand_id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "code" "text" NOT NULL,
    "sort_order" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "public"."sub_strands" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."subjects" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "code" "text" NOT NULL,
    "class_levels" "text"[] DEFAULT '{B7,B8,B9}'::"text"[] NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."subjects" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."teacher_invite_codes" (
    "id" "uuid" DEFAULT "public"."uuid_generate_v4"() NOT NULL,
    "school_id" "uuid" NOT NULL,
    "code" "text" DEFAULT "encode"("public"."gen_random_bytes"(6), 'hex'::"text") NOT NULL,
    "created_by" "uuid" NOT NULL,
    "uses_remaining" integer DEFAULT 10 NOT NULL,
    "expires_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."teacher_invite_codes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."teachers" (
    "id" "uuid" NOT NULL,
    "school_id" "uuid",
    "full_name" "text" NOT NULL,
    "email" "text" NOT NULL,
    "role" "text" DEFAULT 'teacher'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "teachers_role_check" CHECK (("role" = ANY (ARRAY['teacher'::"text", 'school_admin'::"text"])))
);


ALTER TABLE "public"."teachers" OWNER TO "postgres";


ALTER TABLE ONLY "public"."attempts"
    ADD CONSTRAINT "attempts_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."class_subjects"
    ADD CONSTRAINT "class_subjects_class_id_subject_id_key" UNIQUE ("class_id", "subject_id");



ALTER TABLE ONLY "public"."class_subjects"
    ADD CONSTRAINT "class_subjects_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."classes"
    ADD CONSTRAINT "classes_class_code_key" UNIQUE ("class_code");



ALTER TABLE ONLY "public"."classes"
    ADD CONSTRAINT "classes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."learners"
    ADD CONSTRAINT "learners_class_id_learner_code_key" UNIQUE ("class_id", "learner_code");



ALTER TABLE ONLY "public"."learners"
    ADD CONSTRAINT "learners_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."mastery_history"
    ADD CONSTRAINT "mastery_history_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."questions"
    ADD CONSTRAINT "questions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."review_queue"
    ADD CONSTRAINT "review_queue_learner_id_question_id_key" UNIQUE ("learner_id", "question_id");



ALTER TABLE ONLY "public"."review_queue"
    ADD CONSTRAINT "review_queue_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."schools"
    ADD CONSTRAINT "schools_invite_code_key" UNIQUE ("invite_code");



ALTER TABLE ONLY "public"."schools"
    ADD CONSTRAINT "schools_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."self_practice_sessions"
    ADD CONSTRAINT "self_practice_sessions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."strands"
    ADD CONSTRAINT "strands_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."strands"
    ADD CONSTRAINT "strands_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."sub_strands"
    ADD CONSTRAINT "sub_strands_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."sub_strands"
    ADD CONSTRAINT "sub_strands_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."subjects"
    ADD CONSTRAINT "subjects_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."subjects"
    ADD CONSTRAINT "subjects_name_key" UNIQUE ("name");



ALTER TABLE ONLY "public"."subjects"
    ADD CONSTRAINT "subjects_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."teacher_invite_codes"
    ADD CONSTRAINT "teacher_invite_codes_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."teacher_invite_codes"
    ADD CONSTRAINT "teacher_invite_codes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."teachers"
    ADD CONSTRAINT "teachers_email_key" UNIQUE ("email");



ALTER TABLE ONLY "public"."teachers"
    ADD CONSTRAINT "teachers_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."topic_mastery"
    ADD CONSTRAINT "topic_mastery_learner_id_topic_id_key" UNIQUE ("learner_id", "topic_id");



ALTER TABLE ONLY "public"."topic_mastery"
    ADD CONSTRAINT "topic_mastery_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."topics"
    ADD CONSTRAINT "topics_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."topics"
    ADD CONSTRAINT "topics_pkey" PRIMARY KEY ("id");



CREATE INDEX "idx_attempts_created" ON "public"."attempts" USING "btree" ("created_at");



CREATE INDEX "idx_attempts_learner" ON "public"."attempts" USING "btree" ("learner_id");



CREATE INDEX "idx_attempts_learner_topic_created" ON "public"."attempts" USING "btree" ("learner_id", "topic_id", "created_at" DESC);



CREATE INDEX "idx_attempts_question" ON "public"."attempts" USING "btree" ("question_id");



CREATE INDEX "idx_attempts_session" ON "public"."attempts" USING "btree" ("session_id");



CREATE INDEX "idx_attempts_session_index" ON "public"."attempts" USING "btree" ("session_id", "session_question_index") WHERE ("session_id" IS NOT NULL);



CREATE INDEX "idx_attempts_topic" ON "public"."attempts" USING "btree" ("topic_id");



CREATE INDEX "idx_attempts_type" ON "public"."attempts" USING "btree" ("attempt_type");



CREATE INDEX "idx_classes_school" ON "public"."classes" USING "btree" ("school_id");



CREATE INDEX "idx_classes_teacher" ON "public"."classes" USING "btree" ("teacher_id");



CREATE INDEX "idx_invite_codes_code" ON "public"."teacher_invite_codes" USING "btree" ("code");



CREATE INDEX "idx_invite_codes_school" ON "public"."teacher_invite_codes" USING "btree" ("school_id");



CREATE INDEX "idx_learners_class" ON "public"."learners" USING "btree" ("class_id");



CREATE INDEX "idx_learners_school" ON "public"."learners" USING "btree" ("school_id");



CREATE INDEX "idx_mastery_history_learner" ON "public"."mastery_history" USING "btree" ("learner_id", "topic_id", "recorded_at");



CREATE UNIQUE INDEX "idx_mv_class_mastery" ON "public"."mv_class_mastery" USING "btree" ("class_id", "topic_id");



CREATE UNIQUE INDEX "idx_mv_learner_summary" ON "public"."mv_learner_summary" USING "btree" ("learner_id");



CREATE UNIQUE INDEX "idx_mv_question_analytics" ON "public"."mv_question_analytics" USING "btree" ("question_id");



CREATE INDEX "idx_questions_owner" ON "public"."questions" USING "btree" ("owner_teacher_id");



CREATE INDEX "idx_questions_topic" ON "public"."questions" USING "btree" ("topic_id");



CREATE INDEX "idx_questions_visibility" ON "public"."questions" USING "btree" ("visibility");



CREATE INDEX "idx_review_queue_due" ON "public"."review_queue" USING "btree" ("learner_id", "due_at") WHERE ("stage" <> 'retained'::"text");



CREATE INDEX "idx_review_queue_learner" ON "public"."review_queue" USING "btree" ("learner_id");



CREATE INDEX "idx_review_queue_learner_not_retained" ON "public"."review_queue" USING "btree" ("learner_id", "due_at") WHERE ("stage" <> 'retained'::"text");



CREATE INDEX "idx_self_practice_class_level" ON "public"."self_practice_sessions" USING "btree" ("practice_class_level");



CREATE INDEX "idx_strands_subject" ON "public"."strands" USING "btree" ("subject_id");



CREATE INDEX "idx_sub_strands_strand" ON "public"."sub_strands" USING "btree" ("strand_id");



CREATE INDEX "idx_teachers_school" ON "public"."teachers" USING "btree" ("school_id");



CREATE INDEX "idx_topic_mastery_learner" ON "public"."topic_mastery" USING "btree" ("learner_id");



CREATE INDEX "idx_topic_mastery_learner_status" ON "public"."topic_mastery" USING "btree" ("learner_id", "status");



CREATE INDEX "idx_topic_mastery_learner_topic_status" ON "public"."topic_mastery" USING "btree" ("learner_id", "topic_id", "status");



CREATE INDEX "idx_topic_mastery_status" ON "public"."topic_mastery" USING "btree" ("status");



CREATE INDEX "idx_topic_mastery_topic" ON "public"."topic_mastery" USING "btree" ("topic_id");



CREATE INDEX "idx_topics_class_level" ON "public"."topics" USING "btree" ("class_level");



CREATE INDEX "idx_topics_sub_strand" ON "public"."topics" USING "btree" ("sub_strand_id");



CREATE OR REPLACE TRIGGER "trg_mastery_snapshot" AFTER UPDATE ON "public"."topic_mastery" FOR EACH ROW EXECUTE FUNCTION "public"."record_mastery_snapshot"();



ALTER TABLE ONLY "public"."attempts"
    ADD CONSTRAINT "attempts_learner_id_fkey" FOREIGN KEY ("learner_id") REFERENCES "public"."learners"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."attempts"
    ADD CONSTRAINT "attempts_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "public"."questions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."attempts"
    ADD CONSTRAINT "attempts_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "public"."topics"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."class_subjects"
    ADD CONSTRAINT "class_subjects_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "public"."classes"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."class_subjects"
    ADD CONSTRAINT "class_subjects_subject_id_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."subjects"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."classes"
    ADD CONSTRAINT "classes_school_id_fkey" FOREIGN KEY ("school_id") REFERENCES "public"."schools"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."classes"
    ADD CONSTRAINT "classes_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "public"."teachers"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."learners"
    ADD CONSTRAINT "learners_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "public"."classes"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."learners"
    ADD CONSTRAINT "learners_school_id_fkey" FOREIGN KEY ("school_id") REFERENCES "public"."schools"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."mastery_history"
    ADD CONSTRAINT "mastery_history_learner_id_fkey" FOREIGN KEY ("learner_id") REFERENCES "public"."learners"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."mastery_history"
    ADD CONSTRAINT "mastery_history_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "public"."topics"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."questions"
    ADD CONSTRAINT "questions_owner_teacher_id_fkey" FOREIGN KEY ("owner_teacher_id") REFERENCES "public"."teachers"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."questions"
    ADD CONSTRAINT "questions_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "public"."topics"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."review_queue"
    ADD CONSTRAINT "review_queue_learner_id_fkey" FOREIGN KEY ("learner_id") REFERENCES "public"."learners"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."review_queue"
    ADD CONSTRAINT "review_queue_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "public"."questions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."review_queue"
    ADD CONSTRAINT "review_queue_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "public"."topics"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."self_practice_sessions"
    ADD CONSTRAINT "self_practice_sessions_learner_id_fkey" FOREIGN KEY ("learner_id") REFERENCES "public"."learners"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."self_practice_sessions"
    ADD CONSTRAINT "self_practice_sessions_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "public"."topics"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."strands"
    ADD CONSTRAINT "strands_subject_id_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."subjects"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."sub_strands"
    ADD CONSTRAINT "sub_strands_strand_id_fkey" FOREIGN KEY ("strand_id") REFERENCES "public"."strands"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."teacher_invite_codes"
    ADD CONSTRAINT "teacher_invite_codes_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."teachers"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."teacher_invite_codes"
    ADD CONSTRAINT "teacher_invite_codes_school_id_fkey" FOREIGN KEY ("school_id") REFERENCES "public"."schools"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."teachers"
    ADD CONSTRAINT "teachers_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."teachers"
    ADD CONSTRAINT "teachers_school_id_fkey" FOREIGN KEY ("school_id") REFERENCES "public"."schools"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."topic_mastery"
    ADD CONSTRAINT "topic_mastery_learner_id_fkey" FOREIGN KEY ("learner_id") REFERENCES "public"."learners"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."topic_mastery"
    ADD CONSTRAINT "topic_mastery_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "public"."topics"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."topics"
    ADD CONSTRAINT "topics_sub_strand_id_fkey" FOREIGN KEY ("sub_strand_id") REFERENCES "public"."sub_strands"("id") ON DELETE CASCADE;



ALTER TABLE "public"."attempts" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "attempts_insert" ON "public"."attempts" FOR INSERT WITH CHECK (("learner_id" = "auth"."uid"()));



CREATE POLICY "attempts_select" ON "public"."attempts" FOR SELECT USING ((("learner_id" = "auth"."uid"()) OR ("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"())))));



ALTER TABLE "public"."class_subjects" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "class_subjects_teacher" ON "public"."class_subjects" TO "authenticated" USING (("class_id" IN ( SELECT "classes"."id"
   FROM "public"."classes"
  WHERE ("classes"."teacher_id" = "auth"."uid"()))));



ALTER TABLE "public"."classes" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "classes_anon_select_by_code" ON "public"."classes" FOR SELECT USING (true);



CREATE POLICY "classes_teacher_delete" ON "public"."classes" FOR DELETE TO "authenticated" USING (("teacher_id" = "auth"."uid"()));



CREATE POLICY "classes_teacher_insert" ON "public"."classes" FOR INSERT TO "authenticated" WITH CHECK (("teacher_id" = "auth"."uid"()));



CREATE POLICY "classes_teacher_select" ON "public"."classes" FOR SELECT TO "authenticated" USING (("teacher_id" = "auth"."uid"()));



CREATE POLICY "classes_teacher_update" ON "public"."classes" FOR UPDATE TO "authenticated" USING (("teacher_id" = "auth"."uid"()));



CREATE POLICY "invite_codes_anon_select" ON "public"."teacher_invite_codes" FOR SELECT USING (("uses_remaining" > 0));



CREATE POLICY "invite_codes_insert" ON "public"."teacher_invite_codes" FOR INSERT WITH CHECK ((("created_by" = "auth"."uid"()) AND ("school_id" = "public"."get_teacher_school_id"())));



CREATE POLICY "invite_codes_select" ON "public"."teacher_invite_codes" FOR SELECT USING (("school_id" = "public"."get_teacher_school_id"()));



ALTER TABLE "public"."learners" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "learners_insert_all" ON "public"."learners" FOR INSERT WITH CHECK ((("auth"."uid"() = "id") OR ("class_id" IN ( SELECT "classes"."id"
   FROM "public"."classes"
  WHERE ("classes"."teacher_id" = "auth"."uid"())))));



CREATE POLICY "learners_select_all" ON "public"."learners" FOR SELECT USING (true);



CREATE POLICY "learners_teacher_delete" ON "public"."learners" FOR DELETE USING (("class_id" IN ( SELECT "classes"."id"
   FROM "public"."classes"
  WHERE ("classes"."teacher_id" = "auth"."uid"()))));



CREATE POLICY "learners_teacher_update" ON "public"."learners" FOR UPDATE USING (("class_id" IN ( SELECT "classes"."id"
   FROM "public"."classes"
  WHERE ("classes"."teacher_id" = "auth"."uid"()))));



CREATE POLICY "learners_update_all" ON "public"."learners" FOR UPDATE USING ((("auth"."uid"() = "id") OR ("class_id" IN ( SELECT "classes"."id"
   FROM "public"."classes"
  WHERE ("classes"."teacher_id" = "auth"."uid"())))));



ALTER TABLE "public"."mastery_history" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "mastery_history_insert" ON "public"."mastery_history" FOR INSERT WITH CHECK (("learner_id" = "auth"."uid"()));



CREATE POLICY "mastery_history_select" ON "public"."mastery_history" FOR SELECT USING ((("learner_id" = "auth"."uid"()) OR ("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"())))));



CREATE POLICY "mastery_history_teacher_select" ON "public"."mastery_history" FOR SELECT USING (("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"()))));



ALTER TABLE "public"."questions" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "questions_anon_select" ON "public"."questions" FOR SELECT USING (("visibility" = 'shared'::"text"));



CREATE POLICY "questions_delete" ON "public"."questions" FOR DELETE TO "authenticated" USING (("owner_teacher_id" = "auth"."uid"()));



CREATE POLICY "questions_insert" ON "public"."questions" FOR INSERT TO "authenticated" WITH CHECK (("owner_teacher_id" = "auth"."uid"()));



CREATE POLICY "questions_select" ON "public"."questions" FOR SELECT USING ((("visibility" = 'shared'::"text") OR ("owner_teacher_id" = "auth"."uid"()) OR (("visibility" = 'school'::"text") AND ("owner_teacher_id" IN ( SELECT "teachers"."id"
   FROM "public"."teachers"
  WHERE ("teachers"."school_id" IN ( SELECT "teachers_1"."school_id"
           FROM "public"."teachers" "teachers_1"
          WHERE ("teachers_1"."id" = "auth"."uid"()))))))));



CREATE POLICY "questions_update" ON "public"."questions" FOR UPDATE TO "authenticated" USING (("owner_teacher_id" = "auth"."uid"()));



ALTER TABLE "public"."review_queue" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "review_queue_insert" ON "public"."review_queue" FOR INSERT WITH CHECK (("learner_id" = "auth"."uid"()));



CREATE POLICY "review_queue_select" ON "public"."review_queue" FOR SELECT USING ((("learner_id" = "auth"."uid"()) OR ("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"())))));



CREATE POLICY "review_queue_teacher_select" ON "public"."review_queue" FOR SELECT USING (("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"()))));



CREATE POLICY "review_queue_update" ON "public"."review_queue" FOR UPDATE USING ((("learner_id" = "auth"."uid"()) OR ("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"())))));



ALTER TABLE "public"."schools" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "schools_select" ON "public"."schools" FOR SELECT TO "authenticated" USING (("id" IN ( SELECT "teachers"."school_id"
   FROM "public"."teachers"
  WHERE ("teachers"."id" = "auth"."uid"()))));



CREATE POLICY "self_practice_insert" ON "public"."self_practice_sessions" FOR INSERT WITH CHECK (("learner_id" = "auth"."uid"()));



CREATE POLICY "self_practice_select" ON "public"."self_practice_sessions" FOR SELECT USING ((("learner_id" = "auth"."uid"()) OR ("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"())))));



ALTER TABLE "public"."self_practice_sessions" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "self_practice_teacher_select" ON "public"."self_practice_sessions" FOR SELECT USING (("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"()))));



ALTER TABLE "public"."strands" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "strands_anon_read" ON "public"."strands" FOR SELECT USING (true);



CREATE POLICY "strands_read" ON "public"."strands" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));



ALTER TABLE "public"."sub_strands" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "sub_strands_anon_read" ON "public"."sub_strands" FOR SELECT USING (true);



CREATE POLICY "sub_strands_read" ON "public"."sub_strands" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));



ALTER TABLE "public"."subjects" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "subjects_anon_read" ON "public"."subjects" FOR SELECT USING (true);



CREATE POLICY "subjects_read" ON "public"."subjects" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));



ALTER TABLE "public"."teacher_invite_codes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."teachers" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "teachers_insert_own" ON "public"."teachers" FOR INSERT WITH CHECK (("id" = "auth"."uid"()));



CREATE POLICY "teachers_select_own" ON "public"."teachers" FOR SELECT TO "authenticated" USING (("id" = "auth"."uid"()));



CREATE POLICY "teachers_update_own" ON "public"."teachers" FOR UPDATE TO "authenticated" USING (("id" = "auth"."uid"()));



ALTER TABLE "public"."topic_mastery" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "topic_mastery_insert" ON "public"."topic_mastery" FOR INSERT WITH CHECK (("learner_id" = "auth"."uid"()));



CREATE POLICY "topic_mastery_select" ON "public"."topic_mastery" FOR SELECT USING ((("learner_id" = "auth"."uid"()) OR ("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"())))));



CREATE POLICY "topic_mastery_teacher_select" ON "public"."topic_mastery" FOR SELECT USING (("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"()))));



CREATE POLICY "topic_mastery_update" ON "public"."topic_mastery" FOR UPDATE USING ((("learner_id" = "auth"."uid"()) OR ("learner_id" IN ( SELECT "l"."id"
   FROM ("public"."learners" "l"
     JOIN "public"."classes" "c" ON (("l"."class_id" = "c"."id")))
  WHERE ("c"."teacher_id" = "auth"."uid"())))));



ALTER TABLE "public"."topics" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "topics_anon_read" ON "public"."topics" FOR SELECT USING (true);



CREATE POLICY "topics_read" ON "public"."topics" FOR SELECT USING (("auth"."role"() = 'authenticated'::"text"));





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";












GRANT ALL ON FUNCTION "public"."armor"("bytea") TO "postgres";
GRANT ALL ON FUNCTION "public"."armor"("bytea") TO "anon";
GRANT ALL ON FUNCTION "public"."armor"("bytea") TO "authenticated";
GRANT ALL ON FUNCTION "public"."armor"("bytea") TO "service_role";



GRANT ALL ON FUNCTION "public"."armor"("bytea", "text"[], "text"[]) TO "postgres";
GRANT ALL ON FUNCTION "public"."armor"("bytea", "text"[], "text"[]) TO "anon";
GRANT ALL ON FUNCTION "public"."armor"("bytea", "text"[], "text"[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."armor"("bytea", "text"[], "text"[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."calculate_bece_readiness"("p_learner_id" "uuid", "p_subject_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."calculate_bece_readiness"("p_learner_id" "uuid", "p_subject_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."calculate_bece_readiness"("p_learner_id" "uuid", "p_subject_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."check_retained_mastery"("p_learner_id" "uuid", "p_topic_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."check_retained_mastery"("p_learner_id" "uuid", "p_topic_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."check_retained_mastery"("p_learner_id" "uuid", "p_topic_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."create_learner_account"("p_class_id" "uuid", "p_display_name" "text", "p_email" "text", "p_password" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."create_learner_account"("p_class_id" "uuid", "p_display_name" "text", "p_email" "text", "p_password" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."create_learner_account"("p_class_id" "uuid", "p_display_name" "text", "p_email" "text", "p_password" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."crypt"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."crypt"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."crypt"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."crypt"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."dearmor"("text") TO "postgres";
GRANT ALL ON FUNCTION "public"."dearmor"("text") TO "anon";
GRANT ALL ON FUNCTION "public"."dearmor"("text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."dearmor"("text") TO "service_role";



GRANT ALL ON FUNCTION "public"."decrypt"("bytea", "bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."decrypt"("bytea", "bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."decrypt"("bytea", "bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."decrypt"("bytea", "bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."decrypt_iv"("bytea", "bytea", "bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."decrypt_iv"("bytea", "bytea", "bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."decrypt_iv"("bytea", "bytea", "bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."decrypt_iv"("bytea", "bytea", "bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."digest"("bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."digest"("bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."digest"("bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."digest"("bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."digest"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."digest"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."digest"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."digest"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."encrypt"("bytea", "bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."encrypt"("bytea", "bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."encrypt"("bytea", "bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."encrypt"("bytea", "bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."encrypt_iv"("bytea", "bytea", "bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."encrypt_iv"("bytea", "bytea", "bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."encrypt_iv"("bytea", "bytea", "bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."encrypt_iv"("bytea", "bytea", "bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."gen_random_bytes"(integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."gen_random_bytes"(integer) TO "anon";
GRANT ALL ON FUNCTION "public"."gen_random_bytes"(integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."gen_random_bytes"(integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."gen_random_uuid"() TO "postgres";
GRANT ALL ON FUNCTION "public"."gen_random_uuid"() TO "anon";
GRANT ALL ON FUNCTION "public"."gen_random_uuid"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."gen_random_uuid"() TO "service_role";



GRANT ALL ON FUNCTION "public"."gen_salt"("text") TO "postgres";
GRANT ALL ON FUNCTION "public"."gen_salt"("text") TO "anon";
GRANT ALL ON FUNCTION "public"."gen_salt"("text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."gen_salt"("text") TO "service_role";



GRANT ALL ON FUNCTION "public"."gen_salt"("text", integer) TO "postgres";
GRANT ALL ON FUNCTION "public"."gen_salt"("text", integer) TO "anon";
GRANT ALL ON FUNCTION "public"."gen_salt"("text", integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."gen_salt"("text", integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_due_reviews"("p_learner_id" "uuid", "p_limit" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."get_due_reviews"("p_learner_id" "uuid", "p_limit" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_due_reviews"("p_learner_id" "uuid", "p_limit" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_teacher_id"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_teacher_id"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_teacher_id"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_teacher_school_id"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_teacher_school_id"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_teacher_school_id"() TO "service_role";



GRANT ALL ON FUNCTION "public"."hmac"("bytea", "bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."hmac"("bytea", "bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."hmac"("bytea", "bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."hmac"("bytea", "bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."hmac"("text", "text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."hmac"("text", "text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."hmac"("text", "text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."hmac"("text", "text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."join_school_via_invite"("p_teacher_id" "uuid", "p_invite_code" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."join_school_via_invite"("p_teacher_id" "uuid", "p_invite_code" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."join_school_via_invite"("p_teacher_id" "uuid", "p_invite_code" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_armor_headers"("text", OUT "key" "text", OUT "value" "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_armor_headers"("text", OUT "key" "text", OUT "value" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_armor_headers"("text", OUT "key" "text", OUT "value" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_armor_headers"("text", OUT "key" "text", OUT "value" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_key_id"("bytea") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_key_id"("bytea") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_key_id"("bytea") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_key_id"("bytea") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea", "text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea", "text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea", "text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt"("bytea", "bytea", "text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_decrypt_bytea"("bytea", "bytea", "text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt"("text", "bytea") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt"("text", "bytea") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt"("text", "bytea") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt"("text", "bytea") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt"("text", "bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt"("text", "bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt"("text", "bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt"("text", "bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt_bytea"("bytea", "bytea") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt_bytea"("bytea", "bytea") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt_bytea"("bytea", "bytea") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt_bytea"("bytea", "bytea") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt_bytea"("bytea", "bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt_bytea"("bytea", "bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt_bytea"("bytea", "bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_pub_encrypt_bytea"("bytea", "bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt"("bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt"("bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt"("bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt"("bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt"("bytea", "text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt"("bytea", "text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt"("bytea", "text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt"("bytea", "text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt_bytea"("bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt_bytea"("bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt_bytea"("bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt_bytea"("bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt_bytea"("bytea", "text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt_bytea"("bytea", "text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt_bytea"("bytea", "text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_sym_decrypt_bytea"("bytea", "text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt"("text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt"("text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt"("text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt"("text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt"("text", "text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt"("text", "text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt"("text", "text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt"("text", "text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt_bytea"("bytea", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt_bytea"("bytea", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt_bytea"("bytea", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt_bytea"("bytea", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt_bytea"("bytea", "text", "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt_bytea"("bytea", "text", "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt_bytea"("bytea", "text", "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pgp_sym_encrypt_bytea"("bytea", "text", "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."record_mastery_snapshot"() TO "anon";
GRANT ALL ON FUNCTION "public"."record_mastery_snapshot"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."record_mastery_snapshot"() TO "service_role";



GRANT ALL ON FUNCTION "public"."refresh_dashboard_views"() TO "anon";
GRANT ALL ON FUNCTION "public"."refresh_dashboard_views"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."refresh_dashboard_views"() TO "service_role";



GRANT ALL ON FUNCTION "public"."submit_attempt"("p_learner_id" "uuid", "p_question_id" "uuid", "p_topic_id" "uuid", "p_is_correct" boolean, "p_learner_answer" "jsonb", "p_time_taken" integer, "p_hints_used" integer, "p_attempt_type" "text", "p_session_id" "uuid", "p_session_question_index" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."submit_attempt"("p_learner_id" "uuid", "p_question_id" "uuid", "p_topic_id" "uuid", "p_is_correct" boolean, "p_learner_answer" "jsonb", "p_time_taken" integer, "p_hints_used" integer, "p_attempt_type" "text", "p_session_id" "uuid", "p_session_question_index" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."submit_attempt"("p_learner_id" "uuid", "p_question_id" "uuid", "p_topic_id" "uuid", "p_is_correct" boolean, "p_learner_answer" "jsonb", "p_time_taken" integer, "p_hints_used" integer, "p_attempt_type" "text", "p_session_id" "uuid", "p_session_question_index" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_generate_v1"() TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_generate_v1"() TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_generate_v1"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_generate_v1"() TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_generate_v1mc"() TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_generate_v1mc"() TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_generate_v1mc"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_generate_v1mc"() TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_generate_v3"("namespace" "uuid", "name" "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_generate_v3"("namespace" "uuid", "name" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_generate_v3"("namespace" "uuid", "name" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_generate_v3"("namespace" "uuid", "name" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_generate_v4"() TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_generate_v4"() TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_generate_v4"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_generate_v4"() TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_generate_v5"("namespace" "uuid", "name" "text") TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_generate_v5"("namespace" "uuid", "name" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_generate_v5"("namespace" "uuid", "name" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_generate_v5"("namespace" "uuid", "name" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_nil"() TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_nil"() TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_nil"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_nil"() TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_ns_dns"() TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_ns_dns"() TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_ns_dns"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_ns_dns"() TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_ns_oid"() TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_ns_oid"() TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_ns_oid"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_ns_oid"() TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_ns_url"() TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_ns_url"() TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_ns_url"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_ns_url"() TO "service_role";



GRANT ALL ON FUNCTION "public"."uuid_ns_x500"() TO "postgres";
GRANT ALL ON FUNCTION "public"."uuid_ns_x500"() TO "anon";
GRANT ALL ON FUNCTION "public"."uuid_ns_x500"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."uuid_ns_x500"() TO "service_role";


















GRANT ALL ON TABLE "public"."attempts" TO "anon";
GRANT ALL ON TABLE "public"."attempts" TO "authenticated";
GRANT ALL ON TABLE "public"."attempts" TO "service_role";



GRANT ALL ON TABLE "public"."class_subjects" TO "anon";
GRANT ALL ON TABLE "public"."class_subjects" TO "authenticated";
GRANT ALL ON TABLE "public"."class_subjects" TO "service_role";



GRANT ALL ON TABLE "public"."classes" TO "anon";
GRANT ALL ON TABLE "public"."classes" TO "authenticated";
GRANT ALL ON TABLE "public"."classes" TO "service_role";



GRANT ALL ON TABLE "public"."learners" TO "anon";
GRANT ALL ON TABLE "public"."learners" TO "authenticated";
GRANT ALL ON TABLE "public"."learners" TO "service_role";



GRANT ALL ON TABLE "public"."mastery_history" TO "anon";
GRANT ALL ON TABLE "public"."mastery_history" TO "authenticated";
GRANT ALL ON TABLE "public"."mastery_history" TO "service_role";



GRANT ALL ON TABLE "public"."topic_mastery" TO "anon";
GRANT ALL ON TABLE "public"."topic_mastery" TO "authenticated";
GRANT ALL ON TABLE "public"."topic_mastery" TO "service_role";



GRANT ALL ON TABLE "public"."topics" TO "anon";
GRANT ALL ON TABLE "public"."topics" TO "authenticated";
GRANT ALL ON TABLE "public"."topics" TO "service_role";



GRANT ALL ON TABLE "public"."mv_class_mastery" TO "anon";
GRANT ALL ON TABLE "public"."mv_class_mastery" TO "authenticated";
GRANT ALL ON TABLE "public"."mv_class_mastery" TO "service_role";



GRANT ALL ON TABLE "public"."self_practice_sessions" TO "anon";
GRANT ALL ON TABLE "public"."self_practice_sessions" TO "authenticated";
GRANT ALL ON TABLE "public"."self_practice_sessions" TO "service_role";



GRANT ALL ON TABLE "public"."mv_learner_summary" TO "anon";
GRANT ALL ON TABLE "public"."mv_learner_summary" TO "authenticated";
GRANT ALL ON TABLE "public"."mv_learner_summary" TO "service_role";



GRANT ALL ON TABLE "public"."questions" TO "anon";
GRANT ALL ON TABLE "public"."questions" TO "authenticated";
GRANT ALL ON TABLE "public"."questions" TO "service_role";



GRANT ALL ON TABLE "public"."mv_question_analytics" TO "anon";
GRANT ALL ON TABLE "public"."mv_question_analytics" TO "authenticated";
GRANT ALL ON TABLE "public"."mv_question_analytics" TO "service_role";



GRANT ALL ON TABLE "public"."review_queue" TO "anon";
GRANT ALL ON TABLE "public"."review_queue" TO "authenticated";
GRANT ALL ON TABLE "public"."review_queue" TO "service_role";



GRANT ALL ON TABLE "public"."schools" TO "anon";
GRANT ALL ON TABLE "public"."schools" TO "authenticated";
GRANT ALL ON TABLE "public"."schools" TO "service_role";



GRANT ALL ON TABLE "public"."strands" TO "anon";
GRANT ALL ON TABLE "public"."strands" TO "authenticated";
GRANT ALL ON TABLE "public"."strands" TO "service_role";



GRANT ALL ON TABLE "public"."sub_strands" TO "anon";
GRANT ALL ON TABLE "public"."sub_strands" TO "authenticated";
GRANT ALL ON TABLE "public"."sub_strands" TO "service_role";



GRANT ALL ON TABLE "public"."subjects" TO "anon";
GRANT ALL ON TABLE "public"."subjects" TO "authenticated";
GRANT ALL ON TABLE "public"."subjects" TO "service_role";



GRANT ALL ON TABLE "public"."teacher_invite_codes" TO "anon";
GRANT ALL ON TABLE "public"."teacher_invite_codes" TO "authenticated";
GRANT ALL ON TABLE "public"."teacher_invite_codes" TO "service_role";



GRANT ALL ON TABLE "public"."teachers" TO "anon";
GRANT ALL ON TABLE "public"."teachers" TO "authenticated";
GRANT ALL ON TABLE "public"."teachers" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";































