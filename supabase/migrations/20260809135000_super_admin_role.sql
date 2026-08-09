-- Add is_admin and status to teachers
ALTER TABLE public.teachers
ADD COLUMN IF NOT EXISTS is_admin BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';

-- Elevate the requested user
UPDATE public.teachers
SET is_admin = true
WHERE email = 'eli@flawlex.online';

-- RPC to suspend a teacher
CREATE OR REPLACE FUNCTION suspend_teacher_account(p_teacher_id UUID, p_status TEXT)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  -- Only allow admins to call this
  IF NOT EXISTS (
    SELECT 1 FROM teachers WHERE id = auth.uid() AND is_admin = true
  ) THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  UPDATE teachers SET status = p_status WHERE id = p_teacher_id;
END;
$$;

-- RPC to completely delete a teacher account (cascading to their learners)
CREATE OR REPLACE FUNCTION delete_teacher_account(p_teacher_id UUID)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, auth
AS $$
DECLARE
  v_learner_id UUID;
BEGIN
  -- Only allow admins to call this
  IF NOT EXISTS (
    SELECT 1 FROM teachers WHERE id = auth.uid() AND is_admin = true
  ) THEN
    RAISE EXCEPTION 'Unauthorized';
  END IF;

  -- 1. For every learner in this teacher's classes, delete their auth.users entry
  FOR v_learner_id IN 
    SELECT l.id 
    FROM learners l
    JOIN classes c ON l.class_id = c.id
    WHERE c.teacher_id = p_teacher_id
  LOOP
    DELETE FROM auth.users WHERE id = v_learner_id;
  END LOOP;

  -- 2. Delete the teacher's auth.users entry 
  DELETE FROM auth.users WHERE id = p_teacher_id;

  -- Just in case CASCADE isn't set up perfectly
  DELETE FROM classes WHERE teacher_id = p_teacher_id;
  DELETE FROM teachers WHERE id = p_teacher_id;
  
END;
$$;

-- Admins can view all teachers
DROP POLICY IF EXISTS "Admins can view all teachers" ON public.teachers;
CREATE POLICY "Admins can view all teachers" ON public.teachers
  FOR SELECT
  USING (
    auth.uid() = id OR
    EXISTS (SELECT 1 FROM teachers t2 WHERE t2.id = auth.uid() AND t2.is_admin = true)
  );

-- Admins can view all classes
DROP POLICY IF EXISTS "Admins can view all classes" ON public.classes;
CREATE POLICY "Admins can view all classes" ON public.classes
  FOR SELECT
  USING (
    EXISTS (SELECT 1 FROM teachers WHERE id = auth.uid() AND is_admin = true)
  );

-- Admins can view all learners
DROP POLICY IF EXISTS "Admins can view all learners" ON public.learners;
CREATE POLICY "Admins can view all learners" ON public.learners
  FOR SELECT
  USING (
    EXISTS (SELECT 1 FROM teachers WHERE id = auth.uid() AND is_admin = true)
  );
