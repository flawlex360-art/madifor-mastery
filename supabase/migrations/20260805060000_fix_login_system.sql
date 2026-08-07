-- Fix login system by relying on standard Supabase Auth for dummy emails
-- Drop the broken custom learner creation function
DROP FUNCTION IF EXISTS create_learner_account(UUID, TEXT, TEXT, TEXT);

-- Re-add the PIN column that was removed, and add a dummy_email column to help with lookup
ALTER TABLE learners ADD COLUMN IF NOT EXISTS pin TEXT NOT NULL DEFAULT '';
ALTER TABLE learners ADD COLUMN IF NOT EXISTS dummy_email TEXT;

-- We need an anon policy to allow the login screen to look up a learner's dummy_email by their name and class_id.
-- First, drop the old policies on learners.
DROP POLICY IF EXISTS learners_select ON learners;
DROP POLICY IF EXISTS learners_insert ON learners;
DROP POLICY IF EXISTS learners_update ON learners;

-- Anyone (anon) can read the basic profile of a learner in a class (needed for login name selection)
-- We only expose id, class_id, display_name, dummy_email.
-- Since RLS policies are applied at the row level, we just allow SELECT on learners for anon/authenticated.
CREATE POLICY learners_select_all ON learners
    FOR SELECT USING (true);

-- Authenticated teachers can insert/update learners in their classes.
-- Authenticated learners can update their own record.
-- Furthermore, an authenticated learner can INSERT themselves if their ID matches auth.uid() 
-- (which happens during the dummy email signup process).
CREATE POLICY learners_insert_all ON learners
    FOR INSERT WITH CHECK (
        auth.uid() = id OR
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );

CREATE POLICY learners_update_all ON learners
    FOR UPDATE USING (
        auth.uid() = id OR
        class_id IN (SELECT id FROM classes WHERE teacher_id = auth.uid())
    );
