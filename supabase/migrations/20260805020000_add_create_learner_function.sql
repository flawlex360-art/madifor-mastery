-- SECURITY DEFINER function to create learners (bypasses RLS)
CREATE OR REPLACE FUNCTION create_learner(
    p_class_id UUID,
    p_display_name TEXT,
    p_learner_code TEXT,
    p_pin TEXT
)
RETURNS UUID AS $$
DECLARE
    v_id UUID;
    v_school_id UUID;
BEGIN
    SELECT school_id INTO v_school_id FROM classes WHERE id = p_class_id;
    INSERT INTO learners (class_id, school_id, display_name, learner_code, pin)
    VALUES (p_class_id, v_school_id, p_display_name, p_learner_code, p_pin)
    RETURNING id INTO v_id;
    RETURN v_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
