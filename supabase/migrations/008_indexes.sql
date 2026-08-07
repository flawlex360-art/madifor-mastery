-- Flawlex Mastery — Migration 008: Performance Indexes
-- Composite and partial indexes for the most common query patterns

-- Composite: learner's attempts per topic, newest first
-- Used by: trend charts, decline detection, individual drill-down
CREATE INDEX idx_attempts_learner_topic_created
    ON attempts(learner_id, topic_id, created_at DESC);

-- Composite: due reviews for interleaving into assessment sessions
-- Partial: excludes 'retained' rows
CREATE INDEX idx_review_queue_learner_not_retained
    ON review_queue(learner_id, due_at)
    WHERE stage != 'retained';

-- Composite: mastery status per learner for BECE readiness calc
CREATE INDEX idx_topic_mastery_learner_status
    ON topic_mastery(learner_id, status);

-- Composite: class-level dashboard queries
CREATE INDEX idx_topic_mastery_learner_topic_status
    ON topic_mastery(learner_id, topic_id, status);

-- For session-based attempt retrieval
CREATE INDEX idx_attempts_session_index
    ON attempts(session_id, session_question_index)
    WHERE session_id IS NOT NULL;
