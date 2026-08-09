-- Fix infinite recursion in teacher RLS by using a SECURITY DEFINER function

CREATE OR REPLACE FUNCTION is_admin()
RETURNS boolean
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT COALESCE((SELECT is_admin FROM teachers WHERE id = auth.uid()), false);
$$;

-- Drop the recursive policy
DROP POLICY IF EXISTS "Admins can view all teachers" ON public.teachers;

-- Recreate policies using the function
CREATE POLICY "Admins can view all teachers" ON public.teachers
  FOR SELECT
  USING (
    auth.uid() = id OR is_admin()
  );

DROP POLICY IF EXISTS "Admins can view all classes" ON public.classes;
CREATE POLICY "Admins can view all classes" ON public.classes
  FOR SELECT
  USING (
    is_admin()
  );

DROP POLICY IF EXISTS "Admins can view all learners" ON public.learners;
CREATE POLICY "Admins can view all learners" ON public.learners
  FOR SELECT
  USING (
    is_admin()
  );
