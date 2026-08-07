-- Flawlex Mastery — SBC B7/JHS1 Questions
-- 27 topics x 20 questions = 540 questions total
-- Generated from NaCCA CCP Science Curriculum (September 2020)

-- ============================================================
-- B7/JHS1.1.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ce78fe2d-6331-599b-8c91-4044d099119a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Matter exists in how many common states?',
    '["Two", "Three", "Four", "Five"]'::jsonb,
    '1'::jsonb,
    'Matter exists in three common states: solid, liquid, and gas.',
    ARRAY['Think about water — ice, liquid, steam.', 'Solid, liquid, gas.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b1559a13-29d8-509a-83f2-9d9a4421adc4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Which state has a definite shape and volume?',
    '["Liquid", "Gas", "Solid", "Plasma"]'::jsonb,
    '2'::jsonb,
    'Solids have definite shape and volume.',
    ARRAY['Think about a rock.', 'Solids hold their shape.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3d64f2f1-6936-5637-b1ee-de17716b5590',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'fill_in_blank',
    'A liquid takes the shape of its ___.',
    NULL,
    '"container"'::jsonb,
    'Liquids take the shape of their container.',
    ARRAY['Pour water into different glasses.', 'The answer is what holds the liquid.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd68c553a-422b-525a-9966-1c1f7b7d3837',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Which of these is a gas at room temperature?',
    '["Iron", "Water", "Oxygen", "Ice"]'::jsonb,
    '2'::jsonb,
    'Oxygen is a gas at room temperature.',
    ARRAY['We breathe it.', '21% of air.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '37c9f10b-2b83-5f8e-b1e3-ecd4ec378e9e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'fill_in_blank',
    'Gases have no definite shape or ___.',
    NULL,
    '"volume"'::jsonb,
    'Gases have no definite shape or volume.',
    ARRAY['Think about air expanding.', 'It fills its container.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '82da638d-355b-5127-be54-289b0e7a0eac',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Ice is water in which state?',
    '["Liquid", "Gas", "Solid", "Vapour"]'::jsonb,
    '2'::jsonb,
    'Ice is solid water.',
    ARRAY['Ice is hard.', 'Water freezes at 0 degrees.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0a99f374-6c83-5169-8b7b-c017d910a7f8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'When water boils, it changes from liquid to gas. This is called:',
    '["Condensation", "Evaporation", "Freezing", "Melting"]'::jsonb,
    '1'::jsonb,
    'Evaporation is liquid to gas.',
    ARRAY['Boiling water produces steam.', 'Opposite of condensation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c0cbaa4d-86fd-5b07-bf3f-ddf5572657cc',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Which property separates sand from water?',
    '["Color", "Filtration", "Evaporation", "Magnetism"]'::jsonb,
    '1'::jsonb,
    'Filtration separates insoluble solids from liquids.',
    ARRAY['Sand does not dissolve.', 'A filter catches the solid.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b3a3fc83-6cd1-57be-822d-613dd9d24ea6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'fill_in_blank',
    'When sugar dissolves in water it forms a ___.',
    NULL,
    '"solution"'::jsonb,
    'Sugar dissolved in water forms a solution.',
    ARRAY['The sugar disappears.', 'A homogeneous mixture.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ba862128-7aca-5516-9844-4a413859cb2f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Ink spreading in water demonstrates:',
    '["Filtration", "Diffusion", "Evaporation", "Condensation"]'::jsonb,
    '1'::jsonb,
    'Diffusion is particles moving from high to low concentration.',
    ARRAY['Ink particles spread evenly.', 'Smells spread the same way.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ac5f0433-37ef-5fc5-b7c1-ac33e31a57d3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'fill_in_blank',
    'Pure water boils at ___ degrees Celsius.',
    NULL,
    '"100"'::jsonb,
    'Water boils at 100 degrees C at standard pressure.',
    ARRAY['A well-known constant.', 'Freezing point + 100.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '33c8a0a3-9bc2-5190-b479-7c973d2e26e7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'A substance that flows and has fixed volume but no fixed shape is a:',
    '["Solid", "Liquid", "Gas", "Plasma"]'::jsonb,
    '1'::jsonb,
    'Liquids flow, have fixed volume, take container shape.',
    ARRAY['Think about water or oil.', 'You can pour it.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a4dd7576-780c-5cd6-9a6c-bd3538beb19f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Compressing a gas in a sealed container will:',
    '["Increase its volume", "Decrease its volume", "Change it to liquid", "Have no effect"]'::jsonb,
    '1'::jsonb,
    'Gas volume decreases under compression.',
    ARRAY['Gas particles have space between them.', 'Think of a syringe.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '114ca9fa-9da2-528b-8d8b-a7c5c2b27128',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Which method separates a salt-water mixture?',
    '["Filtration", "Evaporation", "Magnetism", "Decanting"]'::jsonb,
    '1'::jsonb,
    'Evaporation leaves salt behind when water evaporates.',
    ARRAY['Salt dissolves in water.', 'Water evaporates, salt stays.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f6f39926-bce7-59e1-b704-ab7c4e035f06',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'A mixture of sand and iron filings can be separated by:',
    '["Filtration", "Evaporation", "Using a magnet", "Distillation"]'::jsonb,
    '2'::jsonb,
    'Iron is magnetic; sand is not.',
    ARRAY['Iron sticks to magnets.', 'Sand stays behind.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8e8c2e78-1c0d-5a03-a5ff-1cd9a4ffed01',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'A student has a mixture of salt, sand, and water. Best separation sequence?',
    '["Evaporate then filter", "Filter then evaporate", "Distill only", "Filter then distill"]'::jsonb,
    '1'::jsonb,
    'Filter first to remove sand, then evaporate to recover salt.',
    ARRAY['Sand is insoluble, salt is soluble.', 'Do the easiest first.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7c0b2e4e-b41e-5b8c-8b6b-48ea63405baf',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Why does a gas fill its entire container while a liquid does not?',
    '["Gas particles are heavier", "Gas particles move freely with weak attraction", "Liquid particles are larger", "Gas particles are stationary"]'::jsonb,
    '1'::jsonb,
    'Gas particles have weak intermolecular forces and move freely.',
    ARRAY['Particles in gases are far apart.', 'Random motion in all directions.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dd97af17-9bb2-5cd4-950f-60c8391a673f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'fill_in_blank',
    'Why does sweating cool the body?',
    NULL,
    '"evaporation"'::jsonb,
    'Sweat evaporates, absorbing heat from the skin, cooling the body.',
    ARRAY['What happens when sweat dries?', 'Liquid to gas needs energy.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5b1f8678-1185-5390-977a-ade56d5da8b8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'fill_in_blank',
    'At equilibrium, the rate of evaporation ___ the rate of condensation.',
    NULL,
    '"equals"'::jsonb,
    'At equilibrium, evaporation and condensation rates are equal.',
    ARRAY['Equilibrium means balance.', 'Two opposing processes at same rate.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd19afb2f-cbd2-57c0-9637-f79a13184e57',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.1'), NULL, 'multiple_choice',
    'Why does boiling water temperature stay constant even with continued heating?',
    '["Thermometer is broken", "Energy used for phase change, not temperature increase", "Maximum temperature reached", "Heat lost to surroundings"]'::jsonb,
    '1'::jsonb,
    'Energy goes to overcoming intermolecular forces, not raising temperature.',
    ARRAY['Think about where energy goes during phase change.', 'Latent heat of vaporisation.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.1.1.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '14cdaa15-d723-5a86-afce-a4bbf3d2e7fb',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'fill_in_blank',
    'The periodic table arranges elements by increasing ___.',
    NULL,
    '"atomic number"'::jsonb,
    'Elements are ordered by atomic number (protons).',
    ARRAY['Proton count.', 'The whole number on each square.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '27a7b132-36aa-56c5-96f5-39e3d59bb273',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'How many elements are in Period 1?',
    '["1", "2", "8", "18"]'::jsonb,
    '1'::jsonb,
    'Period 1 has 2 elements: H and He.',
    ARRAY['Top row.', 'Only 1 and 2 electrons.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e09c7be3-2b7d-53b1-b5c9-9703b2cd627d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'fill_in_blank',
    'Elements in the same group have similar ___.',
    NULL,
    '"chemical properties"'::jsonb,
    'Same group = same valence electrons = similar properties.',
    ARRAY['Vertical column.', 'Same outer electrons.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ad4eda07-7eeb-5263-8fa2-4b1b5846db22',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'The symbol Fe stands for:',
    '["Fluorine", "Iron", "Francium", "Fermium"]'::jsonb,
    '1'::jsonb,
    'Fe is iron, from Latin "ferrum".',
    ARRAY['Two letters starting with F.', 'Latin origin.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bcb67080-e7bc-5896-9ca2-bfff57b9ac91',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Noble gases are in Group:',
    '["1", "7", "0 or 8", "2"]'::jsonb,
    '2'::jsonb,
    'Noble gases are in Group 0 (or 8).',
    ARRAY['Very unreactive.', 'Full outer shell.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '534bc482-c6b2-593d-830d-774037fda0bb',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Metals are found on which side of the periodic table?',
    '["Right", "Left and centre", "Both equally", "Only in the middle"]'::jsonb,
    '1'::jsonb,
    'Metals are on the left and centre; non-metals on the right.',
    ARRAY['Most elements are metals.', 'Staircase line divides them.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0e5f57c7-46db-59c9-ad26-fd8aa28c9f94',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Element X has atomic number 11. Its group and period are:',
    '["Group 1, Period 3", "Group 2, Period 3", "Group 1, Period 2", "Group 3, Period 3"]'::jsonb,
    '0'::jsonb,
    'Sodium (11): electron config 2,8,1 — Group 1, Period 3.',
    ARRAY['11 electrons: 2+8+1.', 'Outer shell = period.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf28d51a-359b-5ec9-a28f-742dab5aa4cc',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Why do Group 1 metals react similarly with water?',
    '["Same atomic mass", "All have 1 valence electron", "All are gases", "Same neutrons"]'::jsonb,
    '1'::jsonb,
    'Group 1 elements all have 1 valence electron.',
    ARRAY['Outer electrons determine reactivity.', 'They lose 1 electron.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd54387ec-fd8d-505d-8f59-92f479f8aa11',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'fill_in_blank',
    'Group 7 elements have ___ valence electrons and tend to ___ electrons.',
    NULL,
    '"7, gain 1"'::jsonb,
    'Group 7 has 7 valence electrons, gains 1 for full shell.',
    ARRAY['Group number = valence electrons.', 'Need 1 more for full shell.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cb0cd1e9-5f66-5db0-935a-1c9bb995dd61',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Which element is a noble gas with atomic number 10?',
    '["Helium", "Neon", "Argon", "Krypton"]'::jsonb,
    '1'::jsonb,
    'Neon (Ne) has atomic number 10.',
    ARRAY['Used in signs.', 'Config 2,8.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '33db3b68-079b-5c94-9694-21136182246f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Magnesium forms Mg2+ because it:',
    '["Gains 2 electrons", "Loses 2 electrons", "Loses 1 electron", "Gains 1 electron"]'::jsonb,
    '1'::jsonb,
    'Mg is Group 2, loses 2 electrons to form Mg2+.',
    ARRAY['Group 2 elements lose 2.', 'Positive ion = lost electrons.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a80f20df-874e-5995-a857-5e6dbaa6af29',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Formula of sodium chloride is:',
    '["NaCl2", "NaCl", "Na2Cl", "Na2Cl2"]'::jsonb,
    '1'::jsonb,
    'Na+ and Cl- combine 1:1 to form NaCl.',
    ARRAY['+1 and -1 balance.', 'Simple ionic compound.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '40be1ad8-78a5-57ba-9112-cd069ea272fe',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Element with config 2,8,1 will most likely form ion with charge:',
    '["+1", "+2", "-1", "-2"]'::jsonb,
    '0'::jsonb,
    'Losing 1 valence electron gives +1 charge.',
    ARRAY['1 electron to lose.', 'Group 1 element.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c8c79c93-0d73-5593-89db-4c7731cacf57',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'fill_in_blank',
    'Across Period 3, properties change from ___ to ___.',
    NULL,
    '"metallic, non-metallic"'::jsonb,
    'Period 3 goes from metallic (Na) to non-metallic (Ar).',
    ARRAY['Left to right trend.', 'Staircase line.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1b70dba2-7a82-526c-892f-7651fdd4d976',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Element Z (atomic number 20) is most likely a:',
    '["Metal", "Non-metal", "Noble gas", "Metalloid"]'::jsonb,
    '0'::jsonb,
    'Calcium (20) has config 2,8,8,2 — 2 valence electrons, so it is a metal.',
    ARRAY['Few valence electrons = metal.', 'It can lose 2 electrons.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd3ddc92f-b9c2-5bea-9dc2-9fd265a58870',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'fill_in_blank',
    'Why are noble gases unreactive while Group 1 metals are very reactive?',
    NULL,
    '"full outer shell"'::jsonb,
    'Noble gases have full outer shells; Group 1 metals have 1 electron to lose.',
    ARRAY['Stability = full shell.', 'Reactive atoms want stable config.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd417811d-4433-5b98-a70e-52e49a0dd0c6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'An unknown element forms oxide X2O. Which group is X in?',
    '["Group 1", "Group 2", "Group 4", "Group 7"]'::jsonb,
    '0'::jsonb,
    'Two X atoms each lose 1 electron (+2 total) to balance O (-2).',
    ARRAY['Oxygen is -2.', 'Two X provide +2.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9d0b207d-31f1-5416-8a4a-1118f314504f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Why does reactivity increase down Group 1?',
    '["Gain more electrons", "Outer electron further from nucleus, easier to lose", "Fewer protons", "More electronegative"]'::jsonb,
    '1'::jsonb,
    'More shells = outer electron further from nucleus = weaker attraction.',
    ARRAY['Distance weakens attraction.', 'More shielding.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'da944f5a-629a-53fd-91c7-7ef4722bb786',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'multiple_choice',
    'Is it correct that elements in the same period have similar properties?',
    '["Yes", "No \u2014 same group has similar properties", "Only metals", "Only non-metals"]'::jsonb,
    '1'::jsonb,
    'Same GROUP has similar properties, not same period.',
    ARRAY['Period = row, Group = column.', 'Valence electrons differ across a period.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3cafb0cb-eb22-5aad-82a0-1fc30995b091',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.1.2'), NULL, 'fill_in_blank',
    'Element with config 2,8,7 is in Group ___ and will form ion with charge ___.',
    NULL,
    '"7, -1"'::jsonb,
    'Config 2,8,7 = chlorine. Group 7, gains 1 electron to form -1 ion.',
    ARRAY['Count outer electrons.', 'Almost full shell.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.1.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1052815d-1dc4-563d-b422-7b55a35e88c2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'fill_in_blank',
    'The basic structural and functional unit of life is the ___.',
    NULL,
    '"cell"'::jsonb,
    'All living things are made of cells.',
    ARRAY['The smallest unit of life.', 'All organisms have them.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2d4a6be8-c9a2-53de-b0a0-92d4fc42311f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'Which organelle controls all cell activities?',
    '["Mitochondrion", "Nucleus", "Ribosome", "Cell membrane"]'::jsonb,
    '1'::jsonb,
    'The nucleus controls all cell activities and contains DNA.',
    ARRAY['It is the control centre.', 'Contains genetic material.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1e0c2d3a-880c-5a9a-828d-502cde17b69e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'The cell membrane functions to:',
    '["Produce energy", "Control what enters and exits the cell", "Store food", "Make proteins"]'::jsonb,
    '1'::jsonb,
    'The cell membrane is selectively permeable.',
    ARRAY['It is the outer boundary.', 'Selectively permeable.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f809f1c1-0cdb-5e29-9cec-7bb69cd631ce',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'Which part of the cell is responsible for energy production?',
    '["Nucleus", "Ribosome", "Mitochondrion", "Vacuole"]'::jsonb,
    '2'::jsonb,
    'Mitochondria are the powerhouses of the cell.',
    ARRAY['They produce ATP.', 'Called the powerhouse.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6db82113-96e4-5b6f-86f6-eb9ef39c656e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'fill_in_blank',
    'Plant cells have a rigid ___ that animal cells lack.',
    NULL,
    '"cell wall"'::jsonb,
    'The cell wall provides structural support to plant cells.',
    ARRAY['Made of cellulose.', 'Outside the membrane.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b1c62560-f11e-566e-aa52-3667fb9ff760',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'The jelly-like substance inside a cell is called:',
    '["Nucleus", "Cytoplasm", "Membrane", "Vacuole"]'::jsonb,
    '1'::jsonb,
    'Cytoplasm is the jelly-like fluid where organelles are suspended.',
    ARRAY['Fills the cell.', 'Organelles float in it.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5a27c20a-65e4-5de2-a502-2c4af3747637',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'Which structure is found in plant cells but NOT in animal cells?',
    '["Nucleus", "Cell membrane", "Chloroplast", "Mitochondrion"]'::jsonb,
    '2'::jsonb,
    'Chloroplasts are found only in plant cells for photosynthesis.',
    ARRAY['They capture light energy.', 'Green pigment.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a5de6ecf-fc97-57e1-91d1-c982bb99ce15',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'A student views a cell under a microscope and sees a large central vacuole. This cell is most likely from a:',
    '["Human", "Animal", "Plant", "Bacterium"]'::jsonb,
    '2'::jsonb,
    'Plant cells have a large central vacuole for water storage.',
    ARRAY['Animal cells have small vacuoles.', 'Plants need water storage.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4251c907-0978-57a5-86d6-b9722c3a4131',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'The function of ribosomes is to:',
    '["Store genetic material", "Synthesise proteins", "Produce energy", "Control cell division"]'::jsonb,
    '1'::jsonb,
    'Ribosomes are the sites of protein synthesis.',
    ARRAY['They read mRNA.', 'Found on rough ER.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '73d630cb-a0e1-5928-bee1-4ee249d1fa2a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'Why do red blood cells have no nucleus?',
    '["They are dead", "To carry more oxygen", "They do not need energy", "They are plant cells"]'::jsonb,
    '1'::jsonb,
    'Red blood cells lose their nucleus to make room for haemoglobin.',
    ARRAY['More space for oxygen transport.', 'Specialised for transport.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2e2a511e-f6e5-526e-bd01-c29f23567a17',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'fill_in_blank',
    'Diffusion occurs when particles move from ___ concentration to ___ concentration.',
    NULL,
    '"high, low"'::jsonb,
    'Diffusion is movement from high to low concentration.',
    ARRAY['Particles spread out.', 'No energy needed.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ac77f362-9baf-534b-9ded-9016312a469c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'fill_in_blank',
    'Osmosis is the movement of water through a ___ membrane.',
    NULL,
    '"selectively permeable"'::jsonb,
    'Osmosis is water movement through a selectively permeable membrane.',
    ARRAY['Only water moves.', 'Down water potential gradient.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '09df88e3-45ed-5b10-ba1e-7ed0c33dd454',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'Which organelle is found in both plant and animal cells?',
    '["Chloroplast", "Cell wall", "Mitochondrion", "Large central vacuole"]'::jsonb,
    '2'::jsonb,
    'Mitochondria are found in both plant and animal cells.',
    ARRAY['Both need energy.', 'ATP production.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f1bb3f69-2bea-5015-b3d8-17c155c62c42',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'A cell is placed in a hypotonic solution. What happens?',
    '["It shrinks", "It swells", "Nothing", "It divides"]'::jsonb,
    '1'::jsonb,
    'Water enters the cell by osmosis, causing it to swell.',
    ARRAY['Water moves to lower concentration.', 'Cell gains water.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fb70f184-909b-599f-be9e-5f8887bad66c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'fill_in_blank',
    'Why are mitochondria more numerous in muscle cells than in skin cells?',
    NULL,
    '"energy"'::jsonb,
    'Muscle cells need more energy for contraction, so they have more mitochondria.',
    ARRAY['Active cells need more ATP.', 'Muscles contract frequently.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4095f1f4-4f49-5b7b-bdc1-0d3cd83d6c30',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'A student claims plant cells do not have mitochondria. Is this correct?',
    '["Yes, only animal cells have them", "No, plant cells also have mitochondria", "Only during photosynthesis", "Only in roots"]'::jsonb,
    '1'::jsonb,
    'Plant cells have both chloroplasts AND mitochondria.',
    ARRAY['Plants also respire.', 'Mitochondria for respiration.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8ad0ff8e-45a5-5ba6-8ace-a0078e5cf51c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'Why do root hair cells have many mitochondria?',
    '["To absorb light", "To provide energy for active transport of minerals", "To store water", "To photosynthesise"]'::jsonb,
    '1'::jsonb,
    'Root hair cells use active transport to absorb minerals, which requires ATP from mitochondria.',
    ARRAY['Minerals move against concentration gradient.', 'Active transport needs energy.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e6b94963-b0a9-5e2e-9940-c63ad3e7a41c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'fill_in_blank',
    'If a cell is placed in a hypertonic solution, water moves ___ the cell by osmosis.',
    NULL,
    '"out of"'::jsonb,
    'In hypertonic solution, water leaves the cell, causing it to shrink (crenation).',
    ARRAY['Higher solute outside.', 'Water follows concentration gradient.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a676878d-c50b-5ba0-bb1d-3c89e73c5fec',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'Explain why the cell membrane is described as selectively permeable.',
    '["It blocks everything", "It allows some substances through but not others", "It is fully permeable", "It only allows water"]'::jsonb,
    '1'::jsonb,
    'Selectively permeable means it allows certain molecules through while blocking others.',
    ARRAY['Think of a gate with a guard.', 'Not everything passes through.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ce736689-9a03-578b-b775-509e28f3399a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.1.2.1'), NULL, 'multiple_choice',
    'Which cell structure would be most affected by a poison that stops protein production?',
    '["Mitochondrion", "Ribosome", "Vacuole", "Cell wall"]'::jsonb,
    '1'::jsonb,
    'Ribosomes are responsible for protein synthesis.',
    ARRAY['Where proteins are made.', 'Found in all cells.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.2.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c0ff9444-cfbc-5f28-a7eb-f2b734ff6b13',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'The process by which water changes from liquid to gas is called:',
    '["Condensation", "Evaporation", "Precipitation", "Transpiration"]'::jsonb,
    '1'::jsonb,
    'Evaporation is liquid water changing to water vapour.',
    ARRAY['Happens at the surface.', 'Driven by heat energy.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c725023c-d73c-583d-adf6-a46310edf8e8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Rain, snow, and hail are forms of:',
    '["Evaporation", "Condensation", "Precipitation", "Infiltration"]'::jsonb,
    '2'::jsonb,
    'Precipitation is water falling from clouds.',
    ARRAY['Water falling to earth.', 'Various forms.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a73a106f-ded4-540c-a447-b3e2d1b689e7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Water vapour cooling to form clouds is called:',
    '["Evaporation", "Precipitation", "Condensation", "Runoff"]'::jsonb,
    '2'::jsonb,
    'Condensation is gas cooling to form liquid droplets.',
    ARRAY['Think of fog on a cold day.', 'Opposite of evaporation.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '71c94172-b55f-5879-b3b6-f1a8172d520d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'fill_in_blank',
    'The main source of energy for the water cycle is the ___.',
    NULL,
    '"sun"'::jsonb,
    'The sun provides energy for evaporation.',
    ARRAY['It heats water bodies.', 'Drives the whole cycle.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b83cd995-0093-5cab-8859-e0aee4ae4913',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Water soaking into the ground is called:',
    '["Runoff", "Infiltration", "Condensation", "Evaporation"]'::jsonb,
    '1'::jsonb,
    'Infiltration is water seeping into the soil.',
    ARRAY['Water enters the ground.', 'Recharges groundwater.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7696ce8b-0609-5c94-ac7f-3b642adea4c9',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Water flowing over land surface into rivers is called:',
    '["Infiltration", "Evaporation", "Runoff", "Condensation"]'::jsonb,
    '2'::jsonb,
    'Runoff is water flowing over the surface.',
    ARRAY['Does not soak in.', 'Flows to rivers and lakes.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b26c60b6-1720-52ec-9257-fdbcfdd55f63',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Transpiration is water loss from:',
    '["Rivers", "Oceans", "Plant leaves", "Soil"]'::jsonb,
    '2'::jsonb,
    'Transpiration is water vapour lost from plant leaves.',
    ARRAY['Plants release water.', 'Through stomata.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9b9cd3e5-7dc7-5905-b115-0818f4bfd7ca',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Why does evaporation increase on a hot day?',
    '["Less wind", "Higher temperature increases kinetic energy of water molecules", "More clouds", "Lower air pressure"]'::jsonb,
    '1'::jsonb,
    'Higher temperature means more energy for water molecules to escape.',
    ARRAY['Heat speeds up molecules.', 'More evaporation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '364f869e-cd9a-50c0-9a74-4ab35ebf55af',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'A glass of cold water develops droplets on the outside. This is because:',
    '["The glass is leaking", "Water vapour in air condenses on the cold surface", "Evaporation from the glass", "The water is seeping through"]'::jsonb,
    '1'::jsonb,
    'Warm air meets cold surface; water vapour condenses into liquid droplets.',
    ARRAY['Warm air holds moisture.', 'Cold surface cools the vapour.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b5c727ac-cb3c-543d-897e-b56c11b3c966',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'fill_in_blank',
    'The water cycle is described as a ___ pattern in nature.',
    NULL,
    '"repeated"'::jsonb,
    'The water cycle continuously repeats.',
    ARRAY['It never stops.', 'Same stages over and over.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7f7de319-608d-528c-80bd-3cd5d7f92cba',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Why is the water cycle important for clean water supply?',
    '["It creates new water", "It purifies water through evaporation and condensation", "It filters water through rocks", "It adds chemicals to water"]'::jsonb,
    '1'::jsonb,
    'Evaporation leaves impurities behind; condensation produces pure water.',
    ARRAY['Natural distillation.', 'Salt and impurities stay behind.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e2a59099-b9b6-5391-9837-bdcaf40dd185',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Which part of the water cycle replenishes groundwater?',
    '["Evaporation", "Condensation", "Infiltration", "Runoff"]'::jsonb,
    '2'::jsonb,
    'Infiltration allows water to seep into underground aquifers.',
    ARRAY['Water enters soil.', 'Recharges wells and springs.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '23811e14-a564-52ae-98f6-b5de7209a3be',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'A dam on a river primarily affects which part of the water cycle?',
    '["Evaporation", "Precipitation", "Runoff", "Condensation"]'::jsonb,
    '2'::jsonb,
    'A dam controls runoff by storing water that would flow downstream.',
    ARRAY['Blocks water flow.', 'Controls surface water.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95d7a401-9c79-5e8c-bf77-8467c139d360',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Deforestation can reduce rainfall in an area because:',
    '["Less transpiration", "More evaporation", "More infiltration", "More runoff"]'::jsonb,
    '0'::jsonb,
    'Fewer trees means less transpiration, which reduces moisture in the air for rain.',
    ARRAY['Trees release water vapour.', 'Less moisture = less rain.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b2828f8c-b523-5e5a-9af3-d407eea0c95d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'fill_in_blank',
    'Explain why oceans do not overflow despite all the rivers flowing into them.',
    NULL,
    '"evaporation"'::jsonb,
    'Water evaporates from oceans, balancing the input from rivers.',
    ARRAY['Continuous cycle.', 'Evaporation removes water.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4260a431-1c3f-5dfc-91df-81fd7f71bbd2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'If global temperatures rise, what happens to the water cycle?',
    '["Evaporation decreases", "Evaporation increases, more extreme weather", "The cycle stops", "Rainfall decreases everywhere"]'::jsonb,
    '1'::jsonb,
    'Higher temperatures increase evaporation and atmospheric moisture, leading to more intense weather events.',
    ARRAY['More energy in the system.', 'More evaporation = more storms.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '253b5553-7de3-538c-9ee1-093c22c63cc1',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'Why does water that infiltrates the ground eventually reappear in rivers?',
    '["It is pushed up by gravity", "Groundwater flows underground and emerges at springs or feeds rivers", "It evaporates immediately", "Plants absorb all of it"]'::jsonb,
    '1'::jsonb,
    'Groundwater flows through rock layers and eventually emerges at springs or feeds river base flow.',
    ARRAY['Underground flow paths.', 'Gravity drives the flow.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2b598bcf-a2e1-513b-b530-3b76f654cdb4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'A student claims the water cycle creates new water. Is this correct?',
    '["Yes, condensation creates water", "No, the same water is continuously recycled", "Yes, through photosynthesis", "Only during the rainy season"]'::jsonb,
    '1'::jsonb,
    'The water cycle recycles the same water — no new water is created or destroyed.',
    ARRAY['Conservation of matter.', 'Same water, different states.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ce2f942c-e32f-5a32-a9ae-64def9e7dce5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'multiple_choice',
    'How does urbanisation (building cities) affect the water cycle?',
    '["Increases infiltration", "Increases runoff and decreases infiltration", "Has no effect", "Decreases evaporation"]'::jsonb,
    '1'::jsonb,
    'Concrete and asphalt prevent infiltration, increasing runoff and reducing groundwater recharge.',
    ARRAY['Paved surfaces block water.', 'More flooding.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '403b8995-7154-5a81-94d5-df52a74103b1',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.1.1'), NULL, 'fill_in_blank',
    'The continuous movement of water between the earth and atmosphere is called the ___.',
    NULL,
    '"water cycle"'::jsonb,
    'The water cycle describes water movement through evaporation, condensation, precipitation.',
    ARRAY['Also called hydrological cycle.', 'Never-ending process.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.2.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0d8f057c-862b-51bb-b7d7-02c37e829a3b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'fill_in_blank',
    'The housefly undergoes ___ metamorphosis.',
    NULL,
    '"complete"'::jsonb,
    'The housefly has four stages: egg, larva, pupa, adult.',
    ARRAY['Four distinct stages.', 'Looks very different as adult.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e1b11969-158a-59b9-bc20-f440cd8a6b77',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'The larval stage of a housefly is called a:',
    '["Caterpillar", "Maggot", "Grub", "Tadpole"]'::jsonb,
    '1'::jsonb,
    'The housefly larva is called a maggot.',
    ARRAY['White, worm-like.', 'Found in rotting matter.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cc5436ac-cd3e-57c9-8972-cec7fbb805a4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'How many stages are in the housefly life cycle?',
    '["2", "3", "4", "5"]'::jsonb,
    '2'::jsonb,
    'Four stages: egg, larva, pupa, adult.',
    ARRAY['Egg, larva, pupa, adult.', 'Complete metamorphosis.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '78b89aac-2c62-5123-913d-84a35fc16047',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'The correct order of the housefly life cycle is:',
    '["Adult, pupa, larva, egg", "Egg, larva, pupa, adult", "Egg, pupa, larva, adult", "Larva, egg, adult, pupa"]'::jsonb,
    '1'::jsonb,
    'Egg → larva → pupa → adult.',
    ARRAY['Starts with egg.', 'Adult is the final stage.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e8783d0f-ee12-527b-9d31-d767eeadc046',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'Where does a housefly typically lay its eggs?',
    '["In water", "On rotting organic matter", "On leaves", "Underground"]'::jsonb,
    '1'::jsonb,
    'Houseflies lay eggs on rotting food, manure, or garbage.',
    ARRAY['Food source for larvae.', 'Decaying matter.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '294a9959-98b9-5769-a5e2-0745c5911bbc',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'The pupal stage is a period of:',
    '["Feeding", "Growth", "Transformation", "Death"]'::jsonb,
    '2'::jsonb,
    'During the pupal stage, the larva transforms into an adult.',
    ARRAY['Major changes happen.', 'Body restructures.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '10b7ad3f-d7df-504c-9274-7a9332118416',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'How do houseflies spread diseases?',
    '["Through biting", "By carrying pathogens on their body parts", "Through their droppings only", "By producing toxins"]'::jsonb,
    '1'::jsonb,
    'Houseflies carry pathogens on their legs and body from contaminated surfaces.',
    ARRAY['They land on food after touching waste.', 'Transfer germs.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '76a92f59-507c-52b3-a803-849911c6ab48',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'Houseflies are harmful to humans because they:',
    '["Eat crops", "Spread diseases like dysentery", "Bite humans", "Destroy buildings"]'::jsonb,
    '1'::jsonb,
    'Houseflies spread diseases including dysentery and food poisoning.',
    ARRAY['Land on food after touching waste.', 'Contaminate food.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd5ec029c-dc6f-5326-a1b6-c4a74046cded',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'Which method helps reduce housefly populations?',
    '["Using pesticides only", "Proper waste disposal and sanitation", "Keeping windows open", "Growing more plants"]'::jsonb,
    '1'::jsonb,
    'Removing breeding sites (rotting waste) reduces housefly populations.',
    ARRAY['Remove their food source.', 'Clean environment.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '40720a9e-6d10-537b-aa95-44cfb521f143',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'fill_in_blank',
    'A housefly egg hatches into a ___ in about 8-20 hours.',
    NULL,
    '"larva"'::jsonb,
    'Housefly eggs hatch into larvae (maggots) quickly.',
    ARRAY['First stage after egg.', 'White, worm-like.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f2872f86-0efd-57c7-8eb2-883d60bb7431',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'Why are houseflies more common in areas with poor sanitation?',
    '["They prefer warm areas", "More breeding sites available in waste and garbage", "They need darkness", "They are attracted to light"]'::jsonb,
    '1'::jsonb,
    'Poor sanitation provides more egg-laying sites and food for larvae.',
    ARRAY['Rotting waste is ideal.', 'Clean areas have fewer.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fd1b5d71-c024-5846-8170-977f5683a591',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'The adult housefly emerges from the:',
    '["Egg", "Larva", "Pupa", "Cocoon"]'::jsonb,
    '2'::jsonb,
    'The adult emerges from the pupal case.',
    ARRAY['Final transformation stage.', 'Breaks out of the case.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '78f163d5-c7bc-5a36-af7e-734c9f16e16d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'What is the average lifespan of an adult housefly?',
    '["1 day", "1 week", "1-3 months", "1 year"]'::jsonb,
    '2'::jsonb,
    'Adult houseflies live about 1-3 months under favourable conditions.',
    ARRAY['Not very long.', 'Depends on conditions.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '832e4405-a6ce-5469-95b0-555ae13abf0e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'Housefly larvae (maggots) are sometimes used medically to:',
    '["Spread disease", "Clean wounds by eating dead tissue", "Produce antibiotics", "Make food"]'::jsonb,
    '1'::jsonb,
    'Maggot therapy uses sterile larvae to remove dead tissue from wounds.',
    ARRAY['They eat dead tissue only.', 'Medical application.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '65371ce5-10d2-5204-afeb-d2aab11ccf22',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'Why is it important to break the housefly life cycle at the larval stage?',
    '["Larvae are easiest to see", "Larvae cause the most damage", "Preventing larvae prevents adults from forming", "Adults cannot reproduce"]'::jsonb,
    '2'::jsonb,
    'Eliminating larvae prevents them from developing into reproducing adults.',
    ARRAY['Break the cycle early.', 'Prevent population growth.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '61034c85-6ed9-53c7-89c2-f709288fcbe4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'fill_in_blank',
    'A community has increasing housefly problems. What integrated approach would you recommend?',
    NULL,
    '"sanitation"'::jsonb,
    'Proper waste management, sanitation, and fly traps together reduce populations.',
    ARRAY['Multiple methods needed.', 'Clean up breeding sites.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '93a5fc1a-49ce-57f2-afe4-637cf197b5e7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'fill_in_blank',
    'Explain why covering food helps prevent housefly-related diseases.',
    NULL,
    '"prevents contamination"'::jsonb,
    'Covering food prevents houseflies from landing on it and transferring pathogens.',
    ARRAY['Flies carry germs on legs.', 'No contact = no transfer.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'df7fbe4a-dd5a-5472-9795-00761347216c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'Houseflies and butterflies both undergo complete metamorphosis. How are their pupal stages different?',
    '["Identical", "Fly forms a puparium, butterfly forms a chrysalis", "Fly has no pupal stage", "Butterfly has no pupal stage"]'::jsonb,
    '1'::jsonb,
    'Flies form a hard puparium; butterflies form a chrysalis (or cocoon for moths).',
    ARRAY['Different protective structures.', 'Same purpose, different forms.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '33371873-fd46-5b1e-8787-389cf69f0ff7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'Why are houseflies considered more dangerous than mosquitoes in spreading intestinal diseases?',
    '["They are larger", "They breed faster", "They carry pathogens from faeces to food directly", "They bite more people"]'::jsonb,
    '2'::jsonb,
    'Houseflies move between waste and food, directly transferring intestinal pathogens.',
    ARRAY['Touch waste, then touch food.', 'Direct contamination route.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '13ab6137-0102-58f4-803a-895418c2d722',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.2.1'), NULL, 'multiple_choice',
    'The housefly life cycle from egg to adult takes approximately:',
    '["1-2 days", "1-2 weeks", "1-2 months", "1 year"]'::jsonb,
    '1'::jsonb,
    'The complete cycle takes about 1-2 weeks depending on temperature.',
    ARRAY['Faster in warm conditions.', 'Egg to adult.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.2.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e37a0822-4f56-552d-9858-bbeaecaff78b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'fill_in_blank',
    'Plant nutrients from natural sources like manure are called ___.',
    NULL,
    '"organic"'::jsonb,
    'Organic nutrients come from natural sources like compost and manure.',
    ARRAY['From living things.', 'Natural fertiliser.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7a4b7c8d-99d5-5be2-9546-3d4e67c06abf',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Inorganic fertilisers are also known as:',
    '["Natural fertilisers", "Chemical fertilisers", "Organic matter", "Compost"]'::jsonb,
    '1'::jsonb,
    'Inorganic fertilisers are manufactured chemicals.',
    ARRAY['Made in factories.', 'Synthetic nutrients.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e51b61b2-af85-5e7a-b1b6-78d6a5adb25d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'The three main nutrients plants need are:',
    '["Calcium, iron, zinc", "Nitrogen, Phosphorus, Potassium", "Carbon, Hydrogen, Oxygen", "Sodium, Chlorine, Magnesium"]'::jsonb,
    '1'::jsonb,
    'NPK — Nitrogen (N), Phosphorus (P), Potassium (K) are the primary plant nutrients.',
    ARRAY['N-P-K on fertiliser bags.', 'Essential for growth.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '44aed5f5-d907-55ca-8e24-962bda698750',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Nitrogen is important for:',
    '["Root growth", "Leaf and stem growth", "Flowering only", "Seed formation"]'::jsonb,
    '1'::jsonb,
    'Nitrogen promotes vegetative growth — leaves and stems.',
    ARRAY['Makes plants green.', 'For lush growth.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '045acf33-e417-51e5-bc2d-dd7f90812d2d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'fill_in_blank',
    'Compost is an example of an ___ nutrient source.',
    NULL,
    '"organic"'::jsonb,
    'Compost is decomposed organic matter used as fertiliser.',
    ARRAY['From plant/animal waste.', 'Natural decomposition.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8d3129a9-071c-5a78-8398-5de07bd176e2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Which nutrient helps plants develop strong roots?',
    '["Nitrogen", "Phosphorus", "Potassium", "Calcium"]'::jsonb,
    '1'::jsonb,
    'Phosphorus promotes root development and flowering.',
    ARRAY['Important for roots.', 'Also helps flowering.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '44580d65-43e5-59b9-ba38-d3069bdfc054',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Why should organic and inorganic fertilisers not be applied at the same time?',
    '["They cancel each other", "Chemical fertilisers may kill beneficial soil organisms from organic matter", "They produce toxic gases", "Plants cannot absorb both"]'::jsonb,
    '1'::jsonb,
    'Chemical fertilisers can harm soil microorganisms that break down organic matter.',
    ARRAY['Soil organisms are important.', 'Timing matters.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8396caeb-2eda-59ee-a771-e54ea73f9ce3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'A farmer notices yellowing leaves on his crops. Which nutrient is most likely deficient?',
    '["Phosphorus", "Potassium", "Nitrogen", "Calcium"]'::jsonb,
    '2'::jsonb,
    'Nitrogen deficiency causes yellowing (chlorosis) of leaves.',
    ARRAY['Leaves need nitrogen for chlorophyll.', 'Yellow = nitrogen deficiency.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e5abcb21-e103-52fd-bfd3-b75d6edf3d19',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Organic fertilisers improve soil structure because they:',
    '["Add chemicals", "Increase soil organic matter and microbial activity", "Kill weeds", "Reduce water retention"]'::jsonb,
    '1'::jsonb,
    'Organic matter improves soil texture and supports beneficial organisms.',
    ARRAY['Better soil structure.', 'More soil life.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2585e3f9-11f4-5fe8-bd04-e02b047b2c91',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'A bag of fertiliser labelled 10-20-10 means:',
    '["10% N, 20% P, 10% K", "10 kg N, 20 kg P, 10 kg K", "10% organic, 20% mineral, 10% water", "10-20-10 is the brand name"]'::jsonb,
    '0'::jsonb,
    'The numbers represent the percentage of N, P, and K respectively.',
    ARRAY['N-P-K percentages.', 'Standard labelling.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7fc2e346-6d74-5ba6-9843-369d579301c0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Why is potassium important for plants?',
    '["Only for photosynthesis", "Helps with disease resistance and fruit quality", "Only for root growth", "Only for flowering"]'::jsonb,
    '1'::jsonb,
    'Potassium strengthens plants and improves disease resistance and fruit quality.',
    ARRAY['Overall plant health.', 'Better fruits.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'eb18585d-7c87-5ba7-acae-f56217b78d02',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Over-application of chemical fertilisers can lead to:',
    '["Better crop growth always", "Water pollution through runoff", "Improved soil health", "Reduced weed growth"]'::jsonb,
    '1'::jsonb,
    'Excess fertiliser runs off into water bodies, causing pollution and algal blooms.',
    ARRAY['Eutrophication.', 'Water pollution.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '000b40e6-a75a-5d80-8078-52357c3b326e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'fill_in_blank',
    'A farmer wants to grow crops without chemicals. What organic nutrient sources could they use?',
    NULL,
    '"compost"'::jsonb,
    'Compost, animal manure, and green manure are organic nutrient sources.',
    ARRAY['Natural materials.', 'Decomposed organic matter.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2d5bea37-f3a3-5b69-bba3-0cc11f56df7b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Which method of applying fertiliser ensures nutrients reach the root zone?',
    '["Broadcasting on the surface", "Mixing into the soil", "Spraying on leaves", "Dissolving in irrigation water only"]'::jsonb,
    '1'::jsonb,
    'Mixing fertiliser into soil places nutrients near roots where they are needed.',
    ARRAY['Root zone application.', 'Direct access for roots.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e289a1c0-c090-5e01-9a98-3308e6659963',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Why do farmers in Ghana often prefer organic fertilisers?',
    '["They are always cheaper", "They improve soil health over time and are locally available", "Chemical fertilisers do not work in Ghana", "Organic fertilisers act faster"]'::jsonb,
    '1'::jsonb,
    'Organic fertilisers improve long-term soil health and are often more accessible.',
    ARRAY['Sustainable approach.', 'Local availability.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0bdcda65-3dc8-5df5-bb85-83d96ecc5293',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'fill_in_blank',
    'A field has been using only chemical fertilisers for 10 years. The soil is now hard and compacted. Explain why.',
    NULL,
    '"lack of organic matter"'::jsonb,
    'Chemical fertilisers do not add organic matter; soil structure deteriorates without it.',
    ARRAY['Organic matter improves texture.', 'Chemicals alone are not enough.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c7ee0c92-7905-58a5-8bd2-b4e032b6a597',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Compare the advantages and disadvantages of organic vs inorganic fertilisers for a small-scale farmer in Ghana.',
    '["Organic is always better", "Inorganic is always better", "Organic improves soil but is slow; inorganic is fast but does not improve soil", "They are exactly the same"]'::jsonb,
    '2'::jsonb,
    'Organic improves soil long-term but is slow; inorganic is fast-acting but does not build soil health.',
    ARRAY['Speed vs sustainability.', 'Cost and availability.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dbf18984-8cb4-5075-8db6-77ba4cf1f5e0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'Why might a farmer apply lime (calcium carbonate) to their soil?',
    '["To increase acidity", "To reduce soil acidity (raise pH)", "To add nitrogen", "To kill pests"]'::jsonb,
    '1'::jsonb,
    'Lime neutralises acidic soils, making nutrients more available to plants.',
    ARRAY['pH adjustment.', 'Nutrient availability.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '546792d1-5f75-50ec-ba84-a2763517c61d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'multiple_choice',
    'A crop shows purple-tinged leaves and poor flowering. Which nutrient is likely deficient?',
    '["Nitrogen", "Phosphorus", "Potassium", "Iron"]'::jsonb,
    '1'::jsonb,
    'Phosphorus deficiency causes purple discolouration and poor flowering.',
    ARRAY['P is for flowering and roots.', 'Purple leaves = P deficiency.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '986e9ab8-b2c1-5f3f-8a4e-d05911999a26',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.3.1'), NULL, 'fill_in_blank',
    'Explain why crop rotation with legumes improves soil fertility.',
    NULL,
    '"nitrogen fixation"'::jsonb,
    'Legumes have root nodules with bacteria that fix atmospheric nitrogen into the soil.',
    ARRAY['Bacteria in root nodules.', 'Natural nitrogen source.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.2.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '84c249c3-38b3-5348-93d6-bb69c13ecc89',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Cattle, sheep, and goats are classified as:',
    '["Monogastrics", "Ruminants", "Poultry", "Aquatic animals"]'::jsonb,
    '1'::jsonb,
    'These animals have a four-chambered stomach for digesting grass.',
    ARRAY['They chew cud.', 'Multiple stomach chambers.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c717050e-2ce5-596c-8006-7d10c0637239',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'A pig is an example of a:',
    '["Ruminant", "Monogastric", "Bird", "Reptile"]'::jsonb,
    '1'::jsonb,
    'Pigs have a single-chambered stomach (monogastric).',
    ARRAY['One stomach chamber.', 'Cannot digest grass well.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '81270c38-9859-5987-ad0a-e0d441f695e8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Poultry are domestic animals that are:',
    '["Mammals", "Birds", "Reptiles", "Fish"]'::jsonb,
    '1'::jsonb,
    'Poultry are domesticated birds kept for eggs and meat.',
    ARRAY['Chickens, ducks, turkeys.', 'They lay eggs.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e9927d7b-fd2a-5c1c-9fe1-8394f7256b40',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'fill_in_blank',
    'A ruminant animal has ___ stomach chambers.',
    NULL,
    '"four"'::jsonb,
    'Ruminants have a four-chambered stomach.',
    ARRAY['Rumen, reticulum, omasum, abomasum.', 'Complex digestion.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9b639c24-d13d-5f30-a058-0ced3c03c97a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Which is NOT a ruminant animal?',
    '["Cow", "Goat", "Sheep", "Pig"]'::jsonb,
    '3'::jsonb,
    'Pigs are monogastric, not ruminant.',
    ARRAY['Single stomach chamber.', 'Cannot digest cellulose well.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3af4f9b6-9aec-5c2e-9468-8beaf92975fd',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'fill_in_blank',
    'Examples of poultry include chickens and ___.',
    NULL,
    '"ducks"'::jsonb,
    'Poultry includes chickens, ducks, turkeys, guinea fowls.',
    ARRAY['Also turkeys and guinea fowls.', 'Domestic birds.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '546556ea-5c27-52e8-a687-d0d04f9d3449',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Ruminants can digest grass because they have:',
    '["Stronger teeth", "Bacteria in their stomach that break down cellulose", "A larger mouth", "Special enzymes in saliva only"]'::jsonb,
    '1'::jsonb,
    'Ruminants have symbiotic bacteria in the rumen that break down cellulose.',
    ARRAY['Microorganisms help.', 'Cellulose digestion.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '012a236e-ba39-510f-819a-7850f944977a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Why are goats important in rural Ghana?',
    '["Only for milk", "They provide milk, meat, and can survive on poor vegetation", "Only for hides", "Only as pets"]'::jsonb,
    '1'::jsonb,
    'Goats are versatile — they provide milk, meat, and are hardy animals.',
    ARRAY['Adaptable animals.', 'Multiple uses.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '560699e3-4970-5841-8445-cef00d1cfd49',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'A monogastric animal differs from a ruminant because it:',
    '["Has no stomach", "Has a single-chambered stomach", "Only eats meat", "Cannot reproduce"]'::jsonb,
    '1'::jsonb,
    'Monogastric animals have one stomach compartment.',
    ARRAY['Simple digestion.', 'Cannot digest fibre well.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2e286c58-4de1-5840-ac6f-79aa3f27e1b3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Cattle are important for all of the following EXCEPT:',
    '["Milk production", "Meat", "Draft power", "Egg production"]'::jsonb,
    '3'::jsonb,
    'Cattle do not produce eggs — that is poultry.',
    ARRAY['Cattle are mammals.', 'Eggs come from birds.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ac474bec-5aa7-5b5a-8360-06f6d2bcad8d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'The process of ruminants bringing food back from the stomach to chew again is called:',
    '["Swallowing", "Regurgitation or chewing cud", "Vomiting", "Digestion"]'::jsonb,
    '1'::jsonb,
    'Ruminants regurgitate and re-chew their food (cud) for better digestion.',
    ARRAY['Brings food back up.', 'Chewing again.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ac3a0343-981a-560d-acb5-1171c59bbd75',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Which type of domestic animal is most efficient at converting feed to protein?',
    '["Cattle", "Pigs", "Goats", "Fish"]'::jsonb,
    '3'::jsonb,
    'Fish are very efficient at converting feed to body protein.',
    ARRAY['High feed conversion ratio.', 'Aquaculture.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a3e102b5-7cd4-5131-9df4-922cbf2abbff',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Why are chickens the most common poultry in Ghana?',
    '["They are the only poultry available", "They are easy to keep, grow fast, and provide eggs and meat", "They require no feeding", "They are the largest birds"]'::jsonb,
    '1'::jsonb,
    'Chickens are easy to raise, fast-growing, and provide both eggs and meat.',
    ARRAY['Low cost, high output.', 'Dual purpose.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '79719805-27a3-5cc8-a203-0dfb475fc199',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'fill_in_blank',
    'A farmer keeps both cattle and chickens. How do their nutritional needs differ?',
    NULL,
    '"different feeds"'::jsonb,
    'Cattle eat grass and roughage; chickens need grains and protein-rich feeds.',
    ARRAY['Herbivores vs omnivores.', 'Different digestive systems.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'faff98f1-a91c-5f9d-9a91-30fa1b2ba6c8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Why might a small-scale farmer in Ghana prefer goats over cattle?',
    '["Goats produce more milk", "Goats require less space and food, and are easier to manage", "Cattle are more valuable", "Goats live longer"]'::jsonb,
    '1'::jsonb,
    'Goats are smaller, eat less, and are more adaptable to harsh conditions.',
    ARRAY['Lower cost to maintain.', 'Hardier animals.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e1a64e29-cc32-5bc7-8a8e-ae577bbc9cf8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'fill_in_blank',
    'A ruminant and a monogastric eat the same grass. Explain why the ruminant gets more nutrition from it.',
    NULL,
    '"bacteria"'::jsonb,
    'Ruminant bacteria break down cellulose into usable nutrients; monogastrics cannot digest cellulose well.',
    ARRAY['Cellulose digestion.', 'Symbiotic bacteria.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ef69c573-baef-5df3-adfc-461e418878ed',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Which domestic animal would be best for a landless farmer with limited resources?',
    '["Cattle", "Pigs", "Chickens or guinea fowl", "Sheep"]'::jsonb,
    '2'::jsonb,
    'Poultry need minimal space and can be kept in a small area.',
    ARRAY['Small space needed.', 'Low startup cost.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b16e21f7-45a2-5f6d-b929-a45bd7222648',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'fill_in_blank',
    'Explain why cross-breeding of livestock is done in animal production.',
    NULL,
    '"improved traits"'::jsonb,
    'Cross-breeding combines desirable traits from different breeds — better growth, disease resistance, productivity.',
    ARRAY['Hybrid vigour.', 'Combines best qualities.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7d53e97f-8d41-5805-be83-6b61aeb9977f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'fill_in_blank',
    'A farmer notices their chickens are not laying eggs. List three possible causes.',
    NULL,
    '"nutrition"'::jsonb,
    'Poor nutrition, disease, stress, or insufficient light can reduce egg laying.',
    ARRAY['Check feed quality.', 'Look for signs of disease.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c81da3ef-c3fc-53f3-9bb4-ce47f1aea179',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.1'), NULL, 'multiple_choice',
    'Draught animals like oxen are used in farming for:',
    '["Producing milk", "Ploughing fields and transporting loads", "Laying eggs", "Producing wool"]'::jsonb,
    '1'::jsonb,
    'Oxen are used for ploughing and transporting heavy loads.',
    ARRAY['Replace tractors.', 'Traditional farming.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.2.4.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '975064f5-422d-5fcc-bc14-e4485e72b5ac',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Animals kept for food production include:',
    '["Dogs and cats", "Cattle, goats, and chickens", "Lions and elephants", "Snakes and lizards"]'::jsonb,
    '1'::jsonb,
    'Cattle, goats, chickens are common food animals.',
    ARRAY['Meat, milk, eggs.', 'Farm animals.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '14d5b4c1-c3c3-58c8-8c84-f6d56efac31b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Wool is obtained from:',
    '["Cattle", "Sheep", "Goats", "Pigs"]'::jsonb,
    '1'::jsonb,
    'Wool comes from sheep.',
    ARRAY['Sheared from sheep.', 'Used for clothing.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a6b845f0-375d-553d-a74f-0c3cce8d00e0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Animals that help in farming by pulling loads are called:',
    '["Pets", "Draught animals", "Wild animals", "Predators"]'::jsonb,
    '1'::jsonb,
    'Draught animals like oxen pull ploughs and carts.',
    ARRAY['Work animals.', 'Traditional farming.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a73b2af6-3bda-50db-84f5-e3b006c9fb37',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'fill_in_blank',
    'Leather is made from the ___ of animals.',
    NULL,
    '"skin"'::jsonb,
    'Leather is processed animal skin.',
    ARRAY['Hides and skins.', 'Tanned and treated.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '47f3d385-b7ab-5700-8991-4f1c6eed261e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'fill_in_blank',
    'Bees produce ___ which humans use as food.',
    NULL,
    '"honey"'::jsonb,
    'Honey is produced by bees.',
    ARRAY['Sweet substance.', 'Natural sweetener.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9c7b3d53-2797-5b7a-a0f2-f132770f2c50',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Which animal product is used to make shoes?',
    '["Milk", "Eggs", "Leather", "Wool"]'::jsonb,
    '2'::jsonb,
    'Leather from animal hides is used for shoes.',
    ARRAY['Processed skin.', 'Durable material.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3d5cd34c-7caa-5808-b5f6-857e482afd11',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'In Ghana, which animal is commonly used for transportation in rural areas?',
    '["Cats", "Donkeys", "Rabbits", "Fish"]'::jsonb,
    '1'::jsonb,
    'Donkeys are used for carrying loads in rural areas.',
    ARRAY['Strong working animals.', 'Transport goods.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c06775b0-95a6-522e-b6f1-ec7600f6c6e7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Animals provide all of the following EXCEPT:',
    '["Food", "Clothing", "Building materials", "Medicine"]'::jsonb,
    '2'::jsonb,
    'Animals provide food, clothing (wool, leather), and some medicines, but not building materials.',
    ARRAY['Think about animal products.', 'Wood and cement are not from animals.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '309b328d-19ab-54cf-bb95-d05d9c7283a7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Silk is produced by:',
    '["Sheep", "Silkworms", "Bees", "Cattle"]'::jsonb,
    '1'::jsonb,
    'Silk comes from silkworm cocoons.',
    ARRAY['Insect product.', 'Fine fabric.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6dcd016c-4a52-58fd-8e8b-c6760890c3ec',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'How do animals contribute to crop production indirectly?',
    '["They eat weeds", "Their manure is used as fertiliser", "They pollinate all crops", "They dig the soil"]'::jsonb,
    '1'::jsonb,
    'Animal manure provides organic nutrients for crops.',
    ARRAY['Natural fertiliser.', 'Organic matter.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e729b85b-6d56-5f9e-809f-9e0c43d99e52',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Guinea fowls in Ghana are kept for:',
    '["Only eggs", "Meat and pest control", "Wool production", "Draught purposes"]'::jsonb,
    '1'::jsonb,
    'Guinea fowls provide meat and help control insects.',
    ARRAY['Dual purpose.', 'Traditional poultry.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5c6de4c8-92f4-5c23-9620-658062ebb73e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Animals used in scientific research help humans by:',
    '["Being test subjects for new medicines", "Providing entertainment", "Producing food", "None of the above"]'::jsonb,
    '0'::jsonb,
    'Animals are used to test medicines and understand diseases before human use.',
    ARRAY['Medical research.', 'Drug testing.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ea96df6c-c3b9-5b95-8f39-d5a8502b2b24',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Which animal product is used in making tyres and other rubber products?',
    '["Leather", "Wool", "None \u2014 rubber comes from plants", "Bone meal"]'::jsonb,
    '2'::jsonb,
    'Rubber comes from rubber trees, not animals.',
    ARRAY['Plant product, not animal.', 'Latex from trees.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b436cb58-d6da-578e-b396-36f27dcdc053',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'fill_in_blank',
    'Why is it important to keep domestic animals healthy?',
    NULL,
    '"food safety"'::jsonb,
    'Healthy animals produce safe food (milk, meat, eggs) and are more productive.',
    ARRAY['Disease-free products.', 'Better productivity.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '19dddfef-8143-5e96-bdd1-96e3e7d6ec76',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'fill_in_blank',
    'A farmer wants to diversify income using animals. Suggest three products they could sell.',
    NULL,
    '"eggs"'::jsonb,
    'Eggs, milk, meat, honey, manure are all sellable animal products.',
    ARRAY['Multiple revenue streams.', 'Value-added products.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9b81e9fc-7cb0-54d5-aab5-2944bf4b5d32',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Why is overgrazing by domestic animals a problem?',
    '["It kills the animals", "It destroys vegetation and leads to soil erosion", "It produces too much manure", "It makes animals sick"]'::jsonb,
    '1'::jsonb,
    'Overgrazing removes plant cover, leading to soil erosion and land degradation.',
    ARRAY['No plants to hold soil.', 'Desertification risk.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bdd5b15e-0a85-56b3-9e2e-1b1c54d551c4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Compare the economic value of keeping chickens versus cattle for a small farmer.',
    '["Chickens are always better", "Cattle are always better", "Chickens need less space and produce faster returns; cattle need more investment but higher long-term value", "They have equal value"]'::jsonb,
    '2'::jsonb,
    'Chickens are quicker returns, lower cost; cattle are higher investment but more valuable long-term.',
    ARRAY['Space and time factors.', 'Capital requirements.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3fe96cdc-dfe7-5ee9-8e10-202d4996c1b5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'fill_in_blank',
    'How do domestic animals contribute to the Ghanaian economy?',
    NULL,
    '"food production"'::jsonb,
    'Animals contribute through food production, employment, export, and cultural value.',
    ARRAY['Meat, milk, eggs.', 'Jobs in farming.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8450d876-cfe0-540b-819f-fdcd626dc3e2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'multiple_choice',
    'Why should antibiotics be used carefully in animal production?',
    '["They are expensive", "Overuse can lead to antibiotic resistance in bacteria", "They make animals grow slower", "They are only for humans"]'::jsonb,
    '1'::jsonb,
    'Overuse of antibiotics in animals can create resistant bacteria that affect human health.',
    ARRAY['Antibiotic resistance.', 'Public health concern.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '880fb351-0b93-5bf9-b95f-cac12af452cf',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.2.4.2'), NULL, 'fill_in_blank',
    'Animals in Ghana serve cultural roles too. Give an example.',
    NULL,
    '"festivals"'::jsonb,
    'Animals are used in festivals, ceremonies, and traditional rites.',
    ARRAY['Cultural significance.', 'Rituals and celebrations.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.3.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '40bb89a1-1947-5367-9b19-e34772a159e4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'fill_in_blank',
    'The six classes of food nutrients include carbohydrates, proteins, fats, vitamins, minerals, and ___.',
    NULL,
    '"water"'::jsonb,
    'Water is the sixth class of nutrient essential for life.',
    ARRAY['Essential for survival.', '70% of body weight.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '03b57263-d89f-574f-9ca6-fc1130567c2e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Carbohydrates are the body''s main source of:',
    '["Protein", "Energy", "Vitamins", "Minerals"]'::jsonb,
    '1'::jsonb,
    'Carbohydrates provide energy for body functions.',
    ARRAY['Broken down to glucose.', 'Quick energy source.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5f458cc3-9da9-5aa2-89b7-3612b504bea5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Proteins are needed for:',
    '["Only energy", "Growth and repair of body tissues", "Only brain function", "Only digestion"]'::jsonb,
    '1'::jsonb,
    'Proteins build and repair tissues, muscles, and organs.',
    ARRAY['Building blocks of life.', 'Growth and repair.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '369f2a5b-81eb-5a0a-b8a3-2d6d5112baa5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'A disease caused by lack of protein is:',
    '["Scurvy", "Kwashiorkor", "Rickets", "Anaemia"]'::jsonb,
    '1'::jsonb,
    'Kwashiorkor is caused by protein deficiency.',
    ARRAY['Swollen belly in children.', 'Protein-energy malnutrition.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '02d47588-e947-5ee8-b459-03c836b64dd2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Vitamin C deficiency causes:',
    '["Kwashiorkor", "Scurvy", "Rickets", "Goitre"]'::jsonb,
    '1'::jsonb,
    'Scurvy is caused by vitamin C deficiency.',
    ARRAY['Bleeding gums, weak joints.', 'Eat citrus fruits.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7bf7d5a6-310b-560a-a02b-3b27aa02925c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'fill_in_blank',
    'Fats and oils provide ___ energy per gram than carbohydrates.',
    NULL,
    '"more"'::jsonb,
    'Fats provide more than twice the energy of carbohydrates per gram.',
    ARRAY['9 kcal vs 4 kcal.', 'Concentrated energy.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '48127c02-4408-5665-8500-9a05772f4ae9',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'A balanced diet contains:',
    '["Only carbohydrates", "All classes of nutrients in the right proportions", "Only proteins and vitamins", "Only fruits and vegetables"]'::jsonb,
    '1'::jsonb,
    'A balanced diet has all nutrients in correct proportions.',
    ARRAY['Variety of foods.', 'Right amounts.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b6dea299-6d12-57b8-89c5-ea16bd15b2a3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Rickets in children is caused by deficiency of:',
    '["Vitamin A", "Vitamin C", "Vitamin D and calcium", "Iron"]'::jsonb,
    '2'::jsonb,
    'Vitamin D and calcium deficiency causes rickets (soft bones).',
    ARRAY['Bone disease.', 'Sunlight helps make vitamin D.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '114e372d-302e-59dc-9455-fc9f9e5e0ab9',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Anaemia is caused by deficiency of:',
    '["Protein", "Vitamin C", "Iron", "Calcium"]'::jsonb,
    '2'::jsonb,
    'Iron deficiency leads to anaemia (low red blood cells).',
    ARRAY['Tiredness, pale skin.', 'Iron-rich foods needed.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '495d68ae-de0d-5988-b02c-bd0f258bb4cf',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Water is important in the body for all of the following EXCEPT:',
    '["Transporting nutrients", "Regulating body temperature", "Building bones", "Removing waste"]'::jsonb,
    '2'::jsonb,
    'Water transports nutrients, regulates temperature, and removes waste, but does not build bones.',
    ARRAY['Many functions.', 'Not for bone building.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '16ceff30-7058-5768-b973-fc4d33320ba4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Which food group is the best source of protein?',
    '["Rice and bread", "Beans, fish, and eggs", "Vegetables and fruits", "Oils and butter"]'::jsonb,
    '1'::jsonb,
    'Beans, fish, eggs, and meat are rich in protein.',
    ARRAY['Animal and plant proteins.', 'Building blocks.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3e160e00-492e-5540-bd0b-a3ef299df173',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'A child with a swollen belly, thin arms, and discoloured hair is likely suffering from:',
    '["Scurvy", "Kwashiorkor", "Rickets", "Goitre"]'::jsonb,
    '1'::jsonb,
    'These are classic signs of kwashiorkor (protein deficiency).',
    ARRAY['Common in children.', 'Protein malnutrition.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '74cd54ac-eb7a-543f-81b6-5da569dacd75',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'fill_in_blank',
    'Why do athletes need more carbohydrates than sedentary people?',
    NULL,
    '"energy"'::jsonb,
    'Athletes use more energy, so they need more carbohydrates for fuel.',
    ARRAY['More activity = more energy.', 'Quick energy source.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b722168d-5e28-54d8-a8b2-7acd15e3fb6b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Excess carbohydrates in the body are stored as:',
    '["Protein", "Fat", "Vitamins", "Minerals"]'::jsonb,
    '1'::jsonb,
    'Excess carbohydrates are converted to fat and stored.',
    ARRAY['Energy storage.', 'Can lead to obesity.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5e4a42bc-4029-5dbd-9b9f-b476ea7d2361',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'A diet consisting only of rice and bread is not balanced because:',
    '["It has too much protein", "It lacks proteins, vitamins, and minerals", "It has too much fat", "It has too much water"]'::jsonb,
    '1'::jsonb,
    'Rice and bread provide mainly carbohydrates; they lack proteins, vitamins, and minerals.',
    ARRAY['Missing nutrients.', 'Need variety.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '35ed387d-780b-51e4-a356-c5f00f6ac8f4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'fill_in_blank',
    'Why is breastfeeding recommended for infants over formula milk?',
    NULL,
    '"antibodies"'::jsonb,
    'Breast milk contains antibodies that protect infants from infections.',
    ARRAY['Immune protection.', 'Nutritionally complete.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9179164c-d7a4-5379-91bf-b9f846baab02',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'fill_in_blank',
    'A student eats only fast food. What nutritional problems might develop?',
    NULL,
    '"deficiency"'::jsonb,
    'Fast food is high in fat, sugar, and salt but low in vitamins, minerals, and fibre.',
    ARRAY['Imbalanced diet.', 'Missing essential nutrients.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '440a5fd7-b604-5806-bf1a-f03b5c1d4a9d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'fill_in_blank',
    'Explain why pregnant women need more iron and folic acid in their diet.',
    NULL,
    '"blood production"'::jsonb,
    'Pregnant women need more iron and folic acid for increased blood production and foetal development.',
    ARRAY['More blood needed.', 'Baby development.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6c014a3d-63ae-5b71-8e9e-a43eea6c4be0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Why does the body need minerals like calcium and phosphorus?',
    '["For energy only", "For strong bones and teeth", "For brain function only", "For digestion only"]'::jsonb,
    '1'::jsonb,
    'Calcium and phosphorus are essential for building and maintaining bones and teeth.',
    ARRAY['Structural minerals.', 'Bone health.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '36f50f5f-424a-5bc6-831f-231889aa27f8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.1.1'), NULL, 'multiple_choice',
    'Night blindness is caused by deficiency of:',
    '["Vitamin B", "Vitamin C", "Vitamin A", "Vitamin D"]'::jsonb,
    '2'::jsonb,
    'Vitamin A deficiency causes night blindness.',
    ARRAY['Eye health.', 'Eat carrots and liver.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.3.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fc20227d-5de1-57ea-ad85-44764bbfa63f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'How many planets are in our solar system?',
    '["6", "7", "8", "9"]'::jsonb,
    '2'::jsonb,
    'There are 8 planets in our solar system.',
    ARRAY['Mercury to Neptune.', 'Pluto is a dwarf planet.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f42ed942-a3f7-5f78-a987-f37a3f8b1013',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'The inner planets are also called:',
    '["Gas giants", "Terrestrial planets", "Dwarf planets", "Asteroids"]'::jsonb,
    '1'::jsonb,
    'Inner planets are rocky/terrestrial planets.',
    ARRAY['Made of rock and metal.', 'Close to the sun.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1092f502-3a77-52d1-b68f-43016403b03f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'The closest planet to the sun is:',
    '["Venus", "Earth", "Mercury", "Mars"]'::jsonb,
    '2'::jsonb,
    'Mercury is the closest planet to the sun.',
    ARRAY['Smallest planet.', 'Very hot surface.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '477f7d1d-03d8-5f52-a1ac-f8e1cc387f4d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'The planet known as the "Red Planet" is:',
    '["Venus", "Mars", "Jupiter", "Mercury"]'::jsonb,
    '1'::jsonb,
    'Mars appears red due to iron oxide (rust) on its surface.',
    ARRAY['Reddish colour.', 'Fourth from sun.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '53c1570e-5f69-54fc-9643-99c3c30805d3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'fill_in_blank',
    'Earth is the ___ planet from the sun.',
    NULL,
    '"third"'::jsonb,
    'Earth is the third planet from the sun.',
    ARRAY['Not too hot, not too cold.', 'Habitable zone.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd3acd2fa-3e11-5d04-8597-a2545a72f7ea',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Which planet is closest in size to Earth?',
    '["Mercury", "Venus", "Mars", "Jupiter"]'::jsonb,
    '1'::jsonb,
    'Venus is similar in size to Earth — often called Earth''s twin.',
    ARRAY['Nearly same diameter.', 'Similar mass.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5e75e04f-4a5a-5d4f-b62c-90d984dd76e7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Why is Mercury not the hottest planet despite being closest to the sun?',
    '["It is too small", "Venus has a thick atmosphere that traps heat", "Mercury has ice", "The sun heats Venus more"]'::jsonb,
    '1'::jsonb,
    'Venus has a thick CO2 atmosphere creating a greenhouse effect, making it hotter.',
    ARRAY['Greenhouse effect.', 'Atmosphere traps heat.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3f7038c5-cdec-5b30-aecb-2e4a4fce47ae',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Earth supports life because:',
    '["It is closest to the sun", "It has liquid water, a suitable atmosphere, and moderate temperature", "It has no atmosphere", "It is the largest planet"]'::jsonb,
    '1'::jsonb,
    'Earth has liquid water, a protective atmosphere, and temperatures suitable for life.',
    ARRAY['Goldilocks zone.', 'Just right conditions.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '811bc30b-f4ee-5adc-9eb4-fb0099c71139',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Mars has seasons similar to Earth because:',
    '["It has the same atmosphere", "Its axis is tilted at a similar angle", "It is the same distance from the sun", "It has water"]'::jsonb,
    '1'::jsonb,
    'Mars has a tilted axis (25.2 degrees) similar to Earth (23.5 degrees), causing seasons.',
    ARRAY['Axis tilt causes seasons.', 'Similar tilt angle.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '279e79ed-4743-535e-a603-8e58d48d78ea',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'The four inner planets in order from the sun are:',
    '["Mars, Venus, Earth, Mercury", "Mercury, Venus, Earth, Mars", "Venus, Mercury, Mars, Earth", "Earth, Venus, Mercury, Mars"]'::jsonb,
    '1'::jsonb,
    'Mercury, Venus, Earth, Mars — in order from the sun.',
    ARRAY['MVEM mnemonic.', 'Closest to furthest.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b3823d31-8fcc-5bc1-a4d3-726b2069445f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Why does Venus have a runaway greenhouse effect?',
    '["It is too far from the sun", "Its thick atmosphere of CO2 traps heat", "It has no atmosphere", "It has too much water"]'::jsonb,
    '1'::jsonb,
    'Venus has a very thick CO2 atmosphere that traps heat, making surface temperature ~460°C.',
    ARRAY['CO2 traps heat.', 'Extreme temperatures.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4eb6a14c-815c-573e-b47c-33a5acf28de5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Mars has a thin atmosphere composed mainly of:',
    '["Oxygen", "Nitrogen", "Carbon dioxide", "Hydrogen"]'::jsonb,
    '2'::jsonb,
    'Mars has a thin atmosphere, 95% CO2.',
    ARRAY['Very thin.', 'Not breathable.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6903f572-370e-5e9c-8a37-312ceb6c93a3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'fill_in_blank',
    'Why are the inner planets rocky while the outer planets are gaseous?',
    NULL,
    '"temperature"'::jsonb,
    'Higher temperatures near the sun allowed only rocky materials to solidify; lighter gases were blown further out.',
    ARRAY['Heat near the sun.', 'Rock vs gas formation.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3138cf3d-6bb9-5bc3-8592-84828e94a509',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Scientists think Mars may have had liquid water in the past. What evidence supports this?',
    '["Ice caps at poles only", "Dry riverbeds, minerals that form in water, and ice caps", "Mars has oceans now", "It rains on Mars"]'::jsonb,
    '1'::jsonb,
    'Dry riverbeds, water-formed minerals, and polar ice caps suggest past water.',
    ARRAY['Geological evidence.', 'Ancient water features.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'eddc7239-8674-5e5b-b253-0a3660619026',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'If you could stand on Venus, what would you experience?',
    '["Cool temperatures and clear skies", "Extreme heat and crushing atmospheric pressure", "No atmosphere at all", "Frozen landscape"]'::jsonb,
    '1'::jsonb,
    'Venus surface is ~460°C with atmospheric pressure 90 times Earth''s.',
    ARRAY['Greenhouse effect.', 'Crushing pressure.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '25cb2d53-13e5-5576-b3ad-2e188bc0de09',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Why do we see Venus and Mercury as morning or evening stars?',
    '["They produce their own light", "They orbit closer to the sun than Earth, so they appear near the sun in our sky", "They are very far away", "They are made of fire"]'::jsonb,
    '1'::jsonb,
    'Their orbits are inside Earth''s orbit, so they are always near the sun from our perspective.',
    ARRAY['Inner planet orbits.', 'Close to sun in sky.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '728034e4-6d12-5b98-90f5-4f91f1c4140f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'fill_in_blank',
    'What would happen to Earth if it were moved to Mars''s orbit?',
    NULL,
    '"freeze"'::jsonb,
    'Earth would become much colder; water would freeze and life would not survive.',
    ARRAY['Further from sun.', 'Less solar energy.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '36f8a00b-1116-58bc-9abf-ab1de6a321ec',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'fill_in_blank',
    'A day on Venus is longer than a year on Venus. Explain why.',
    NULL,
    '"rotation"'::jsonb,
    'Venus rotates very slowly on its axis (243 Earth days) but orbits the sun in 225 Earth days.',
    ARRAY['Very slow spin.', 'Faster orbit than rotation.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '23619ca7-559b-52ad-ab38-2077f74e72a3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Which inner planet has the most moons?',
    '["Mercury", "Venus", "Earth", "Mars"]'::jsonb,
    '3'::jsonb,
    'Mars has 2 moons (Phobos and Deimos). Mercury and Venus have none; Earth has 1.',
    ARRAY['Small, irregular moons.', 'Captured asteroids.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3b63045f-7c35-513d-aee9-f0a5205b2d70',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.2.1'), NULL, 'multiple_choice',
    'Why can Mercury not retain an atmosphere?',
    '["It is too cold", "It has too much gravity", "Its low gravity and high temperature allow gas molecules to escape", "It is made of gas"]'::jsonb,
    '2'::jsonb,
    'Mercury is small (low gravity) and hot, so gas molecules escape into space.',
    ARRAY['Low gravity + heat.', 'Atmosphere escapes.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.3.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b9807114-ceac-5672-90bd-41cad84793de',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'A community of living organisms interacting with their environment is called an:',
    '["Habitat", "Ecosystem", "Biome", "Population"]'::jsonb,
    '1'::jsonb,
    'An ecosystem includes all living and non-living things in an area.',
    ARRAY['Living + non-living components.', 'Interacting community.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aa8418e6-92c1-5391-bfde-2b6523745bf6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'The living components of an ecosystem are called:',
    '["Abiotic factors", "Biotic factors", "Habitats", "Niches"]'::jsonb,
    '1'::jsonb,
    'Biotic factors are all living things in an ecosystem.',
    ARRAY['Plants, animals, microorganisms.', 'Living components.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '47968c43-4dc0-5810-9e0e-83dbfa4ea7a9',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'Non-living components like temperature, water, and soil are called:',
    '["Biotic factors", "Abiotic factors", "Producers", "Consumers"]'::jsonb,
    '1'::jsonb,
    'Abiotic factors are non-living components.',
    ARRAY['Sunlight, water, temperature.', 'Physical environment.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '814b4216-af36-5b66-8d96-c20527330b5a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'Organisms that produce their own food are called:',
    '["Consumers", "Decomposers", "Producers", "Predators"]'::jsonb,
    '2'::jsonb,
    'Producers (plants) make their own food through photosynthesis.',
    ARRAY['Green plants.', 'Autotrophs.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '51bc5ed9-cddf-5820-8b02-0a8b493fdc59',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'An organism that eats only plants is called a:',
    '["Carnivore", "Herbivore", "Omnivore", "Decomposer"]'::jsonb,
    '1'::jsonb,
    'Herbivores eat only plants.',
    ARRAY['Plant eaters.', 'Primary consumers.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a475bc23-740e-5d75-9895-1812322f57d7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'Fungi and bacteria that break down dead matter are called:',
    '["Producers", "Consumers", "Decomposers", "Predators"]'::jsonb,
    '2'::jsonb,
    'Decomposers break down dead organic matter.',
    ARRAY['Recycle nutrients.', 'Mushrooms, bacteria.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c54f6524-3f44-501c-96ca-c823de318672',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'In a food chain, the producer is always:',
    '["A herbivore", "A green plant", "A carnivore", "A decomposer"]'::jsonb,
    '1'::jsonb,
    'Green plants are always the producers in a food chain.',
    ARRAY['Photosynthesis.', 'Base of food chain.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8b0266a0-7094-5611-ae2c-66cfdfbaaa93',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'A food chain: grass → rabbit → fox. The rabbit is a:',
    '["Producer", "Primary consumer", "Secondary consumer", "Decomposer"]'::jsonb,
    '1'::jsonb,
    'The rabbit eats grass (producer), making it a primary consumer.',
    ARRAY['First consumer level.', 'Herbivore.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '082bbf5d-885b-5ec3-8625-2d41be098fd6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'What is the source of energy for most ecosystems?',
    '["Water", "Soil", "The sun", "Wind"]'::jsonb,
    '2'::jsonb,
    'The sun provides energy for photosynthesis, the base of most food chains.',
    ARRAY['Plants capture sunlight.', 'Energy flows from sun.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3c518703-7645-54c6-9211-898da4fa190c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'A network of interconnected food chains is called a:',
    '["Food web", "Food pyramid", "Energy chain", "Nutrient cycle"]'::jsonb,
    '0'::jsonb,
    'A food web is a network of interconnected food chains.',
    ARRAY['Multiple pathways.', 'More realistic.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ffa4d501-818d-5cfd-9886-1bbdf54c2e30',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'Why do food chains rarely have more than 4-5 levels?',
    '["Animals do not eat that much", "Energy is lost as heat at each level, so not enough remains", "Plants only grow that tall", "There are not enough species"]'::jsonb,
    '1'::jsonb,
    'About 90% of energy is lost as heat at each trophic level.',
    ARRAY['Energy pyramid.', 'Less energy higher up.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '09019975-c550-5758-a6b0-a8a04f27d4eb',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'Which of these is an abiotic factor in a pond ecosystem?',
    '["Fish", "Algae", "Water temperature", "Bacteria"]'::jsonb,
    '2'::jsonb,
    'Water temperature is a non-living (abiotic) factor.',
    ARRAY['Physical condition.', 'Not alive.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '396d0ca2-13d2-5e85-bdb3-5354cda73a88',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'If all the predators in an ecosystem are removed, what happens?',
    '["Nothing changes", "Herbivore population increases, overgrazing occurs", "All animals die", "Plants disappear immediately"]'::jsonb,
    '1'::jsonb,
    'Without predators, herbivores multiply and overgraze, damaging the ecosystem.',
    ARRAY['Population imbalance.', 'Cascade effect.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '37c299e0-86b8-51ad-bf0f-413f46458ca3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'fill_in_blank',
    'Explain why decomposers are essential in an ecosystem.',
    NULL,
    '"nutrient recycling"'::jsonb,
    'Decomposers break down dead matter, returning nutrients to the soil for producers to use.',
    ARRAY['Without them, dead matter accumulates.', 'Nutrient cycle.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'af606405-d444-5682-8c49-e403755e5549',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'A farmer sprays pesticides to kill insects. How might this affect the food chain?',
    '["Only insects are affected", "Birds that eat insects may also be harmed", "The food chain is not affected", "Only the farmer is affected"]'::jsonb,
    '1'::jsonb,
    'Pesticides can bioaccumulate, harming birds and other animals higher in the food chain.',
    ARRAY['Bioaccumulation.', 'Cascade effects.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c1f9e2d3-85fa-5c30-b33c-5bb5abfc84c7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'fill_in_blank',
    'Why are producers the most important organisms in an ecosystem?',
    NULL,
    '"energy source"'::jsonb,
    'Producers capture energy from the sun and convert it to food, supporting all other organisms.',
    ARRAY['Base of food chain.', 'Without them, no food.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '77957c59-b12a-5a7a-ae74-7eff7de68cb7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'An ecosystem has 10,000 kg of plants. Approximately how much energy is available to primary consumers?',
    '["10,000 kg", "1,000 kg", "100 kg", "10 kg"]'::jsonb,
    '1'::jsonb,
    'Only about 10% of energy transfers to the next level (10,000 → 1,000 kg).',
    ARRAY['10% rule.', 'Energy pyramid.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '98ede167-19be-5f89-bfbd-88f9e8ff26ff',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'How does deforestation affect an ecosystem?',
    '["Only affects trees", "Destroys habitats, reduces biodiversity, and disrupts the water cycle", "Only affects animals", "Has no long-term effects"]'::jsonb,
    '1'::jsonb,
    'Deforestation removes producers, destroys habitats, and disrupts ecosystem balance.',
    ARRAY['Multiple impacts.', 'Habitat loss.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e2d18993-2a01-5f1b-b5d1-49f4f8eaa45c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'multiple_choice',
    'What would happen if all decomposers were removed from a forest ecosystem?',
    '["Nothing would change", "Dead organisms would accumulate and nutrients would not be recycled", "Trees would grow faster", "Animals would thrive"]'::jsonb,
    '1'::jsonb,
    'Without decomposers, dead matter piles up and nutrients are locked away from producers.',
    ARRAY['Nutrient cycle breaks.', 'Soil becomes depleted.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '410da7db-48e0-5d9d-be98-67007d9f38c6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.3.1'), NULL, 'fill_in_blank',
    'In a grassland ecosystem, name one producer, one herbivore, and one carnivore.',
    NULL,
    '"grass"'::jsonb,
    'Grass (producer), zebra/rabbit (herbivore), lion/fox (carnivore).',
    ARRAY['Three trophic levels.', 'Classic food chain.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.3.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1bd65f7b-2130-5734-8346-1f76e6bbb44f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'A farming system that combines crops and animals on the same farm is called:',
    '["Monoculture", "Mixed farming", "Plantation farming", "Subsistence farming"]'::jsonb,
    '1'::jsonb,
    'Mixed farming combines crop cultivation and animal rearing.',
    ARRAY['Both crops and livestock.', 'Diversified income.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ad77a0a6-4a2b-5160-9d76-cb5d384fcac8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'Growing only one crop on a large area is called:',
    '["Mixed farming", "Crop rotation", "Monoculture", "Intercropping"]'::jsonb,
    '2'::jsonb,
    'Monoculture is growing a single crop.',
    ARRAY['One crop only.', 'Large scale.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f1c212f2-a54b-5ef3-89b3-ad144435b399',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'The practice of growing different crops in sequence on the same land is called:',
    '["Monoculture", "Crop rotation", "Irrigation", "Harvesting"]'::jsonb,
    '1'::jsonb,
    'Crop rotation is growing different crops in planned sequence.',
    ARRAY['Maintains soil fertility.', 'Breaks pest cycles.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4a9b8683-bb21-5e01-8abc-5b8b94c3e540',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'Subsistence farming is done primarily to:',
    '["Sell for profit", "Feed the farmer''s family", "Export crops", "Make chemicals"]'::jsonb,
    '1'::jsonb,
    'Subsistence farming produces food mainly for the farmer''s family.',
    ARRAY['Small scale.', 'Family consumption.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cde7e0d0-8517-5f93-9e90-c182773126e8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'Commercial farming is done primarily to:',
    '["Feed the family", "Sell for profit", "Conserve the environment", "Practice traditions"]'::jsonb,
    '1'::jsonb,
    'Commercial farming aims to sell products for profit.',
    ARRAY['Large scale.', 'Market oriented.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '066f80fc-2a78-596c-bcef-16efb9a94576',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'A farm that keeps only cattle is an example of:',
    '["Mixed farming", "Crop farming", "Animal husbandry", "Plantation farming"]'::jsonb,
    '2'::jsonb,
    'Animal husbandry is the practice of raising livestock.',
    ARRAY['Livestock only.', 'Animal rearing.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '987ea248-7402-5828-a53e-cd0518fc0aa3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'Why is crop rotation better than monoculture for soil health?',
    '["It is easier", "Different crops use and return different nutrients, maintaining soil balance", "It produces more of one crop", "It requires less labour"]'::jsonb,
    '1'::jsonb,
    'Crop rotation prevents nutrient depletion and breaks pest cycles.',
    ARRAY['Nutrient balance.', 'Pest management.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c007c28b-a27a-5179-b268-1b449c297b3b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'In Ghana, a common crop rotation includes maize followed by:',
    '["More maize", "Cowpea or groundnut", "Rice", "Cassava only"]'::jsonb,
    '1'::jsonb,
    'Legumes like cowpea fix nitrogen, benefiting the next crop.',
    ARRAY['Nitrogen fixation.', 'Soil improvement.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '24755deb-45fb-5707-adec-a651f0043966',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'Mixed farming has an advantage over single-crop farming because:',
    '["It requires less work", "It provides multiple income sources and reduces risk", "It uses less land", "It needs no fertiliser"]'::jsonb,
    '1'::jsonb,
    'Mixed farming diversifies income and reduces the risk of total crop failure.',
    ARRAY['Multiple outputs.', 'Risk reduction.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5fccf46-a847-5522-9f66-0cc035856ae8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'Irrigation is important in farming because:',
    '["It kills weeds", "It provides water to crops during dry periods", "It adds nutrients to soil", "It prevents pest damage"]'::jsonb,
    '1'::jsonb,
    'Irrigation ensures crops get water when rainfall is insufficient.',
    ARRAY['Water supply.', 'Dry season farming.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '252bd7a7-cb08-50d3-b06a-32f4c6aaa769',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'A disadvantage of monoculture is:',
    '["Higher yields always", "Increased vulnerability to pests and diseases", "Better soil health", "Lower costs"]'::jsonb,
    '1'::jsonb,
    'Monoculture is vulnerable because pests that attack one crop can destroy the entire farm.',
    ARRAY['One pest affects everything.', 'No diversity.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3a9ed12d-eea7-5026-949a-f622e18fcd3a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'What is agroforestry?',
    '["Farming without trees", "Growing crops alongside trees", "Destroying forests for farming", "Growing only trees"]'::jsonb,
    '1'::jsonb,
    'Agroforestry combines trees with crops or livestock on the same land.',
    ARRAY['Trees + crops.', 'Sustainable practice.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e5693e6d-2a5a-58f0-aaef-213be15bf39e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'Why do small-scale farmers in Ghana often practise mixed farming?',
    '["Government requires it", "It provides food variety and income security", "It is the easiest method", "They have too much land"]'::jsonb,
    '1'::jsonb,
    'Mixed farming provides diverse food and income, reducing vulnerability.',
    ARRAY['Food security.', 'Multiple benefits.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2c706b50-606e-5ea9-9be3-4cd7d612050c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'fill_in_blank',
    'A farmer practises monoculture of maize year after year. The yields are declining. Explain why.',
    NULL,
    '"soil depletion"'::jsonb,
    'Repeated maize farming depletes specific nutrients and allows maize-specific pests to build up.',
    ARRAY['Nutrient depletion.', 'Pest accumulation.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5c9f3344-b104-5b52-8bc9-79f32f262d3a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'Compare the environmental impact of large-scale commercial farming vs small-scale subsistence farming.',
    '["Commercial is always better", "Subsistence is always better", "Commercial can cause more pollution and habitat loss but is more efficient; subsistence is less efficient but more sustainable", "They have identical impacts"]'::jsonb,
    '2'::jsonb,
    'Commercial farming is more productive but can cause environmental damage; subsistence is gentler but less efficient.',
    ARRAY['Scale vs sustainability.', 'Different trade-offs.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '42c87456-0f22-52ea-ab85-ac74997558b4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'fill_in_blank',
    'How does intercropping help reduce pest damage?',
    NULL,
    '"diversity"'::jsonb,
    'Different crops confuse pests and reduce the chance of total crop failure.',
    ARRAY['Pests prefer specific crops.', 'Mixed planting confuses them.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f5c4d871-e296-5c06-8fa7-f86b2040d744',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'multiple_choice',
    'Why is land rotation (shifting cultivation) practised in some parts of Ghana?',
    '["It is traditional only", "It allows exhausted land to recover its fertility", "It requires less work", "Government policy"]'::jsonb,
    '1'::jsonb,
    'Shifting cultivation lets land rest and regenerate soil nutrients.',
    ARRAY['Soil recovery.', 'Traditional practice.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '42f7e6e1-7e44-570b-b1e3-37f0ddad114d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'fill_in_blank',
    'A government wants to increase food production. Should they promote monoculture or mixed farming? Justify.',
    NULL,
    '"mixed farming"'::jsonb,
    'Mixed farming is more sustainable and provides diverse nutrition, though monoculture may produce more of one crop.',
    ARRAY['Long-term vs short-term.', 'Food security.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '330bd90c-0c6f-5855-aadb-6a854f6477af',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'fill_in_blank',
    'Organic farming avoids chemical fertilisers and pesticides. What are the advantages and challenges?',
    NULL,
    '"sustainable"'::jsonb,
    'Advantages: healthier soil, no chemical residues. Challenges: lower yields, more labour intensive.',
    ARRAY['Environmental benefits.', 'Production challenges.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ef782b6a-c378-5012-9c39-440ec8308569',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.3.4.1'), NULL, 'fill_in_blank',
    'Name two crops commonly grown together in an intercropping system in Ghana.',
    NULL,
    '"maize and cowpea"'::jsonb,
    'Maize and cowpea, or maize and cassava are common intercropping combinations.',
    ARRAY['Different growth habits.', 'Complementary crops.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.4.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '39eb04fb-9c03-5fa1-883a-3a7995a80dcf',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'fill_in_blank',
    'Energy is the ability to do ___.',
    NULL,
    '"work"'::jsonb,
    'Energy is defined as the ability to do work.',
    ARRAY['Fundamental concept.', 'Measured in Joules.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c1ee812f-d190-5b54-8f4a-86b154592d62',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'The SI unit of energy is the:',
    '["Newton", "Watt", "Joule", "Calorie"]'::jsonb,
    '2'::jsonb,
    'The Joule (J) is the SI unit of energy.',
    ARRAY['Named after James Joule.', 'Also measures work.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6b4189de-f099-536a-b805-944c3f4eac43',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Energy stored in food is:',
    '["Kinetic energy", "Chemical energy", "Nuclear energy", "Heat energy"]'::jsonb,
    '1'::jsonb,
    'Food stores chemical energy in molecular bonds.',
    ARRAY['Released during digestion.', 'Chemical bonds.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8d7d4968-25cd-5440-a9fb-67d3e210fe5c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'fill_in_blank',
    'A moving object has ___ energy.',
    NULL,
    '"kinetic"'::jsonb,
    'Kinetic energy is energy of motion.',
    ARRAY['Movement energy.', 'Depends on mass and speed.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c8e284cf-adb5-51e4-9b73-8c4a8a2d57c2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Energy stored in a stretched rubber band is:',
    '["Kinetic energy", "Potential energy", "Heat energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Elastic potential energy is stored in stretched or compressed objects.',
    ARRAY['Stored energy.', 'Released when let go.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c054f4ac-543a-5a72-b26b-0e2eff95fd08',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Light energy from the sun reaches Earth through:',
    '["Conduction", "Convection", "Radiation", "Sound waves"]'::jsonb,
    '2'::jsonb,
    'Light travels as electromagnetic radiation through space.',
    ARRAY['No medium needed.', 'Speed of light.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0b18888-326a-57e3-b8b5-8dfdda62db68',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Which is the correct energy transformation in a torch?',
    '["Chemical \u2192 light \u2192 heat", "Chemical \u2192 electrical \u2192 light and heat", "Electrical \u2192 chemical \u2192 light", "Light \u2192 chemical \u2192 electrical"]'::jsonb,
    '1'::jsonb,
    'Batteries (chemical) provide electricity, which produces light and heat in the bulb.',
    ARRAY['Battery to bulb.', 'Energy conversion chain.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fec694cb-2668-51af-9975-4fb0c5d71245',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'fill_in_blank',
    'A ball at the top of a hill has ___ energy. As it rolls down, this converts to ___ energy.',
    NULL,
    '"potential, kinetic"'::jsonb,
    'At the top: potential energy. Rolling down: converts to kinetic energy.',
    ARRAY['Height = potential.', 'Movement = kinetic.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1766bea7-55fe-5351-b620-e46c96aac2ae',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Sound energy is produced by:',
    '["Still objects", "Vibrating objects", "Cold objects", "Dark objects"]'::jsonb,
    '1'::jsonb,
    'Sound is produced by vibrations that travel through a medium.',
    ARRAY['Vibrations in air.', 'Needs a medium.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '137979d8-7b26-5699-ab7f-10502e1972fd',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Electrical energy is used to power:',
    '["Only lights", "Many devices like motors, heaters, and computers", "Only motors", "Only heaters"]'::jsonb,
    '1'::jsonb,
    'Electrical energy powers many devices — lights, motors, heaters, electronics.',
    ARRAY['Versatile energy form.', 'Most used energy.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '76e0ed1c-f1e0-5ed5-837d-ea8912829aa5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Nuclear energy is released when:',
    '["Chemicals burn", "Atomic nuclei split or combine", "Water boils", "Objects move"]'::jsonb,
    '1'::jsonb,
    'Nuclear energy comes from fission (splitting) or fusion (combining) nuclei.',
    ARRAY['E = mc squared.', 'Huge energy release.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '63e343de-afd2-58df-ba5e-b7c2656410ce',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'fill_in_blank',
    'A waterfall has both ___ and ___ energy.',
    NULL,
    '"potential, kinetic"'::jsonb,
    'A waterfall has potential energy (height) and kinetic energy (moving water).',
    ARRAY['Height and movement.', 'Both at once.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '88c49475-0857-5fd5-ab45-2c71b31b4f5e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Which energy transformation occurs in a solar cell?',
    '["Light to electrical", "Chemical to electrical", "Nuclear to heat", "Sound to electrical"]'::jsonb,
    '0'::jsonb,
    'Solar cells convert light energy directly to electrical energy.',
    ARRAY['Photovoltaic effect.', 'Sunlight to electricity.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f988b3f9-4cd7-5e8b-8f80-84f056b7fbd1',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Conservation of energy means energy:',
    '["Can be created", "Cannot be created or destroyed, only transformed", "Can be destroyed", "Disappears when used"]'::jsonb,
    '1'::jsonb,
    'Energy is neither created nor destroyed — it only changes form.',
    ARRAY['First law of thermodynamics.', 'Always conserved.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3f49f789-5d56-5185-ae10-bb05c9005788',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'A car engine converts chemical energy in fuel to:',
    '["Only heat", "Kinetic energy and heat", "Electrical energy only", "Light energy"]'::jsonb,
    '1'::jsonb,
    'Car engines convert fuel (chemical) to motion (kinetic) and waste heat.',
    ARRAY['Not 100% efficient.', 'Some energy lost as heat.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '49674dd9-fc27-576c-a525-d6eefda3f8f2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'fill_in_blank',
    'Why is energy said to be "lost" as heat in most conversions?',
    NULL,
    '"dissipated"'::jsonb,
    'Energy is not destroyed but becomes dispersed as low-grade heat that is hard to use.',
    ARRAY['Not truly lost.', 'Waste heat.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6e0ed94a-87e2-5d6f-9a48-4324d0ff682e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'An electric fan converts electrical energy to:',
    '["Only kinetic energy", "Kinetic energy and heat", "Only heat", "Light energy"]'::jsonb,
    '1'::jsonb,
    'A fan converts electrical energy to kinetic energy (moving air) and some heat.',
    ARRAY['Motor produces heat.', 'Mostly movement.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '23988564-0929-5c28-9a11-36ba0ff379c0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'fill_in_blank',
    'Why do we say "energy conversion" rather than "energy creation"?',
    NULL,
    '"conservation"'::jsonb,
    'Energy cannot be created — it only converts from one form to another.',
    ARRAY['Conservation law.', 'Transform, not create.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5332279-18e5-5823-878f-662c5c5cd9b6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'fill_in_blank',
    'A pendulum swings back and forth. Describe the energy conversion.',
    NULL,
    '"potential to kinetic"'::jsonb,
    'At the top: potential energy. At the bottom: kinetic energy. They continuously convert.',
    ARRAY['Continuous conversion.', 'Back and forth.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd57cfeca-bec8-5aa7-9e52-d6c7a9586d70',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.1'), NULL, 'multiple_choice',
    'Which device converts chemical energy to electrical energy?',
    '["A light bulb", "A battery", "A motor", "A solar cell"]'::jsonb,
    '1'::jsonb,
    'A battery converts stored chemical energy to electrical energy.',
    ARRAY['Electrochemical reaction.', 'Portable power source.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.4.1.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '013c769c-97a9-5f1c-b7f3-5eeaad653c52',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Heat transfer by direct contact between particles is called:',
    '["Radiation", "Convection", "Conduction", "Insulation"]'::jsonb,
    '2'::jsonb,
    'Conduction is heat transfer through direct contact.',
    ARRAY['Particles touch and vibrate.', 'Solids conduct well.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a1cda959-ce28-5970-b364-614935d8c22d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Heat transfer in fluids (liquids and gases) by bulk movement is called:',
    '["Conduction", "Radiation", "Convection", "Insulation"]'::jsonb,
    '2'::jsonb,
    'Convection is heat transfer by movement of heated fluid.',
    ARRAY['Hot fluid rises, cold sinks.', 'Currents form.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7bf90444-1487-546a-abb5-c998a34809ee',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Heat transfer through electromagnetic waves is called:',
    '["Conduction", "Convection", "Radiation", "Insulation"]'::jsonb,
    '2'::jsonb,
    'Radiation transfers heat through electromagnetic waves.',
    ARRAY['No medium needed.', 'Sun heats Earth.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7dcf66c9-3546-5c2b-840d-d0f52e93829d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Good conductors of heat include:',
    '["Wood", "Metals", "Plastic", "Rubber"]'::jsonb,
    '1'::jsonb,
    'Metals are good conductors of heat.',
    ARRAY['Copper, aluminium, iron.', 'Free electrons.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'de12e067-e915-5604-a74f-e1780067b42f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Materials that do not conduct heat well are called:',
    '["Conductors", "Insulators", "Radiators", "Converters"]'::jsonb,
    '1'::jsonb,
    'Insulators resist heat flow.',
    ARRAY['Wood, plastic, air.', 'Keep things warm.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5050740a-7795-5573-928a-ac231975508b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'fill_in_blank',
    'A thermos flask keeps drinks hot by reducing heat loss through conduction, convection, and ___.',
    NULL,
    '"radiation"'::jsonb,
    'A thermos reduces all three types of heat transfer.',
    ARRAY['Silvered surfaces reflect radiation.', 'Vacuum prevents conduction.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '23048902-5438-508a-b073-5d942231ab16',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Why does a metal spoon feel colder than a wooden spoon at the same temperature?',
    '["Metal is actually colder", "Metal conducts heat away from your hand faster", "Wood produces heat", "Your hand is wrong"]'::jsonb,
    '1'::jsonb,
    'Metal conducts heat away from your hand faster, making it feel colder.',
    ARRAY['Conduction rate differs.', 'Thermal conductivity.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3a817398-3a26-523d-9061-55874738bc74',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Convection currents form because:',
    '["Hot fluid is denser than cold fluid", "Hot fluid rises because it is less dense, cold fluid sinks", "Fluids cannot mix", "Conduction occurs"]'::jsonb,
    '1'::jsonb,
    'Heated fluid expands, becomes less dense, and rises. Cooler fluid sinks to replace it.',
    ARRAY['Density difference drives currents.', 'Circular flow.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ac81ae05-5f9a-5fb0-940d-3f27cb0970db',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Why are houses painted white in hot climates?',
    '["White looks nice", "White surfaces absorb less heat radiation", "White is cheaper", "White conducts heat better"]'::jsonb,
    '1'::jsonb,
    'White surfaces reflect more radiation and absorb less heat.',
    ARRAY['Light colours reflect.', 'Reduces heat gain.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '00a49970-a4a9-5cef-96f1-e7a6c15be0c7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Land breezes occur at night because:',
    '["Land heats up faster than sea", "Land cools faster than sea, so air over land sinks and blows toward sea", "The sea dries up", "Wind blows from mountains"]'::jsonb,
    '1'::jsonb,
    'At night, land cools faster. Cool air over land sinks and flows toward the warmer sea.',
    ARRAY['Temperature difference.', 'Air flows from cool to warm.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd2456889-5044-5a08-a17a-e4826037d9b5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Why are cooking pots made of metal but have plastic or wooden handles?',
    '["Metal is cheaper", "Metal conducts heat well for cooking; plastic/wood insulates to protect hands", "Plastic conducts heat better", "It is tradition"]'::jsonb,
    '1'::jsonb,
    'Metal conducts heat to cook food; plastic/wood handles insulate hands from burns.',
    ARRAY['Conductor + insulator combination.', 'Safety design.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6d551eb4-2e82-5bff-90a3-65d4fcfc966f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Which colour absorbs the most heat radiation?',
    '["White", "Silver", "Black", "Yellow"]'::jsonb,
    '2'::jsonb,
    'Black surfaces absorb the most radiation; white absorbs the least.',
    ARRAY['Dark colours absorb more.', 'Solar panels are dark.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a70cfc78-1fa6-591b-8db2-831dab6cbc09',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'A sea breeze during the day blows from:',
    '["Land to sea", "Sea to land", "Mountains to sea", "Sea to mountains"]'::jsonb,
    '1'::jsonb,
    'During the day, land heats faster. Cool air from sea flows toward the low-pressure area over land.',
    ARRAY['Land heats up faster.', 'Sea breeze.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '003dd248-2b40-5eaa-aadc-489e6ab13c6e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'fill_in_blank',
    'Explain why double-glazed windows reduce heat loss from a house.',
    NULL,
    '"trapped air"'::jsonb,
    'Trapped air between two glass panes is a poor conductor, reducing heat loss by conduction.',
    ARRAY['Air is an insulator.', 'Double layer.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9dfb6cfb-f23e-5fe1-9232-50008f4fed5a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Why does a black car get hotter inside than a white car on a sunny day?',
    '["Black cars have no air conditioning", "Black surfaces absorb more solar radiation", "White cars generate cold air", "Black cars are smaller"]'::jsonb,
    '1'::jsonb,
    'Black absorbs more radiation, converting it to heat inside the car.',
    ARRAY['Absorption differences.', 'Colour affects temperature.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7cc1d549-42ad-50a6-92be-a492473d5bce',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'fill_in_blank',
    'A metal rod is heated at one end. The other end eventually gets hot too. Explain the process.',
    NULL,
    '"conduction"'::jsonb,
    'Heat is conducted along the rod as vibrating particles pass energy to their neighbours.',
    ARRAY['Particle vibration.', 'Energy transfer through contact.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '79ab3ca2-3bb0-5bcc-9695-74b7510e5473',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Why do firefighters wear shiny metallic suits?',
    '["To look professional", "To reflect heat radiation from fires", "To conduct heat away", "To absorb heat slowly"]'::jsonb,
    '1'::jsonb,
    'Metallic surfaces reflect radiation, protecting firefighters from extreme heat.',
    ARRAY['Reflective surface.', 'Radiation protection.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '800647fc-7364-5aba-a53a-17547e8f6538',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'Why does blowing on hot food cool it faster?',
    '["It adds cold air", "It increases convection by moving hot air away from the food surface", "It changes the food''s temperature directly", "It adds moisture"]'::jsonb,
    '1'::jsonb,
    'Blowing removes the layer of hot air near the food, speeding up cooling by convection.',
    ARRAY['Forced convection.', 'Faster heat loss.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '21f6dbbf-fdb7-5530-80b5-d61bfae52b96',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'fill_in_blank',
    'A vacuum flask has a vacuum between double walls. How does this reduce heat transfer?',
    NULL,
    '"no conduction or convection"'::jsonb,
    'A vacuum has no particles, so conduction and convection cannot occur.',
    ARRAY['No medium for heat transfer.', 'Only radiation possible.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'af268ee7-1424-51e9-80a7-3348668b9b97',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.2'), NULL, 'multiple_choice',
    'In which direction does heat flow?',
    '["From cold to hot", "From hot to cold", "Both directions equally", "Only upwards"]'::jsonb,
    '1'::jsonb,
    'Heat always flows from a hotter object to a cooler one.',
    ARRAY['Temperature gradient.', 'Second law of thermodynamics.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.4.1.3
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b8dcfa79-768f-54ca-b47e-09ae967ca806',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'Light travels in:',
    '["Curved lines", "Straight lines", "Circles", "Zigzag patterns"]'::jsonb,
    '1'::jsonb,
    'Light travels in straight lines called rays.',
    ARRAY['Shadow formation proves this.', 'Ray optics.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e4647bb1-6908-5bcc-9514-6fa34a9acca9',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'A shadow is formed because light:',
    '["Bends around objects", "Cannot pass through opaque objects", "Reflects off objects", "Refracts through objects"]'::jsonb,
    '1'::jsonb,
    'Shadows form because opaque objects block light.',
    ARRAY['Light cannot bend around them.', 'Straight-line travel.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '86598cdf-94dc-5478-879c-58a76f2f51a1',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'An object that allows all light to pass through is:',
    '["Opaque", "Translucent", "Transparent", "Reflective"]'::jsonb,
    '2'::jsonb,
    'Transparent objects allow all light through (e.g., clear glass).',
    ARRAY['See through clearly.', 'Full transmission.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '00aecd65-2ea5-547c-bf92-d9d3f535a45f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'An object that blocks all light is called:',
    '["Transparent", "Translucent", "Opaque", "Reflective"]'::jsonb,
    '2'::jsonb,
    'Opaque objects block all light.',
    ARRAY['No light passes through.', 'Casts a shadow.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5c92707-4948-5117-a6c9-60a919586018',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'fill_in_blank',
    'A ___ material allows some light through but scatters it (e.g., frosted glass).',
    NULL,
    '"translucent"'::jsonb,
    'Translucent materials allow partial light transmission with scattering.',
    ARRAY['Partially see-through.', 'Frosted glass, tissue paper.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '095aa181-6498-5242-9bc6-3436700cf7d0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'A pinhole camera works because light travels in:',
    '["Curves", "Circles", "Straight lines", "Waves only"]'::jsonb,
    '2'::jsonb,
    'A pinhole camera uses the straight-line property of light to form an image.',
    ARRAY['Light passes through tiny hole.', 'Forms inverted image.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1928f07e-3e68-5d66-ba51-067efe7c4443',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'A solar eclipse occurs when:',
    '["The sun moves behind Earth", "The moon blocks sunlight from reaching Earth", "Earth blocks sunlight", "Clouds cover the sun"]'::jsonb,
    '1'::jsonb,
    'A solar eclipse happens when the moon is between the sun and Earth, casting a shadow.',
    ARRAY['Moon''s shadow on Earth.', 'Straight-line light blocked.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c1af09ed-35f2-5ba7-99c8-4425b773653a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'Why can you see around a corner with a mirror?',
    '["Light bends around corners", "Light reflects off the mirror in straight lines", "The mirror generates light", "Light diffracts"]'::jsonb,
    '1'::jsonb,
    'Mirrors reflect light, changing its direction while it still travels in straight lines.',
    ARRAY['Reflection changes direction.', 'Angle of incidence = angle of reflection.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aadcc243-2f21-5129-97f4-8c32071cb672',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'fill_in_blank',
    'An eclipse shadow has two parts: the dark ___ and the lighter penumbra.',
    NULL,
    '"umbra"'::jsonb,
    'The umbra is the darkest part of a shadow where no light reaches.',
    ARRAY['Total shadow.', 'Completely dark.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3fa43fa7-1048-5db0-abaf-eb665c615d95',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'Why do we see lightning before we hear thunder?',
    '["Light is brighter", "Light travels much faster than sound", "Sound is blocked", "Thunder happens later"]'::jsonb,
    '1'::jsonb,
    'Light travels at 300,000 km/s while sound travels at only 340 m/s.',
    ARRAY['Speed difference.', 'Light arrives first.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'acc45479-60b1-5042-95fb-2b76707e5c02',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'Total eclipses of the sun are rare because:',
    '["The sun moves too fast", "The moon''s orbit is tilted, so it usually passes above or below the sun", "Earth rotates too fast", "Clouds always block the view"]'::jsonb,
    '1'::jsonb,
    'The moon''s orbital plane is tilted 5° relative to Earth''s orbit, so alignments are rare.',
    ARRAY['Orbital geometry.', 'Not every new moon.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e12e2465-558d-564c-8877-08cbaecfc270',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'A lunar eclipse occurs when:',
    '["The moon blocks the sun", "Earth blocks sunlight from reaching the moon", "The sun blocks the moon", "The moon goes behind Jupiter"]'::jsonb,
    '1'::jsonb,
    'A lunar eclipse happens when Earth is between the sun and moon, casting a shadow on the moon.',
    ARRAY['Earth''s shadow on moon.', 'Full moon phase.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '108b0ea1-a63e-55c3-93c0-8a67a1b27c94',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'Why are shadows longer in the morning and evening than at noon?',
    '["The sun is closer", "The sun is at a lower angle, creating longer shadows", "Light is weaker", "The ground is colder"]'::jsonb,
    '1'::jsonb,
    'Low sun angle creates longer shadows; at noon, the sun is directly overhead.',
    ARRAY['Angle of light matters.', 'Trigonometry of shadows.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'af0fc9f3-7f8e-5504-a3a1-b4b63f603996',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'During a total solar eclipse, the sky becomes dark because:',
    '["The sun goes out", "The moon completely blocks the sun''s light", "Clouds cover the sky", "Earth stops rotating"]'::jsonb,
    '1'::jsonb,
    'The moon perfectly blocks the sun, casting a shadow on Earth.',
    ARRAY['Rare alignment.', 'Umbra reaches Earth.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0c93d0c-c9aa-5cf0-b4ab-dc3d9c4b4023',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'A student uses a card with a pinhole to project an image. The image is:',
    '["Upright", "Inverted (upside down)", "Enlarged", "Coloured"]'::jsonb,
    '1'::jsonb,
    'Pinhole images are inverted because light travels in straight lines through the hole.',
    ARRAY['Crosses at pinhole.', 'Inverted projection.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a5d5b59a-a108-5a3b-b50e-d6b95ab8420a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'fill_in_blank',
    'Explain why you cannot see around a solid corner but can hear around it.',
    NULL,
    '"diffraction"'::jsonb,
    'Sound waves can diffract (bend) around obstacles, but light travels in straight lines and does not bend significantly.',
    ARRAY['Wavelength matters.', 'Sound diffracts more.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd902aeab-bca1-5cdb-b4df-2ee7d25466ae',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'If the sun were not a point source of light, shadows would have:',
    '["No penumbra", "A larger penumbra", "No umbra", "No shadow at all"]'::jsonb,
    '1'::jsonb,
    'An extended source creates softer shadows with larger penumbra regions.',
    ARRAY['Multiple light paths.', 'Blurred shadow edges.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '91d025a4-f3b5-53c8-8b89-db8dc45000b5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'fill_in_blank',
    'Why are annular solar eclipses different from total solar eclipses?',
    NULL,
    '"distance"'::jsonb,
    'The moon is farther from Earth in annular eclipses, so it does not fully cover the sun, leaving a ring of light.',
    ARRAY['Moon''s distance varies.', 'Apparent size changes.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e8bf2ec6-15dc-5e83-a3e5-d73ad7168429',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'multiple_choice',
    'A shadow puppet show uses a screen and a light source. Why must the puppet be opaque?',
    '["To look pretty", "To block light and create a shadow on the screen", "To reflect light", "To make sound"]'::jsonb,
    '1'::jsonb,
    'Opaque puppets block light, creating sharp shadows on the screen.',
    ARRAY['Shadow formation.', 'Light blocking.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2a666d27-5f21-5dc7-af54-a24e0b4e7a98',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.1.3'), NULL, 'fill_in_blank',
    'Light from the sun takes about 8 minutes to reach Earth. Calculate the approximate distance (speed of light = 300,000 km/s).',
    NULL,
    '"144 million km"'::jsonb,
    'Distance = speed × time = 300,000 × 480 = 144,000,000 km.',
    ARRAY['Convert 8 minutes to seconds.', 'D = v × t.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.4.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b2ba69cb-1eeb-5bf9-9b5b-90870fba737e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'Electric current is the flow of:',
    '["Protons", "Neutrons", "Electrons", "Photons"]'::jsonb,
    '2'::jsonb,
    'Electric current is the flow of electrons through a conductor.',
    ARRAY['Negative charges move.', 'In a circuit.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '76b1a062-6a22-5c09-bbfe-093b22f78a34',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'The unit of electric current is the:',
    '["Volt", "Watt", "Ampere", "Ohm"]'::jsonb,
    '2'::jsonb,
    'Current is measured in Amperes (A).',
    ARRAY['Named after Andre-Marie Ampere.', 'Flow rate of charge.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bd0ac1aa-3e9f-5784-a3cc-8d256a1309b8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'A material that allows electricity to flow through it is called a:',
    '["Insulator", "Conductor", "Resistor", "Semiconductor"]'::jsonb,
    '1'::jsonb,
    'Conductors allow electric current to flow.',
    ARRAY['Metals are good conductors.', 'Free electrons.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fb658621-0e51-500b-85d6-7e45b3d651d4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'Materials like rubber and plastic do not conduct electricity. They are called:',
    '["Conductors", "Insulators", "Generators", "Batteries"]'::jsonb,
    '1'::jsonb,
    'Insulators do not allow electric current to flow.',
    ARRAY['Safety covering.', 'No free electrons.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3349bfcc-d6c5-5159-a3e5-43f44ea6e8e6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'A device that provides electrical energy in a circuit is the:',
    '["Switch", "Bulb", "Battery or cell", "Wire"]'::jsonb,
    '2'::jsonb,
    'A battery or cell provides the energy to push electrons around a circuit.',
    ARRAY['Energy source.', 'Pushes electrons.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd6b9c168-8f2a-5d30-8115-087b212abd29',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'Voltage is measured in:',
    '["Amperes", "Ohms", "Volts", "Watts"]'::jsonb,
    '2'::jsonb,
    'Voltage (potential difference) is measured in Volts (V).',
    ARRAY['Named after Alessandro Volta.', 'Electrical pressure.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '17095248-150d-563a-8732-5d5d1b7d308a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'In a series circuit, if one bulb blows, the other bulbs:',
    '["Stay on", "Also go off", "Get brighter", "Dim slightly"]'::jsonb,
    '1'::jsonb,
    'In a series circuit, there is only one path — if it breaks, all components stop.',
    ARRAY['Single path for current.', 'Break stops flow.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3df78b60-c21b-55b1-869f-c7b9a021865c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'In a parallel circuit, each component has:',
    '["The same current", "Its own separate path for current", "No voltage", "Higher resistance"]'::jsonb,
    '1'::jsonb,
    'Parallel circuits have separate branches, so each component has its own current path.',
    ARRAY['Independent branches.', 'One can fail, others continue.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '902df43b-7740-5cd4-8111-5dfd3c389a66',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'fill_in_blank',
    'An ammeter is connected in ___ with the component being measured.',
    NULL,
    '"series"'::jsonb,
    'An ammeter measures current and must be connected in series.',
    ARRAY['Current flows through it.', 'In the path.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f005a8a8-49f2-59da-a169-45fe10890467',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'fill_in_blank',
    'A voltmeter is connected in ___ with the component being measured.',
    NULL,
    '"parallel"'::jsonb,
    'A voltmeter measures potential difference and is connected in parallel.',
    ARRAY['Across the component.', 'Measures voltage drop.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8d97b407-1ebe-5f02-a58a-c49934f36888',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'Resistance is measured in:',
    '["Volts", "Amperes", "Ohms", "Watts"]'::jsonb,
    '2'::jsonb,
    'Resistance is measured in Ohms (Ω).',
    ARRAY['Named after Georg Ohm.', 'Opposition to current.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f0ffee56-d9c3-5f1b-9934-5cdd835b7c91',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'Which material is the best conductor of electricity?',
    '["Copper", "Iron", "Steel", "Aluminium"]'::jsonb,
    '0'::jsonb,
    'Copper is one of the best electrical conductors.',
    ARRAY['Used in wiring.', 'Good conductivity.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '191b21d5-f374-5163-8963-3b63ff3c6ee5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'Why are electrical wires coated with plastic?',
    '["To make them stronger", "To insulate and prevent electric shocks", "To make them visible", "To reduce resistance"]'::jsonb,
    '1'::jsonb,
    'Plastic insulation prevents accidental contact with live wires.',
    ARRAY['Safety measure.', 'Prevents shocks.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8265f441-b430-5623-9665-477e13de684a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'fill_in_blank',
    'A circuit has a 12V battery and 4A current. What is the resistance?',
    NULL,
    '"3 ohms"'::jsonb,
    'R = V/I = 12/4 = 3 Ohms.',
    ARRAY['Ohm''s law: R = V/I.', 'Divide voltage by current.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5dae646c-a554-5f6c-8e7a-390bb77855bb',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'Why do houses use parallel circuits for lighting?',
    '["It uses less wire", "If one light fails, the others stay on", "It is cheaper", "It uses less electricity"]'::jsonb,
    '1'::jsonb,
    'Parallel circuits allow independent operation — one light can fail without affecting others.',
    ARRAY['Independent paths.', 'Reliability.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf0109a7-7861-5706-8768-10d822c3ad13',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'A fuse works by:',
    '["Increasing current", "Melting when current is too high, breaking the circuit", "Generating electricity", "Reducing voltage"]'::jsonb,
    '1'::jsonb,
    'A fuse contains a thin wire that melts if current exceeds a safe level, breaking the circuit.',
    ARRAY['Safety device.', 'Protects appliances.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '48397091-f4bd-5726-b4d3-828421f5bf68',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'fill_in_blank',
    'Why is the Earth wire important in electrical appliances?',
    NULL,
    '"safety"'::jsonb,
    'The Earth wire provides a safe path for current to flow to ground if a fault occurs, preventing electric shock.',
    ARRAY['Safety grounding.', 'Protects users.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f82ef645-2074-5f28-9c7c-ef6fcce0bc22',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'If the voltage across a resistor is doubled, what happens to the current (assuming resistance stays the same)?',
    '["Current halves", "Current doubles", "Current stays the same", "Current quadruples"]'::jsonb,
    '1'::jsonb,
    'From Ohm''s law (V = IR), if V doubles and R is constant, I doubles.',
    ARRAY['Direct proportionality.', 'V = IR.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f4f84638-c088-546c-b7a8-8a4c72d27b4f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'A student claims a thick wire has less resistance than a thin wire of the same material. Is this correct?',
    '["No, thick wires have more resistance", "Yes, thicker wires have more area for current to flow, reducing resistance", "They have the same resistance", "Depends on the material only"]'::jsonb,
    '1'::jsonb,
    'Thicker wires have more cross-sectional area, reducing resistance.',
    ARRAY['More space for electrons.', 'Inverse relationship with area.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8d5faca6-4211-5797-b1ee-448c86d924a0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.1'), NULL, 'multiple_choice',
    'Why do birds sitting on a power line not get electrocuted?',
    '["The lines are not live", "They are not completing a circuit \u2014 no current flows through their bodies", "Birds are immune to electricity", "The wires are insulated"]'::jsonb,
    '1'::jsonb,
    'Birds do not complete a circuit because both feet are on the same wire at the same voltage.',
    ARRAY['No potential difference.', 'No current path through body.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.4.2.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '044d0295-e4a7-599c-bcd6-baa3c644a30b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'A semiconductor device that allows current in one direction only is a:',
    '["Resistor", "Capacitor", "Diode", "Transistor"]'::jsonb,
    '2'::jsonb,
    'A diode allows current to flow in one direction only.',
    ARRAY['One-way valve for electricity.', 'Forward bias.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '484c2a0d-7970-5de9-b0f8-4b4359f289a8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'LED stands for:',
    '["Light Emitting Diode", "Low Energy Device", "Linear Electric Detector", "Laser Energy Diode"]'::jsonb,
    '0'::jsonb,
    'LED = Light Emitting Diode.',
    ARRAY['Emits light when forward biased.', 'Efficient lighting.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '988a8c98-109b-56a0-b778-291ed67f2b09',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'A component that stores electric charge is a:',
    '["Resistor", "Capacitor", "Diode", "Switch"]'::jsonb,
    '1'::jsonb,
    'A capacitor stores electric charge.',
    ARRAY['Two plates separated by dielectric.', 'Temporary storage.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '93be4dd6-0bd5-5c7e-b159-4dff10d00970',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'A resistor is a component that:',
    '["Amplifies signals", "Opposes the flow of current", "Stores charge", "Generates electricity"]'::jsonb,
    '1'::jsonb,
    'Resistors oppose current flow.',
    ARRAY['Controls current.', 'Measured in Ohms.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '81205d06-1948-57b4-bc10-9d9114090c22',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'A transistor can act as an:',
    '["Amplifier or switch", "Insulator only", "Battery", "Antenna"]'::jsonb,
    '0'::jsonb,
    'Transistors can amplify signals or act as electronic switches.',
    ARRAY['Key component in electronics.', 'Computers use millions.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2b7e18f1-4506-5c68-ba00-59223f17b715',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'The basic electronic component that can be opened or closed to control current is a:',
    '["Resistor", "Capacitor", "Switch", "Diode"]'::jsonb,
    '2'::jsonb,
    'A switch opens or closes a circuit.',
    ARRAY['On/off control.', 'Manual or automatic.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bcc2d8c3-a646-5881-94a6-b18bec10ec41',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'Why are LEDs preferred over traditional bulbs?',
    '["They are brighter always", "They use less energy and last longer", "They are cheaper", "They produce more heat"]'::jsonb,
    '1'::jsonb,
    'LEDs are more energy-efficient and have a much longer lifespan.',
    ARRAY['Energy saving.', 'Long lasting.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '415fb118-4ff8-5111-bdee-57c292d3db52',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'In which direction does current flow through a forward-biased diode?',
    '["From cathode to anode", "From anode to cathode", "Both directions", "No current flows"]'::jsonb,
    '1'::jsonb,
    'In forward bias, current flows from anode (+) to cathode (-).',
    ARRAY['One direction only.', 'Arrow direction.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '36393e9c-55e0-5576-ba2f-bf9494a790da',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'fill_in_blank',
    'A capacitor blocks ___ current but allows ___ current to pass briefly.',
    NULL,
    '"DC, AC"'::jsonb,
    'Capacitors block steady DC but allow changing AC to pass.',
    ARRAY['Charges up then blocks.', 'AC passes through.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '321a67ff-67db-5a69-b91d-97810b3e4979',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'Resistors are colour-coded to indicate their:',
    '["Price", "Resistance value", "Manufacturer", "Age"]'::jsonb,
    '1'::jsonb,
    'Colour bands on resistors show their resistance value in Ohms.',
    ARRAY['Colour code chart.', '4 or 5 bands.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd00948f5-e888-525c-aa97-1d29501c5d65',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'A transistor has three terminals called:',
    '["Anode, cathode, gate", "Base, collector, emitter", "Positive, negative, ground", "Input, output, common"]'::jsonb,
    '1'::jsonb,
    'Transistor terminals: Base (B), Collector (C), Emitter (E).',
    ARRAY['Three connections.', 'Controls current flow.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'feedab2f-f607-5c31-b213-6a7abd100cbf',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'An integrated circuit (IC) contains:',
    '["One transistor", "Many transistors and components on a single chip", "Only resistors", "Only capacitors"]'::jsonb,
    '1'::jsonb,
    'ICs pack thousands to billions of components on a small silicon chip.',
    ARRAY['Miniaturisation.', 'Computer chips.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7a0e20ba-a078-5eed-85b3-951fb3a2f26e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'Sensors are electronic components that:',
    '["Generate electricity", "Detect changes in the environment", "Store data", "Display information"]'::jsonb,
    '1'::jsonb,
    'Sensors detect physical changes like temperature, light, or pressure.',
    ARRAY['Input devices.', 'Convert physical to electrical.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd00de059-c90d-59f5-b02b-b2e2d86bbedf',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'fill_in_blank',
    'A light-dependent resistor (LDR) has ___ resistance in bright light.',
    NULL,
    '"low"'::jsonb,
    'LDR resistance decreases in bright light.',
    ARRAY['More light = less resistance.', 'Light sensitive.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0c99efa5-af93-58f9-b83a-e707808d7b11',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'Why is a transistor used as a switch in computers?',
    '["It is large", "It can switch on and off billions of times per second", "It uses a lot of power", "It generates heat"]'::jsonb,
    '1'::jsonb,
    'Transistors switch extremely fast, enabling digital computing.',
    ARRAY['Binary logic.', '0 and 1 states.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8230cdf8-81a0-5626-aeec-df7b3ce79317',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'fill_in_blank',
    'An LED does not light up in a circuit. List two possible reasons.',
    NULL,
    '"reverse biased"'::jsonb,
    'Possible: LED is reverse biased, LED is broken, battery is dead, or circuit is open.',
    ARRAY['Check polarity.', 'Complete circuit needed.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fc622f2f-17ec-50de-9f89-5628575952db',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'How does a variable resistor (potentiometer) work?',
    '["It changes voltage only", "It changes resistance by adjusting the length of the resistive material", "It stores charge", "It generates signals"]'::jsonb,
    '1'::jsonb,
    'A potentiometer has a sliding contact that changes the effective resistance.',
    ARRAY['Adjustable resistance.', 'Volume controls use them.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cd746ebe-8941-5c26-9e19-f7cb5ff48009',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'Why are silicon and germanium used in semiconductor devices?',
    '["They are cheap", "They have intermediate conductivity that can be controlled", "They are metals", "They are insulators"]'::jsonb,
    '1'::jsonb,
    'Semiconductors have conductivity between conductors and insulators, controllable by doping.',
    ARRAY['Controlled conductivity.', 'Doping changes properties.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '23c975da-964f-5ce3-9919-aedc2ab52ed2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'multiple_choice',
    'A thermistor is a component whose resistance changes with:',
    '["Light", "Temperature", "Pressure", "Sound"]'::jsonb,
    '1'::jsonb,
    'A thermistor''s resistance changes with temperature.',
    ARRAY['Temperature sensor.', 'NTC: resistance drops as temp rises.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0d04dd18-b2cb-55be-8c5c-cc9a5ca67758',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.2.2'), NULL, 'fill_in_blank',
    'Explain why modern electronics use integrated circuits instead of individual components.',
    NULL,
    '"miniaturisation"'::jsonb,
    'ICs are smaller, faster, more reliable, and cheaper than using separate components.',
    ARRAY['Size and speed advantages.', 'Mass production.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.4.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a26d1596-0dd7-5d81-93db-8c0b4249ad0a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'The law of conservation of energy states that energy cannot be:',
    '["Used", "Stored", "Created or destroyed, only transformed", "Measured"]'::jsonb,
    '2'::jsonb,
    'Energy is conserved — it changes form but is never created or destroyed.',
    ARRAY['First law of thermodynamics.', 'Always conserved.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f9803111-8cee-5d44-85a7-70531b110a2a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'When you rub your hands together, kinetic energy converts to:',
    '["Electrical energy", "Heat energy", "Light energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Friction converts kinetic energy to heat energy.',
    ARRAY['Friction generates warmth.', 'Energy transformation.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b9c29051-832a-54b8-82bd-9ad0ea95699f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'A generator converts:',
    '["Electrical to mechanical", "Mechanical to electrical", "Chemical to light", "Heat to chemical"]'::jsonb,
    '1'::jsonb,
    'Generators convert mechanical energy (rotation) to electrical energy.',
    ARRAY['Spinning magnets and coils.', 'Electromagnetic induction.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '54a21819-bd7c-5e29-bb09-ebdca4236b38',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'An electric motor converts:',
    '["Chemical to heat", "Electrical to mechanical", "Mechanical to electrical", "Light to electrical"]'::jsonb,
    '1'::jsonb,
    'Electric motors convert electrical energy to mechanical energy (rotation).',
    ARRAY['Opposite of generator.', 'Powers fans, pumps.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '72e92a1e-f425-518b-91d9-0c2c871ea7db',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'fill_in_blank',
    'Photosynthesis converts light energy to ___ energy.',
    NULL,
    '"chemical"'::jsonb,
    'Plants convert light energy to chemical energy stored in glucose.',
    ARRAY['Light → glucose.', 'Energy storage in bonds.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '575c2ae3-9e95-5ff4-8a04-c802bed6c830',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'Cellular respiration converts chemical energy to:',
    '["Light only", "ATP (usable energy) and heat", "Nuclear energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Respiration releases chemical energy from food as ATP and heat.',
    ARRAY['Opposite of photosynthesis.', 'Energy for cells.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4032805a-1805-59aa-bd6e-effdc46d4076',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'When a car brakes, kinetic energy is converted to:',
    '["Chemical energy", "Heat energy in the brakes", "Light energy", "Nuclear energy"]'::jsonb,
    '1'::jsonb,
    'Friction in brakes converts kinetic energy to heat.',
    ARRAY['Brake pads get hot.', 'Energy transformation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '43bf0e24-9042-52d1-a8d9-02298fc13255',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'A solar panel converts light energy to:',
    '["Heat only", "Electrical energy", "Chemical energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Solar panels (photovoltaic cells) convert light to electricity.',
    ARRAY['Photovoltaic effect.', 'Renewable energy.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9f498004-deef-5497-b5c4-68c5ea7b86f6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'Why is no energy conversion 100% efficient?',
    '["We do not try hard enough", "Some energy is always converted to waste heat", "Machines are poorly made", "Energy disappears"]'::jsonb,
    '1'::jsonb,
    'In every conversion, some energy becomes low-grade heat that is hard to use.',
    ARRAY['Second law of thermodynamics.', 'Entropy increases.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd6f4c881-a725-56f6-80bb-130abaffa451',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'A hydroelectric dam converts:',
    '["Chemical to electrical", "Potential energy of water to electrical energy", "Nuclear to electrical", "Wind to electrical"]'::jsonb,
    '1'::jsonb,
    'Falling water (potential → kinetic) turns turbines to generate electricity.',
    ARRAY['Water power.', 'Renewable source.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '47a28a77-8cec-51c8-8201-8528811145df',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'In a power station, the energy conversion chain is:',
    '["Chemical \u2192 heat \u2192 mechanical \u2192 electrical", "Electrical \u2192 mechanical \u2192 heat \u2192 chemical", "Heat \u2192 chemical \u2192 electrical \u2192 mechanical", "Mechanical \u2192 heat \u2192 chemical \u2192 electrical"]'::jsonb,
    '0'::jsonb,
    'Fuel (chemical) → steam (heat) → turbine (mechanical) → generator (electrical).',
    ARRAY['Four-step conversion.', 'Fossil fuel power station.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7bf3d087-6286-5e44-8625-8b8bfdef8ae0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'Wind turbines convert:',
    '["Heat to electrical", "Kinetic energy of wind to electrical energy", "Chemical to mechanical", "Light to heat"]'::jsonb,
    '1'::jsonb,
    'Wind turbines convert wind''s kinetic energy to electrical energy.',
    ARRAY['Renewable source.', 'Moving air turns blades.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5f9c71a3-7f39-58ce-89b9-f74d7421928f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'An escalator converts electrical energy to:',
    '["Only heat", "Kinetic energy (movement) and heat", "Light energy", "Sound energy only"]'::jsonb,
    '1'::jsonb,
    'An escalator motor converts electrical energy to kinetic energy and waste heat.',
    ARRAY['Movement of steps.', 'Motor produces some heat.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '72169895-8333-5b4e-ab73-e6071d4db7a6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'fill_in_blank',
    'Why is energy efficiency important for the environment?',
    NULL,
    '"less waste"'::jsonb,
    'Efficient devices use less energy, reducing fuel consumption and pollution.',
    ARRAY['Less fuel burned.', 'Lower emissions.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95c22d13-8293-5c35-8244-271596414772',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'A light bulb converts 5% of electrical energy to light and 95% to heat. An LED converts 80% to light. Why is the LED better?',
    '["It is brighter", "It wastes less energy as heat, using electricity more efficiently", "It is cheaper", "It lasts longer only"]'::jsonb,
    '1'::jsonb,
    'LEDs waste far less energy as heat, making them more efficient.',
    ARRAY['Energy efficiency comparison.', 'Less waste heat.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '03d2630d-af8c-5eb4-92cc-b8a8088716f5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'fill_in_blank',
    'Explain the energy conversions that occur when you eat food and then run.',
    NULL,
    '"chemical to kinetic"'::jsonb,
    'Food (chemical energy) → digestion → ATP (usable energy) → muscle contraction (kinetic energy) + heat.',
    ARRAY['Chemical → mechanical.', 'Body as energy converter.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '697699b3-f738-5d5f-a7ac-0b78f95de3fc',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'Why does a bouncing ball eventually stop?',
    '["It runs out of energy", "Kinetic energy is converted to heat and sound through impacts, eventually stopping the ball", "Gravity gets weaker", "Air pushes it down"]'::jsonb,
    '1'::jsonb,
    'Each bounce converts some kinetic energy to heat and sound until all energy is dissipated.',
    ARRAY['Energy dissipation.', 'Not truly lost.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '12e783d5-9331-5eb7-86df-6bf67035ea93',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'fill_in_blank',
    'A country wants to reduce its carbon emissions. Which energy conversions should it promote?',
    NULL,
    '"renewable"'::jsonb,
    'Promote renewable conversions: solar (light→electrical), wind (kinetic→electrical), hydro (potential→electrical).',
    ARRAY['Clean energy sources.', 'Reduce fossil fuels.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '09033469-5424-56e6-838d-c6743467171b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'fill_in_blank',
    'An electric car is more efficient than a petrol car. Explain why.',
    NULL,
    '"fewer conversions"'::jsonb,
    'Electric cars have fewer energy conversion steps (battery→motor) vs petrol (chemical→heat→mechanical).',
    ARRAY['Less waste heat.', 'Simpler conversion chain.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '67a1f513-1ee5-5b5e-9258-5e39c9e65111',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.3.1'), NULL, 'multiple_choice',
    'Energy cannot be destroyed. So where does the energy go when you turn off a lamp?',
    '["It disappears", "It was converted to heat and light while on; when off, no more conversion occurs", "It is stored in the wire", "It goes back to the power station"]'::jsonb,
    '1'::jsonb,
    'The electrical energy was being converted to light and heat. When off, the conversion stops.',
    ARRAY['Conservation still holds.', 'Conversion stops.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.4.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e209d8d2-029c-50f6-92cf-f9726e9807d5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Which of the following is a contact force?',
    '["Gravity", "Magnetic force", "Friction", "Electric force"]'::jsonb,
    '2'::jsonb,
    'Friction is a contact force — it acts when surfaces touch.',
    ARRAY['Requires physical contact.', 'Opposes motion.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e83d4094-649b-538f-b754-a4651448d51b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'The SI unit of force is the:',
    '["Joule", "Watt", "Newton", "Kilogram"]'::jsonb,
    '2'::jsonb,
    'Force is measured in Newtons (N).',
    ARRAY['Named after Isaac Newton.', 'F = ma.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '99c0a2c4-daed-59bf-a047-9ebe3b65dd10',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Gravity is an example of a:',
    '["Contact force", "Non-contact force", "Frictional force", "Muscular force"]'::jsonb,
    '1'::jsonb,
    'Gravity acts at a distance without contact.',
    ARRAY['Attraction between masses.', 'Earth pulls objects.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '798c1421-06d9-5128-83ed-985ffcfc9ac8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'An object at rest stays at rest unless acted on by a force. This is:',
    '["Newton''s Second Law", "Newton''s First Law (Inertia)", "Newton''s Third Law", "Law of gravity"]'::jsonb,
    '1'::jsonb,
    'Newton''s First Law describes inertia.',
    ARRAY['Objects resist change in motion.', 'Unless force acts.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8f0ebca5-ad80-588d-9a9c-4dccbc81aadd',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'fill_in_blank',
    'A force of 10N acts on a 2kg object. The acceleration is ___ m/s squared.',
    NULL,
    '"5"'::jsonb,
    'a = F/m = 10/2 = 5 m/s squared.',
    ARRAY['F = ma, so a = F/m.', 'Divide force by mass.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '424d9200-5b26-56ad-944a-8ae20c93c2f9',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'For every action, there is an equal and opposite reaction. This is:',
    '["Newton''s First Law", "Newton''s Second Law", "Newton''s Third Law", "Law of conservation"]'::jsonb,
    '2'::jsonb,
    'Newton''s Third Law: action and reaction are equal and opposite.',
    ARRAY['Forces come in pairs.', 'Always equal.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ec16ae2c-5e1c-55f1-ba09-b54c44679096',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'A net force of 20N acts on a 4kg box. Its acceleration is:',
    '["5 m/s squared", "80 m/s squared", "0.2 m/s squared", "24 m/s squared"]'::jsonb,
    '0'::jsonb,
    'a = F/m = 20/4 = 5 m/s squared.',
    ARRAY['F = ma rearranged.', 'Simple division.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '70bd47a0-36d2-58f7-8ab7-2315396d0d92',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'A car moves at constant velocity. What is the net force on it?',
    '["Greater than zero", "Zero", "Less than zero", "Infinite"]'::jsonb,
    '1'::jsonb,
    'Constant velocity means zero acceleration, so net force is zero.',
    ARRAY['Balanced forces.', 'No acceleration.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '82dda015-45d1-525b-b7ae-63479672d740',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'If force is doubled and mass stays the same, acceleration:',
    '["Halves", "Doubles", "Stays the same", "Quadruples"]'::jsonb,
    '1'::jsonb,
    'a = F/m. If F doubles and m is constant, a doubles.',
    ARRAY['Direct proportionality.', 'F and a are proportional.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8c0caa16-3041-5544-9d37-e166e92cb0ce',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'A 50N force accelerates an object at 10 m/s squared. Its mass is:',
    '["500 kg", "5 kg", "40 kg", "60 kg"]'::jsonb,
    '1'::jsonb,
    'm = F/a = 50/10 = 5 kg.',
    ARRAY['Rearrange F = ma.', 'm = F/a.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f2405c79-34ac-5185-a5ee-5bb5148c62cb',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Friction always acts in the direction that:',
    '["Helps motion", "Opposes motion or intended motion", "Is perpendicular to motion", "Is the same as the applied force"]'::jsonb,
    '1'::jsonb,
    'Friction opposes motion or the tendency to move.',
    ARRAY['Resistance to movement.', 'Always against motion.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e9789263-db62-54fb-817d-158c885f6465',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Why does a ball rolling on grass slow down faster than on a smooth floor?',
    '["Grass is softer", "Grass creates more friction than smooth tiles", "Gravity is stronger on grass", "The ball is heavier on grass"]'::jsonb,
    '1'::jsonb,
    'Rougher surfaces create more friction, slowing the ball faster.',
    ARRAY['Friction depends on surface.', 'Rough = more friction.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dafa2613-9391-5d80-b2c6-36bd1f68067d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'A skydiver falls at constant velocity after opening the parachute. The forces on them are:',
    '["Only gravity", "Gravity and air resistance are balanced", "Only air resistance", "No forces act"]'::jsonb,
    '1'::jsonb,
    'Constant velocity means balanced forces — gravity down equals air resistance up.',
    ARRAY['Terminal velocity.', 'Net force = 0.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc912103-075c-5576-b886-0d763eec783e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'A ball thrown upward at its highest point has:',
    '["Zero force acting on it", "Gravity still acting downward", "No acceleration", "Upward force"]'::jsonb,
    '1'::jsonb,
    'At the highest point, velocity is zero but gravity still acts downward.',
    ARRAY['Force is not zero.', 'Only velocity is zero.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2d245dfc-0c52-5677-9fa0-2547bba42a5f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'fill_in_blank',
    'Explain why you lean forward when a bus suddenly stops.',
    NULL,
    '"inertia"'::jsonb,
    'Your body tends to continue moving forward (inertia) while the bus decelerates.',
    ARRAY['Newton''s First Law.', 'Body resists change.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4bd71f86-6021-5dd4-b50e-7da7f8e7f37c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'fill_in_blank',
    'A 1000 kg car accelerates at 2 m/s squared. What force does the engine produce?',
    NULL,
    '"2000 N"'::jsonb,
    'F = ma = 1000 × 2 = 2000 N.',
    ARRAY['F = ma formula.', 'Multiply mass by acceleration.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ff4e0b98-f05c-5c12-bfcd-6bff64cda423',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Two forces of 5N and 3N act in the same direction on an object. The resultant force is:',
    '["2N", "8N", "15N", "5N"]'::jsonb,
    '1'::jsonb,
    'Forces in the same direction add: 5 + 3 = 8N.',
    ARRAY['Add forces in same direction.', 'Simple addition.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd8e4eb2a-ba2e-5edd-b2c4-01b0d1d322c3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'multiple_choice',
    'Two forces of 10N and 4N act in opposite directions. The resultant is:',
    '["14N", "6N in the direction of the larger force", "40N", "5N"]'::jsonb,
    '1'::jsonb,
    'Opposite forces subtract: 10 - 4 = 6N in the direction of the larger force.',
    ARRAY['Subtract opposite forces.', 'Direction matters.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd28338a3-98e5-54ea-aeeb-c0eb70d43633',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'fill_in_blank',
    'Why does a heavier object need more force to achieve the same acceleration as a lighter one?',
    NULL,
    '"mass"'::jsonb,
    'From F = ma, more mass requires more force for the same acceleration.',
    ARRAY['Direct relationship.', 'More mass = more resistance.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '055c6c7e-6169-553e-ad3a-296a45394ade',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.1'), NULL, 'fill_in_blank',
    'A rocket works by Newton''s Third Law. Explain.',
    NULL,
    '"action-reaction"'::jsonb,
    'Rocket pushes gas down (action); gas pushes rocket up (reaction).',
    ARRAY['Equal and opposite forces.', 'Thrust.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.4.4.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a625e293-636c-59b1-884a-03a5188ee8e5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'A lever is an example of a:',
    '["Complex machine", "Simple machine", "Electrical device", "Chemical compound"]'::jsonb,
    '1'::jsonb,
    'A lever is one of the six simple machines.',
    ARRAY['Makes work easier.', 'Multiplies force.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd7dff728-ebe6-5f83-bc23-ec45219409f5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'The point around which a lever pivots is called the:',
    '["Load", "Effort", "Fulcrum", "Handle"]'::jsonb,
    '2'::jsonb,
    'The fulcrum is the pivot point of a lever.',
    ARRAY['Also called pivot.', 'Support point.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '908026e6-8015-59d9-bdf4-6118bda7c48b',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'An inclined plane is a:',
    '["Ramp", "Wheel", "Lever", "Pulley"]'::jsonb,
    '0'::jsonb,
    'An inclined plane is a sloping surface (ramp).',
    ARRAY['Reduces effort needed.', 'Longer distance.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'da75e2ba-da0a-599f-88ac-3944cbe1ecb4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'A wheel and axle is used in:',
    '["A see-saw", "A door handle", "A ramp", "A wedge"]'::jsonb,
    '1'::jsonb,
    'Door handles, steering wheels, and doorknobs use wheel and axle.',
    ARRAY['Rotating motion.', 'Force multiplication.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5d5e34fc-ee55-58fa-9841-e1e3d6ea4c60',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'fill_in_blank',
    'A pulley changes the ___ of the applied force.',
    NULL,
    '"direction"'::jsonb,
    'A pulley can change the direction of force.',
    ARRAY['Pull down to lift up.', 'Easier direction.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '032f1da2-8969-56ae-9967-086e6536e4e0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'fill_in_blank',
    'A screw is essentially an ___ wrapped around a cylinder.',
    NULL,
    '"inclined plane"'::jsonb,
    'A screw is an inclined plane wrapped around a cylinder.',
    ARRAY['Thread is a ramp.', 'Holds things together.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '13f095e2-a758-51aa-b4c3-cc2b9b08f059',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'In a Class 1 lever, the fulcrum is between:',
    '["Load and fulcrum", "Effort and load", "Effort and fulcrum", "Only the load"]'::jsonb,
    '1'::jsonb,
    'Class 1: fulcrum between effort and load (e.g., see-saw, crowbar).',
    ARRAY['Classic lever type.', 'Fulcrum in middle.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '83b7c24a-d7f9-5bce-b3bd-b5bbb94ddac0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'fill_in_blank',
    'A bottle opener is a Class ___ lever.',
    NULL,
    '"2"'::jsonb,
    'In a Class 2 lever, the load is between the fulcrum and effort (e.g., wheelbarrow, bottle opener).',
    ARRAY['Load in middle.', 'Mechanical advantage > 1.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '353e0560-c9f8-5f6c-b2e3-e440069de469',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'Mechanical advantage is:',
    '["The force applied", "The ratio of load to effort", "The distance moved", "The weight of the machine"]'::jsonb,
    '1'::jsonb,
    'MA = Load / Effort. It shows how much a machine multiplies force.',
    ARRAY['Force multiplication factor.', '> 1 means easier.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c089c683-b435-581a-9ccf-3b09887c1164',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'A lever has a mechanical advantage of 4. If you apply 10N of effort, you can lift:',
    '["4N", "40N", "2.5N", "14N"]'::jsonb,
    '1'::jsonb,
    'Load = MA × Effort = 4 × 10 = 40N.',
    ARRAY['Force multiplication.', 'MA formula.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '001af090-9b6f-55d2-b0bb-e632147cb3b4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'An inclined plane reduces effort by:',
    '["Reducing the load", "Increasing the distance over which force is applied", "Changing gravity", "Adding energy"]'::jsonb,
    '1'::jsonb,
    'A ramp trades distance for force — less effort over a longer path.',
    ARRAY['Same work, less force.', 'Longer distance.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f6e3acdb-bdf9-5932-b62c-bf57084173c6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'A single fixed pulley:',
    '["Multiplies force", "Changes direction of force", "Reduces friction", "Increases load"]'::jsonb,
    '1'::jsonb,
    'A single fixed pulley changes force direction but does not multiply it.',
    ARRAY['Pull down to lift up.', 'MA = 1.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4111daa4-5157-57b1-94ab-edfca66a8324',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'A gear system is an example of a:',
    '["Simple machine only", "Complex machine made of simple machines", "Chemical device", "Electrical machine"]'::jsonb,
    '1'::jsonb,
    'Gears are wheel and axle mechanisms combined into complex machines.',
    ARRAY['Multiple simple machines.', 'Combined mechanisms.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2a8b003c-c167-5407-90d5-be9a2bb416b3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'fill_in_blank',
    'Why is a wheelbarrow a Class 2 lever?',
    NULL,
    '"load between fulcrum and effort"'::jsonb,
    'The wheel (fulcrum) is at one end, effort at the handles, load in the middle.',
    ARRAY['Load in middle position.', 'Always MA > 1.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '52dcb2c7-03a2-5f9a-b350-3c94d6a8cae4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'A crowbar is used to lift a heavy rock. The effort arm is 1.5m and the load arm is 0.3m. What is the MA?',
    '["0.2", "5", "1.8", "4.5"]'::jsonb,
    '1'::jsonb,
    'MA = effort arm / load arm = 1.5 / 0.3 = 5.',
    ARRAY['Lever MA formula.', 'Ratio of arm lengths.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6af18dbf-a5f2-5df0-abb8-351db17d42ec',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'Why does a longer spanner make it easier to loosen a bolt?',
    '["It is lighter", "Longer handle = greater moment (turning effect) for the same force", "The bolt becomes weaker", "Less friction"]'::jsonb,
    '1'::jsonb,
    'Moment = force × distance. Longer distance means more turning effect.',
    ARRAY['Moment formula.', 'Torque.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ddb85de2-ab6a-5353-9589-e90fbcac363d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'fill_in_blank',
    'A compound machine combines simple machines. Give an example.',
    NULL,
    '"bicycle"'::jsonb,
    'A bicycle combines wheel and axle, gears, and levers.',
    ARRAY['Multiple simple machines.', 'Working together.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7d3bad98-fe7f-5000-9f39-9c4e62e0a92c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'fill_in_blank',
    'Explain why a sharp knife cuts better than a blunt one.',
    NULL,
    '"pressure"'::jsonb,
    'A sharp knife has a smaller area, so for the same force, pressure is higher (P = F/A).',
    ARRAY['Pressure = Force / Area.', 'Smaller area = more pressure.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95f616a7-210b-5f16-bf8e-b81785484942',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'A gear with 40 teeth drives a gear with 10 teeth. The gear ratio is:',
    '["4:1", "1:4", "50:1", "1:50"]'::jsonb,
    '0'::jsonb,
    'Gear ratio = driving teeth / driven teeth = 40/10 = 4:1.',
    ARRAY['Speed increases 4 times.', 'Torque decreases.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '37726326-be21-5bb7-901a-05aa33442a49',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.4.2'), NULL, 'multiple_choice',
    'Why do construction workers use an inclined plane (ramp) to load heavy items onto trucks?',
    '["It is traditional", "It requires less force than lifting straight up, even though the distance is longer", "It uses less energy", "The truck is too high"]'::jsonb,
    '1'::jsonb,
    'A ramp reduces the force needed by increasing the distance — same work, less effort.',
    ARRAY['Trade-off: force vs distance.', 'Mechanical advantage.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.4.5.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5fd8bbe-1017-52b0-be50-6560c3cafd35',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'A cutlass is used in farming for:',
    '["Digging", "Cutting grass and weeds", "Watering plants", "Measuring soil"]'::jsonb,
    '1'::jsonb,
    'Cutlass is used for slashing grass, weeds, and harvesting.',
    ARRAY['Common farming tool.', 'Sharp blade.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9aa9816f-8290-5f32-bdb7-583cc4f0386e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'A hoe is primarily used for:',
    '["Cutting trees", "Digging and weeding", "Spraying chemicals", "Watering crops"]'::jsonb,
    '1'::jsonb,
    'A hoe is used for digging, weeding, and making ridges.',
    ARRAY['Blade on a handle.', 'Soil preparation.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e008390c-ffa2-5819-a5f6-6a1abf2286e0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'Why should farming tools be cleaned after use?',
    '["To make them shiny", "To prevent rust and extend their lifespan", "To make them lighter", "To change their colour"]'::jsonb,
    '1'::jsonb,
    'Cleaning removes moisture and dirt that cause rust and corrosion.',
    ARRAY['Maintenance practice.', 'Lasts longer.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8ab0a07b-4d08-58a1-8916-53fbdcfd1066',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'fill_in_blank',
    'Storing tools in a ___ place helps prevent rust.',
    NULL,
    '"dry"'::jsonb,
    'Dry storage prevents moisture from causing rust on metal tools.',
    ARRAY['Moisture causes rust.', 'Keep tools dry.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f32cad42-b883-512b-9b35-6d5a253ab238',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'A watering can is used to:',
    '["Dig soil", "Apply water to plants", "Cut grass", "Measure nutrients"]'::jsonb,
    '1'::jsonb,
    'Watering cans are used for irrigating plants.',
    ARRAY['Controlled water application.', 'Garden tool.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a9a97f9f-e8af-5903-b4de-b53bae88e5ee',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'Oil or grease is applied to metal parts of tools to:',
    '["Make them heavier", "Prevent rust and reduce friction", "Change their colour", "Make them sharper"]'::jsonb,
    '1'::jsonb,
    'Oil creates a barrier against moisture and reduces friction on moving parts.',
    ARRAY['Rust prevention.', 'Lubrication.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '25028f91-2131-528f-b656-e15c41882584',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'Why should the blade of a cutlass be kept sharp?',
    '["To look good", "A sharp blade cuts more efficiently with less effort", "To make it heavier", "To prevent rust"]'::jsonb,
    '1'::jsonb,
    'Sharp blades require less force and cut cleaner, reducing damage to plants.',
    ARRAY['Efficiency and safety.', 'Less effort needed.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b082592f-d268-553e-beb2-6253817d7c1e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'A rake is used for:',
    '["Digging", "Levelling soil and gathering debris", "Cutting", "Watering"]'::jsonb,
    '1'::jsonb,
    'Rakes are used for levelling soil, gathering leaves, and clearing debris.',
    ARRAY['Teeth for gathering.', 'Garden tool.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2cf49bd7-77cb-5717-add8-60a7ba52c623',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'Why should wooden handles on tools be checked for cracks?',
    '["For appearance", "Cracked handles can break during use, causing injury", "To paint them", "To make them lighter"]'::jsonb,
    '1'::jsonb,
    'Cracked handles are weak and may snap, leading to accidents.',
    ARRAY['Safety check.', 'Replace if damaged.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e39d6bda-f08d-54bb-a087-c0160f3734f2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'A wheelbarrow makes transporting loads easier because:',
    '["It reduces the weight", "The wheel reduces friction and the lever principle helps lift", "It increases the load", "It makes the ground smoother"]'::jsonb,
    '1'::jsonb,
    'The wheel reduces friction and the handles act as lever arms.',
    ARRAY['Wheel + lever.', 'Less effort needed.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '488e7b58-4a5b-56ed-aa6a-42a71234e464',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'fill_in_blank',
    'Name two tools used for soil preparation in farming.',
    NULL,
    '"hoe and rake"'::jsonb,
    'Hoes, rakes, and forks are used for soil preparation.',
    ARRAY['Digging and levelling.', 'Before planting.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '317a9e77-707f-5a74-8521-2ba086efb9f8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'Why is it important to wear protective gloves when handling tools?',
    '["To look professional", "To prevent blisters, cuts, and splinters", "To grip worse", "To keep hands dirty"]'::jsonb,
    '1'::jsonb,
    'Gloves protect hands from injuries during tool use.',
    ARRAY['Safety equipment.', 'Hand protection.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '24518080-5f00-5bbc-91d6-af64d690f219',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'A sprayer is used in farming to:',
    '["Water crops", "Apply pesticides or herbicides evenly", "Dig holes", "Harvest crops"]'::jsonb,
    '1'::jsonb,
    'Sprayers apply liquid chemicals (pesticides, herbicides) in a fine mist.',
    ARRAY['Even application.', 'Chemical application tool.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3ecbf0e9-d5b3-5415-b39c-cf2389968b05',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'fill_in_blank',
    'Why should chemicals like pesticides be stored separately from food and farming tools?',
    NULL,
    '"contamination"'::jsonb,
    'Chemicals can contaminate food and tools, posing health risks.',
    ARRAY['Safety storage.', 'Prevent poisoning.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cdd9604a-02f9-5241-a1c7-b1b74f1792f2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'A farmer uses the same cutlass for harvesting and for clearing weeds near food crops. What risk does this pose?',
    '["No risk", "Chemical residue from weeds may contaminate food crops", "The cutlass gets duller", "It takes more time"]'::jsonb,
    '1'::jsonb,
    'Using the same tool for different tasks can spread contaminants or diseases.',
    ARRAY['Cross-contamination risk.', 'Clean between uses.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '04d06e30-5cba-5a1b-8e8b-4f441676aae9',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'fill_in_blank',
    'Explain how the design of a hoe makes it an effective farming tool.',
    NULL,
    '"lever and wedge"'::jsonb,
    'The hoe combines a lever (handle) and wedge (blade) to multiply force for digging and cutting.',
    ARRAY['Simple machine combination.', 'Efficient design.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1187aa9e-8265-5936-b589-082e6df412af',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'Why are some farming tool handles made longer than others?',
    '["For decoration", "Longer handles provide more leverage and allow working while standing upright", "To be heavier", "To cost more"]'::jsonb,
    '1'::jsonb,
    'Longer handles increase the moment arm, reducing the force needed.',
    ARRAY['Ergonomic design.', 'Less bending.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6d23c6d4-4438-589e-b836-73255c336b1f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'A farmer notices rust on their tools. What should they do?',
    '["Ignore it", "Remove rust with sandpaper, apply oil, and store in a dry place", "Throw the tools away", "Use more water"]'::jsonb,
    '1'::jsonb,
    'Rust can be removed, and tools can be protected with oil and dry storage.',
    ARRAY['Maintenance.', 'Extends tool life.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'eb187f19-8cfe-52af-82b6-a41514e84bc8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'What is the advantage of using a wheelbarrow over carrying loads by hand?',
    '["It is faster only", "It distributes the load and reduces the effort needed using the wheel and lever principle", "It holds more only", "It looks better"]'::jsonb,
    '1'::jsonb,
    'The wheel reduces friction; the lever principle reduces lifting effort.',
    ARRAY['Mechanical advantage.', 'Practical design.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9951a7e6-cc6e-5de8-a640-0ca6e844bbf4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.4.5.1'), NULL, 'multiple_choice',
    'Why should a sprayer be calibrated before use?',
    '["To look professional", "To ensure the correct amount of chemical is applied \u2014 too much wastes money and harms the environment", "To make it spray faster", "To change its colour"]'::jsonb,
    '1'::jsonb,
    'Calibration ensures proper application rate — over-spraying wastes chemicals and pollutes.',
    ARRAY['Correct dosage.', 'Environmental protection.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.5.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c92e57bf-dc6e-5443-ad79-4873fbc11005',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'Waste that can decompose naturally is called:',
    '["Inorganic waste", "Organic waste", "Hazardous waste", "Nuclear waste"]'::jsonb,
    '1'::jsonb,
    'Organic waste (food scraps, plant matter) decomposes naturally.',
    ARRAY['Biodegradable.', 'Comes from living things.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c211afa4-cd13-5809-85b3-33d2f52c0253',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'Examples of inorganic waste include:',
    '["Food scraps", "Plastic bottles and glass", "Leaves", "Animal bones"]'::jsonb,
    '1'::jsonb,
    'Plastic, glass, and metal are inorganic waste that does not decompose easily.',
    ARRAY['Non-biodegradable.', 'Persists in environment.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5715b69-7ff2-5ba8-a9e7-ae55dd09d10e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'Burning waste in the open is called:',
    '["Composting", "Open burning or incineration", "Recycling", "Landfill"]'::jsonb,
    '1'::jsonb,
    'Open burning releases harmful gases into the air.',
    ARRAY['Air pollution.', 'Not recommended.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9086c746-b76f-547e-8c26-736b20feabcf',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'The 3 Rs of waste management are:',
    '["Reduce, Reuse, Recycle", "Remove, Replace, Repair", "Run, Rest, Relax", "Read, Write, Remember"]'::jsonb,
    '0'::jsonb,
    'The 3 Rs: Reduce waste, Reuse items, Recycle materials.',
    ARRAY['Waste hierarchy.', 'Most sustainable approach.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e7aaf1cf-e732-5ab3-907a-f80d4737e19e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'Composting converts organic waste into:',
    '["Plastic", "Manure or fertiliser", "Glass", "Metal"]'::jsonb,
    '1'::jsonb,
    'Composting decomposes organic waste into nutrient-rich manure.',
    ARRAY['Natural process.', 'Soil amendment.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cffd1f2e-8441-52d8-acf1-7e82fbcb8b32',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'A landfill is:',
    '["A recycling plant", "A site where waste is buried in the ground", "A composting facility", "A waste-to-energy plant"]'::jsonb,
    '1'::jsonb,
    'Landfills are engineered sites for waste disposal.',
    ARRAY['Controlled burial.', 'Last resort.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '986cfbd9-9eea-5d3c-ae21-7a059116e7c5',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'Why is it important to separate waste into biodegradable and non-biodegradable?',
    '["It looks cleaner", "Different types need different disposal methods", "It is a law", "To make waste heavier"]'::jsonb,
    '1'::jsonb,
    'Biodegradable waste can be composted; non-biodegradable needs recycling or proper disposal.',
    ARRAY['Different treatment.', 'Waste sorting.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bff3b8ae-e7a2-5c55-95e8-7762d808ef3f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'Recycling plastic reduces pollution because:',
    '["Plastic is valuable", "It reduces the amount of new plastic produced and waste in the environment", "It makes new plastic cheaper", "Plastic does not decompose"]'::jsonb,
    '1'::jsonb,
    'Recycling reuses material, reducing production and disposal impacts.',
    ARRAY['Resource conservation.', 'Less pollution.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3b4a5757-906e-5647-87f5-9c1c3cda440e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'Why is open dumping of waste harmful?',
    '["It looks ugly only", "It contaminates water, attracts pests, and breeds disease vectors", "It is illegal only", "It wastes land only"]'::jsonb,
    '1'::jsonb,
    'Open dumping pollutes water, attracts rodents and flies, and spreads disease.',
    ARRAY['Health hazard.', 'Environmental damage.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '20d1da18-e309-5a56-be09-9af0a386c13d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'fill_in_blank',
    'Name one way to reduce household waste.',
    NULL,
    '"buy less"'::jsonb,
    'Buying less, using reusable bags, and avoiding single-use plastics reduce waste.',
    ARRAY['Prevention is best.', 'Source reduction.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '142dafd3-92f0-58ed-b458-94ea6b434177',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'Glass can be recycled by:',
    '["Burying it", "Melting and reforming into new products", "Burning it", "Throwing it in water"]'::jsonb,
    '1'::jsonb,
    'Glass is melted and reformed into new glass products endlessly.',
    ARRAY['100% recyclable.', 'No quality loss.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5f8aa04-a697-5ffe-8f57-b3447954d24d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'Why are plastic bags a major environmental problem in Ghana?',
    '["They are expensive", "They do not decompose, block drains, and cause flooding", "They are biodegradable", "They are useful"]'::jsonb,
    '1'::jsonb,
    'Plastic bags persist for hundreds of years, clogging drains and causing floods.',
    ARRAY['Non-biodegradable.', 'Drainage blockage.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dea120e2-89c8-5142-957c-8a215b3a3dab',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'fill_in_blank',
    'A community has no waste collection service. Suggest a sustainable waste management approach.',
    NULL,
    '"composting and recycling"'::jsonb,
    'Community composting for organic waste, recycling collection points for inorganic waste, and education.',
    ARRAY['Community-based solutions.', 'Multiple approaches.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd6922bdf-37ad-5645-a89c-cb3d37d3b892',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'fill_in_blank',
    'Why is it better to reduce waste than to recycle?',
    NULL,
    '"prevention"'::jsonb,
    'Reducing waste at the source prevents waste creation entirely, which is more efficient than recycling.',
    ARRAY['Most sustainable R.', 'Prevention > cure.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8299d1bc-39cb-556d-931c-e42a9ee59f79',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'How does improper waste disposal affect water bodies like rivers in Ghana?',
    '["No effect", "Contaminates water with chemicals and pathogens, killing aquatic life and making water unsafe", "Makes water taste better", "Increases fish population"]'::jsonb,
    '1'::jsonb,
    'Waste in rivers causes eutrophication, toxic contamination, and health hazards.',
    ARRAY['Water pollution.', 'Health risks.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0df63683-3d20-5026-b932-4526ca907f06',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'A factory produces toxic waste. What should they do with it?',
    '["Dump it in the river", "Treat it to neutralise toxins before disposal", "Burn it openly", "Bury it in the garden"]'::jsonb,
    '1'::jsonb,
    'Toxic waste must be treated or neutralised before safe disposal.',
    ARRAY['Environmental regulations.', 'Safety first.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a58fd5ec-b71c-5e6f-8248-e52a12e773ed',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'fill_in_blank',
    'Explain why biogas production is a good waste management strategy for rural Ghana.',
    NULL,
    '"energy from waste"'::jsonb,
    'Biogas converts animal and human waste into cooking gas and fertiliser, solving waste and energy problems.',
    ARRAY['Dual benefit.', 'Renewable energy.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '040e19dd-02df-5152-a62f-adf6c6b4b328',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'multiple_choice',
    'What happens to electronic waste (e-waste) if not disposed of properly?',
    '["Nothing", "Toxic chemicals leach into soil and water, harming health", "It decomposes safely", "It becomes useful"]'::jsonb,
    '1'::jsonb,
    'E-waste contains heavy metals (lead, mercury) that contaminate soil and water.',
    ARRAY['Hazardous materials.', 'Special disposal needed.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2463c97d-0943-5a9e-9194-eb7c54eff7f7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'fill_in_blank',
    'Why is waste segregation at source important for effective recycling?',
    NULL,
    '"contamination"'::jsonb,
    'Mixed waste is harder to recycle; segregation at source keeps materials clean and recyclable.',
    ARRAY['Clean streams.', 'Higher recycling rates.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '819d50e6-176e-5d42-be8b-ff3e5f54b0ab',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.1.1'), NULL, 'fill_in_blank',
    'Suggest two ways a school in Ghana can reduce its waste output.',
    NULL,
    '"reusable containers"'::jsonb,
    'Use reusable containers, compost food waste, reduce paper use, and set up recycling bins.',
    ARRAY['Practical solutions.', 'School-level action.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.5.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bb542e16-2615-5fd0-a21f-3a36661f3fcb',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Kwashiorkor is caused by deficiency of:',
    '["Vitamins", "Protein", "Carbohydrates", "Fats"]'::jsonb,
    '1'::jsonb,
    'Kwashiorkor results from protein deficiency.',
    ARRAY['Common in children.', 'Swollen belly.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f90c96da-da32-5bc5-9e80-ab7daff3e687',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Marasmus is caused by:',
    '["Excess protein", "Overall calorie/energy deficiency", "Vitamin deficiency", "Mineral deficiency"]'::jsonb,
    '1'::jsonb,
    'Marasmus results from severe overall calorie deficiency.',
    ARRAY['Extreme wasting.', 'Severe malnutrition.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '25f6479b-57ee-536a-8f84-581e3e558d9e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Scurvy is caused by deficiency of:',
    '["Vitamin A", "Vitamin B", "Vitamin C", "Vitamin D"]'::jsonb,
    '2'::jsonb,
    'Vitamin C deficiency causes scurvy.',
    ARRAY['Bleeding gums.', 'Eat citrus fruits.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3271dbfa-71fe-5d08-aafe-6405a588cd38',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Rickets (soft bones) is caused by deficiency of:',
    '["Iron", "Vitamin A", "Vitamin D and calcium", "Protein"]'::jsonb,
    '2'::jsonb,
    'Vitamin D and calcium deficiency causes rickets.',
    ARRAY['Bone deformity.', 'Sunlight helps.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7d113c01-0694-54af-8616-66e6e3cd6c40',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Anaemia (low red blood cells) is caused by deficiency of:',
    '["Protein", "Vitamin C", "Iron", "Calcium"]'::jsonb,
    '2'::jsonb,
    'Iron deficiency causes anaemia.',
    ARRAY['Tiredness, pallor.', 'Iron-rich foods.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2fc760d8-75f7-535a-a56d-1f74c465b387',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'fill_in_blank',
    'Carbohydrates provide ___ energy than fats per gram.',
    NULL,
    '"less"'::jsonb,
    'Carbohydrates provide 4 kcal/g vs fats at 9 kcal/g.',
    ARRAY['Less concentrated energy.', 'But more readily available.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '42ed8ea1-a481-5d18-8d50-cefc52499ebe',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'A child with dry eyes and frequent infections may be deficient in:',
    '["Vitamin C", "Vitamin A", "Iron", "Protein"]'::jsonb,
    '1'::jsonb,
    'Vitamin A deficiency affects vision and immune function.',
    ARRAY['Night blindness.', 'Carrots, liver.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3064f38c-be29-5ee9-8d02-7e35807d4d2d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Goitre (swollen thyroid) is caused by deficiency of:',
    '["Iron", "Vitamin C", "Iodine", "Calcium"]'::jsonb,
    '2'::jsonb,
    'Iodine deficiency causes goitre.',
    ARRAY['Swollen neck.', 'Iodised salt prevents it.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a92c514e-3262-55ea-85b0-8a351a59e055',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Why is protein essential for children?',
    '["Only for energy", "For growth, tissue repair, and immune function", "Only for brain development", "Only for bones"]'::jsonb,
    '1'::jsonb,
    'Protein is needed for growth, repair, and making antibodies.',
    ARRAY['Building blocks.', 'Essential for development.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b191a9a5-111b-5f44-948a-3291540e967f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Which nutrient is the body''s main and quickest source of energy?',
    '["Fats", "Proteins", "Carbohydrates", "Vitamins"]'::jsonb,
    '2'::jsonb,
    'Carbohydrates are the preferred energy source.',
    ARRAY['Glucose from carbs.', 'Brain fuel.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '34754181-24e0-5754-951d-72a5982a334e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'fill_in_blank',
    'Name one good source of iron in the Ghanaian diet.',
    NULL,
    '"liver"'::jsonb,
    'Liver, red meat, beans, dark leafy vegetables, and palm oil are iron-rich.',
    ARRAY['Animal and plant sources.', 'Prevents anaemia.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3949ed63-6f8c-5e25-b95a-b3f521e626c3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Why do pregnant women need more iron and folic acid?',
    '["For energy", "For increased blood production and to prevent birth defects", "For bone strength", "For weight gain"]'::jsonb,
    '1'::jsonb,
    'Pregnancy requires more blood and folate prevents neural tube defects.',
    ARRAY['Increased demands.', 'Baby development.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c2286ede-1453-5813-a006-4b3d7f7f88c6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'A diet of only cassava and maize may lead to:',
    '["Obesity", "Protein and micronutrient deficiencies", "Too much energy", "No health problems"]'::jsonb,
    '1'::jsonb,
    'Staple crops alone lack protein and essential vitamins/minerals.',
    ARRAY['Need dietary diversity.', 'Complementary foods.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a5b7987c-e3ca-5601-8544-217c8d69c700',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'fill_in_blank',
    'Why is exclusive breastfeeding recommended for the first 6 months?',
    NULL,
    '"complete nutrition"'::jsonb,
    'Breast milk provides complete nutrition and antibodies for the first 6 months.',
    ARRAY['All nutrients needed.', 'Immune protection.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9b625885-d422-52ea-8438-34408a54f82e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'fill_in_blank',
    'A student eats plenty of rice but little protein. What deficiency symptoms might appear?',
    NULL,
    '"kwashiorkor"'::jsonb,
    'Swollen belly, thin limbs, discoloured hair, skin sores — signs of kwashiorkor.',
    ARRAY['Protein deficiency.', 'Classic symptoms.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3ffe2553-c4d6-58ce-8f5f-281f23c84e78',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Why is vitamin A important beyond preventing night blindness?',
    '["Only for eyes", "It supports immune function, skin health, and growth", "Only for bones", "Only for blood"]'::jsonb,
    '1'::jsonb,
    'Vitamin A supports immunity, skin, growth, and reproduction.',
    ARRAY['Multiple roles.', 'Beyond vision.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '867d0d37-66c7-539e-8048-ad6c7ea0a172',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'multiple_choice',
    'Compare marasmus and kwashiorkor.',
    '["They are the same", "Marasmus is overall calorie deficiency; kwashiorkor is protein deficiency", "Kwashiorkor is more severe", "Marasmus only affects adults"]'::jsonb,
    '1'::jsonb,
    'Marasmus: severe calorie deficit, wasting. Kwashiorkor: protein deficit, oedema.',
    ARRAY['Different causes.', 'Both are malnutrition.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'af7e1f7c-8960-5cdf-8aad-3c328df9950e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'fill_in_blank',
    'How can the Ghanaian diet be improved to prevent deficiency diseases?',
    NULL,
    '"diversification"'::jsonb,
    'Eat a variety of foods: proteins (fish, beans), fruits, vegetables, and fortified foods.',
    ARRAY['Dietary diversity.', 'Complementary foods.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e05993e3-4eba-54ae-89a6-a9b0554336ee',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'fill_in_blank',
    'Why is iodised salt recommended for preventing goitre?',
    NULL,
    '"iodine"'::jsonb,
    'Iodised salt provides iodine, which the thyroid needs to produce hormones.',
    ARRAY['Simple prevention.', 'Essential mineral.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f4bc7d6b-8b8c-58af-8cee-698bec6b0056',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.1'), NULL, 'fill_in_blank',
    'A child in rural Ghana has stunted growth and frequent illnesses. What nutritional intervention would you suggest?',
    NULL,
    '"balanced diet"'::jsonb,
    'Provide protein-rich foods (eggs, fish, beans), vitamin A-rich foods (mangoes, carrots), and deworming.',
    ARRAY['Multiple deficiencies likely.', 'Holistic approach.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.5.2.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3b8e9f22-c8c1-587b-b499-c82a9d8d95be',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'HIV stands for:',
    '["Human Infectious Virus", "Human Immunodeficiency Virus", "Highly Infectious Virus", "Hepatitis Infectious Virus"]'::jsonb,
    '1'::jsonb,
    'HIV = Human Immunodeficiency Virus.',
    ARRAY['Attacks immune system.', 'AIDS is the final stage.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '106555d6-f89b-5ac3-8fa6-c80507354454',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'HIV attacks the body''s:',
    '["Nervous system", "Digestive system", "Immune system", "Skeletal system"]'::jsonb,
    '2'::jsonb,
    'HIV targets CD4 cells in the immune system.',
    ARRAY['Weakens immunity.', 'Opportunistic infections.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9d71184d-7746-5174-a771-c47e986d09f8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'The common cold is caused by:',
    '["Bacteria", "Virus", "Fungus", "Parasite"]'::jsonb,
    '1'::jsonb,
    'The common cold is caused by rhinoviruses.',
    ARRAY['Very common.', 'Self-limiting.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6a675531-5940-59b3-8fc3-3e5967f95dc2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'Influenza (flu) is caused by a:',
    '["Bacterium", "Virus", "Fungus", "Protozoan"]'::jsonb,
    '1'::jsonb,
    'Influenza is caused by the influenza virus.',
    ARRAY['Respiratory illness.', 'Seasonal epidemics.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'edb415b7-1b6c-5fcd-8fe7-f1f3cad05764',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'Antibiotics are effective against:',
    '["Viruses", "Bacteria", "Both viruses and bacteria", "Neither"]'::jsonb,
    '1'::jsonb,
    'Antibiotics only work against bacteria, not viruses.',
    ARRAY['Common misconception.', 'Viral diseases need other treatments.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '39c870d3-2bfb-56a9-bba1-46c8136258ce',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'HIV is transmitted through:',
    '["Casual contact", "Blood, unprotected sex, and mother to child", "Air", "Water"]'::jsonb,
    '1'::jsonb,
    'HIV spreads through body fluids: blood, semen, vaginal fluid, breast milk.',
    ARRAY['Not casual contact.', 'Preventable transmission.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '157d2730-4f1a-5e78-83bf-7e2f73234b16',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'AIDS stands for:',
    '["Acquired Immune Deficiency Syndrome", "Auto Immune Disease Syndrome", "Acquired Infectious Disease System", "Active Immune Defence System"]'::jsonb,
    '0'::jsonb,
    'AIDS = Acquired Immune Deficiency Syndrome.',
    ARRAY['Final stage of HIV.', 'Severe immune damage.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e1d5f093-2b19-51d5-81a9-d23b2bcc5ee4',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'Why can''t antibiotics treat viral diseases?',
    '["Viruses are too small", "Viruses use host cells to reproduce, so drugs that kill viruses would also harm cells", "Antibiotics are too weak", "Viruses do not cause disease"]'::jsonb,
    '1'::jsonb,
    'Viruses replicate inside host cells, making them hard to target without harming cells.',
    ARRAY['Different mechanism.', 'No cell wall to attack.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '67ac3344-680d-5674-a7b8-d708ccbd5ee2',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'How can HIV transmission from mother to child be prevented?',
    '["Impossible", "Antiretroviral therapy during pregnancy and avoiding breastfeeding", "Only vaccination", "Only by caesarean section"]'::jsonb,
    '1'::jsonb,
    'Antiretroviral drugs during pregnancy significantly reduce mother-to-child transmission.',
    ARRAY['Medical intervention.', 'Proven prevention.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4e5d3506-4fa6-5c9e-9ffc-577cce656a0f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'The best way to prevent viral diseases is:',
    '["Taking antibiotics", "Vaccination and hygiene", "Eating more food", "Drinking clean water only"]'::jsonb,
    '1'::jsonb,
    'Vaccination stimulates immunity; hygiene reduces exposure.',
    ARRAY['Prevention is key.', 'Immune system support.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '633e9032-d2ef-5585-8aeb-e15c1aaf332a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'Ebola is a viral disease that spreads through:',
    '["Air", "Direct contact with infected body fluids", "Water", "Mosquito bites"]'::jsonb,
    '1'::jsonb,
    'Ebola spreads through direct contact with blood and body fluids of infected persons.',
    ARRAY['Highly dangerous.', 'Contact transmission.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2fe90701-fe95-5df7-bc06-8739748dde58',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'Why is HIV testing important?',
    '["For government records", "Early detection allows treatment with antiretroviral drugs, improving quality of life", "To quarantine people", "It is not important"]'::jsonb,
    '1'::jsonb,
    'Early HIV detection enables antiretroviral therapy, preventing AIDS.',
    ARRAY['Treatment available.', 'Early is better.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dd5defd4-1e03-5d90-839a-7402761650f7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'A person with HIV can live a healthy life if they:',
    '["Avoid all people", "Take antiretroviral drugs consistently", "Only eat healthy food", "Exercise only"]'::jsonb,
    '1'::jsonb,
    'Consistent antiretroviral therapy suppresses the virus to undetectable levels.',
    ARRAY['Lifelong treatment.', 'U=U (Undetectable = Untransmittable).'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '473476e0-c10f-55d2-bd20-abdf751a6b18',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'fill_in_blank',
    'Why do new viruses like COVID-19 emerge?',
    NULL,
    '"mutation"'::jsonb,
    'Viruses mutate as they spread between species and adapt to new hosts.',
    ARRAY['Genetic changes.', 'Zoonotic transmission.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '436495f1-77d6-5523-be19-87fee5095e2a',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'fill_in_blank',
    'Explain why vaccination is more effective than treatment for controlling viral diseases.',
    NULL,
    '"prevention"'::jsonb,
    'Vaccination prevents infection before it starts, reducing spread; treatment only helps after infection.',
    ARRAY['Prevention > cure.', 'Herd immunity.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0f794eb9-8ef9-59dc-89c3-d79b7023ae72',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'Why is stigma harmful in the fight against HIV/AIDS?',
    '["It is not harmful", "Stigma prevents people from getting tested and treated, spreading the disease further", "It helps control the disease", "Only government stigma matters"]'::jsonb,
    '1'::jsonb,
    'Stigma discourages testing and treatment, increasing transmission.',
    ARRAY['Social barrier.', 'Public health obstacle.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f0f34dc4-1467-5572-b9ec-f4fca6b30162',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'fill_in_blank',
    'How does the body fight a viral infection?',
    NULL,
    '"immune response"'::jsonb,
    'The immune system produces antibodies that neutralise the virus and T-cells that destroy infected cells.',
    ARRAY['Adaptive immunity.', 'Memory cells for future protection.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4644c094-3299-517e-bb09-e1fdb6bd8914',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'multiple_choice',
    'A student says "I can get HIV from sharing a meal with an HIV-positive person." Is this correct?',
    '["Yes, it is possible", "No, HIV is NOT transmitted through casual contact like sharing food", "Only if they have a cut", "Only through water"]'::jsonb,
    '1'::jsonb,
    'HIV is NOT spread through casual contact, food, water, or air.',
    ARRAY['Facts vs myths.', 'Education important.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a12ba9b7-424d-5c47-b44b-4a3e64d3c197',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'fill_in_blank',
    'Why are viral diseases harder to treat than bacterial diseases?',
    NULL,
    '"host cell dependency"'::jsonb,
    'Viruses use host cell machinery to replicate, making it hard to attack the virus without harming cells.',
    ARRAY['Different biology.', 'Antibiotics don''t work.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2eff6a90-fe80-570c-8c4f-e9788b909064',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.2.2'), NULL, 'fill_in_blank',
    'List two ways to prevent the spread of respiratory viruses like influenza.',
    NULL,
    '"handwashing"'::jsonb,
    'Handwashing, covering coughs, vaccination, and avoiding close contact with sick people.',
    ARRAY['Hygiene measures.', 'Multiple strategies.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.5.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4cfb09e1-2c62-514f-a74e-08b8a68a996c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'A scientist who studies living organisms is a:',
    '["Physicist", "Biologist", "Chemist", "Geologist"]'::jsonb,
    '1'::jsonb,
    'Biologists study living things.',
    ARRAY['Plants, animals, microorganisms.', 'Life sciences.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2201db2e-f5dd-5931-9b1d-32a7ebdc0dce',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'An engineer who designs buildings is a:',
    '["Mechanical engineer", "Civil engineer", "Electrical engineer", "Chemical engineer"]'::jsonb,
    '1'::jsonb,
    'Civil engineers design and build structures like buildings and bridges.',
    ARRAY['Construction.', 'Infrastructure.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '098ed84f-7a58-5de0-b39f-15bbf7272c62',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'A doctor who specialises in treating children is a:',
    '["Surgeon", "Paediatrician", "Cardiologist", "Dermatologist"]'::jsonb,
    '1'::jsonb,
    'A paediatrician treats children.',
    ARRAY['Child health.', 'Medical speciality.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1ede45cb-b24f-56a5-8aa1-b72d8ffa4c16',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'A person who studies rocks and minerals is a:',
    '["Biologist", "Physicist", "Geologist", "Astronomer"]'::jsonb,
    '2'::jsonb,
    'Geologists study Earth''s rocks, minerals, and structure.',
    ARRAY['Earth sciences.', 'Mining, oil exploration.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '623845f8-c70a-5720-8deb-9a00350e4286',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'A pharmacist:',
    '["Performs surgery", "Prepares and dispenses medicines", "Builds houses", "Teaches science"]'::jsonb,
    '1'::jsonb,
    'Pharmacists prepare, dispense, and advise on medicines.',
    ARRAY['Drug experts.', 'Healthcare profession.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a17f536d-834f-5426-b7d9-171811489299',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'Agricultural scientists help farmers by:',
    '["Building roads", "Developing better crop varieties and farming methods", "Making clothes", "Designing computers"]'::jsonb,
    '1'::jsonb,
    'Agricultural scientists improve farming through research.',
    ARRAY['Crop improvement.', 'Pest management.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '085c661b-ad47-5574-b21d-bd0357d5b7dd',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'Why is science education important for national development?',
    '["It is not important", "It produces skilled professionals who solve problems and drive innovation", "Only for personal benefit", "Only for rich countries"]'::jsonb,
    '1'::jsonb,
    'Science education creates professionals who contribute to healthcare, industry, and technology.',
    ARRAY['Development drivers.', 'Problem solvers.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b8ac1201-4b37-5fc7-8a94-6b1a8e472f8c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'An IT professional works with:',
    '["Plants", "Computers and software", "Animals", "Rocks"]'::jsonb,
    '1'::jsonb,
    'IT professionals work with computers, networks, and software.',
    ARRAY['Technology sector.', 'Growing field.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6906c891-9470-5932-b509-7e921e744043',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'A meteorologist studies:',
    '["Animals", "Weather and climate", "Plants", "Rocks"]'::jsonb,
    '1'::jsonb,
    'Meteorologists study weather patterns and climate.',
    ARRAY['Weather forecasting.', 'Climate science.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '031f103e-a93a-59ad-adfb-e74b8e30fa2e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'Why do Ghana and other developing countries need more scientists?',
    '["They do not need scientists", "To solve local problems in health, agriculture, and technology", "Only for university jobs", "Only for international companies"]'::jsonb,
    '1'::jsonb,
    'Scientists address local challenges: diseases, food security, infrastructure.',
    ARRAY['Local solutions.', 'National development.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9c1724ab-693d-55f1-a58b-dd558d94640d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'A laboratory technician:',
    '["Teaches students", "Conducts experiments and analyses samples under supervision", "Builds roads", "Farms land"]'::jsonb,
    '1'::jsonb,
    'Lab technicians support scientists by conducting tests and maintaining equipment.',
    ARRAY['Supporting role.', 'Essential for research.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '94a6dfd5-f6e1-5098-a07c-15936d872066',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'Which career combines science with protecting the environment?',
    '["Accountant", "Environmental scientist", "Lawyer", "Chef"]'::jsonb,
    '1'::jsonb,
    'Environmental scientists study and protect the natural environment.',
    ARRAY['Conservation.', 'Pollution control.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f931e2de-9356-5b73-9c20-885c786a3c40',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'fill_in_blank',
    'How can science careers improve healthcare in Ghana?',
    NULL,
    '"research and treatment"'::jsonb,
    'Scientists develop treatments, diagnostic tools, and public health strategies.',
    ARRAY['Medical research.', 'Disease prevention.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5bf690cd-973a-59f5-bc47-cafd0639c365',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'fill_in_blank',
    'A student is interested in both maths and biology. Suggest two careers they could pursue.',
    NULL,
    '"biostatistician"'::jsonb,
    'Biostatistics, bioinformatics, epidemiology, or biomedical engineering.',
    ARRAY['Interdisciplinary careers.', 'Combine interests.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3cd08d9e-63d4-5599-b2a9-7c608abe8b31',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'fill_in_blank',
    'Why is it important for Ghana to invest in local pharmaceutical research?',
    NULL,
    '"self-sufficiency"'::jsonb,
    'Local research reduces dependence on imported medicines and addresses local health needs.',
    ARRAY['Drug development.', 'Affordable healthcare.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '14fc0a58-2894-50a9-af82-5c5c6c6d7803',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'How does science contribute to food security in Ghana?',
    '["It does not", "Through improved crop varieties, pest control, and sustainable farming", "Only through importing food", "Only through fishing"]'::jsonb,
    '1'::jsonb,
    'Agricultural science develops drought-resistant crops, better fertilisers, and pest management.',
    ARRAY['Crop science.', 'Food production.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'de319280-df96-5a7d-b7c6-6c4522010439',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'Why should girls be encouraged to pursue science careers?',
    '["Only boys can do science", "Girls are equally capable and diverse perspectives improve scientific outcomes", "Science is only for men", "Girls should focus on arts"]'::jsonb,
    '1'::jsonb,
    'Gender diversity in science leads to better research and innovation.',
    ARRAY['Equal opportunity.', 'Better outcomes.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '771b4e8d-b9c0-5ffa-a167-0c212f89701e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'multiple_choice',
    'A country with few scientists may face challenges in:',
    '["Entertainment only", "Healthcare, technology, agriculture, and industry", "Sports only", "Music only"]'::jsonb,
    '1'::jsonb,
    'Lack of scientists limits progress in all sectors requiring research and innovation.',
    ARRAY['Development gap.', 'Brain drain.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9daf8857-bc0d-56e5-afcf-9cdaaea8e6e7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'fill_in_blank',
    'Name one way science has improved daily life in Ghana.',
    NULL,
    '"medicine"'::jsonb,
    'Medicine, mobile phones, improved farming, clean water treatment, electricity.',
    ARRAY['Many examples.', 'Technology impact.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc90b4f5-73ab-5e39-b330-69f44857d282',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.3.1'), NULL, 'fill_in_blank',
    'What skills are important for a career in science?',
    NULL,
    '"critical thinking"'::jsonb,
    'Critical thinking, problem-solving, curiosity, patience, and communication skills.',
    ARRAY['Essential qualities.', 'Beyond knowledge.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.5.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '598ff847-e502-5446-8c9d-ae7459be1f1c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'The greenhouse effect is caused by:',
    '["Oxygen in the atmosphere", "Gases like CO2 trapping heat in the atmosphere", "The sun getting hotter", "The Earth moving closer to the sun"]'::jsonb,
    '1'::jsonb,
    'Greenhouse gases (CO2, methane) trap heat, warming the Earth.',
    ARRAY['Natural process enhanced by humans.', 'Global warming.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'da032c5e-bdd1-5f0e-9713-c260ae7f1d61',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'The main greenhouse gas produced by burning fossil fuels is:',
    '["Oxygen", "Nitrogen", "Carbon dioxide", "Hydrogen"]'::jsonb,
    '2'::jsonb,
    'Burning fossil fuels releases CO2 into the atmosphere.',
    ARRAY['Fossil fuel combustion.', 'Major contributor.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd5286634-2c0f-5c00-8edf-4377d26d23c8',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'fill_in_blank',
    'Solar energy is a ___ energy source.',
    NULL,
    '"renewable"'::jsonb,
    'Solar energy is renewable — it will not run out.',
    ARRAY['Sunlight is unlimited.', 'Clean energy.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95215574-eb1b-5a9a-94ba-3ec73088e2e0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'fill_in_blank',
    'Fossil fuels include coal, oil, and ___.',
    NULL,
    '"natural gas"'::jsonb,
    'The three main fossil fuels are coal, oil, and natural gas.',
    ARRAY['Formed over millions of years.', 'Non-renewable.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '33376716-6fc6-5b95-88b1-14abbc6e5be7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'Wind energy is generated by:',
    '["Burning coal", "Wind turning turbines", "Nuclear reactions", "Water falling"]'::jsonb,
    '1'::jsonb,
    'Wind turns turbine blades to generate electricity.',
    ARRAY['Renewable source.', 'Kinetic to electrical.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '42f9b0f7-3df9-578e-abd4-0645bd71a5cc',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'Which is NOT a renewable energy source?',
    '["Solar", "Wind", "Coal", "Hydroelectric"]'::jsonb,
    '2'::jsonb,
    'Coal is a fossil fuel — non-renewable.',
    ARRAY['Formed over millions of years.', 'Finite supply.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '94736663-3e83-541f-9f39-864723c8d502',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'Deforestation contributes to climate change because:',
    '["Trees produce CO2", "Trees absorb CO2; removing them increases atmospheric CO2", "Trees block the sun", "Trees cause rain"]'::jsonb,
    '1'::jsonb,
    'Trees absorb CO2 through photosynthesis. Fewer trees means more CO2 in the atmosphere.',
    ARRAY['Carbon sink removed.', 'Increased greenhouse effect.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fe7ad5cc-f686-5ca2-a9e3-2e27be0a96d7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'Rising sea levels due to climate change affect coastal areas by:',
    '["Making beaches bigger", "Causing flooding and erosion of coastal land", "Lowering the sea temperature", "Creating new islands"]'::jsonb,
    '1'::jsonb,
    'Melting ice and thermal expansion raise sea levels, flooding coastal areas.',
    ARRAY['Coastal communities at risk.', 'Habitat loss.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '50f9652d-e2a4-509e-a92e-b5279faad953',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'What is the difference between weather and climate?',
    '["They are the same", "Weather is short-term; climate is long-term average weather patterns", "Climate is daily; weather is yearly", "Weather affects only temperature"]'::jsonb,
    '1'::jsonb,
    'Weather = day-to-day conditions; climate = average over 30+ years.',
    ARRAY['Time scale difference.', 'Climate is patterns.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e068fc18-86c1-5ebd-927f-78164c765424',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'fill_in_blank',
    'Name one effect of climate change on agriculture in Ghana.',
    NULL,
    '"drought"'::jsonb,
    'Changing rainfall patterns cause droughts and floods, reducing crop yields.',
    ARRAY['Food security threat.', 'Unpredictable seasons.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bd6008ab-2741-5d54-9638-053855b188cb',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'Why is hydroelectric power considered renewable?',
    '["It uses dams", "Water is continuously recycled through the water cycle", "It produces no pollution", "It is cheap"]'::jsonb,
    '1'::jsonb,
    'The water cycle continuously replenishes the water used for hydroelectric power.',
    ARRAY['Natural cycle.', 'Sustainable source.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '97a59f2f-faf2-5183-8f5d-6148cb712403',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'What can individuals do to reduce their carbon footprint?',
    '["Nothing significant", "Use public transport, save electricity, plant trees, reduce waste", "Only the government can act", "Move to another country"]'::jsonb,
    '1'::jsonb,
    'Individual actions collectively make a significant impact.',
    ARRAY['Personal responsibility.', 'Cumulative effect.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b5c60a64-36e5-5541-84a9-7a524cd3f656',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'fill_in_blank',
    'Why are fossil fuels called non-renewable?',
    NULL,
    '"finite"'::jsonb,
    'They form over millions of years and are being used much faster than they are created.',
    ARRAY['Finite resources.', 'Will eventually run out.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6128083d-c9a1-5e59-b325-5fedca67f3b7',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'fill_in_blank',
    'A country switches from coal to solar power. How does this help the environment?',
    NULL,
    '"reduces emissions"'::jsonb,
    'Solar power produces no greenhouse gas emissions during operation, unlike coal.',
    ARRAY['Clean energy.', 'No combustion.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5c0592f-8211-537a-bdb2-ee821f2c8440',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'Why might some people oppose building a hydroelectric dam?',
    '["Dams are ugly", "It floods large areas, displacing communities and destroying ecosystems", "Dams are too expensive", "Dams do not produce enough electricity"]'::jsonb,
    '1'::jsonb,
    'Dams have environmental and social costs: habitat destruction, displacement.',
    ARRAY['Environmental impact.', 'Social cost.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cbb7dd0d-54a9-506f-ab20-06f018fa27e3',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'fill_in_blank',
    'Explain the connection between population growth and climate change.',
    NULL,
    '"consumption"'::jsonb,
    'More people means more energy use, deforestation, and waste, increasing greenhouse gas emissions.',
    ARRAY['Resource demand.', 'Emissions increase.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b9a6d072-eb91-569e-88a1-65f2b68f00be',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'Why is Ghana well-suited for solar energy?',
    '["It has many factories", "It receives abundant sunshine year-round", "It has no other energy sources", "Solar panels are cheap"]'::jsonb,
    '1'::jsonb,
    'Ghana''s tropical location provides consistent solar radiation throughout the year.',
    ARRAY['Geographic advantage.', 'Abundant sunlight.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2d7ceb89-0118-521b-9f0f-3c3174784664',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'fill_in_blank',
    'What are the health effects of climate change on communities in Ghana?',
    NULL,
    '"diseases"'::jsonb,
    'Increased heat stress, waterborne diseases, malaria spread, and food insecurity.',
    ARRAY['Multiple health impacts.', 'Vulnerable populations.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'da0ddda3-fa15-56e8-9423-8b11a4488f35',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'multiple_choice',
    'How does urbanisation contribute to climate change?',
    '["It does not", "More buildings, vehicles, and energy use increase emissions and reduce green spaces", "It helps the environment", "Only through population growth"]'::jsonb,
    '1'::jsonb,
    'Urban areas consume more energy, produce more waste, and replace vegetation with concrete.',
    ARRAY['Urban heat island.', 'Emissions increase.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1705db9e-59ed-5c3b-a805-ec30d6b67e6c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.4.1'), NULL, 'fill_in_blank',
    'Suggest two renewable energy solutions for a rural community in Ghana.',
    NULL,
    '"solar and biogas"'::jsonb,
    'Solar panels for electricity and biogas from animal waste for cooking.',
    ARRAY['Local solutions.', 'Off-grid options.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B7/JHS1.5.5.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8ec837d3-848f-57ba-9922-cee25846e2ee',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Plants that grow once and die in one season are called:',
    '["Perennials", "Annuals", "Biennials", "Trees"]'::jsonb,
    '1'::jsonb,
    'Annuals complete their life cycle in one season.',
    ARRAY['Maize, beans, rice.', 'One season.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c6df6b9e-b5f5-5166-93ce-1abc9e2204b9',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Plants that live for more than two years are called:',
    '["Annuals", "Biennials", "Perennials", "Shrubs"]'::jsonb,
    '2'::jsonb,
    'Perennials live for many years.',
    ARRAY['Trees, grasses.', 'Long-lived.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd5dcd367-ab43-5515-8abd-ec809b78d099',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'A tree is classified as a plant with:',
    '["Soft stems", "A woody trunk and branches", "No leaves", "Underground stems"]'::jsonb,
    '1'::jsonb,
    'Trees have woody trunks and grow tall.',
    ARRAY['Perennial woody plants.', 'Forest dominant.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9f0b29d1-1b86-588c-b118-75e995c6a21e',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Grasses are examples of:',
    '["Trees", "Shrubs", "Herbs", "Monocotyledons"]'::jsonb,
    '3'::jsonb,
    'Grasses are monocotyledons — one seed leaf, parallel veins.',
    ARRAY['Common plant type.', 'Cereal crops.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1cccb5f5-4d24-56ec-a0dc-46d5141a035c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'A shrub is a plant with:',
    '["No stems", "Multiple woody stems from the base", "A single tall trunk", "Underground storage"]'::jsonb,
    '1'::jsonb,
    'Shrubs have multiple woody stems branching from the base.',
    ARRAY['Shorter than trees.', 'Bush-like.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8746177d-0cab-5c10-96d1-8c9d5ec4b2da',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Leguminous plants like beans and groundnut help the soil by:',
    '["Adding pesticides", "Fixing nitrogen in the soil", "Removing water", "Killing bacteria"]'::jsonb,
    '1'::jsonb,
    'Legumes have root nodules with bacteria that fix atmospheric nitrogen.',
    ARRAY['Natural fertiliser.', 'Crop rotation benefit.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2854a854-30d7-5482-9b4e-280e33c97a5d',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Why are forests important for the environment?',
    '["Only for wood", "They absorb CO2, produce oxygen, prevent erosion, and support biodiversity", "Only for animals", "Only for medicine"]'::jsonb,
    '1'::jsonb,
    'Forests provide multiple ecosystem services.',
    ARRAY['Carbon sinks.', 'Habitat protection.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3ebdd6b6-8ef8-5dea-9833-5a3b8e1c3371',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Why do plants have different leaf shapes?',
    '["For decoration", "Different shapes are adaptations to their environment and function", "All leaves are the same shape", "Only for collecting water"]'::jsonb,
    '1'::jsonb,
    'Leaf shapes adapt to light capture, water conservation, and defence.',
    ARRAY['Environmental adaptation.', 'Functional diversity.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '803f91aa-d2c4-5e24-be38-63a3e27cbd65',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Crops like yam and cassava are grown for their:',
    '["Leaves", "Stems or tubers (underground storage)", "Flowers", "Seeds"]'::jsonb,
    '1'::jsonb,
    'Yam and cassava store food in underground tubers/root tubers.',
    ARRAY['Staple foods.', 'Root/tuber crops.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd85647ec-a7ba-5bf3-84ef-827fcf770e49',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'What is the role of flowers in plants?',
    '["Photosynthesis", "Reproduction \u2014 they produce seeds", "Water absorption", "Food storage"]'::jsonb,
    '1'::jsonb,
    'Flowers are the reproductive structures of flowering plants.',
    ARRAY['Attract pollinators.', 'Seed production.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '874e7011-23e5-5b31-ab14-308d9d032f01',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Why should deforestation be controlled in Ghana?',
    '["It looks bad", "It leads to soil erosion, loss of biodiversity, and contributes to climate change", "It makes the air cleaner", "It increases rainfall"]'::jsonb,
    '1'::jsonb,
    'Deforestation has multiple negative environmental impacts.',
    ARRAY['Soil erosion.', 'Climate impact.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '664ac061-0923-5def-9466-b2f69a35fcb9',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'fill_in_blank',
    'Name one crop that is important for Ghana''s economy.',
    NULL,
    '"cocoa"'::jsonb,
    'Cocoa is Ghana''s major export crop. Others: timber, oil palm, rubber.',
    ARRAY['Export crop.', 'Foreign exchange.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a1eb205f-1f1b-550f-8747-9ad275688b8f',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Why are some plants classified as weeds?',
    '["They are ugly", "They compete with crops for nutrients, water, and light", "They are always poisonous", "They grow only in forests"]'::jsonb,
    '1'::jsonb,
    'Weeds are unwanted plants that compete with cultivated crops.',
    ARRAY['Agricultural competition.', 'Yield reduction.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '02d5c2d1-7320-5bb8-81a5-9617631eeefe',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'fill_in_blank',
    'How do plants help prevent soil erosion?',
    NULL,
    '"root system"'::jsonb,
    'Plant roots bind soil particles together, and canopy cover reduces raindrop impact.',
    ARRAY['Soil binding.', 'Ground cover.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '62b4547f-6e08-53e7-95b6-7bfa978f36bc',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Why is crop diversity important for food security?',
    '["It is not important", "Growing different crops reduces the risk of total failure from pests or drought", "It makes farming harder", "Only one crop is needed"]'::jsonb,
    '1'::jsonb,
    'Diversity spreads risk — if one crop fails, others may survive.',
    ARRAY['Risk management.', 'Nutritional variety.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f9c799a4-7890-5f67-8e05-ec11a512cad6',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'fill_in_blank',
    'A farmer plants trees alongside their crops (agroforestry). What benefits does this provide?',
    NULL,
    '"shade and soil"'::jsonb,
    'Trees provide shade, prevent erosion, add organic matter, and can provide fruit or timber.',
    ARRAY['Multiple benefits.', 'Sustainable practice.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7c2e8fa2-4c55-50f4-8eb1-ccf160d63673',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Why are mangrove forests important along Ghana''s coast?',
    '["For decoration", "They protect coastlines from erosion and provide nursery habitats for fish", "They block ships", "They are poisonous"]'::jsonb,
    '1'::jsonb,
    'Mangroves protect shores and are vital fish breeding grounds.',
    ARRAY['Coastal protection.', 'Marine nursery.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '05d08bb6-08f4-59c2-a476-d5891c2aaf5c',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'fill_in_blank',
    'Explain how plants are adapted to survive in dry (arid) conditions.',
    NULL,
    '"water conservation"'::jsonb,
    'Deep roots, thick stems for water storage, waxy leaves to reduce water loss.',
    ARRAY['Xerophytic adaptations.', 'Drought survival.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f3d42c8f-eb1f-5fa6-8757-975c3ce666c0',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'Why is it important to plant trees after cutting them down?',
    '["It is not important", "To maintain the ecosystem services trees provide: oxygen, CO2 absorption, soil protection", "Only for beauty", "Only for wood"]'::jsonb,
    '1'::jsonb,
    'Replanting ensures continued environmental benefits.',
    ARRAY['Sustainability.', 'Forest regeneration.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e4d3fcaa-4236-516e-b95e-a5e83cf93882',
    (SELECT id FROM topics WHERE code = 'B7/JHS1.5.5.1'), NULL, 'multiple_choice',
    'How do invasive plant species threaten Ghana''s native ecosystems?',
    '["They do not", "They outcompete native species, reducing biodiversity and disrupting food webs", "They help native plants", "They only grow in water"]'::jsonb,
    '1'::jsonb,
    'Invasive species compete with and displace native plants.',
    ARRAY['Ecological threat.', 'Biodiversity loss.'],
    'bece_level', 'analysis', 'shared'
);

-- Total: 27 topics x 20 questions = 540 questions
