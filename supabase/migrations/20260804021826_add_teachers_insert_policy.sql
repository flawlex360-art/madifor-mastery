-- Add missing INSERT policy for teachers table
-- Without this, teacherSignUp() cannot insert the teacher row after auth signup

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE policyname = 'teachers_insert_own' AND tablename = 'teachers'
  ) THEN
    CREATE POLICY teachers_insert_own ON teachers
      FOR INSERT WITH CHECK (id = auth.uid());
  END IF;
END $$;

-- Backfill: create teacher rows for any auth users that were registered
-- but whose teacher INSERT was blocked by RLS
INSERT INTO public.teachers (id, full_name, email)
SELECT u.id,
       COALESCE(u.raw_user_meta_data->>'full_name', split_part(u.email, '@', 1)),
       u.email
FROM auth.users u
LEFT JOIN public.teachers t ON t.id = u.id
WHERE t.id IS NULL
ON CONFLICT (id) DO NOTHING;
