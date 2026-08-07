-- Mastery History: track mastery changes over time for trend charts
-- One row per (learner, topic) mastery snapshot

CREATE TABLE mastery_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    learner_id UUID NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
    topic_id UUID NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
    first_pass_pct NUMERIC(5,2) NOT NULL,
    status TEXT NOT NULL,
    recorded_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_mastery_history_learner ON mastery_history(learner_id, topic_id, recorded_at);

-- Trigger: automatically record a mastery snapshot when topic_mastery changes
CREATE OR REPLACE FUNCTION record_mastery_snapshot()
RETURNS TRIGGER AS $$
BEGIN
    -- Only record if first_pass_pct actually changed
    IF OLD.first_pass_pct IS DISTINCT FROM NEW.first_pass_pct
       OR OLD.status IS DISTINCT FROM NEW.status THEN
        INSERT INTO mastery_history (learner_id, topic_id, first_pass_pct, status)
        VALUES (NEW.learner_id, NEW.topic_id, NEW.first_pass_pct, NEW.status);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_mastery_snapshot
    AFTER UPDATE ON topic_mastery
    FOR EACH ROW
    EXECUTE FUNCTION record_mastery_snapshot();

-- Anon access for learner-side queries
CREATE POLICY mastery_history_anon_select ON mastery_history
    FOR SELECT USING (true);
CREATE POLICY mastery_history_anon_insert ON mastery_history
    FOR INSERT WITH CHECK (true);

-- RLS for teacher access
ALTER TABLE mastery_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY mastery_history_teacher_select ON mastery_history
    FOR SELECT USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );
