CREATE OR REPLACE FUNCTION admin_update_question_options(
  p_id uuid,
  p_options jsonb,
  p_correct int
) RETURNS void AS $$
BEGIN
  UPDATE questions 
  SET options = p_options, correct_answer = to_jsonb(p_correct)
  WHERE id = p_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
