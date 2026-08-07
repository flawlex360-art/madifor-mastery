-- Voluntary Practice: cross-class level practice tracking
-- Allows learners to practice topics from other class levels (e.g. B9 learner practicing B7)
-- Uses existing self_practice infrastructure (attempt_type = 'self_practice' skips mastery/review)

-- Add class level to self_practice_sessions
ALTER TABLE self_practice_sessions
  ADD COLUMN practice_class_level TEXT CHECK (practice_class_level IN ('B7', 'B8', 'B9'));

-- Index for filtering voluntary practice by level
CREATE INDEX idx_self_practice_class_level ON self_practice_sessions(practice_class_level);
