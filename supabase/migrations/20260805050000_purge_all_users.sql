-- Migration to completely wipe all existing users and application data
-- We delete from auth.users which cascades to teachers.
-- We also delete from learners manually (in case they were disconnected).
-- Finally, we wipe classes and schools just to have a fully clean slate.

DELETE FROM auth.users;
DELETE FROM learners;
DELETE FROM teachers;
DELETE FROM classes;
DELETE FROM schools;
