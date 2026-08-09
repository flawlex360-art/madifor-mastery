-- Flawlex Mastery — Add school_name to teachers table

ALTER TABLE public.teachers
ADD COLUMN IF NOT EXISTS school_name TEXT;
