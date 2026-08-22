UPDATE questions
SET 
  options = '["incisor", "molar", "canine", "tusk"]'::jsonb,
  correct_answer = '1'::jsonb,
  question_type = 'multiple_choice'
WHERE id = 'b1373f91-78a6-5a94-b8b8-a27e27a06eac';
