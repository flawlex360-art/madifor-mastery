-- ============================================================
-- Fix 1: Patch existing broken identity records
-- Adds missing email_verified and phone_verified fields
-- ============================================================
UPDATE auth.identities
SET identity_data = identity_data || '{"email_verified": false, "phone_verified": false}'::jsonb
WHERE provider = 'email'
  AND identity_data->>'email_verified' IS NULL;

-- ============================================================
-- Fix 2: Update create_learner_account to include required fields
-- ============================================================
CREATE OR REPLACE FUNCTION create_learner_account(
    p_class_id UUID,
    p_display_name TEXT,
    p_email TEXT,
    p_password TEXT
)
RETURNS UUID AS $$
DECLARE
    v_user_id UUID;
    v_school_id UUID;
    v_learner_code TEXT;
BEGIN
    SELECT school_id INTO v_school_id FROM classes WHERE id = p_class_id;
    v_learner_code := substr(md5(random()::text), 1, 8);
    v_user_id := gen_random_uuid();

    -- Create auth user
    INSERT INTO auth.users (
        instance_id, id, aud, role, email, encrypted_password, email_confirmed_at,
        raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
        confirmation_token, email_change, email_change_token_new, recovery_token
    ) VALUES (
        '00000000-0000-0000-0000-000000000000', v_user_id, 'authenticated', 'authenticated',
        p_email, crypt(p_password, gen_salt('bf')), NOW(),
        '{"provider":"email","providers":["email"]}', '{}', NOW(), NOW(),
        '', '', '', ''
    );

    -- Insert identity record WITH email_verified and phone_verified
    INSERT INTO auth.identities (
        id, user_id, identity_data, provider, provider_id, last_sign_in_at, created_at, updated_at
    ) VALUES (
        gen_random_uuid(), v_user_id,
        jsonb_build_object(
            'sub', v_user_id::text,
            'email', p_email,
            'email_verified', false,
            'phone_verified', false
        ),
        'email', v_user_id::text, NOW(), NOW(), NOW()
    );

    -- Create learner record
    INSERT INTO learners (id, class_id, school_id, display_name, learner_code)
    VALUES (v_user_id, p_class_id, v_school_id, TRIM(p_display_name), v_learner_code);

    RETURN v_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- Fix 3: Create delete_learner_account RPC
-- ============================================================
CREATE OR REPLACE FUNCTION delete_learner_account(p_learner_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM public.learners WHERE id = p_learner_id;
    DELETE FROM auth.identities WHERE user_id = p_learner_id;
    DELETE FROM auth.users WHERE id = p_learner_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- Fix 4: Trim existing display_names with trailing whitespace
-- ============================================================
UPDATE public.learners
SET display_name = TRIM(display_name)
WHERE display_name <> TRIM(display_name);
