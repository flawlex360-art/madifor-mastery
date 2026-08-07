-- Flawlex Mastery — Migration 004: Assessment & Review Tables
-- Attempts, review queue, topic mastery, self-practice sessions

-- ============================================================
-- CLASS SUBJECTS — enrollment junction table
-- ============================================================
CREATE TABLE class_subjects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    class_id UUID NOT NULL REFERENCES classes(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    enrolled_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(class_id, subject_id)
);

-- ============================================================
-- ATTEMPTS — every answer a learner gives
-- ============================================================
CREATE TABLE attempts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    learner_id UUID NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,

    is_correct BOOLEAN NOT NULL,
    learner_answer JSONB,
    time_taken_seconds INTEGER,
    hints_used INTEGER NOT NULL DEFAULT 0,

    attempt_type TEXT NOT NULL CHECK (attempt_type IN ('graded', 'review', 'self_practice')),

    -- Session grouping: which assessment session this attempt belongs to
    session_id UUID,
    session_question_index INTEGER,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- REVIEW QUEUE — spaced repetition state per (learner, question)
-- ============================================================
CREATE TABLE review_queue (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    learner_id UUID NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,

    stage TEXT NOT NULL DEFAULT 'missed' CHECK (stage IN (
        'missed', 'review_1', 'review_2', 'review_3', 'retained'
    )),
    due_at TIMESTAMPTZ NOT NULL,
    added_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    last_reviewed_at TIMESTAMPTZ,

    UNIQUE(learner_id, question_id)
);

-- ============================================================
-- TOPIC MASTERY — per-learner, per-topic mastery state
-- ============================================================
CREATE TABLE topic_mastery (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    learner_id UUID NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,

    -- First-pass mastery
    first_pass_correct INTEGER NOT NULL DEFAULT 0,
    first_pass_total INTEGER NOT NULL DEFAULT 0,
    first_pass_pct NUMERIC(5,2) NOT NULL DEFAULT 0.00,
    first_pass_mastered BOOLEAN NOT NULL DEFAULT FALSE,

    -- Retained mastery
    retained_mastered BOOLEAN NOT NULL DEFAULT FALSE,
    retained_at TIMESTAMPTZ,

    -- Status
    status TEXT NOT NULL DEFAULT 'not_started' CHECK (status IN (
        'not_started', 'in_progress', 'first_pass_mastered', 'retained_mastered'
    )),
    last_updated TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    UNIQUE(learner_id, topic_id)
);

-- ============================================================
-- SELF-PRACTICE SESSIONS — tracked separately from mastery
-- ============================================================
CREATE TABLE self_practice_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    learner_id UUID NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
    questions_attempted INTEGER NOT NULL DEFAULT 0,
    questions_correct INTEGER NOT NULL DEFAULT 0,
    started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    ended_at TIMESTAMPTZ
);

-- ============================================================
-- INDEXES
-- ============================================================
CREATE INDEX idx_attempts_learner ON attempts(learner_id);
CREATE INDEX idx_attempts_question ON attempts(question_id);
CREATE INDEX idx_attempts_topic ON attempts(topic_id);
CREATE INDEX idx_attempts_session ON attempts(session_id);
CREATE INDEX idx_attempts_type ON attempts(attempt_type);
CREATE INDEX idx_attempts_created ON attempts(created_at);

CREATE INDEX idx_review_queue_learner ON review_queue(learner_id);
CREATE INDEX idx_review_queue_due ON review_queue(learner_id, due_at) WHERE stage != 'retained';

CREATE INDEX idx_topic_mastery_learner ON topic_mastery(learner_id);
CREATE INDEX idx_topic_mastery_topic ON topic_mastery(topic_id);
CREATE INDEX idx_topic_mastery_status ON topic_mastery(status);
