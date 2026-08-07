-- Fix infinite recursion in teachers RLS policy
-- The policy referenced itself via a subquery, causing PostgreSQL to loop

-- Drop the recursive policy
DROP POLICY IF EXISTS teachers_select_own ON teachers;

-- Simple policy: teachers can only read their own record
CREATE POLICY teachers_select_own ON teachers
    FOR SELECT TO authenticated USING (
        id = auth.uid()
    );

-- Also fix the schools policy that referenced the recursive function
DROP POLICY IF EXISTS schools_select ON schools;
CREATE POLICY schools_select ON schools
    FOR SELECT TO authenticated USING (
        id IN (SELECT school_id FROM teachers WHERE id = auth.uid())
    );
