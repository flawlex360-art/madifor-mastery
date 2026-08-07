-- Fix: Scope teacher RLS policies to authenticated role only
-- The original 005 migration created policies without TO clause,
-- which means they apply to ALL roles (including anon). For INSERT,
-- ALL policies must pass, so the teacher policy blocks anon inserts.

-- Teachers
DROP POLICY IF EXISTS teachers_select_own ON teachers;
CREATE POLICY teachers_select_own ON teachers
    FOR SELECT TO authenticated USING (
        id = auth.uid() OR
        school_id IN (SELECT school_id FROM teachers WHERE id = auth.uid())
    );

DROP POLICY IF EXISTS teachers_update_own ON teachers;
CREATE POLICY teachers_update_own ON teachers
    FOR UPDATE TO authenticated USING (id = auth.uid());

-- Schools
DROP POLICY IF EXISTS schools_select ON schools;
CREATE POLICY schools_select ON schools
    FOR SELECT TO authenticated USING (
        id IN (SELECT school_id FROM teachers WHERE id = auth.uid())
    );

-- Classes — teacher CRUD
DROP POLICY IF EXISTS classes_teacher_select ON classes;
CREATE POLICY classes_teacher_select ON classes
    FOR SELECT TO authenticated USING (teacher_id = auth.uid());

DROP POLICY IF EXISTS classes_teacher_insert ON classes;
CREATE POLICY classes_teacher_insert ON classes
    FOR INSERT TO authenticated WITH CHECK (teacher_id = auth.uid());

DROP POLICY IF EXISTS classes_teacher_update ON classes;
CREATE POLICY classes_teacher_update ON classes
    FOR UPDATE TO authenticated USING (teacher_id = auth.uid());

DROP POLICY IF EXISTS classes_teacher_delete ON classes;
CREATE POLICY classes_teacher_delete ON classes
    FOR DELETE TO authenticated USING (teacher_id = auth.uid());

-- Learners — teacher CRUD
DROP POLICY IF EXISTS learners_teacher_select ON learners;
CREATE POLICY learners_teacher_select ON learners
    FOR SELECT TO authenticated USING (
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

DROP POLICY IF EXISTS learners_teacher_insert ON learners;
CREATE POLICY learners_teacher_insert ON learners
    FOR INSERT TO authenticated WITH CHECK (
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

-- Questions — teacher CRUD
DROP POLICY IF EXISTS questions_select ON questions;
CREATE POLICY questions_select ON questions
    FOR SELECT USING (
        visibility = 'shared' OR
        owner_teacher_id = auth.uid() OR
        (visibility = 'school' AND owner_teacher_id IN (
            SELECT id FROM teachers WHERE school_id IN (SELECT school_id FROM teachers WHERE id = auth.uid())
        ))
    );

DROP POLICY IF EXISTS questions_insert ON questions;
CREATE POLICY questions_insert ON questions
    FOR INSERT TO authenticated WITH CHECK (owner_teacher_id = auth.uid());

DROP POLICY IF EXISTS questions_update ON questions;
CREATE POLICY questions_update ON questions
    FOR UPDATE TO authenticated USING (owner_teacher_id = auth.uid());

DROP POLICY IF EXISTS questions_delete ON questions;
CREATE POLICY questions_delete ON questions
    FOR DELETE TO authenticated USING (owner_teacher_id = auth.uid());

-- Attempts — teacher view
DROP POLICY IF EXISTS attempts_teacher_select ON attempts;
CREATE POLICY attempts_teacher_select ON attempts
    FOR SELECT TO authenticated USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );

-- Review queue — teacher view
DROP POLICY IF EXISTS review_queue_select ON review_queue;
CREATE POLICY review_queue_select ON review_queue
    FOR SELECT TO authenticated USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );

-- Topic mastery — teacher view
DROP POLICY IF EXISTS topic_mastery_select ON topic_mastery;
CREATE POLICY topic_mastery_select ON topic_mastery
    FOR SELECT TO authenticated USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );

-- Class subjects
DROP POLICY IF EXISTS class_subjects_teacher ON class_subjects;
CREATE POLICY class_subjects_teacher ON class_subjects
    FOR ALL TO authenticated USING (
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

-- Self practice — teacher view
DROP POLICY IF EXISTS self_practice_select ON self_practice_sessions;
CREATE POLICY self_practice_select ON self_practice_sessions
    FOR SELECT TO authenticated USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );

-- Also need to handle inserts for attempts/review_queue/topic_mastery
-- from authenticated role (teacher-initiated functions like submit_attempt)
DROP POLICY IF EXISTS attempts_insert ON attempts;
CREATE POLICY attempts_insert ON attempts
    FOR INSERT WITH CHECK (true);
-- Note: attempts INSERT needs to work for both anon (learner) and authenticated (teacher/system)

DROP POLICY IF EXISTS review_queue_insert ON review_queue;
CREATE POLICY review_queue_insert ON review_queue
    FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS review_queue_update ON review_queue;
CREATE POLICY review_queue_update ON review_queue
    FOR UPDATE USING (true);

DROP POLICY IF EXISTS topic_mastery_insert ON topic_mastery;
CREATE POLICY topic_mastery_insert ON topic_mastery
    FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS topic_mastery_update ON topic_mastery;
CREATE POLICY topic_mastery_update ON topic_mastery
    FOR UPDATE USING (true);

DROP POLICY IF EXISTS self_practice_insert ON self_practice_sessions;
CREATE POLICY self_practice_insert ON self_practice_sessions
    FOR INSERT WITH CHECK (true);
