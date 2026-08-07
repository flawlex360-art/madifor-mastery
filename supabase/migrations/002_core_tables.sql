-- Flawlex Mastery — Migration 002: Core Tables
-- Multi-tenant foundation: Schools → Teachers → Classes → Learners
-- RLS policies in 005_rls_policies.sql

-- ============================================================
-- SCHOOLS — top-level tenant
-- ============================================================
CREATE TABLE schools (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    invite_code TEXT UNIQUE NOT NULL DEFAULT encode(gen_random_bytes(6), 'hex'),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- TEACHERS — linked to Supabase Auth user
-- ============================================================
CREATE TABLE teachers (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    school_id UUID REFERENCES schools(id) ON DELETE SET NULL,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    role TEXT NOT NULL DEFAULT 'teacher' CHECK (role IN ('teacher', 'school_admin')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- CLASSES — a teacher's class grouping
-- ============================================================
CREATE TABLE classes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    teacher_id UUID NOT NULL REFERENCES teachers(id) ON DELETE CASCADE,
    school_id UUID REFERENCES schools(id) ON DELETE SET NULL,
    name TEXT NOT NULL,
    class_level TEXT NOT NULL CHECK (class_level IN ('B7', 'B8', 'B9')),
    class_code TEXT UNIQUE NOT NULL DEFAULT encode(gen_random_bytes(4), 'hex'),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- LEARNERS — minimal data, no email/password
-- ============================================================
CREATE TABLE learners (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    class_id UUID NOT NULL REFERENCES classes(id) ON DELETE CASCADE,
    school_id UUID REFERENCES schools(id) ON DELETE SET NULL,
    display_name TEXT NOT NULL,
    learner_code TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(class_id, learner_code)
);

-- ============================================================
-- INDEXES for tenant-scoped queries
-- ============================================================
CREATE INDEX idx_teachers_school ON teachers(school_id);
CREATE INDEX idx_classes_teacher ON classes(teacher_id);
CREATE INDEX idx_classes_school ON classes(school_id);
CREATE INDEX idx_learners_class ON learners(class_id);
CREATE INDEX idx_learners_school ON learners(school_id);
