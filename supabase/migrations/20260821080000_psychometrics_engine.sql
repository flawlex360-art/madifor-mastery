-- Migration: 009_psychometrics
-- Phase 1: Database Engine for Item Response Theory (Rasch Model Approximation)

-- 1. Learner Abilities Table
CREATE TABLE IF NOT EXISTS learner_abilities (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    learner_id uuid NOT NULL REFERENCES learners(id) ON DELETE CASCADE,
    subject_id uuid NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    theta double precision NOT NULL DEFAULT 0.0, -- True ability score
    total_answered integer NOT NULL DEFAULT 0,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    UNIQUE(learner_id, subject_id)
);

-- Enable RLS for learner abilities
ALTER TABLE learner_abilities ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Learners can view their own abilities"
    ON learner_abilities FOR SELECT
    USING (auth.uid() = learner_id);

CREATE POLICY "Teachers can view their students abilities"
    ON learner_abilities FOR SELECT
    USING (
        learner_id IN (
            SELECT l.id FROM learners l
            JOIN classes c ON l.class_id = c.id
            WHERE c.teacher_id = auth.uid()
        )
    );

-- 2. Question Parameters Table
CREATE TABLE IF NOT EXISTS question_parameters (
    question_id uuid PRIMARY KEY REFERENCES questions(id) ON DELETE CASCADE,
    difficulty double precision NOT NULL DEFAULT 0.0, -- 'b' parameter
    discrimination double precision NOT NULL DEFAULT 1.0, -- 'a' parameter
    guessing double precision NOT NULL DEFAULT 0.0, -- 'c' parameter
    total_attempts integer NOT NULL DEFAULT 0,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

-- Enable RLS for question parameters
ALTER TABLE question_parameters ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view question parameters"
    ON question_parameters FOR SELECT
    USING (true);

-- 3. The Rasch Model Engine (Trigger on attempt_history)
CREATE OR REPLACE FUNCTION process_psychometric_update()
RETURNS TRIGGER AS $$
DECLARE
    v_subject_id uuid;
    v_theta double precision;
    v_b double precision;
    v_prob double precision;
    v_k_theta double precision := 0.3; -- How fast learner ability shifts
    v_k_b double precision := 0.05;    -- How fast question difficulty shifts (slower is better for stability)
    v_s integer;
BEGIN
    -- 1. Find the subject_id for this topic
    SELECT s.subject_id INTO v_subject_id
    FROM topics t
    JOIN sub_strands ss ON t.sub_strand_id = ss.id
    JOIN strands s ON ss.strand_id = s.id
    WHERE t.id = NEW.topic_id;

    IF v_subject_id IS NULL THEN
        RETURN NEW; -- Safefall if topic is orphaned
    END IF;

    -- 2. Get or initialize learner ability
    SELECT theta INTO v_theta
    FROM learner_abilities
    WHERE learner_id = NEW.learner_id AND subject_id = v_subject_id;

    IF NOT FOUND THEN
        INSERT INTO learner_abilities (learner_id, subject_id, theta)
        VALUES (NEW.learner_id, v_subject_id, 0.0)
        RETURNING theta INTO v_theta;
    END IF;

    -- 3. Get or initialize question parameters
    SELECT difficulty INTO v_b
    FROM question_parameters
    WHERE question_id = NEW.question_id;

    IF NOT FOUND THEN
        INSERT INTO question_parameters (question_id, difficulty)
        VALUES (NEW.question_id, 0.0)
        RETURNING difficulty INTO v_b;
    END IF;

    -- 4. Calculate Probability of Correct Answer (Rasch Model: P = 1 / (1 + e^-(theta - b)))
    -- We cap the exponent to prevent overflow errors
    v_prob := 1.0 / (1.0 + exp(GREATEST(LEAST(-(v_theta - v_b), 50.0), -50.0)));
    
    -- 5. Actual score
    IF NEW.is_correct THEN
        v_s := 1;
    ELSE
        v_s := 0;
    END IF;
    
    -- 6. Update Learner Ability (theta_new = theta_old + K * (Actual - Expected))
    UPDATE learner_abilities
    SET theta = theta + v_k_theta * (v_s - v_prob),
        total_answered = total_answered + 1,
        updated_at = now()
    WHERE learner_id = NEW.learner_id AND subject_id = v_subject_id;

    -- 7. Update Question Difficulty (b_new = b_old + K * (Expected - Actual))
    UPDATE question_parameters
    SET difficulty = difficulty + v_k_b * (v_prob - v_s),
        total_attempts = total_attempts + 1,
        updated_at = now()
    WHERE question_id = NEW.question_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Attach Trigger to attempts
DROP TRIGGER IF EXISTS trigger_update_psychometrics ON attempts;
CREATE TRIGGER trigger_update_psychometrics
AFTER INSERT ON attempts
FOR EACH ROW
EXECUTE FUNCTION process_psychometric_update();
