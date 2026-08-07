-- Flawlex Mastery — Migration 003: Curriculum Tables
-- Subject-agnostic design: Subject → Strand → Sub-strand → Topic → Question
-- Nothing here references "Science" specifically — Mathematics slots in as config, not code.

-- ============================================================
-- SUBJECTS
-- ============================================================
CREATE TABLE subjects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL UNIQUE,
    code TEXT NOT NULL UNIQUE,
    class_levels TEXT[] NOT NULL DEFAULT '{"B7","B8","B9"}',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- STRANDS — top-level curriculum grouping
-- ============================================================
CREATE TABLE strands (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    code TEXT NOT NULL UNIQUE,
    class_level TEXT NOT NULL CHECK (class_level IN ('B7', 'B8', 'B9')),
    sort_order INTEGER NOT NULL DEFAULT 0
);

-- ============================================================
-- SUB-STRANDS
-- ============================================================
CREATE TABLE sub_strands (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    strand_id UUID NOT NULL REFERENCES strands(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    code TEXT NOT NULL UNIQUE,
    sort_order INTEGER NOT NULL DEFAULT 0
);

-- ============================================================
-- TOPICS — the mastery unit
-- ============================================================
CREATE TABLE topics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sub_strand_id UUID NOT NULL REFERENCES sub_strands(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    code TEXT NOT NULL UNIQUE,
    class_level TEXT NOT NULL CHECK (class_level IN ('B7', 'B8', 'B9')),
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- QUESTIONS — the content bank
-- ============================================================
CREATE TABLE questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
    owner_teacher_id UUID REFERENCES teachers(id) ON DELETE SET NULL,

    -- Content
    question_type TEXT NOT NULL CHECK (question_type IN (
        'multiple_choice', 'fill_in_blank', 'diagram_label',
        'matching', 'short_structured'
    )),
    stem TEXT NOT NULL,
    options JSONB,
    correct_answer JSONB NOT NULL,
    explanation TEXT NOT NULL,
    hints TEXT[],

    -- Metadata
    difficulty TEXT NOT NULL DEFAULT 'core' CHECK (difficulty IN ('easy', 'core', 'bece_level')),
    blooms_level TEXT NOT NULL DEFAULT 'recall' CHECK (blooms_level IN ('recall', 'application', 'analysis')),
    diagram_url TEXT,

    -- Visibility: shared (all teachers), school (same school), private (owner only)
    visibility TEXT NOT NULL DEFAULT 'private' CHECK (visibility IN ('shared', 'private', 'school')),

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- INDEXES
-- ============================================================
CREATE INDEX idx_strands_subject ON strands(subject_id);
CREATE INDEX idx_sub_strands_strand ON sub_strands(strand_id);
CREATE INDEX idx_topics_sub_strand ON topics(sub_strand_id);
CREATE INDEX idx_topics_class_level ON topics(class_level);
CREATE INDEX idx_questions_topic ON questions(topic_id);
CREATE INDEX idx_questions_owner ON questions(owner_teacher_id);
CREATE INDEX idx_questions_visibility ON questions(visibility);
