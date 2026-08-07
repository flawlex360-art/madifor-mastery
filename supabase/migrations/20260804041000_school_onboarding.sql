-- School Onboarding: allow teachers to create schools and invite other teachers

-- Teacher invite codes table
CREATE TABLE teacher_invite_codes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    school_id UUID NOT NULL REFERENCES schools(id) ON DELETE CASCADE,
    code TEXT UNIQUE NOT NULL DEFAULT encode(gen_random_bytes(6), 'hex'),
    created_by UUID NOT NULL REFERENCES teachers(id) ON DELETE CASCADE,
    uses_remaining INTEGER NOT NULL DEFAULT 10,
    expires_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_invite_codes_school ON teacher_invite_codes(school_id);
CREATE INDEX idx_invite_codes_code ON teacher_invite_codes(code);

-- RLS
ALTER TABLE teacher_invite_codes ENABLE ROW LEVEL SECURITY;

-- Teachers can see invite codes for their school
CREATE POLICY invite_codes_select ON teacher_invite_codes
    FOR SELECT USING (
        school_id = public.get_teacher_school_id()
    );

-- School admins can create invite codes
CREATE POLICY invite_codes_insert ON teacher_invite_codes
    FOR INSERT WITH CHECK (
        created_by = auth.uid()
        AND school_id = public.get_teacher_school_id()
    );

-- Anon: allow looking up invite codes during teacher registration
CREATE POLICY invite_codes_anon_select ON teacher_invite_codes
    FOR SELECT USING (uses_remaining > 0);

-- Function: join school via invite code
CREATE OR REPLACE FUNCTION join_school_via_invite(
    p_teacher_id UUID,
    p_invite_code TEXT
)
RETURNS BOOLEAN AS $$
DECLARE
    v_school_id UUID;
    v_code_id UUID;
    v_remaining INTEGER;
    v_expires TIMESTAMPTZ;
BEGIN
    -- Find the invite code
    SELECT id, school_id, uses_remaining, expires_at
    INTO v_code_id, v_school_id, v_remaining, v_expires
    FROM teacher_invite_codes
    WHERE code = p_invite_code
      AND uses_remaining > 0;

    IF v_school_id IS NULL THEN
        RETURN FALSE; -- Invalid code
    END IF;

    IF v_expires IS NOT NULL AND v_expires < NOW() THEN
        RETURN FALSE; -- Expired
    END IF;

    -- Link teacher to school
    UPDATE teachers SET school_id = v_school_id WHERE id = p_teacher_id;

    -- Decrement uses
    UPDATE teacher_invite_codes
    SET uses_remaining = uses_remaining - 1
    WHERE id = v_code_id;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
