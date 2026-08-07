-- Flawlex Mastery — Seed 002: Sample Questions for Forces & Motion (B8.4.1)
-- 20 questions covering Types of Forces, Effects of Forces on Motion, and Friction
-- All questions include the mandatory explanation field

-- ============================================================
-- TOPIC: Types of Forces (B8.4.1.1) — 7 questions
-- ============================================================

-- Q1: MCQ — Easy — Recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000015', NULL, 'multiple_choice',
    'Which of the following is a contact force?',
    '["Gravity","Magnetic force","Friction","Electric force"]',
    '2',
    'Friction is a contact force because it acts when two surfaces are in direct contact. Gravity, magnetic force, and electric force can act at a distance without physical contact.',
    ARRAY['Contact forces require physical touch between objects.', 'Think about which force needs two surfaces rubbing together.'],
    'easy', 'recall', 'shared'
);

-- Q2: MCQ — Core — Recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000015', NULL, 'multiple_choice',
    'The SI unit of force is the:',
    '["Joule","Watt","Newton","Kilogram"]',
    '2',
    'The Newton (N) is the SI unit of force, named after Sir Isaac Newton. 1 Newton is the force needed to accelerate 1 kg at 1 m/s². Joule measures energy, Watt measures power, and kilogram measures mass.',
    ARRAY['Force is measured in Newtons (N).', 'Think about the scientist who gave us the laws of motion.'],
    'core', 'recall', 'shared'
);

-- Q3: MCQ — Core — Application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000015', NULL, 'multiple_choice',
    'A boy pushes a wall with a force of 20N but the wall does not move. What can you say about the forces acting on the wall?',
    '["The push force is greater than the wall''s weight","The push force is balanced by friction or reaction force","The wall has no forces acting on it","The wall will eventually move if he pushes harder"]',
    '1',
    'The wall does not move because the 20N push is balanced by an equal and opposite reaction force from the ground (friction) and the wall''s own rigidity. This means the net force is zero, so there is no acceleration.',
    ARRAY['Newton''s Third Law: every action has an equal and opposite reaction.', 'If the wall isn''t moving, what does that tell you about the total force?'],
    'core', 'application', 'shared'
);

-- Q4: MCQ — BECE-level — Application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000015', NULL, 'multiple_choice',
    'Which diagram shows a pair of balanced forces acting on a box resting on a table?',
    '["Arrow pointing right only","Arrows pointing left and right with equal length","Arrow pointing down only","Arrows pointing up and down with unequal length"]',
    '1',
    'Balanced forces are equal in magnitude but opposite in direction. A box at rest has its weight (down) balanced by the normal reaction (up), and any horizontal forces must also balance. Equal-length arrows in opposite directions represent balanced forces.',
    ARRAY['Balanced forces mean the object is stationary or moving at constant speed.', 'Equal forces in opposite directions cancel each other out.'],
    'bece_level', 'application', 'shared'
);

-- Q5: Fill-in-blank — Core — Recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000015', NULL, 'fill_in_blank',
    'A force of ___ is required to accelerate a 5 kg mass at 2 m/s².',
    NULL,
    '"10"',
    'Using Newton''s Second Law: F = m × a = 5 kg × 2 m/s² = 10 N. Force equals mass times acceleration.',
    ARRAY['Use the formula F = m × a.', 'Multiply the mass (5 kg) by the acceleration (2 m/s²).'],
    'core', 'application', 'shared'
);

-- Q6: MCQ — Core — Recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000015', NULL, 'multiple_choice',
    'Gravitational force acts between:',
    '["Only objects on Earth","Any two objects with mass","Only metals","Only living things"]',
    '1',
    'Gravitational force exists between ANY two objects that have mass. The force is very weak unless one or both objects are very large (like planets). It is a non-contact force that acts at a distance.',
    ARRAY['Gravity is a universal force.', 'Think about what causes the Moon to orbit the Earth.'],
    'core', 'recall', 'shared'
);

-- Q7: MCQ — Easy — Recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000015', NULL, 'multiple_choice',
    'Which of the following is an example of a non-contact force?',
    '["Pushing a door","Pulling a rope","Gravity","Kicking a ball"]',
    '2',
    'Gravity is a non-contact force because it acts without physical contact between objects. Pushing, pulling, and kicking all require direct physical contact between the objects involved.',
    ARRAY['Non-contact forces act at a distance.', 'Which force can you feel even without touching the source?'],
    'easy', 'recall', 'shared'
);

-- ============================================================
-- TOPIC: Effects of Forces on Motion (B8.4.1.2) — 7 questions
-- ============================================================

-- Q8: MCQ — Core — Application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000016', NULL, 'multiple_choice',
    'A 10 kg box is pushed with a net force of 50 N. What is its acceleration?',
    '["5 m/s²","50 m/s²","500 m/s²","0.5 m/s²"]',
    '0',
    'Using F = ma: a = F/m = 50 N / 10 kg = 5 m/s². Acceleration is force divided by mass.',
    ARRAY['Rearrange F = ma to find acceleration: a = F/m.', 'Divide the force by the mass.'],
    'core', 'application', 'shared'
);

-- Q9: MCQ — Core — Application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000016', NULL, 'multiple_choice',
    'A car is moving at a constant speed on a straight road. What can you say about the forces on it?',
    '["The driving force is greater than air resistance","All forces are balanced","There are no forces acting on it","The car will keep accelerating"]',
    '1',
    'Constant speed in a straight line means zero acceleration. By Newton''s Second Law (F=ma), if acceleration is zero, the net force must be zero. This means the driving force exactly balances all resistive forces (friction + air resistance).',
    ARRAY['Zero acceleration means zero net force.', 'If the speed isn''t changing, what does that say about the total force?'],
    'core', 'application', 'shared'
);

-- Q10: MCQ — BECE-level — Analysis
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000016', NULL, 'multiple_choice',
    'A ball is thrown vertically upwards. At its highest point, what is the net force acting on it? (Ignore air resistance)',
    '["Zero — it has stopped","Equal to its weight, acting downwards","Greater than its weight","Less than its weight but acting upwards"]',
    '1',
    'At the highest point, the ball momentarily has zero velocity, but gravity still acts on it with the same force (weight = mg). The net force is NOT zero — it is the ball''s weight pulling it down. This is why it starts falling back.',
    ARRAY['Gravity never stops acting, even when the ball stops moving.', 'The ball''s velocity is zero, but is the force zero?'],
    'bece_level', 'analysis', 'shared'
);

-- Q11: MCQ — Core — Application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000016', NULL, 'multiple_choice',
    'What happens to the acceleration of an object if the force acting on it is doubled while the mass stays the same?',
    '["It stays the same","It is doubled","It is halved","It is quadrupled"]',
    '1',
    'From F = ma, if F doubles and m stays constant, then a must also double. Acceleration is directly proportional to force when mass is constant.',
    ARRAY['Acceleration is directly proportional to force (a = F/m).', 'If you double the top of a fraction, what happens to the result?'],
    'core', 'application', 'shared'
);

-- Q12: Fill-in-blank — Core — Application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000016', NULL, 'fill_in_blank',
    'A force of 100 N accelerates an object at 4 m/s². The mass of the object is ___ kg.',
    NULL,
    '"25"',
    'Using F = ma: m = F/a = 100 N / 4 m/s² = 25 kg. Mass is force divided by acceleration.',
    ARRAY['Rearrange F = ma to find mass: m = F/a.', 'Divide the force by the acceleration.'],
    'core', 'application', 'shared'
);

-- Q13: MCQ — BECE-level — Analysis
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000016', NULL, 'multiple_choice',
    'A skydiver falls at constant velocity after opening the parachute. Which statement is correct?',
    '["Air resistance equals the skydiver''s weight","Air resistance is greater than the skydiver''s weight","Gravity has stopped acting","The skydiver has no forces acting on them"]',
    '0',
    'Constant velocity means zero acceleration, which means zero net force. The only two forces acting are weight (down) and air resistance (up). For net force to be zero, these must be equal and opposite.',
    ARRAY['Constant velocity = zero net force.', 'Two forces: one up (air resistance), one down (weight). They must be...?'],
    'bece_level', 'analysis', 'shared'
);

-- Q14: MCQ — Easy — Recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000016', NULL, 'multiple_choice',
    'Newton''s First Law of Motion is also known as the law of:',
    '["Acceleration","Inertia","Action and Reaction","Gravity"]',
    '1',
    'Newton''s First Law states that an object at rest stays at rest, and an object in motion stays in motion at constant velocity, unless acted upon by a net external force. This property of matter is called inertia.',
    ARRAY['This law describes what happens when no net force acts on an object.', 'The word starts with "I" and means resistance to change in motion.'],
    'easy', 'recall', 'shared'
);

-- ============================================================
-- TOPIC: Friction (B8.4.1.3) — 6 questions
-- ============================================================

-- Q15: MCQ — Easy — Recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000017', NULL, 'multiple_choice',
    'Friction always acts in the direction that:',
    '["Helps the motion of an object","Opposes the motion or intended motion of an object","Is perpendicular to the motion","Is the same as the applied force"]',
    '1',
    'Friction always opposes the direction of motion or intended motion. If you push a box to the right, friction acts to the left. If you try to start a box moving to the right, static friction acts to the left.',
    ARRAY['Think about what happens when you slide a book across a table.', 'Which direction does friction push relative to the sliding direction?'],
    'easy', 'recall', 'shared'
);

-- Q16: MCQ — Core — Application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000017', NULL, 'multiple_choice',
    'A student pushes a heavy box on a rough floor. To reduce the friction, the student could:',
    '["Push harder","Place rollers under the box","Increase the weight of the box","Use a rougher surface"]',
    '1',
    'Rollers convert sliding friction into rolling friction, which is much smaller. Pushing harder increases the normal force (and friction), increasing weight increases friction, and a rougher surface increases friction.',
    ARRAY['Rolling friction is much less than sliding friction.', 'How can you change the type of friction instead of fighting it?'],
    'core', 'application', 'shared'
);

-- Q17: MCQ — Core — Recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000017', NULL, 'multiple_choice',
    'Which of the following is an ADVANTAGE of friction?',
    '["It wears out machine parts","It causes heating in engines","It allows us to walk without slipping","It slows down moving vehicles"]',
    '2',
    'Friction between our shoes and the ground provides the grip we need to walk. Without friction, we would slip and be unable to move. This is a key advantage of friction in daily life.',
    ARRAY['Think about walking on ice (very low friction).', 'What would happen if there was no grip between your feet and the ground?'],
    'core', 'recall', 'shared'
);

-- Q18: MCQ — BECE-level — Application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000017', NULL, 'multiple_choice',
    'A wooden block is pulled across a table at constant speed. If the block''s weight is 20 N and the coefficient of friction is 0.3, what is the frictional force?',
    '["6 N","20 N","0.3 N","60 N"]',
    '0',
    'Frictional force = coefficient of friction × normal force. On a flat surface, normal force = weight = 20 N. So friction = 0.3 × 20 = 6 N. Since the block moves at constant speed, the pulling force must also equal 6 N.',
    ARRAY['Friction = μ × N, where μ is the coefficient and N is the normal force.', 'On a flat surface, the normal force equals the weight.'],
    'bece_level', 'application', 'shared'
);

-- Q19: MCQ — Core — Analysis
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000017', NULL, 'multiple_choice',
    'Why do car tyres have grooved patterns on their surface?',
    '["To make the car look attractive","To increase friction and improve grip on wet roads","To reduce the weight of the tyre","To allow air to flow through"]',
    '1',
    'The grooves in car tyres channel water away from the contact patch, allowing the rubber to grip the road surface. This increases friction and prevents hydroplaning (skidding on wet roads).',
    ARRAY['Think about what happens to a smooth tyre on a wet road.', 'The grooves help with water and grip.'],
    'core', 'analysis', 'shared'
);

-- Q20: MCQ — BECE-level — Analysis
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0000000-0000-0000-0000-000000000017', NULL, 'multiple_choice',
    'A ball rolling on grass slows down faster than a ball rolling on a smooth tiled floor. This is because:',
    '["The ball on grass is heavier","Grass exerts more friction than the tiled floor","Gravity is stronger on grass","The ball loses energy on tiles but not on grass"]',
    '1',
    'Grass is a rougher surface than smooth tiles, so it exerts more friction on the rolling ball. Greater friction means a larger opposing force, which causes the ball to decelerate faster and stop sooner.',
    ARRAY['Rougher surfaces create more friction.', 'Compare the texture of grass to smooth tiles.'],
    'bece_level', 'analysis', 'shared'
);
