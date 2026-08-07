-- Flawlex Mastery — Migration 005: Row-Level Security Policies
-- Multi-tenant isolation: a teacher at School A never sees School B's data.
-- These policies are re-applied AFTER user config, so they always win.

-- ============================================================
-- ENABLE RLS ON ALL TABLES
-- ============================================================
ALTER TABLE schools ENABLE ROW LEVEL SECURITY;
ALTER TABLE teachers ENABLE ROW LEVEL SECURITY;
ALTER TABLE classes ENABLE ROW LEVEL SECURITY;
ALTER TABLE learners ENABLE ROW LEVEL SECURITY;
ALTER TABLE subjects ENABLE ROW LEVEL SECURITY;
ALTER TABLE strands ENABLE ROW LEVEL SECURITY;
ALTER TABLE sub_strands ENABLE ROW LEVEL SECURITY;
ALTER TABLE topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE review_queue ENABLE ROW LEVEL SECURITY;
ALTER TABLE topic_mastery ENABLE ROW LEVEL SECURITY;
ALTER TABLE class_subjects ENABLE ROW LEVEL SECURITY;
ALTER TABLE self_practice_sessions ENABLE ROW LEVEL SECURITY;

-- ============================================================
-- HELPER FUNCTIONS — resolve current user's teacher context
-- Created in public schema (auth schema is protected in Supabase)
-- ============================================================
CREATE OR REPLACE FUNCTION public.get_teacher_id()
RETURNS UUID AS $$
    SELECT id FROM teachers WHERE id = auth.uid()
$$ LANGUAGE sql SECURITY DEFINER STABLE;

CREATE OR REPLACE FUNCTION public.get_teacher_school_id()
RETURNS UUID AS $$
    SELECT school_id FROM teachers WHERE id = auth.uid()
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- ============================================================
-- TEACHERS — see own record + others in same school
-- ============================================================
CREATE POLICY teachers_select_own ON teachers
    FOR SELECT USING (
        id = auth.uid() OR
        school_id = public.get_teacher_school_id()
    );

CREATE POLICY teachers_update_own ON teachers
    FOR UPDATE USING (id = auth.uid());

CREATE POLICY teachers_insert_own ON teachers
    FOR INSERT WITH CHECK (id = auth.uid());

-- ============================================================
-- SCHOOLS — see own school only
-- ============================================================
CREATE POLICY schools_select ON schools
    FOR SELECT USING (
        id = public.get_teacher_school_id()
    );

-- ============================================================
-- CLASSES — CRUD scoped to owning teacher
-- ============================================================
CREATE POLICY classes_teacher_select ON classes
    FOR SELECT USING (teacher_id = auth.uid());

CREATE POLICY classes_teacher_insert ON classes
    FOR INSERT WITH CHECK (teacher_id = auth.uid());

CREATE POLICY classes_teacher_update ON classes
    FOR UPDATE USING (teacher_id = auth.uid());

CREATE POLICY classes_teacher_delete ON classes
    FOR DELETE USING (teacher_id = auth.uid());

-- ============================================================
-- LEARNERS — visible only through their class's teacher
-- ============================================================
CREATE POLICY learners_teacher_select ON learners
    FOR SELECT USING (
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

CREATE POLICY learners_teacher_insert ON learners
    FOR INSERT WITH CHECK (
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

CREATE POLICY learners_teacher_update ON learners
    FOR UPDATE USING (
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

CREATE POLICY learners_teacher_delete ON learners
    FOR DELETE USING (
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

-- ============================================================
-- CURRICULUM — readable by all authenticated users
-- ============================================================
CREATE POLICY subjects_read ON subjects
    FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY strands_read ON strands
    FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY sub_strands_read ON sub_strands
    FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY topics_read ON topics
    FOR SELECT USING (auth.role() = 'authenticated');

-- ============================================================
-- QUESTIONS — visibility-aware access
-- shared: all teachers | school: same school | private: owner only
-- ============================================================
CREATE POLICY questions_select ON questions
    FOR SELECT USING (
        visibility = 'shared' OR
        owner_teacher_id = auth.uid() OR
        (visibility = 'school' AND owner_teacher_id IN (
            SELECT id FROM teachers WHERE school_id = public.get_teacher_school_id()
        ))
    );

CREATE POLICY questions_insert ON questions
    FOR INSERT WITH CHECK (owner_teacher_id = auth.uid());

CREATE POLICY questions_update ON questions
    FOR UPDATE USING (owner_teacher_id = auth.uid());

CREATE POLICY questions_delete ON questions
    FOR DELETE USING (owner_teacher_id = auth.uid());

-- ============================================================
-- ATTEMPTS — teachers see attempts for their class learners
-- ============================================================
CREATE POLICY attempts_teacher_select ON attempts
    FOR SELECT USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );

CREATE POLICY attempts_insert ON attempts
    FOR INSERT WITH CHECK (true);

-- ============================================================
-- REVIEW QUEUE — teachers see their class learners' queues
-- ============================================================
CREATE POLICY review_queue_teacher_select ON review_queue
    FOR SELECT USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );

CREATE POLICY review_queue_insert ON review_queue
    FOR INSERT WITH CHECK (true);

CREATE POLICY review_queue_update ON review_queue
    FOR UPDATE USING (true);

-- ============================================================
-- TOPIC MASTERY — teachers see their class learners' mastery
-- ============================================================
CREATE POLICY topic_mastery_teacher_select ON topic_mastery
    FOR SELECT USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );

CREATE POLICY topic_mastery_insert ON topic_mastery
    FOR INSERT WITH CHECK (true);

CREATE POLICY topic_mastery_update ON topic_mastery
    FOR UPDATE USING (true);

-- ============================================================
-- CLASS SUBJECTS — teacher manages their own class enrollments
-- ============================================================
CREATE POLICY class_subjects_teacher ON class_subjects
    FOR ALL USING (
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

-- ============================================================
-- SELF-PRACTICE SESSIONS — teachers see their class learners
-- ============================================================
CREATE POLICY self_practice_teacher_select ON self_practice_sessions
    FOR SELECT USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );

CREATE POLICY self_practice_insert ON self_practice_sessions
    FOR INSERT WITH CHECK (true);
