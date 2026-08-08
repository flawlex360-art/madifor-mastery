-- Create function to completely delete a learner including their auth account
CREATE OR REPLACE FUNCTION delete_learner_account(p_learner_id UUID)
RETURNS VOID AS $$
BEGIN
    -- Delete from public.learners first (though auth.users CASCADE might handle this if FK exists)
    DELETE FROM public.learners WHERE id = p_learner_id;
    
    -- Delete from auth.identities
    DELETE FROM auth.identities WHERE user_id = p_learner_id;
    
    -- Delete from auth.users (requires SECURITY DEFINER)
    DELETE FROM auth.users WHERE id = p_learner_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
