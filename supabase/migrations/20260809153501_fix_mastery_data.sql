-- Flawlex Mastery — Data Fix for Mastery > 100%
-- Caps existing corrupted records to 100%

UPDATE topic_mastery tm
SET 
    first_pass_correct = LEAST(tm.first_pass_correct, (SELECT COUNT(*) FROM questions q WHERE q.topic_id = tm.topic_id)),
    first_pass_pct = LEAST(tm.first_pass_pct, 100.0),
    status = CASE 
        WHEN LEAST(tm.first_pass_pct, 100.0) >= 80.0 THEN 'first_pass_mastered' 
        ELSE 'in_progress' 
    END
WHERE tm.first_pass_pct > 100.0;
