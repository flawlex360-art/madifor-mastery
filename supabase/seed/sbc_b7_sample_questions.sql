-- Flawlex Mastery — SBC B7 Sample Questions
-- 20 questions for B7/JHS1.4.4.1 (Force and Motion: Unbalanced Forces)

-- Q1: multiple_choice — easy — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Which of the following is a contact force?',
    '["Gravity","Magnetic force","Friction","Electric force"]'::jsonb,
    '2'::jsonb,
    'Friction is a contact force because it acts when two surfaces are in direct contact.',
    ARRAY['Contact forces require physical touch between objects.', 'Think about which force needs two surfaces rubbing together.'],
    'easy', 'recall', 'shared'
);

-- Q2: multiple_choice — core — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'The SI unit of force is the:',
    '["Joule","Watt","Newton","Kilogram"]'::jsonb,
    '2'::jsonb,
    'The Newton (N) is the SI unit of force, named after Sir Isaac Newton.',
    ARRAY['Force is measured in Newtons (N).', 'Think about the scientist who gave us the laws of motion.'],
    'core', 'recall', 'shared'
);

-- Q3: multiple_choice — core — application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'A boy pushes a wall with 20N but it does not move. What can you say about the forces?',
    '["The push is greater than the weight","The push is balanced by reaction force","No forces act on it","It will eventually move"]'::jsonb,
    '1'::jsonb,
    'The wall does not move because the 20N push is balanced by an equal reaction force. Net force is zero.',
    ARRAY['Newtons Third Law: every action has an equal opposite reaction.', 'If the wall isnt moving, what does that say about total force?'],
    'core', 'application', 'shared'
);

-- Q4: multiple_choice — core — application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'A 10 kg box is pushed with a net force of 50 N. What is its acceleration?',
    '["5 m/s squared","50 m/s squared","500 m/s squared","0.5 m/s squared"]'::jsonb,
    '0'::jsonb,
    'Using F = ma: a = F/m = 50 N / 10 kg = 5 m/s squared.',
    ARRAY['Rearrange F = ma to find acceleration: a = F/m.', 'Divide the force by the mass.'],
    'core', 'application', 'shared'
);

-- Q5: fill_in_blank — core — application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'fill_in_blank',
    'A force of ___ is required to accelerate a 5 kg mass at 2 m/s squared.',
    NULL,
    '"10"'::jsonb,
    'Using F = ma: F = 5 x 2 = 10 N.',
    ARRAY['Use the formula F = m x a.', 'Multiply the mass (5 kg) by the acceleration (2 m/s squared).'],
    'core', 'application', 'shared'
);

-- Q6: multiple_choice — core — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Gravitational force acts between:',
    '["Only objects on Earth","Any two objects with mass","Only metals","Only living things"]'::jsonb,
    '1'::jsonb,
    'Gravitational force exists between ANY two objects that have mass.',
    ARRAY['Gravity is a universal force.', 'Think about what causes the Moon to orbit the Earth.'],
    'core', 'recall', 'shared'
);

-- Q7: multiple_choice — easy — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Which of the following is an example of a non-contact force?',
    '["Pushing a door","Pulling a rope","Gravity","Kicking a ball"]'::jsonb,
    '2'::jsonb,
    'Gravity is a non-contact force because it acts without physical contact.',
    ARRAY['Non-contact forces act at a distance.', 'Which force can you feel even without touching the source?'],
    'easy', 'recall', 'shared'
);

-- Q8: multiple_choice — core — application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'A car moves at constant speed on a straight road. What about the forces on it?',
    '["Driving force greater than air resistance","All forces balanced","No forces acting","Car will keep accelerating"]'::jsonb,
    '1'::jsonb,
    'Constant speed means zero acceleration, so net force must be zero. All forces are balanced.',
    ARRAY['Zero acceleration means zero net force.', 'If speed isnt changing, what does that say about total force?'],
    'core', 'application', 'shared'
);

-- Q9: multiple_choice — easy — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Newtons First Law of Motion is also known as the law of:',
    '["Acceleration","Inertia","Action and Reaction","Gravity"]'::jsonb,
    '1'::jsonb,
    'Newtons First Law states an object stays at rest or in motion unless acted on by a net force. This is called inertia.',
    ARRAY['This law describes what happens when no net force acts on an object.', 'The word starts with I and means resistance to change in motion.'],
    'easy', 'recall', 'shared'
);

-- Q10: multiple_choice — core — application
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'What happens to acceleration if force is doubled and mass stays the same?',
    '["Stays the same","Doubled","Halved","Quadrupled"]'::jsonb,
    '1'::jsonb,
    'From F = ma, if F doubles and m is constant, a doubles. Acceleration is proportional to force.',
    ARRAY['Acceleration is directly proportional to force (a = F/m).', 'If you double the top of a fraction, what happens?'],
    'core', 'application', 'shared'
);

-- Q11: multiple_choice — easy — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'A lever is an example of:',
    '["A complex machine","A simple machine","An electrical device","A chemical compound"]'::jsonb,
    '1'::jsonb,
    'A lever is one of the six classical simple machines. It multiplies force or changes its direction.',
    ARRAY['Simple machines make work easier.', 'A lever uses a fulcrum to multiply force.'],
    'easy', 'recall', 'shared'
);

-- Q12: multiple_choice — core — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'In a Class 1 lever, the fulcrum is located:',
    '["At one end","Between effort and load","At the other end","Above the lever"]'::jsonb,
    '1'::jsonb,
    'In a Class 1 lever (see-saw, crowbar), the fulcrum is between the effort and the load.',
    ARRAY['Think about a see-saw.', 'Where is the pivot point relative to the people on each end?'],
    'core', 'recall', 'shared'
);

-- Q13: multiple_choice — easy — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Which of the following is NOT a form of energy?',
    '["Heat","Light","Friction","Sound"]'::jsonb,
    '2'::jsonb,
    'Friction is a force, not a form of energy. Heat, light, sound, kinetic, and potential are forms of energy.',
    ARRAY['Energy can be converted from one form to another.', 'Is friction something you can store or convert?'],
    'easy', 'recall', 'shared'
);

-- Q14: multiple_choice — core — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Energy stored in food is an example of:',
    '["Kinetic energy","Potential energy","Chemical energy","Nuclear energy"]'::jsonb,
    '2'::jsonb,
    'Food stores chemical energy in the bonds of its molecules.',
    ARRAY['Think about what kind of energy is stored in bonds.', 'Chemical energy is released during digestion.'],
    'core', 'recall', 'shared'
);

-- Q15: multiple_choice — easy — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Heat transfer by direct contact between particles is called:',
    '["Radiation","Convection","Conduction","Insulation"]'::jsonb,
    '2'::jsonb,
    'Conduction is heat transfer through direct contact between particles.',
    ARRAY['Conduction requires physical contact.', 'Touch a hot spoon - the heat travels through the metal by...'],
    'easy', 'recall', 'shared'
);

-- Q16: multiple_choice — easy — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'Light travels in:',
    '["Curved lines","Straight lines","Circles","Zigzag patterns"]'::jsonb,
    '1'::jsonb,
    'Light travels in straight lines. This is why we see shadows.',
    ARRAY['Think about laser beams or sunbeams through a window.', 'Shadows exist because light cannot bend around objects.'],
    'easy', 'recall', 'shared'
);

-- Q17: multiple_choice — core — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'The flow of electric charges through a conductor is called:',
    '["Voltage","Current","Resistance","Capacitance"]'::jsonb,
    '1'::jsonb,
    'Electric current is the flow of electric charges (electrons) through a conductor. Measured in Amperes.',
    ARRAY['Current = flow of charges.', 'Think of water flowing through a pipe - electricity is similar.'],
    'core', 'recall', 'shared'
);

-- Q18: multiple_choice — core — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Which nutrient deficiency causes kwashiorkor?',
    '["Vitamin C deficiency","Protein deficiency","Iron deficiency","Carbohydrate deficiency"]'::jsonb,
    '1'::jsonb,
    'Kwashiorkor is caused by protein deficiency. It affects children and causes belly swelling.',
    ARRAY['Kwashiorkor is a malnutrition disease.', 'Which macronutrient is essential for growth and repair?'],
    'core', 'recall', 'shared'
);

-- Q19: multiple_choice — easy — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'HIV/AIDS is an example of a:',
    '["Bacterial disease","Fungal disease","Viral disease","Parasitic disease"]'::jsonb,
    '2'::jsonb,
    'HIV is caused by a virus. It attacks the immune system.',
    ARRAY['HIV stands for Human Immunodeficiency Virus.', 'Viruses are much smaller than bacteria.'],
    'easy', 'recall', 'shared'
);

-- Q20: multiple_choice — easy — recall
INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'The process by which water changes from liquid to gas is called:',
    '["Condensation","Precipitation","Evaporation","Transpiration"]'::jsonb,
    '2'::jsonb,
    'Evaporation is when liquid water changes to water vapor due to heat energy.',
    ARRAY['This happens when you boil water.', 'Puddles disappear on hot days because of this process.'],
    'easy', 'recall', 'shared'
);

