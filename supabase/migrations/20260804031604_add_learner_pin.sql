-- Add PIN column to learners table for authentication
-- Learners set a 4-digit PIN on first login; required for subsequent logins
ALTER TABLE learners ADD COLUMN pin TEXT NOT NULL DEFAULT '';
