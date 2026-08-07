-- Allow learners (unauthenticated/anon) to look up classes by code
-- This is needed for the learner login flow which doesn't use Supabase Auth
CREATE POLICY classes_anon_select_by_code ON classes
    FOR SELECT USING (true);

-- Allow learners to create/update their own records
-- Learners authenticate via localStorage, not Supabase Auth, so they run as anon
CREATE POLICY learners_anon_insert ON learners
    FOR INSERT WITH CHECK (true);

CREATE POLICY learners_anon_select ON learners
    FOR SELECT USING (true);

CREATE POLICY learners_anon_update ON learners
    FOR UPDATE USING (true);

-- Allow learners to insert attempts (quiz answers)
CREATE POLICY attempts_anon_insert ON attempts
    FOR INSERT WITH CHECK (true);

-- Allow learners to read their own attempts
CREATE POLICY attempts_anon_select ON attempts
    FOR SELECT USING (true);

-- Allow learners to manage their review queue
CREATE POLICY review_queue_anon_select ON review_queue
    FOR SELECT USING (true);

CREATE POLICY review_queue_anon_insert ON review_queue
    FOR INSERT WITH CHECK (true);

CREATE POLICY review_queue_anon_update ON review_queue
    FOR UPDATE USING (true);

-- Allow learners to read their topic mastery
CREATE POLICY topic_mastery_anon_select ON topic_mastery
    FOR SELECT USING (true);

CREATE POLICY topic_mastery_anon_insert ON topic_mastery
    FOR INSERT WITH CHECK (true);

CREATE POLICY topic_mastery_anon_update ON topic_mastery
    FOR UPDATE USING (true);

-- Allow learners to read curriculum (subjects, strands, topics)
CREATE POLICY subjects_anon_read ON subjects FOR SELECT USING (true);
CREATE POLICY strands_anon_read ON strands FOR SELECT USING (true);
CREATE POLICY sub_strands_anon_read ON sub_strands FOR SELECT USING (true);
CREATE POLICY topics_anon_read ON topics FOR SELECT USING (true);

-- Allow learners to read shared questions
CREATE POLICY questions_anon_select ON questions
    FOR SELECT USING (visibility = 'shared');

-- Allow learners to manage self-practice sessions
CREATE POLICY self_practice_anon_select ON self_practice_sessions
    FOR SELECT USING (true);

CREATE POLICY self_practice_anon_insert ON self_practice_sessions
    FOR INSERT WITH CHECK (true);
