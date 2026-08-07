-- Flawlex Mastery - SBC B9/JHS3 Questions
-- 31 topics x 20 questions = 620 questions total
-- Generated from NaCCA CCP Science Curriculum (September 2020)

-- ============================================================
-- B9/JHS3.1.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '74b825c2-8a97-5956-b21f-81fa5bd4ff4c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'A binary compound contains how many elements?',
    '["One", "Two", "Three", "Many"]'::jsonb,
    '1'::jsonb,
    'Binary compounds contain exactly two elements.',
    ARRAY['[', 'T', 'w', 'o', ' ', 'e', 'l', 'e', 'm', 'e', 'n', 't', 's', ' ', 'o', 'n', 'l', 'y', '.', ',', 'N', 'a', 'm', 'e', ' ', 's', 'a', 'y', 's', ' ', 'b', 'i', ' ', '=', ' ', 't', 'w', 'o', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '760074a4-233a-519d-b34e-131c614d3c50',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'fill_in_blank',
    'The compound NaCl contains sodium and ___.',
    NULL,
    '"chlorine"'::jsonb,
    'NaCl is sodium chloride - sodium + chlorine.',
    ARRAY['[', 'S', 'a', 'l', 't', ' ', 'c', 'o', 'm', 'p', 'o', 'u', 'n', 'd', '.', ',', 'I', 'o', 'n', 'i', 'c', ' ', 'b', 'o', 'n', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ac92d802-b21b-5b26-9c03-9b2a64bf2dd7',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'fill_in_blank',
    'CO2 is a binary compound of carbon and ___.',
    NULL,
    '"oxygen"'::jsonb,
    'CO2 = carbon dioxide = carbon + oxygen.',
    ARRAY['[', 'G', 'r', 'e', 'e', 'n', 'h', 'o', 'u', 's', 'e', ' ', 'g', 'a', 's', '.', ',', 'T', 'w', 'o', ' ', 'o', 'x', 'y', 'g', 'e', 'n', ' ', 'a', 't', 'o', 'm', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bdec89fa-3fd6-58b8-bc3d-f6c44b52ea5d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'H2O is an example of a:',
    '["Element", "Binary compound", "Mixture", "Metal"]'::jsonb,
    '1'::jsonb,
    'H2O contains hydrogen and oxygen - two elements.',
    ARRAY['[', 'W', 'a', 't', 'e', 'r', '.', ',', 'M', 'o', 's', 't', ' ', 'c', 'o', 'm', 'm', 'o', 'n', ' ', 'c', 'o', 'm', 'p', 'o', 'u', 'n', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '34eef9fd-499d-558c-af07-c7f6df1f93eb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'The chemical formula for magnesium oxide is:',
    '["MgO", "MgO2", "Mg2O", "Mg2O2"]'::jsonb,
    '0'::jsonb,
    'Magnesium (Group 2, +2) combines with oxygen (-2) in 1:1 ratio.',
    ARRAY['[', '+', '2', ' ', 'a', 'n', 'd', ' ', '-', '2', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ',', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'i', 'o', 'n', 'i', 'c', ' ', 'c', 'o', 'm', 'p', 'o', 'u', 'n', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '57db4e3d-ed1d-596f-90a3-68b84b4fa7c0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'Iron sulfide (FeS) is formed when iron reacts with:',
    '["Oxygen", "Sulfur", "Chlorine", "Nitrogen"]'::jsonb,
    '1'::jsonb,
    'FeS = iron + sulfur.',
    ARRAY['[', 'D', 'i', 'r', 'e', 'c', 't', ' ', 'c', 'o', 'm', 'b', 'i', 'n', 'a', 't', 'i', 'o', 'n', '.', ',', 'S', 'y', 'n', 't', 'h', 'e', 's', 'i', 's', ' ', 'r', 'e', 'a', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8b82cba4-ad16-5a38-af83-99ae03a9e8d0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'In the compound CaCl2, calcium has a charge of:',
    '["+1", "+2", "-1", "-2"]'::jsonb,
    '1'::jsonb,
    'Calcium is Group 2, loses 2 electrons → +2.',
    ARRAY['[', 'G', 'r', 'o', 'u', 'p', ' ', '2', ' ', 'e', 'l', 'e', 'm', 'e', 'n', 't', '.', ',', 'B', 'a', 'l', 'a', 'n', 'c', 'e', 's', ' ', '2', ' ', 'C', 'l', '⁻', ' ', 'i', 'o', 'n', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '833ce354-f71a-5c1e-af5d-1c72b14d6c00',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'The name of the compound Al2O3 is:',
    '["Aluminium oxide", "Aluminium trioxide", "Dialuminium oxide", "Aluminium oxygen"]'::jsonb,
    '0'::jsonb,
    'Al2O3 = aluminium oxide. Naming: metal + non-metal + -ide.',
    ARRAY['[', 'I', 'o', 'n', 'i', 'c', ' ', 'n', 'a', 'm', 'i', 'n', 'g', ' ', 'r', 'u', 'l', 'e', 's', '.', ',', 'O', 'x', 'i', 'd', 'e', ' ', '=', ' ', 'o', 'x', 'y', 'g', 'e', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'afbc7583-4714-5976-98db-3de9065eba5a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'Why is CO called carbon monoxide and CO2 called carbon dioxide?',
    '["No reason", "Mono = one oxygen, di = two oxygens (Greek prefixes)", "CO is bigger", "CO2 has more carbon"]'::jsonb,
    '1'::jsonb,
    'Greek prefixes indicate the number of atoms: mono (1), di (2).',
    ARRAY['[', 'N', 'a', 'm', 'i', 'n', 'g', ' ', 'c', 'o', 'n', 'v', 'e', 'n', 't', 'i', 'o', 'n', '.', ',', 'S', 'y', 's', 't', 'e', 'm', 'a', 't', 'i', 'c', ' ', 'n', 'a', 'm', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aaaea73c-900d-554a-9ab5-4608cb2346e6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'A compound with formula XY2 means:',
    '["One X and one Y", "One X atom bonded to two Y atoms", "Two X and one Y", "X and Y are the same"]'::jsonb,
    '1'::jsonb,
    'Subscripts indicate atom count: XY2 = 1 X + 2 Y.',
    ARRAY['[', 'C', 'h', 'e', 'm', 'i', 'c', 'a', 'l', ' ', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'S', 'u', 'b', 's', 'c', 'r', 'i', 'p', 't', ' ', 'm', 'e', 'a', 'n', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '48e919ca-e87d-5480-ac39-cbe3d1705fc9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'Why do ionic compounds have high melting points?',
    '["They are soft", "Strong electrostatic forces between ions require lots of energy to break", "They are gases", "They have weak bonds"]'::jsonb,
    '1'::jsonb,
    'Ionic bonds are strong electrostatic attractions between oppositely charged ions.',
    ARRAY['[', 'L', 'a', 't', 't', 'i', 'c', 'e', ' ', 's', 't', 'r', 'u', 'c', 't', 'u', 'r', 'e', '.', ',', 'S', 't', 'r', 'o', 'n', 'g', ' ', 'f', 'o', 'r', 'c', 'e', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '661a1409-d294-577a-bacd-1688f1d10a78',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'fill_in_blank',
    'Name the compound MgBr2.',
    NULL,
    '"magnesium bromide"'::jsonb,
    'Metal name + non-metal name with -ide suffix.',
    ARRAY['[', 'I', 'o', 'n', 'i', 'c', ' ', 'n', 'a', 'm', 'i', 'n', 'g', '.', ',', 'M', 'g', ' ', '+', ' ', 'B', 'r', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7a908ea7-932e-5322-94f7-7e72cd061370',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'Why does NaCl conduct electricity when dissolved but not as a solid?',
    '["It cannot conduct", "In solution, ions are free to move; in solid, ions are locked in lattice", "Solid is pure", "Dissolving creates electrons"]'::jsonb,
    '1'::jsonb,
    'Mobile ions carry charge in solution; fixed ions in solid cannot move.',
    ARRAY['[', 'I', 'o', 'n', 'i', 'c', ' ', 'c', 'o', 'n', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ',', 'M', 'o', 'b', 'i', 'l', 'i', 't', 'y', ' ', 'm', 'a', 't', 't', 'e', 'r', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8afb0665-34b1-54e1-9e9a-4db832ba4f73',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'fill_in_blank',
    'Predict the formula of the compound formed between aluminium and chlorine.',
    NULL,
    '"AlCl3"'::jsonb,
    'Al is +3, Cl is -1. Need 3 Cl to balance 1 Al.',
    ARRAY['[', 'C', 'h', 'a', 'r', 'g', 'e', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ',', '+', '3', ' ', 'a', 'n', 'd', ' ', '3', 'x', '(', '-', '1', ')', ' ', '=', ' ', '0', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5dcec642-93f5-53e1-8625-05727c621b10',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'Why is CO2 a gas at room temperature while NaCl is a solid?',
    '["CO2 is lighter", "CO2 has weak intermolecular forces; NaCl has strong ionic bonds", "CO2 has more atoms", "NaCl is older"]'::jsonb,
    '1'::jsonb,
    'Covalent CO2 has weak forces between molecules; ionic NaCl has a strong lattice.',
    ARRAY['[', 'B', 'o', 'n', 'd', ' ', 't', 'y', 'p', 'e', ' ', 'm', 'a', 't', 't', 'e', 'r', 's', '.', ',', 'D', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', ' ', 's', 't', 'r', 'u', 'c', 't', 'u', 'r', 'e', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fd0b4fba-de92-5a93-9df9-ff7159de07d4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'An unknown compound has formula XCl3. If Cl is -1, what is the charge on X?',
    '["+1", "+2", "+3", "-3"]'::jsonb,
    '2'::jsonb,
    'Total charge must be zero: X + 3(-1) = 0, so X = +3.',
    ARRAY['[', 'C', 'h', 'a', 'r', 'g', 'e', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ',', 'A', 'l', 'g', 'e', 'b', 'r', 'a', 'i', 'c', ' ', 'a', 'p', 'p', 'r', 'o', 'a', 'c', 'h', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7b4b6d52-7f02-58fc-b129-f8b07f3ff256',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'Why are binary covalent compounds like HCl named differently from ionic compounds?',
    '["They are not", "Covalent compounds use Greek prefixes; ionic compounds use charge-based naming", "Only ionic compounds have names", "They are named the same"]'::jsonb,
    '1'::jsonb,
    'Covalent: prefixes (mono, di). Ionic: metal name + non-metal -ide.',
    ARRAY['[', 'D', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', ' ', 'n', 'a', 'm', 'i', 'n', 'g', ' ', 's', 'y', 's', 't', 'e', 'm', 's', '.', ',', 'B', 'o', 'n', 'd', ' ', 't', 'y', 'p', 'e', ' ', 'd', 'e', 't', 'e', 'r', 'm', 'i', 'n', 'e', 's', ' ', 'n', 'a', 'm', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5b82776-cff7-547c-8f5f-dcefb688c7bc',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'A compound contains 40% calcium and 60% chlorine by mass. Is it CaCl or CaCl2?',
    '["CaCl", "CaCl2", "CaCl3", "Cannot tell"]'::jsonb,
    '1'::jsonb,
    'CaCl2 has Ca (40/111 = 36%) and Cl (71/111 = 64%) - close to the data.',
    ARRAY['[', 'M', 'a', 's', 's', ' ', 'r', 'a', 't', 'i', 'o', ' ', 'a', 'n', 'a', 'l', 'y', 's', 'i', 's', '.', ',', 'E', 'm', 'p', 'i', 'r', 'i', 'c', 'a', 'l', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd47af532-c397-5179-ab53-7dd7909d59f1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'Why is it important to know the formula of a compound?',
    '["For decoration", "The formula tells us the composition, properties, and how it reacts", "It is not important", "Only for naming"]'::jsonb,
    '1'::jsonb,
    'Formulas predict properties, reactions, and applications.',
    ARRAY['[', 'C', 'h', 'e', 'm', 'i', 's', 't', 'r', 'y', ' ', 'f', 'o', 'u', 'n', 'd', 'a', 't', 'i', 'o', 'n', '.', ',', 'P', 'r', 'a', 'c', 't', 'i', 'c', 'a', 'l', ' ', 'u', 's', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '889787e4-bb00-58fc-af34-db94b62cfa50',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.1'), NULL, 'multiple_choice',
    'What is the difference between a molecule of O2 and a molecule of O3 (ozone)?',
    '["No difference", "O2 has 2 oxygen atoms; O3 has 3 - different properties", "O3 is heavier only", "O2 is a compound"]'::jsonb,
    '1'::jsonb,
    'Same element, different molecular formulas = allotropes with different properties.',
    ARRAY['[', 'A', 'l', 'l', 'o', 't', 'r', 'o', 'p', 'y', '.', ',', 'D', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', ' ', 'm', 'o', 'l', 'e', 'c', 'u', 'l', 'e', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.1.1.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c301a4ee-1b04-5503-977d-f64ed2264adf',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'An ionic bond is formed between:',
    '["Two non-metals", "A metal and a non-metal", "Two metals", "Two noble gases"]'::jsonb,
    '1'::jsonb,
    'Ionic bonds form when metals transfer electrons to non-metals.',
    ARRAY['[', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'n', ' ', 't', 'r', 'a', 'n', 's', 'f', 'e', 'r', '.', ',', 'M', 'e', 't', 'a', 'l', ' ', 'l', 'o', 's', 'e', 's', ',', ' ', 'n', 'o', 'n', '-', 'm', 'e', 't', 'a', 'l', ' ', 'g', 'a', 'i', 'n', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3ae626c9-f70a-5abc-b484-85f554868c6c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'A covalent bond is formed by:',
    '["Transfer of electrons", "Sharing of electron pairs between atoms", "Movement of protons", "Sharing of neutrons"]'::jsonb,
    '1'::jsonb,
    'Covalent bonds involve sharing electrons.',
    ARRAY['[', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'n', ' ', 's', 'h', 'a', 'r', 'i', 'n', 'g', '.', ',', 'N', 'o', 'n', '-', 'm', 'e', 't', 'a', 'l', ' ', '+', ' ', 'n', 'o', 'n', '-', 'm', 'e', 't', 'a', 'l', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '418d6954-d0b1-54e3-a923-7faf5a356e96',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'fill_in_blank',
    'In NaCl, sodium ___ an electron to become Na+.',
    NULL,
    '"loses"'::jsonb,
    'Sodium (Group 1) loses 1 electron to form Na+.',
    ARRAY['[', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'n', ' ', 't', 'r', 'a', 'n', 's', 'f', 'e', 'r', '.', ',', 'P', 'o', 's', 'i', 't', 'i', 'v', 'e', ' ', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'eb334f68-3454-5f3b-a695-bff46ac888be',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'In a water molecule (H2O), the bonds are:',
    '["Ionic", "Covalent", "Metallic", "No bonds"]'::jsonb,
    '1'::jsonb,
    'H2O has covalent bonds - oxygen shares electrons with hydrogen.',
    ARRAY['[', 'N', 'o', 'n', '-', 'm', 'e', 't', 'a', 'l', ' ', '+', ' ', 'n', 'o', 'n', '-', 'm', 'e', 't', 'a', 'l', '.', ',', 'S', 'h', 'a', 'r', 'e', 'd', ' ', 'e', 'l', 'e', 'c', 't', 'r', 'o', 'n', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1ee83046-215f-56a9-b1e0-f9228ff64375',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'Metallic bonding involves:',
    '["Sharing electrons", "A sea of delocalised electrons around positive metal ions", "Transferring electrons", "No electrons"]'::jsonb,
    '1'::jsonb,
    'Metallic bonds have a lattice of positive ions in a sea of electrons.',
    ARRAY['[', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'n', ' ', 's', 'e', 'a', ' ', 'm', 'o', 'd', 'e', 'l', '.', ',', 'M', 'e', 't', 'a', 'l', ' ', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'i', 'e', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bc1d7b4d-22cc-53f1-8a1e-1881b5e65d71',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'An ion is an atom that has:',
    '["Gained protons", "Gained or lost electrons to become charged", "Lost neutrons", "No charge"]'::jsonb,
    '1'::jsonb,
    'Ions form when atoms gain or lose electrons.',
    ARRAY['[', 'C', 'h', 'a', 'r', 'g', 'e', 'd', ' ', 'p', 'a', 'r', 't', 'i', 'c', 'l', 'e', 's', '.', ',', 'P', 'o', 's', 'i', 't', 'i', 'v', 'e', ' ', 'o', 'r', ' ', 'n', 'e', 'g', 'a', 't', 'i', 'v', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a6c4192b-9e08-5e23-b728-816cb366fee1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'Why does magnesium form Mg2+ and not Mg+?',
    '["Random chance", "Magnesium has 2 valence electrons that it loses to achieve stable configuration", "It gains 2 electrons", "It has 2 protons"]'::jsonb,
    '1'::jsonb,
    'Mg (Group 2) loses both valence electrons for a full outer shell.',
    ARRAY['[', 'S', 't', 'a', 'b', 'l', 'e', ' ', 'c', 'o', 'n', 'f', 'i', 'g', 'u', 'r', 'a', 't', 'i', 'o', 'n', '.', ',', 'N', 'o', 'b', 'l', 'e', ' ', 'g', 'a', 's', ' ', 's', 't', 'r', 'u', 'c', 't', 'u', 'r', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b40a1f34-5a15-56b1-8872-c079fdbec833',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'In a covalent bond, atoms share electrons to:',
    '["Become ions", "Achieve stable electron configurations (full outer shells)", "Lose energy", "Become metals"]'::jsonb,
    '1'::jsonb,
    'Sharing allows both atoms to have full outer shells.',
    ARRAY['[', 'O', 'c', 't', 'e', 't', ' ', 'r', 'u', 'l', 'e', '.', ',', 'S', 't', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ba5ff531-2759-5c6c-bffe-878cace1b011',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'Why is diamond very hard?',
    '["It is heavy", "Each carbon forms 4 strong covalent bonds in a giant lattice", "It has metallic bonds", "It is made of metal"]'::jsonb,
    '1'::jsonb,
    'Diamond has a 3D network of strong C-C covalent bonds.',
    ARRAY['[', 'G', 'i', 'a', 'n', 't', ' ', 'c', 'o', 'v', 'a', 'l', 'e', 'n', 't', ' ', 's', 't', 'r', 'u', 'c', 't', 'u', 'r', 'e', '.', ',', 'V', 'e', 'r', 'y', ' ', 's', 't', 'r', 'o', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '311b5364-453e-53eb-9136-1fd8b46db377',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'Why do ionic compounds conduct electricity in solution?',
    '["They do not", "Ions are free to move in solution and carry electrical charge", "Electrons flow", "Water conducts"]'::jsonb,
    '1'::jsonb,
    'Mobile ions in solution carry charge - electrolysis possible.',
    ARRAY['[', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'l', 'y', 't', 'e', '.', ',', 'I', 'o', 'n', ' ', 'm', 'o', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '415ddf40-406b-5879-84b5-4ccbfa925595',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'How many covalent bonds does a carbon atom typically form?',
    '["1", "2", "3", "4"]'::jsonb,
    '3'::jsonb,
    'Carbon has 4 valence electrons, so it shares 4 electron pairs.',
    ARRAY['[', 'G', 'r', 'o', 'u', 'p', ' ', '4', '.', ',', 'T', 'e', 't', 'r', 'a', 'v', 'a', 'l', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f9cf84fc-c2f4-5635-995e-340820fb054e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'fill_in_blank',
    'Name the type of bonding in sodium chloride.',
    NULL,
    '"ionic"'::jsonb,
    'NaCl: metal (Na) transfers electron to non-metal (Cl) → ionic bond.',
    ARRAY['[', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'n', ' ', 't', 'r', 'a', 'n', 's', 'f', 'e', 'r', '.', ',', 'E', 'l', 'e', 'c', 't', 'r', 'o', 's', 't', 'a', 't', 'i', 'c', ' ', 'a', 't', 't', 'r', 'a', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '24a92471-589f-5b3f-9b81-493c3c3a4e53',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'Why are metals good conductors of electricity?',
    '["They are shiny", "Delocalised electrons in metallic bonding are free to move and carry charge", "They have ionic bonds", "They are dense"]'::jsonb,
    '1'::jsonb,
    'Free-moving electrons in the electron sea carry electrical charge.',
    ARRAY['[', 'M', 'e', 't', 'a', 'l', 'l', 'i', 'c', ' ', 'b', 'o', 'n', 'd', 'i', 'n', 'g', '.', ',', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'n', ' ', 'm', 'o', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '713cffb1-57e6-528f-af51-0b84103244fa',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'fill_in_blank',
    'Explain why water (H2O) has a low melting point while sodium chloride has a high one.',
    NULL,
    '"bond strength"'::jsonb,
    'H2O has weak intermolecular forces between molecules; NaCl has strong ionic bonds in a lattice.',
    ARRAY['[', 'D', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', ' ', 'b', 'o', 'n', 'd', ' ', 't', 'y', 'p', 'e', 's', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 't', 'o', ' ', 'b', 'r', 'e', 'a', 'k', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'acabb324-43d6-582f-8b34-07f4da7b8312',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'Why does carbon form many different compounds?',
    '["It is common", "Carbon can form 4 covalent bonds and bond to itself, creating chains and rings", "It is a metal", "It has no electrons"]'::jsonb,
    '1'::jsonb,
    'Carbon''s tetravalency and ability to catenate (form chains) gives enormous variety.',
    ARRAY['[', 'O', 'r', 'g', 'a', 'n', 'i', 'c', ' ', 'c', 'h', 'e', 'm', 'i', 's', 't', 'r', 'y', '.', ',', 'V', 'e', 'r', 's', 'a', 't', 'i', 'l', 'e', ' ', 'b', 'o', 'n', 'd', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7b4abdad-91a7-5061-8b65-198af60f73cb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'A substance has a high melting point, conducts when dissolved, and forms crystals. What type of bonding?',
    '["Covalent", "Ionic", "Metallic", "No bonding"]'::jsonb,
    '1'::jsonb,
    'These are classic properties of ionic compounds.',
    ARRAY['[', 'I', 'o', 'n', 'i', 'c', ' ', 'c', 'o', 'm', 'p', 'o', 'u', 'n', 'd', ' ', 'i', 'n', 'd', 'i', 'c', 'a', 't', 'o', 'r', 's', '.', ',', 'C', 'r', 'y', 's', 't', 'a', 'l', ' ', 'l', 'a', 't', 't', 'i', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '273d129f-f198-587a-8ccb-28b407f9d975',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'Why is graphite (a form of carbon) a good conductor while diamond is not?',
    '["They are the same", "Graphite has delocalised electrons between layers; diamond has all electrons in bonds", "Diamond is harder", "Graphite is softer"]'::jsonb,
    '1'::jsonb,
    'Graphite layers have free electrons; diamond has no free electrons.',
    ARRAY['[', 'L', 'a', 'y', 'e', 'r', 'e', 'd', ' ', 's', 't', 'r', 'u', 'c', 't', 'u', 'r', 'e', '.', ',', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'n', ' ', 'm', 'o', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e85ca687-0774-568b-8601-f5b6767ef1ba',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'fill_in_blank',
    'What holds the atoms together in a molecule of oxygen (O2)?',
    NULL,
    '"covalent bond"'::jsonb,
    'Two oxygen atoms share two electron pairs (double covalent bond).',
    ARRAY['[', 'S', 'h', 'a', 'r', 'e', 'd', ' ', 'e', 'l', 'e', 'c', 't', 'r', 'o', 'n', 's', '.', ',', 'D', 'o', 'u', 'b', 'l', 'e', ' ', 'b', 'o', 'n', 'd', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6ead98d6-19ae-5807-a84d-65b60c6d2153',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'Why do ionic compounds dissolve in water?',
    '["They do not", "Water molecules pull ions away from the lattice, surrounding them (hydration)", "They react with water", "Water breaks ionic bonds chemically"]'::jsonb,
    '1'::jsonb,
    'Water''s polarity attracts and separates ions - hydration energy overcomes lattice energy.',
    ARRAY['[', 'S', 'o', 'l', 'v', 'a', 't', 'i', 'o', 'n', '.', ',', 'P', 'o', 'l', 'a', 'r', ' ', 's', 'o', 'l', 'v', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '09dbc487-a9d9-55f5-84ac-f64aa67f8dd1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.1.2'), NULL, 'multiple_choice',
    'Compare ionic and covalent bonding in terms of electron behaviour.',
    '["They are identical", "Ionic: electron transfer. Covalent: electron sharing.", "Both transfer electrons", "Both share electrons"]'::jsonb,
    '1'::jsonb,
    'Ionic = transfer; covalent = sharing. Both achieve stable configurations.',
    ARRAY['[', 'K', 'e', 'y', ' ', 'd', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 'c', 'e', '.', ',', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'n', ' ', 'b', 'e', 'h', 'a', 'v', 'i', 'o', 'u', 'r', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.1.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e06998f1-07b8-5da3-9702-ed568565427f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'A specialised cell is one that:',
    '["Is very small", "Has a specific structure adapted for a particular function", "Has no nucleus", "Is dead"]'::jsonb,
    '1'::jsonb,
    'Specialised cells have structures suited to their specific role.',
    ARRAY['[', 'D', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', 'i', 'a', 't', 'i', 'o', 'n', '.', ',', 'F', 'o', 'r', 'm', ' ', 'f', 'o', 'l', 'l', 'o', 'w', 's', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ac7b4fdf-ed0a-5e89-bd8b-98d6d8cc41cb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Red blood cells are specialised for:',
    '["Fighting infection", "Transporting oxygen", "Digesting food", "Producing hormones"]'::jsonb,
    '1'::jsonb,
    'RBCs have haemoglobin to carry oxygen and no nucleus for more space.',
    ARRAY['[', 'O', 'x', 'y', 'g', 'e', 'n', ' ', 't', 'r', 'a', 'n', 's', 'p', 'o', 'r', 't', '.', ',', 'B', 'i', 'c', 'o', 'n', 'c', 'a', 'v', 'e', ' ', 's', 'h', 'a', 'p', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5e7b5750-16f7-5d26-8185-8fe3a57e6195',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Nerve cells (neurons) are specialised for:',
    '["Digestion", "Transmitting electrical impulses", "Fighting disease", "Absorbing water"]'::jsonb,
    '1'::jsonb,
    'Neurons have long axons for transmitting signals over distances.',
    ARRAY['[', 'S', 'i', 'g', 'n', 'a', 'l', ' ', 't', 'r', 'a', 'n', 's', 'm', 'i', 's', 's', 'i', 'o', 'n', '.', ',', 'C', 'o', 'm', 'm', 'u', 'n', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '94f5d76a-cbf1-53e2-8a6a-d5cdb96726fd',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Root hair cells are specialised for:',
    '["Photosynthesis", "Absorbing water and minerals from soil", "Transporting sugars", "Reproduction"]'::jsonb,
    '1'::jsonb,
    'Root hair cells have large surface area for absorption.',
    ARRAY['[', 'A', 'b', 's', 'o', 'r', 'p', 't', 'i', 'o', 'n', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ',', 'L', 'a', 'r', 'g', 'e', ' ', 's', 'u', 'r', 'f', 'a', 'c', 'e', ' ', 'a', 'r', 'e', 'a', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6e49843c-b2b3-5275-b50d-f232c2407bbb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Palisade mesophyll cells are specialised for:',
    '["Absorbing water", "Photosynthesis", "Transporting food", "Respiration"]'::jsonb,
    '1'::jsonb,
    'Palisade cells are packed with chloroplasts for photosynthesis.',
    ARRAY['[', 'L', 'i', 'g', 'h', 't', ' ', 'a', 'b', 's', 'o', 'r', 'p', 't', 'i', 'o', 'n', '.', ',', 'L', 'e', 'a', 'f', ' ', 'c', 'e', 'l', 'l', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0442f962-f60e-5f99-9325-d109b27447b4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Sperm cells are specialised for:',
    '["Photosynthesis", "Fertilisation (carrying genetic material to the egg)", "Absorption", "Support"]'::jsonb,
    '1'::jsonb,
    'Sperm cells have a tail (flagellum) for swimming and enzymes for penetration.',
    ARRAY['[', 'R', 'e', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ',', 'M', 'o', 't', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3bb86122-068c-5383-949f-8871536a0707',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Why do red blood cells have no nucleus?',
    '["They are dead", "More space for haemoglobin to carry oxygen", "They do not need energy", "They are plant cells"]'::jsonb,
    '1'::jsonb,
    'No nucleus = more room for haemoglobin = more oxygen carried.',
    ARRAY['[', 'A', 'd', 'a', 'p', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3355985a-49cb-56b6-adb8-c0592b62007c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'How is a sperm cell adapted for its function?',
    '["It has chloroplasts", "It has a tail for swimming, enzymes in the head, and is streamlined", "It has a large vacuole", "It has a cell wall"]'::jsonb,
    '1'::jsonb,
    'Sperm adaptations: flagellum (movement), acrosome (enzymes), mitochondria (energy).',
    ARRAY['[', 'R', 'e', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'v', 'e', ' ', 'a', 'd', 'a', 'p', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'M', 'o', 't', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '542699f0-5c89-508c-a6ef-6a6c56700ab4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Why do root hair cells have a large surface area?',
    '["For photosynthesis", "To maximise absorption of water and minerals from soil", "To store food", "To support the plant"]'::jsonb,
    '1'::jsonb,
    'Large surface area increases the rate of absorption.',
    ARRAY['[', 'A', 'b', 's', 'o', 'r', 'p', 't', 'i', 'o', 'n', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ',', 'D', 'i', 'f', 'f', 'u', 's', 'i', 'o', 'n', ' ', 'r', 'a', 't', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '138b2e7c-97d5-5a75-a9ae-8a8c85af6272',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Xylem vessels are specialised for:',
    '["Photosynthesis", "Transporting water and minerals up the plant", "Transporting sugars", "Storing food"]'::jsonb,
    '1'::jsonb,
    'Xylem vessels are hollow, dead tubes with lignified walls for water transport.',
    ARRAY['[', 'W', 'a', 't', 'e', 'r', ' ', 't', 'r', 'a', 'n', 's', 'p', 'o', 'r', 't', '.', ',', 'S', 't', 'r', 'u', 'c', 't', 'u', 'r', 'a', 'l', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3d548ae1-5dc3-558a-a89a-7891ec2cb9c3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Phloem tubes are specialised for:',
    '["Water transport", "Translocation (transporting dissolved sugars)", "Photosynthesis", "Support"]'::jsonb,
    '1'::jsonb,
    'Phloem transports sugars from leaves to the rest of the plant.',
    ARRAY['[', 'S', 'u', 'g', 'a', 'r', ' ', 't', 'r', 'a', 'n', 's', 'p', 'o', 'r', 't', '.', ',', 'T', 'r', 'a', 'n', 's', 'l', 'o', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a1762881-3d8c-5000-9d3c-4bb4d0e0d872',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Why are white blood cells larger than red blood cells?',
    '["They are not", "WBCs need space for organelles to produce antibodies and engulf pathogens", "They carry more oxygen", "They are plant cells"]'::jsonb,
    '1'::jsonb,
    'WBCs have a nucleus and organelles for immune functions.',
    ARRAY['[', 'I', 'm', 'm', 'u', 'n', 'e', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ',', 'P', 'h', 'a', 'g', 'o', 'c', 'y', 't', 'o', 's', 'i', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ef7c4cdb-6ee4-5314-9492-02c8b24abcfa',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'fill_in_blank',
    'How is a palisade cell adapted for photosynthesis?',
    NULL,
    '"chloroplasts"'::jsonb,
    'Palisade cells have many chloroplasts, a large surface area, and are near the leaf surface.',
    ARRAY['[', 'L', 'i', 'g', 'h', 't', ' ', 'c', 'a', 'p', 't', 'u', 'r', 'e', '.', ',', 'P', 'h', 'o', 't', 'o', 's', 'y', 'n', 't', 'h', 'e', 's', 'i', 's', ' ', 'l', 'o', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd651e5e9-fa9a-5828-a387-c7f70092d563',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'fill_in_blank',
    'Explain why muscle cells have many mitochondria.',
    NULL,
    '"energy"'::jsonb,
    'Muscles contract frequently, requiring lots of ATP - mitochondria provide this energy.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'd', 'e', 'm', 'a', 'n', 'd', '.', ',', 'A', 'c', 't', 'i', 'v', 'e', ' ', 't', 'i', 's', 's', 'u', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6f0bd665-87ff-5e11-8702-5aada132028e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Why do ciliated epithelial cells have tiny hair-like structures?',
    '["For decoration", "Cilia move mucus and trapped particles along the airway", "To absorb nutrients", "To produce mucus"]'::jsonb,
    '1'::jsonb,
    'Cilia beat rhythmically to move mucus in the respiratory tract.',
    ARRAY['[', 'D', 'e', 'f', 'e', 'n', 'c', 'e', ' ', 'm', 'e', 'c', 'h', 'a', 'n', 'i', 's', 'm', '.', ',', 'M', 'u', 'c', 'o', 'c', 'i', 'l', 'i', 'a', 'r', 'y', ' ', 'e', 's', 'c', 'a', 'l', 'a', 't', 'o', 'r', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0fe2c152-7f4a-5560-91e3-764e0b1641e4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'A cell has a large central vacuole, chloroplasts, and a cell wall. What type of cell is it?',
    '["Animal cell", "Plant cell", "Bacterial cell", "Fungal cell"]'::jsonb,
    '1'::jsonb,
    'Large vacuole + chloroplasts + cell wall = plant cell.',
    ARRAY['[', 'P', 'l', 'a', 'n', 't', '-', 's', 'p', 'e', 'c', 'i', 'f', 'i', 'c', ' ', 'f', 'e', 'a', 't', 'u', 'r', 'e', 's', '.', ',', 'P', 'h', 'o', 't', 'o', 's', 'y', 'n', 't', 'h', 'e', 's', 'i', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1e70b602-f405-5a4b-a428-5a745c081793',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Why are egg cells much larger than sperm cells?',
    '["Random size", "Egg cells store nutrients for the developing embryo", "Sperm have more DNA", "Egg cells swim"]'::jsonb,
    '1'::jsonb,
    'Egg cells contain nutrient reserves (cytoplasm) to support early development.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 's', 't', 'o', 'r', 'a', 'g', 'e', '.', ',', 'E', 'm', 'b', 'r', 'y', 'o', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b649dfe2-acda-5be3-9171-45c5beedbae2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'fill_in_blank',
    'How does the structure of a neuron support its function?',
    NULL,
    '"long axon"'::jsonb,
    'Long axon (transmits signals over distance), dendrites (receive signals), myelin sheath (insulation).',
    ARRAY['[', 'S', 'i', 'g', 'n', 'a', 'l', ' ', 't', 'r', 'a', 'n', 's', 'm', 'i', 's', 's', 'i', 'o', 'n', '.', ',', 'S', 'p', 'e', 'e', 'd', ' ', 'a', 'n', 'd', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8725bd60-620b-571e-b4df-955861f0d60c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Why do guard cells change shape?',
    '["For decoration", "They open and close stomata to control gas exchange and water loss", "To produce chlorophyll", "To absorb water"]'::jsonb,
    '1'::jsonb,
    'Guard cells swell/shrink to open/close stomata based on water availability.',
    ARRAY['[', 'G', 'a', 's', ' ', 'e', 'x', 'c', 'h', 'a', 'n', 'g', 'e', ' ', 'c', 'o', 'n', 't', 'r', 'o', 'l', '.', ',', 'T', 'r', 'a', 'n', 's', 'p', 'i', 'r', 'a', 't', 'i', 'o', 'n', ' ', 'r', 'e', 'g', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7f71cb42-6473-5bbc-9da6-733f2602ded0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.1.2.1'), NULL, 'multiple_choice',
    'Compare the adaptations of a root hair cell and a palisade cell.',
    '["They are identical", "Root hair: large surface area for absorption. Palisade: many chloroplasts for photosynthesis.", "Both do photosynthesis", "Both absorb water"]'::jsonb,
    '1'::jsonb,
    'Different functions require different structural adaptations.',
    ARRAY['[', 'S', 'p', 'e', 'c', 'i', 'a', 'l', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ',', 'L', 'o', 'c', 'a', 't', 'i', 'o', 'n', '-', 's', 'p', 'e', 'c', 'i', 'f', 'i', 'c', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.2.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '511176d6-86ec-51b7-93c6-1ee2cb2aeaee',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'fill_in_blank',
    'The nitrogen cycle describes the movement of ___ through ecosystems.',
    NULL,
    '"nitrogen"'::jsonb,
    'Nitrogen moves between the atmosphere, soil, plants, and animals.',
    ARRAY['[', 'E', 's', 's', 'e', 'n', 't', 'i', 'a', 'l', ' ', 'e', 'l', 'e', 'm', 'e', 'n', 't', '.', ',', 'A', 'l', 'l', ' ', 'l', 'i', 'v', 'i', 'n', 'g', ' ', 't', 'h', 'i', 'n', 'g', 's', ' ', 'n', 'e', 'e', 'd', ' ', 'i', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd6d3eaf0-78cc-5ac1-bf20-980fb23cd3bd',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'fill_in_blank',
    'The atmosphere is about ___% nitrogen.',
    NULL,
    '"78"'::jsonb,
    'Nitrogen makes up 78% of the atmosphere.',
    ARRAY['[', 'M', 'a', 'j', 'o', 'r', ' ', 'c', 'o', 'm', 'p', 'o', 'n', 'e', 'n', 't', '.', ',', 'M', 'o', 's', 't', ' ', 'a', 'b', 'u', 'n', 'd', 'a', 'n', 't', ' ', 'g', 'a', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '99588678-164e-5692-b13c-0ed583d05d3d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Nitrogen fixation converts atmospheric N2 into:',
    '["Oxygen", "Ammonia or nitrates that plants can use", "Carbon dioxide", "Water"]'::jsonb,
    '1'::jsonb,
    'Nitrogen fixation makes N2 usable by plants.',
    ARRAY['[', 'B', 'a', 'c', 't', 'e', 'r', 'i', 'a', 'l', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ',', 'E', 's', 's', 'e', 'n', 't', 'i', 'a', 'l', ' ', 'f', 'o', 'r', ' ', 'l', 'i', 'f', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6b8be1ad-32e6-599e-bbf9-abe5e570fb79',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Nitrogen-fixing bacteria are found in:',
    '["The air", "Root nodules of leguminous plants", "In water only", "In rocks"]'::jsonb,
    '1'::jsonb,
    'Rhizobium bacteria in legume root nodules fix atmospheric nitrogen.',
    ARRAY['[', 'S', 'y', 'm', 'b', 'i', 'o', 't', 'i', 'c', ' ', 'r', 'e', 'l', 'a', 't', 'i', 'o', 'n', 's', 'h', 'i', 'p', '.', ',', 'L', 'e', 'g', 'u', 'm', 'e', ' ', 'p', 'l', 'a', 'n', 't', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f71e0368-61c1-50af-9156-e9ff3ff2d54a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Plants absorb nitrogen from the soil in the form of:',
    '["N2 gas", "Nitrates and ammonium ions", "Pure nitrogen", "Nitrogen oxides"]'::jsonb,
    '1'::jsonb,
    'Plants take up nitrogen as nitrate (NO3⁻) or ammonium (NH4⁺) ions.',
    ARRAY['[', 'S', 'o', 'i', 'l', ' ', 'n', 'u', 't', 'r', 'i', 'e', 'n', 't', 's', '.', ',', 'R', 'o', 'o', 't', ' ', 'a', 'b', 's', 'o', 'r', 'p', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4424647f-c4b3-59ac-bcb1-10ba2a6a5011',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Denitrification converts nitrates back to:',
    '["Ammonia", "Nitrogen gas (N2) in the atmosphere", "Proteins", "Nitrates"]'::jsonb,
    '1'::jsonb,
    'Denitrifying bacteria return nitrogen to the atmosphere as N2.',
    ARRAY['[', 'R', 'e', 'v', 'e', 'r', 's', 'e', ' ', 'o', 'f', ' ', 'f', 'i', 'x', 'a', 't', 'i', 'o', 'n', '.', ',', 'A', 'n', 'a', 'e', 'r', 'o', 'b', 'i', 'c', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95495f53-4bdc-5330-ad28-4dbf099cf009',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Why is nitrogen essential for living organisms?',
    '["For energy only", "Nitrogen is needed for proteins, DNA, and chlorophyll", "For structure only", "It is not essential"]'::jsonb,
    '1'::jsonb,
    'Nitrogen is a key component of amino acids, nucleic acids, and chlorophyll.',
    ARRAY['[', 'B', 'i', 'o', 'l', 'o', 'g', 'i', 'c', 'a', 'l', ' ', 'm', 'o', 'l', 'e', 'c', 'u', 'l', 'e', 's', '.', ',', 'G', 'r', 'o', 'w', 't', 'h', ' ', 'r', 'e', 'q', 'u', 'i', 'r', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '55327f3d-893c-5a79-8848-503d2fc357cb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Lightning contributes to the nitrogen cycle by:',
    '["Producing rain", "Converting atmospheric N2 into nitrogen oxides that dissolve in rain", "Killing bacteria", "Creating ozone"]'::jsonb,
    '1'::jsonb,
    'Lightning provides energy to combine N2 and O2 into nitrogen oxides.',
    ARRAY['[', 'N', 'a', 't', 'u', 'r', 'a', 'l', ' ', 'f', 'i', 'x', 'a', 't', 'i', 'o', 'n', '.', ',', 'A', 't', 'm', 'o', 's', 'p', 'h', 'e', 'r', 'i', 'c', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf8845c5-2afa-547b-a220-f34804f459a0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'What happens to nitrogen in dead organisms?',
    '["It disappears", "Decomposers release nitrogen compounds back into the soil", "It goes to the atmosphere directly", "It turns into carbon"]'::jsonb,
    '1'::jsonb,
    'Decomposition releases nitrogen as ammonia, which bacteria convert to nitrates.',
    ARRAY['[', 'D', 'e', 'c', 'o', 'm', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n', '.', ',', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 'r', 'e', 'c', 'y', 'c', 'l', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '73cbf5db-056e-5142-883c-9483d001086c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Why do farmers rotate crops with legumes?',
    '["It looks nice", "Legumes add nitrogen to the soil through nitrogen-fixing bacteria", "Legumes need less water", "Legumes grow faster"]'::jsonb,
    '1'::jsonb,
    'Legume root bacteria fix nitrogen, enriching the soil for the next crop.',
    ARRAY['[', 'N', 'a', 't', 'u', 'r', 'a', 'l', ' ', 'f', 'e', 'r', 't', 'i', 'l', 'i', 's', 'e', 'r', '.', ',', 'S', 'o', 'i', 'l', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '356d9677-63bc-5943-b3ed-01d5365a9a2a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'fill_in_blank',
    'Name one organism involved in nitrogen fixation.',
    NULL,
    '"Rhizobium"'::jsonb,
    'Rhizobium (root nodule bacteria), Azotobacter (free-living), cyanobacteria.',
    ARRAY['[', 'B', 'a', 'c', 't', 'e', 'r', 'i', 'a', '.', ',', 'S', 'y', 'm', 'b', 'i', 'o', 't', 'i', 'c', ' ', 'o', 'r', ' ', 'f', 'r', 'e', 'e', '-', 'l', 'i', 'v', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a537e402-51c8-5c65-a8a4-b02ce751c6a5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'The main reservoir of nitrogen is:',
    '["The soil", "The atmosphere", "The oceans", "Living organisms"]'::jsonb,
    '1'::jsonb,
    'The atmosphere contains 78% nitrogen - the largest reservoir.',
    ARRAY['[', 'N', '2', ' ', 'g', 'a', 's', '.', ',', 'A', 'b', 'u', 'n', 'd', 'a', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e969e188-8019-598f-bec1-0ec17ad8c1f5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'fill_in_blank',
    'Why is the nitrogen cycle important for agriculture?',
    NULL,
    '"soil fertility"'::jsonb,
    'The cycle replenishes soil nitrogen that crops take up, maintaining fertility.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 'r', 'e', 'p', 'l', 'e', 'n', 'i', 's', 'h', 'm', 'e', 'n', 't', '.', ',', 'C', 'r', 'o', 'p', ' ', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e33c7f96-b07b-594b-a827-b046fe68aa7b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Excessive use of nitrogen fertilisers can cause:',
    '["Better crops always", "Water pollution through eutrophication", "More nitrogen in the atmosphere", "Nothing harmful"]'::jsonb,
    '1'::jsonb,
    'Excess nitrates wash into water bodies, causing algal blooms and eutrophication.',
    ARRAY['[', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ',', 'W', 'a', 't', 'e', 'r', ' ', 'p', 'o', 'l', 'l', 'u', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f12c1b18-3f0e-530a-9aae-91b90eda091f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'How does deforestation affect the nitrogen cycle?',
    '["No effect", "Removing trees reduces nitrogen uptake and increases leaching from soil", "Adds nitrogen to soil", "Speeds up the cycle"]'::jsonb,
    '1'::jsonb,
    'Without trees, nitrogen leaches from soil, reducing fertility.',
    ARRAY['[', 'S', 'o', 'i', 'l', ' ', 'd', 'e', 'g', 'r', 'a', 'd', 'a', 't', 'i', 'o', 'n', '.', ',', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 'l', 'o', 's', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf1d76c7-a51b-5bcf-9945-6e2bd68ab686',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Why can plants not use atmospheric N2 directly?',
    '["They can", "N2 is very stable and unreactive; plants need nitrogen in reactive forms (nitrates/ammonium)", "N2 is toxic", "Plants have no roots"]'::jsonb,
    '1'::jsonb,
    'The triple bond in N2 is very strong - bacteria must break it first.',
    ARRAY['[', 'C', 'h', 'e', 'm', 'i', 'c', 'a', 'l', ' ', 's', 't', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ',', 'C', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', ' ', 'n', 'e', 'e', 'd', 'e', 'd', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '85a982a6-c3f2-53bf-905f-9bc804f671d2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'multiple_choice',
    'Compare nitrogen fixation by lightning vs by bacteria.',
    '["They are identical", "Lightning fixes small amounts (natural); bacteria fix large amounts (biological)", "Lightning fixes more", "Bacteria fix less"]'::jsonb,
    '1'::jsonb,
    'Biological fixation by bacteria is far more significant than lightning fixation.',
    ARRAY['[', 'S', 'c', 'a', 'l', 'e', ' ', 'd', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 'c', 'e', '.', ',', 'B', 'i', 'o', 'l', 'o', 'g', 'i', 'c', 'a', 'l', ' ', 'd', 'o', 'm', 'i', 'n', 'a', 'n', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b1276509-85a9-576a-a289-0517d43abd34',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'fill_in_blank',
    'A farmer wants to reduce chemical fertiliser use. How can understanding the nitrogen cycle help?',
    NULL,
    '"crop rotation"'::jsonb,
    'Use legume rotation, composting, and cover crops to naturally replenish soil nitrogen.',
    ARRAY['[', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'f', 'a', 'r', 'm', 'i', 'n', 'g', '.', ',', 'N', 'a', 't', 'u', 'r', 'a', 'l', ' ', 'f', 'e', 'r', 't', 'i', 'l', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2f793048-4bc7-5807-8405-da59d46abd96',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'fill_in_blank',
    'What would happen if all nitrogen-fixing bacteria disappeared?',
    NULL,
    '"nitrogen depletion"'::jsonb,
    'Plants would run out of usable nitrogen, food chains would collapse.',
    ARRAY['[', 'C', 'r', 'i', 't', 'i', 'c', 'a', 'l', ' ', 'r', 'o', 'l', 'e', '.', ',', 'E', 'c', 'o', 's', 'y', 's', 't', 'e', 'm', ' ', 'c', 'o', 'l', 'l', 'a', 'p', 's', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '317e1eb8-bc10-5ada-bc07-e817ac588624',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.1.1'), NULL, 'fill_in_blank',
    'Why are legumes called "green manure"?',
    NULL,
    '"nitrogen enrichment"'::jsonb,
    'Legumes add nitrogen to the soil when incorporated, acting as natural fertiliser.',
    ARRAY['[', 'S', 'o', 'i', 'l', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ',', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'p', 'r', 'a', 'c', 't', 'i', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.2.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'edd2e891-2f1a-510c-95e5-001255859b47',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'fill_in_blank',
    'The grasshopper undergoes ___ metamorphosis.',
    NULL,
    '"incomplete"'::jsonb,
    'Grasshoppers have incomplete metamorphosis: egg → nymph → adult.',
    ARRAY['[', 'T', 'h', 'r', 'e', 'e', ' ', 's', 't', 'a', 'g', 'e', 's', '.', ',', 'N', 'y', 'm', 'p', 'h', ' ', 'l', 'o', 'o', 'k', 's', ' ', 'l', 'i', 'k', 'e', ' ', 's', 'm', 'a', 'l', 'l', ' ', 'a', 'd', 'u', 'l', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '74d79f6a-a19a-5444-a97b-bac3b432b3cd',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'How many stages are in the grasshopper life cycle?',
    '["2", "3", "4", "5"]'::jsonb,
    '1'::jsonb,
    'Three stages: egg, nymph, adult.',
    ARRAY['[', 'I', 'n', 'c', 'o', 'm', 'p', 'l', 'e', 't', 'e', ' ', 'm', 'e', 't', 'a', 'm', 'o', 'r', 'p', 'h', 'o', 's', 'i', 's', '.', ',', 'N', 'o', ' ', 'p', 'u', 'p', 'a', 'l', ' ', 's', 't', 'a', 'g', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6cb4d9da-affd-54e8-981c-e8114172fdf8',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'The correct order of the grasshopper life cycle is:',
    '["Adult, nymph, egg", "Egg, nymph, adult", "Egg, pupa, adult", "Nymph, egg, adult"]'::jsonb,
    '1'::jsonb,
    'Egg → nymph → adult.',
    ARRAY['[', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'p', 'r', 'o', 'g', 'r', 'e', 's', 's', 'i', 'o', 'n', '.', ',', 'G', 'r', 'a', 'd', 'u', 'a', 'l', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f7bb5546-3009-56da-8696-e08e3e01145d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'A grasshopper nymph looks like:',
    '["A worm", "A small version of the adult without wings", "A caterpillar", "A pupa"]'::jsonb,
    '1'::jsonb,
    'Nymphs resemble adults but are smaller and lack fully developed wings.',
    ARRAY['[', 'G', 'r', 'a', 'd', 'u', 'a', 'l', ' ', 'd', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', '.', ',', 'S', 'i', 'm', 'i', 'l', 'a', 'r', ' ', 'f', 'o', 'r', 'm', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd31332d3-5f8b-5362-bdeb-5694b3f28902',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'Grasshopper eggs are laid in:',
    '["Water", "Pods in the soil", "On leaves", "In nests"]'::jsonb,
    '1'::jsonb,
    'Female grasshoppers lay egg pods in the soil.',
    ARRAY['[', 'U', 'n', 'd', 'e', 'r', 'g', 'r', 'o', 'u', 'n', 'd', ' ', 'e', 'g', 'g', 's', '.', ',', 'P', 'r', 'o', 't', 'e', 'c', 't', 'e', 'd', ' ', 'l', 'o', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd37c522a-de13-5d2f-a454-b59c645649bf',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'How does incomplete metamorphosis differ from complete metamorphosis?',
    '["No difference", "Incomplete has no pupal stage; nymph resembles adult. Complete has larva, pupa, adult.", "Incomplete has more stages", "Complete has fewer stages"]'::jsonb,
    '1'::jsonb,
    'Incomplete: egg → nymph → adult (no larva/pupa).',
    ARRAY['[', 'T', 'h', 'r', 'e', 'e', ' ', 'v', 's', ' ', 'f', 'o', 'u', 'r', ' ', 's', 't', 'a', 'g', 'e', 's', '.', ',', 'G', 'r', 'a', 'd', 'u', 'a', 'l', ' ', 'v', 's', ' ', 'd', 'r', 'a', 'm', 'a', 't', 'i', 'c', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'caa55236-e5bb-5a04-879d-2e74e7208183',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'Why are grasshoppers considered pests?',
    '["They are not", "They eat crop leaves, causing significant agricultural damage", "They pollinate flowers", "They improve soil"]'::jsonb,
    '1'::jsonb,
    'Grasshoppers are herbivores that can devastate crops in swarms.',
    ARRAY['[', 'C', 'r', 'o', 'p', ' ', 'd', 'a', 'm', 'a', 'g', 'e', '.', ',', 'L', 'o', 'c', 'u', 's', 't', ' ', 's', 'w', 'a', 'r', 'm', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5484256d-9446-578b-a053-e95e3edf60b3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'How do grasshopper nymphs grow?',
    '["They do not grow", "They moult (shed their exoskeleton) multiple times as they grow", "They eat more", "They change colour"]'::jsonb,
    '1'::jsonb,
    'Nymphs moult 5-6 times, growing larger with each moult.',
    ARRAY['[', 'E', 'c', 'd', 'y', 's', 'i', 's', '.', ',', 'E', 'x', 'o', 's', 'k', 'e', 'l', 'e', 't', 'o', 'n', ' ', 'l', 'i', 'm', 'i', 't', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4e4e115f-4a4f-5181-8133-83fb90e1d09b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'Why must grasshoppers moult?',
    '["For fun", "Their exoskeleton is rigid and cannot grow, so they shed it to grow larger", "To change colour", "To reproduce"]'::jsonb,
    '1'::jsonb,
    'Rigid exoskeleton limits growth - moulting allows expansion.',
    ARRAY['[', 'G', 'r', 'o', 'w', 't', 'h', ' ', 'l', 'i', 'm', 'i', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'N', 'e', 'w', ' ', 'e', 'x', 'o', 's', 'k', 'e', 'l', 'e', 't', 'o', 'n', ' ', 'f', 'o', 'r', 'm', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4d6b3463-0cbd-5d58-bcc6-7a8b30a590d7',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'Grasshoppers are important in ecosystems because:',
    '["They are not", "They are food for birds and other animals, and they recycle nutrients", "They pollinate all plants", "They fix nitrogen"]'::jsonb,
    '1'::jsonb,
    'Grasshoppers are food for predators and contribute to nutrient cycling.',
    ARRAY['[', 'F', 'o', 'o', 'd', ' ', 'c', 'h', 'a', 'i', 'n', ' ', 'r', 'o', 'l', 'e', '.', ',', 'E', 'c', 'o', 'l', 'o', 'g', 'i', 'c', 'a', 'l', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aa76ead4-046e-5841-956e-5e14e17a2002',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'fill_in_blank',
    'Name one difference between a grasshopper nymph and an adult.',
    NULL,
    '"wings"'::jsonb,
    'Nymphs have wing buds (incomplete wings); adults have fully developed wings.',
    ARRAY['[', 'D', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', ' ', 's', 't', 'a', 'g', 'e', '.', ',', 'R', 'e', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'v', 'e', ' ', 'm', 'a', 't', 'u', 'r', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a7d4280b-9cf8-5d11-8c90-3e75a8f044c4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'Why do grasshoppers lay many eggs?',
    '["They are greedy", "Many eggs increase the chances of some offspring surviving predation and harsh conditions", "They have space", "They do not care for young"]'::jsonb,
    '1'::jsonb,
    'High egg numbers compensate for high mortality rates.',
    ARRAY['[', 'R', 'e', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'v', 'e', ' ', 's', 't', 'r', 'a', 't', 'e', 'g', 'y', '.', ',', 'S', 'u', 'r', 'v', 'i', 'v', 'a', 'l', ' ', 'r', 'a', 't', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e94527fe-8995-5c18-bd99-c9a1748d2b45',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'How does the grasshopper''s life cycle differ from a butterfly''s?',
    '["They are identical", "Grasshopper: incomplete (no pupa). Butterfly: complete (has larva and pupa).", "Grasshopper has more stages", "Butterfly has fewer stages"]'::jsonb,
    '1'::jsonb,
    'Key difference: presence or absence of a pupal stage.',
    ARRAY['[', 'M', 'e', 't', 'a', 'm', 'o', 'r', 'p', 'h', 'o', 's', 'i', 's', ' ', 't', 'y', 'p', 'e', '.', ',', 'D', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', ' ', 'p', 'a', 't', 't', 'e', 'r', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'abb155dd-2d99-5229-9008-adfbb08dbca9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'fill_in_blank',
    'Why are grasshoppers more common in warm climates?',
    NULL,
    '"temperature"'::jsonb,
    'Warmer temperatures speed up development and allow longer breeding seasons.',
    ARRAY['[', 'T', 'e', 'm', 'p', 'e', 'r', 'a', 't', 'u', 'r', 'e', '-', 'd', 'e', 'p', 'e', 'n', 'd', 'e', 'n', 't', '.', ',', 'M', 'e', 't', 'a', 'b', 'o', 'l', 'i', 'c', ' ', 'r', 'a', 't', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f9151c7a-929c-58b9-853f-f114d7a0c39c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'fill_in_blank',
    'A farmer notices grasshopper damage on their maize. What control methods could they use?',
    NULL,
    '"pesticides"'::jsonb,
    'Biological control (natural predators), pesticides, crop rotation, and early planting.',
    ARRAY['[', 'I', 'n', 't', 'e', 'g', 'r', 'a', 't', 'e', 'd', ' ', 'p', 'e', 's', 't', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ',', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'm', 'e', 't', 'h', 'o', 'd', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2a1a9def-bd99-564b-ae48-15ee1be094d7',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'Explain why grasshoppers can cause more damage than caterpillars.',
    '["They cannot", "Grasshoppers eat continuously as nymphs and adults; caterpillars only eat in the larval stage", "Caterpillars are bigger", "Grahoppers are slower"]'::jsonb,
    '1'::jsonb,
    'Grasshoppers feed throughout their life cycle, not just one stage.',
    ARRAY['[', 'E', 'x', 't', 'e', 'n', 'd', 'e', 'd', ' ', 'f', 'e', 'e', 'd', 'i', 'n', 'g', '.', ',', 'A', 'l', 'l', ' ', 's', 't', 'a', 'g', 'e', 's', ' ', 'h', 'a', 'r', 'm', 'f', 'u', 'l', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '61362f94-9492-5224-a2eb-c334209e0836',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'fill_in_blank',
    'How does moulting make grasshoppers vulnerable?',
    NULL,
    '"soft exoskeleton"'::jsonb,
    'After moulting, the new exoskeleton is soft - grasshoppers are vulnerable to predators until it hardens.',
    ARRAY['[', 'V', 'u', 'l', 'n', 'e', 'r', 'a', 'b', 'i', 'l', 'i', 't', 'y', ' ', 'p', 'e', 'r', 'i', 'o', 'd', '.', ',', 'P', 'r', 'e', 'd', 'a', 't', 'i', 'o', 'n', ' ', 'r', 'i', 's', 'k', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5bfd7f1b-744e-563e-bb8b-bb135679b87f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'Why do locust swarms cause devastating crop damage?',
    '["Individual grasshoppers eat a lot", "Swarming behaviour triggers mass feeding and migration, consuming everything in their path", "Locusts are bigger", "They eat roots"]'::jsonb,
    '1'::jsonb,
    'Swarming triggers behavioural changes: gregarious feeding and long-distance migration.',
    ARRAY['[', 'P', 'h', 'a', 's', 'e', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ',', 'M', 'a', 's', 's', ' ', 'd', 'e', 's', 't', 'r', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7e725b3a-fc6c-506f-80df-79f265904ead',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'fill_in_blank',
    'A grasshopper has short antennae and wings that fold along its body. What order of insects does it belong to?',
    NULL,
    '"Orthoptera"'::jsonb,
    'Orthoptera: grasshoppers, crickets, locusts - short antennae, jumping legs.',
    ARRAY['[', 'I', 'n', 's', 'e', 'c', 't', ' ', 'c', 'l', 'a', 's', 's', 'i', 'f', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'T', 'a', 'x', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'o', 'r', 'd', 'e', 'r', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1b99c2c8-9b25-55cb-90b7-3ff46474d149',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.2.1'), NULL, 'multiple_choice',
    'Why is understanding insect life cycles important for pest control?',
    '["It is not", "Knowing the vulnerable stages (egg, nymph) allows targeted control measures", "For fun", "For naming species"]'::jsonb,
    '1'::jsonb,
    'Targeting vulnerable stages is more effective and uses fewer pesticides.',
    ARRAY['[', 'I', 'n', 't', 'e', 'g', 'r', 'a', 't', 'e', 'd', ' ', 'p', 'e', 's', 't', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ',', 'L', 'i', 'f', 'e', ' ', 'c', 'y', 'c', 'l', 'e', ' ', 'k', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.2.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c09a7ae1-1b5b-5e62-a71d-c02fbd5da621',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Crops mature at different rates depending on:',
    '["Season only", "Variety, soil, water, and temperature", "Colour", "Size of seed"]'::jsonb,
    '1'::jsonb,
    'Multiple factors affect maturation time.',
    ARRAY['[', 'G', 'r', 'o', 'w', 't', 'h', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ',', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'a', 'n', 'd', ' ', 'g', 'e', 'n', 'e', 't', 'i', 'c', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'df6399f7-517c-545a-9b31-1158d9e0f44d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Fast-maturing crop varieties are useful because:',
    '["They taste better", "They allow multiple harvests per year", "They need less water", "They are bigger"]'::jsonb,
    '1'::jsonb,
    'Quick maturation enables more cropping cycles.',
    ARRAY['[', 'F', 'o', 'o', 'd', ' ', 's', 'e', 'c', 'u', 'r', 'i', 't', 'y', '.', ',', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'h', 'a', 'r', 'v', 'e', 's', 't', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7c481d6c-e266-5475-9528-a413b4cce741',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Soil fertility affects crop maturation because:',
    '["It does not", "Nutrient-rich soil promotes faster, healthier growth", "It changes colour", "It makes crops smaller"]'::jsonb,
    '1'::jsonb,
    'Adequate nutrients support optimal growth rates.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 'a', 'v', 'a', 'i', 'l', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ',', 'G', 'r', 'o', 'w', 't', 'h', ' ', 'r', 'a', 't', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8ec956cb-cd49-51ae-87cd-cc28dc55c891',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Drought stress causes crops to:',
    '["Grow faster", "Mature more slowly or fail to produce grain", "Change colour", "Produce more seeds"]'::jsonb,
    '1'::jsonb,
    'Water stress reduces photosynthesis and delays development.',
    ARRAY['[', 'W', 'a', 't', 'e', 'r', ' ', 'l', 'i', 'm', 'i', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'G', 'r', 'o', 'w', 't', 'h', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b6ec5dff-bf48-5e29-9d23-0975a9f63df0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'A farmer plants two maize varieties: one matures in 90 days, another in 120 days. Which is better for a short rainy season?',
    '["120-day variety", "90-day variety", "Both are the same", "Neither works"]'::jsonb,
    '1'::jsonb,
    'Shorter maturation suits shorter growing seasons.',
    ARRAY['[', 'S', 'e', 'a', 's', 'o', 'n', ' ', 'm', 'a', 't', 'c', 'h', 'i', 'n', 'g', '.', ',', 'R', 'i', 's', 'k', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '52dd6a54-e41c-5203-9b30-c095c4092174',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Record keeping helps farmers compare crop performance by:',
    '["Looking at pictures", "Tracking yields, growth rates, and conditions over time", "Guessing", "Listening to neighbours"]'::jsonb,
    '1'::jsonb,
    'Data-driven decisions improve farming outcomes.',
    ARRAY['[', 'E', 'v', 'i', 'd', 'e', 'n', 'c', 'e', '-', 'b', 'a', 's', 'e', 'd', ' ', 'f', 'a', 'r', 'm', 'i', 'n', 'g', '.', ',', 'C', 'o', 'n', 't', 'i', 'n', 'u', 'o', 'u', 's', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b92934de-d9c8-5a31-8f93-d0021d57f3f4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'fill_in_blank',
    'A farmer observes their maize is shorter than expected. List two possible causes.',
    NULL,
    '"nutrient deficiency"'::jsonb,
    'Poor soil nutrients, insufficient water, wrong variety, or late planting.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ',', 'D', 'i', 'a', 'g', 'n', 'o', 's', 'i', 's', ' ', 'n', 'e', 'e', 'd', 'e', 'd', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '702621e3-1a31-5dbd-bebd-b2b74c30ef1a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Why might a farmer choose a slow-maturing variety over a fast one?',
    '["No reason", "Slow varieties may have higher yield, drought resistance, or better taste", "Slow is always better", "Fast is always better"]'::jsonb,
    '1'::jsonb,
    'Slow varieties may offer traits that justify the longer growing period.',
    ARRAY['[', 'T', 'r', 'a', 'd', 'e', '-', 'o', 'f', 'f', ' ', 'a', 'n', 'a', 'l', 'y', 's', 'i', 's', '.', ',', 'C', 'o', 'n', 't', 'e', 'x', 't', '-', 'd', 'e', 'p', 'e', 'n', 'd', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ce45c9c5-a213-5cf6-a632-2b916fb852c3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'fill_in_blank',
    'How does temperature affect crop maturation?',
    NULL,
    '"enzyme activity"'::jsonb,
    'Temperature affects enzyme activity and photosynthesis rate, directly influencing growth speed.',
    ARRAY['[', 'O', 'p', 't', 'i', 'm', 'a', 'l', ' ', 'r', 'a', 'n', 'g', 'e', '.', ',', 'T', 'o', 'o', ' ', 'h', 'o', 't', ' ', 'o', 'r', ' ', 'c', 'o', 'l', 'd', ' ', 's', 'l', 'o', 'w', 's', ' ', 'g', 'r', 'o', 'w', 't', 'h', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1a2f2bdf-24df-5d62-9cfa-d2f135b101ba',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Why is spacing important for crop maturation?',
    '["It is not", "Proper spacing ensures each plant gets enough light, water, and nutrients for optimal growth", "To look neat", "To use less water"]'::jsonb,
    '1'::jsonb,
    'Crowded plants compete for resources, delaying maturation.',
    ARRAY['[', 'C', 'o', 'm', 'p', 'e', 't', 'i', 't', 'i', 'o', 'n', '.', ',', 'O', 'p', 't', 'i', 'm', 'a', 'l', ' ', 'd', 'e', 'n', 's', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4e63cdce-0733-5d65-b5f8-3af0ab1e7bfc',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Compare early and late maturing varieties of the same crop.',
    '["They are identical", "Early: faster harvest, lower yield potential. Late: slower but potentially higher yield.", "Early is always better", "Late is always better"]'::jsonb,
    '1'::jsonb,
    'Trade-off between speed and yield potential.',
    ARRAY['[', 'V', 'a', 'r', 'i', 'e', 't', 'y', ' ', 's', 'e', 'l', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 'n', 't', 'e', 'x', 't', ' ', 'm', 'a', 't', 't', 'e', 'r', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ebfe2bba-3bde-5906-8a47-c2d4c30e4741',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'How can a farmer determine the best planting date for a crop?',
    '["Guess", "Based on rainfall patterns, temperature, and variety maturation period", "Plant whenever they want", "Only in January"]'::jsonb,
    '1'::jsonb,
    'Matching planting to climate and variety ensures optimal growth.',
    ARRAY['[', 'A', 'g', 'r', 'i', 'c', 'u', 'l', 't', 'u', 'r', 'a', 'l', ' ', 'c', 'a', 'l', 'e', 'n', 'd', 'a', 'r', '.', ',', 'C', 'l', 'i', 'm', 'a', 't', 'e', ' ', 'm', 'a', 't', 'c', 'h', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ef479dcc-20a6-5159-a31f-e4da832e2bad',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Why might the same crop variety mature at different times in different fields?',
    '["Random chance", "Differences in soil fertility, water availability, and microclimate", "The seeds are different", "The moon phase"]'::jsonb,
    '1'::jsonb,
    'Environmental variations affect growth rate even within the same variety.',
    ARRAY['[', 'F', 'i', 'e', 'l', 'd', ' ', 'c', 'o', 'n', 'd', 'i', 't', 'i', 'o', 'n', 's', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '11b7efa2-8ca3-5b1b-8b4b-debc739e729e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'fill_in_blank',
    'A farmer wants to stagger harvests. How can they use variety selection?',
    NULL,
    '"different varieties"'::jsonb,
    'Plant varieties with different maturation periods to spread harvest over time.',
    ARRAY['[', 'H', 'a', 'r', 'v', 'e', 's', 't', ' ', 'p', 'l', 'a', 'n', 'n', 'i', 'n', 'g', '.', ',', 'C', 'o', 'n', 't', 'i', 'n', 'u', 'o', 'u', 's', ' ', 's', 'u', 'p', 'p', 'l', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1439daa6-450a-5a0c-bb35-c3f2a2041e9e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Why is it important to harvest crops at the right time?',
    '["It is not", "Too early: immature grain. Too late: grain shatters or rots. Right time: maximum yield and quality.", "Any time is fine", "Only for appearance"]'::jsonb,
    '1'::jsonb,
    'Timing affects yield, quality, and storage life.',
    ARRAY['[', 'H', 'a', 'r', 'v', 'e', 's', 't', ' ', 't', 'i', 'm', 'i', 'n', 'g', '.', ',', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'p', 'r', 'e', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '424898a0-da0d-57b4-84c0-5fddcfaaf1ac',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'fill_in_blank',
    'How does photoperiod (day length) affect some crops?',
    NULL,
    '"flowering trigger"'::jsonb,
    'Some crops flower in response to day length - short days or long days trigger flowering.',
    ARRAY['[', 'P', 'h', 'o', 't', 'o', 'p', 'e', 'r', 'i', 'o', 'd', 'i', 's', 'm', '.', ',', 'L', 'i', 'g', 'h', 't', '-', 's', 'e', 'n', 's', 'i', 't', 'i', 'v', 'e', ' ', 'c', 'r', 'o', 'p', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f64a0b9e-428a-5d85-9d83-6bef249b8295',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'A farmer in northern Ghana plants a variety from the south. What problems might occur?',
    '["No problems", "Different rainfall and temperature patterns may cause poor growth or wrong maturation timing", "The crop will grow better", "Government issues"]'::jsonb,
    '1'::jsonb,
    'Varieties are adapted to specific climates - moving them may cause failure.',
    ARRAY['[', 'C', 'l', 'i', 'm', 'a', 't', 'e', ' ', 'a', 'd', 'a', 'p', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'R', 'e', 'g', 'i', 'o', 'n', 'a', 'l', ' ', 's', 'u', 'i', 't', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '228a5bd3-bc8a-548e-86b2-920a5ab276f0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'How can irrigation extend the growing season for crops?',
    '["It cannot", "By providing water during dry periods, allowing crops to continue growing beyond the rainy season", "By adding nutrients", "By changing temperature"]'::jsonb,
    '1'::jsonb,
    'Irrigation removes water as a limiting factor.',
    ARRAY['[', 'D', 'r', 'y', ' ', 's', 'e', 'a', 's', 'o', 'n', ' ', 'f', 'a', 'r', 'm', 'i', 'n', 'g', '.', ',', 'W', 'a', 't', 'e', 'r', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1c4cf522-1cc3-5d90-a4b9-bfc8b15e7d30',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'multiple_choice',
    'Why do some crops mature earlier when planted as seedlings rather than direct-seeded?',
    '["They do not", "Seedlings have a head start - they skip the germination phase in the field", "Seedlings are stronger", "Direct seeding is slower"]'::jsonb,
    '1'::jsonb,
    'Transplanting seedlings saves 2-3 weeks of field time.',
    ARRAY['[', 'N', 'u', 'r', 's', 'e', 'r', 'y', ' ', 'a', 'd', 'v', 'a', 'n', 't', 'a', 'g', 'e', '.', ',', 'T', 'i', 'm', 'e', ' ', 's', 'a', 'v', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3eceac00-b0f0-5009-87ee-3f0988e5ea7c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.1'), NULL, 'fill_in_blank',
    'What is the significance of the "days to maturity" number on seed packets?',
    NULL,
    '"harvest timing"'::jsonb,
    'It tells the farmer how many days from planting to harvest, helping plan the growing season.',
    ARRAY['[', 'P', 'l', 'a', 'n', 'n', 'i', 'n', 'g', ' ', 't', 'o', 'o', 'l', '.', ',', 'H', 'a', 'r', 'v', 'e', 's', 't', ' ', 'p', 'r', 'e', 'd', 'i', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.2.3.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4af2f42f-ec91-5f5c-a53f-fadef8d2d62a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Crops can be used at different stages of maturity for:',
    '["Only one purpose", "Different purposes - green, mature, or dried", "Only animal feed", "Only decoration"]'::jsonb,
    '1'::jsonb,
    'Different maturity stages offer different products and uses.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'u', 's', 'e', 's', '.', ',', 'F', 'l', 'e', 'x', 'i', 'b', 'l', 'e', ' ', 'h', 'a', 'r', 'v', 'e', 's', 't', 'i', 'n', 'g', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e9c4cb17-33f9-5832-a12b-1c5e12131e86',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Green maize (unripe) is used for:',
    '["Animal feed only", "Roasting or boiling as a fresh vegetable", "Making flour", "Seed production"]'::jsonb,
    '1'::jsonb,
    'Green maize is harvested before full maturity for eating.',
    ARRAY['[', 'F', 'r', 'e', 's', 'h', ' ', 'c', 'o', 'n', 's', 'u', 'm', 'p', 't', 'i', 'o', 'n', '.', ',', 'D', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', ' ', 'f', 'r', 'o', 'm', ' ', 'd', 'r', 'i', 'e', 'd', ' ', 'm', 'a', 'i', 'z', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd2dc9831-7f5f-551c-826f-eafbf2bd0ba9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Ripe maize (dried) is used for:',
    '["Only decoration", "Making flour, animal feed, and industrial products", "Eating fresh", "Nothing useful"]'::jsonb,
    '1'::jsonb,
    'Dried maize is processed for flour, feed, and industrial uses.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'p', 'r', 'o', 'd', 'u', 'c', 't', 's', '.', ',', 'S', 't', 'o', 'r', 'a', 'g', 'e', '-', 'f', 'r', 'i', 'e', 'n', 'd', 'l', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '514f2729-4ffb-5a88-81d1-85c0561ee505',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Cassava can be harvested early for:',
    '["Nothing", "Fresh eating (boiled cassava) or left to mature for gari and flour", "Only animal feed", "Only decoration"]'::jsonb,
    '1'::jsonb,
    'Cassava has flexible harvest timing with different end uses.',
    ARRAY['[', 'F', 'o', 'o', 'd', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', 'i', 'n', 'g', '.', ',', 'T', 'i', 'm', 'i', 'n', 'g', ' ', 'm', 'a', 't', 't', 'e', 'r', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd5043ec8-dd5d-5f65-bbaf-1651c065a2d1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Why might a farmer harvest some crops before full maturity?',
    '["No reason", "Green vegetables are more nutritious and tender; market demand may be higher", "To save time", "Crops die if not harvested early"]'::jsonb,
    '1'::jsonb,
    'Early harvest captures peak quality for certain uses.',
    ARRAY['[', 'M', 'a', 'r', 'k', 'e', 't', ' ', 't', 'i', 'm', 'i', 'n', 'g', '.', ',', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'o', 'p', 't', 'i', 'm', 'i', 'z', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '94262ee0-6db1-59fe-bd1e-c870091050a4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Cocoa pods are harvested when:',
    '["They are green", "They are fully ripe and coloured", "They fall off the tree", "Any time"]'::jsonb,
    '1'::jsonb,
    'Ripe cocoa pods change colour and contain mature beans.',
    ARRAY['[', 'H', 'a', 'r', 'v', 'e', 's', 't', ' ', 'i', 'n', 'd', 'i', 'c', 'a', 't', 'o', 'r', '.', ',', 'B', 'e', 'a', 'n', ' ', 'q', 'u', 'a', 'l', 'i', 't', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a63d997a-a739-590a-8d14-304dcae42786',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Why is it important to know the uses of crops at different maturity stages?',
    '["It is not", "It allows farmers to plan harvests for maximum value and multiple income streams", "For decoration", "For fun"]'::jsonb,
    '1'::jsonb,
    'Understanding maturity uses enables income diversification.',
    ARRAY['[', 'V', 'a', 'l', 'u', 'e', ' ', 'o', 'p', 't', 'i', 'm', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ',', 'M', 'a', 'r', 'k', 'e', 't', ' ', 'p', 'l', 'a', 'n', 'n', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd98e4322-9143-530b-98b9-a063ffc4a509',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'A farmer harvests plantain at different stages: green (cooking), ripe (eating), and overripe (beer). This shows:',
    '["Poor farming", "Different maturity stages have different market values and uses", "Waste of crops", "Random harvesting"]'::jsonb,
    '1'::jsonb,
    'Harvesting at different stages maximises value from the same crop.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'p', 'r', 'o', 'd', 'u', 'c', 't', 's', '.', ',', 'I', 'n', 'c', 'o', 'm', 'e', ' ', 'd', 'i', 'v', 'e', 'r', 's', 'i', 'f', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '35d95657-ceb8-5fa4-9fbb-ee07fbec9c92',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Why might a farmer sell green bananas instead of waiting for them to ripen?',
    '["No reason", "Green bananas have a longer shelf life and can be transported to distant markets", "They taste better", "Government policy"]'::jsonb,
    '1'::jsonb,
    'Green bananas last longer in transit, reaching more distant markets.',
    ARRAY['[', 'T', 'r', 'a', 'n', 's', 'p', 'o', 'r', 't', ' ', 'l', 'o', 'g', 'i', 's', 't', 'i', 'c', 's', '.', ',', 'M', 'a', 'r', 'k', 'e', 't', ' ', 'a', 'c', 'c', 'e', 's', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0c75fab5-bd6f-590b-90f3-e50fd6a200ab',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'fill_in_blank',
    'Name one crop that has different uses at different maturity stages.',
    NULL,
    '"plantain"'::jsonb,
    'Plantain: green (boiling), ripe (eating), overripe (fermented drinks). Cassava, maize, and palm fruit also.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'u', 's', 'e', 's', '.', ',', 'F', 'l', 'e', 'x', 'i', 'b', 'l', 'e', ' ', 'h', 'a', 'r', 'v', 'e', 's', 't', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c09e8639-9f46-5202-9c83-1b1f993b4136',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'How does the nutritional content of crops change with maturity?',
    '["It does not change", "Nutrient composition shifts - sugars increase with ripening, starches change", "Younger is always healthier", "Older is always better"]'::jsonb,
    '1'::jsonb,
    'Nutritional changes affect taste, texture, and health benefits.',
    ARRAY['[', 'B', 'i', 'o', 'c', 'h', 'e', 'm', 'i', 'c', 'a', 'l', ' ', 'c', 'h', 'a', 'n', 'g', 'e', 's', '.', ',', 'R', 'i', 'p', 'e', 'n', 'i', 'n', 'g', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '172c71d5-ca55-5fb2-9dae-7d67cde3c3d1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'fill_in_blank',
    'Why might a farmer choose to harvest palm fruit at different stages?',
    NULL,
    '"oil quality"'::jsonb,
    'Young palm fruit has less oil; fully ripe fruit has maximum oil content for processing.',
    ARRAY['[', 'O', 'i', 'l', ' ', 'e', 'x', 't', 'r', 'a', 'c', 't', 'i', 'o', 'n', '.', ',', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'o', 'p', 't', 'i', 'm', 'i', 'z', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e60dc8c9-7ab3-58b3-b649-b1e766d25c32',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'A farmer can sell fresh maize for more than dried maize. Why might they still grow dried maize varieties?',
    '["No reason", "Dried maize stores longer, can be processed into multiple products, and has stable demand", "Fresh maize is always better", "Government requires it"]'::jsonb,
    '1'::jsonb,
    'Dried maize offers storage stability and diverse product options.',
    ARRAY['[', 'V', 'a', 'l', 'u', 'e', ' ', 'c', 'h', 'a', 'i', 'n', '.', ',', 'R', 'i', 's', 'k', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4883dd74-5260-51df-a270-68bffb2e472f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'How does post-harvest handling differ for crops at different maturity stages?',
    '["It does not differ", "Green crops need cool storage; dried crops need dry storage; each has specific requirements", "All crops are stored the same", "Only temperature matters"]'::jsonb,
    '1'::jsonb,
    'Different products require different storage and processing methods.',
    ARRAY['[', 'P', 'o', 's', 't', '-', 'h', 'a', 'r', 'v', 'e', 's', 't', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ',', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'p', 'r', 'e', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '82caafc0-467a-511b-908c-0894176ece72',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Why is value addition important for crops harvested at different stages?',
    '["It is not", "Processing (drying, milling, fermenting) adds value and extends shelf life", "Raw crops are always better", "Only for export"]'::jsonb,
    '1'::jsonb,
    'Value addition increases farmer income and reduces waste.',
    ARRAY['[', 'P', 'r', 'o', 'c', 'e', 's', 's', 'i', 'n', 'g', ' ', 'b', 'e', 'n', 'e', 'f', 'i', 't', 's', '.', ',', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'v', 'a', 'l', 'u', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc776636-ae8b-5c6e-ad17-c458d871dc80',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'fill_in_blank',
    'Explain why some crops are better harvested early for market and others for processing.',
    NULL,
    '"end use"'::jsonb,
    'Market crops prioritise appearance and freshness; processing crops prioritise maturity and starch content.',
    ARRAY['[', 'M', 'a', 'r', 'k', 'e', 't', ' ', 'v', 's', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', 'i', 'n', 'g', '.', ',', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'c', 'r', 'i', 't', 'e', 'r', 'i', 'a', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '609e1c0c-2349-55c4-91dc-ff0e9f027e04',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Why might a farmer stagger harvests of the same crop?',
    '["For fun", "To spread labour, reduce risk, and have continuous supply for market", "To confuse buyers", "To reduce yield"]'::jsonb,
    '1'::jsonb,
    'Staggered harvests provide continuous income and reduce post-harvest losses.',
    ARRAY['[', 'L', 'a', 'b', 'o', 'u', 'r', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ',', 'I', 'n', 'c', 'o', 'm', 'e', ' ', 'f', 'l', 'o', 'w', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e93daac6-494c-5ef0-a45e-74b70e43e3fa',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'How does the market influence when farmers harvest crops?',
    '["Markets do not influence", "Market prices and demand determine optimal harvest timing for maximum profit", "Only weather matters", "Farmers harvest whenever they want"]'::jsonb,
    '1'::jsonb,
    'Market signals (prices, demand) guide harvest decisions.',
    ARRAY['[', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ',', 'M', 'a', 'r', 'k', 'e', 't', '-', 'd', 'r', 'i', 'v', 'e', 'n', ' ', 'f', 'a', 'r', 'm', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '37569944-a178-55c9-815a-23a0245b1367',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'A farmer has both green and ripe tomatoes. How should they handle each?',
    '["Same way", "Green tomatoes can be stored longer; ripe tomatoes need quick sale or processing", "Sell all green", "Let all ripen"]'::jsonb,
    '1'::jsonb,
    'Different maturity stages have different shelf lives and handling needs.',
    ARRAY['[', 'P', 'o', 's', 't', '-', 'h', 'a', 'r', 'v', 'e', 's', 't', ' ', 'h', 'a', 'n', 'd', 'l', 'i', 'n', 'g', '.', ',', 'S', 'h', 'e', 'l', 'f', ' ', 'l', 'i', 'f', 'e', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ebdc37ca-40fa-5574-a4f1-d71a09628465',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.3.2'), NULL, 'multiple_choice',
    'Why is crop diversification (growing crops for different uses) beneficial?',
    '["It is not", "It provides multiple income sources, reduces risk, and improves nutrition", "It increases work", "It uses more land"]'::jsonb,
    '1'::jsonb,
    'Diversification ensures food security and income stability.',
    ARRAY['[', 'R', 'i', 's', 'k', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ',', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'b', 'e', 'n', 'e', 'f', 'i', 't', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.2.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '45948eb0-6886-523a-9b4c-53d5c7eb69f8',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Livestock feed is prepared to:',
    '["Save money", "Provide balanced nutrition for animal health and production", "Kill bacteria", "Make food look good"]'::jsonb,
    '1'::jsonb,
    'Feed preparation ensures animals get the right nutrients.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ',', 'H', 'e', 'a', 'l', 't', 'h', ' ', 'a', 'n', 'd', ' ', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'v', 'i', 't', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9b473626-9251-5232-85f8-2e913fd75c1c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Ingredients for animal feed include grains, protein sources, and:',
    '["Water only", "Minerals and vitamins", "Plastic", "Sand"]'::jsonb,
    '1'::jsonb,
    'Balanced feed needs energy (grains), protein, vitamins, and minerals.',
    ARRAY['[', 'F', 'e', 'e', 'd', ' ', 'c', 'o', 'm', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n', '.', ',', 'N', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'r', 'e', 'q', 'u', 'i', 'r', 'e', 'm', 'e', 'n', 't', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e56c2411-8c00-5e8e-b842-ad53f176df41',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Milling feed ingredients makes them:',
    '["More expensive", "Easier for animals to digest and absorb", "Heavier", "Less nutritious"]'::jsonb,
    '1'::jsonb,
    'Milling breaks down particles, increasing surface area for digestion.',
    ARRAY['[', 'D', 'i', 'g', 'e', 's', 't', 'i', 'b', 'i', 'l', 'i', 't', 'y', '.', ',', 'F', 'e', 'e', 'd', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', 'i', 'n', 'g', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '28f16569-8e9b-52b7-af08-df6b9cc46578',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Mixing feed ingredients ensures:',
    '["Nothing", "Each animal gets a balanced ration with all needed nutrients", "Feed looks uniform", "Animals eat more"]'::jsonb,
    '1'::jsonb,
    'Proper mixing distributes nutrients evenly in the feed.',
    ARRAY['[', 'U', 'n', 'i', 'f', 'o', 'r', 'm', ' ', 'n', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 'n', 's', 'i', 's', 't', 'e', 'n', 't', ' ', 'q', 'u', 'a', 'l', 'i', 't', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5a492d04-19d8-574c-9af0-cb05fdcb75e1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Water is added to feed to:',
    '["Make it heavier", "Make it easier to eat and ensure hydration", "Add weight", "Reduce cost"]'::jsonb,
    '1'::jsonb,
    'Water improves palatability and ensures hydration.',
    ARRAY['[', 'M', 'o', 'i', 's', 't', 'u', 'r', 'e', ' ', 'c', 'o', 'n', 't', 'e', 'n', 't', '.', ',', 'F', 'e', 'e', 'd', ' ', 'p', 'r', 'e', 'p', 'a', 'r', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a4ada224-3dc1-575d-9093-37eb8499a0e2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Stored feed should be kept in:',
    '["Sunlight", "Cool, dry conditions to prevent mould and nutrient loss", "Water", "Open air"]'::jsonb,
    '1'::jsonb,
    'Proper storage prevents spoilage and maintains nutritional value.',
    ARRAY['[', 'F', 'e', 'e', 'd', ' ', 'q', 'u', 'a', 'l', 'i', 't', 'y', '.', ',', 'S', 't', 'o', 'r', 'a', 'g', 'e', ' ', 'c', 'o', 'n', 'd', 'i', 't', 'i', 'o', 'n', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6a936b2e-90e9-5974-a7fe-ec5e1b4e8e5a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Why is it important to grind maize before feeding it to poultry?',
    '["It is not important", "Poultry cannot chew; grinding makes nutrients accessible for digestion", "To make it look better", "To reduce weight"]'::jsonb,
    '1'::jsonb,
    'Poultry swallow whole - ground feed is easier to digest.',
    ARRAY['[', 'D', 'i', 'g', 'e', 's', 't', 'i', 'v', 'e', ' ', 's', 'y', 's', 't', 'e', 'm', '.', ',', 'F', 'e', 'e', 'd', ' ', 'f', 'o', 'r', 'm', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1b3aefc4-0edc-55b8-a955-85fdaafd4a0a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'A farmer mixes their own feed. Why must they ensure proper proportions?',
    '["For appearance", "Wrong proportions cause nutrient deficiencies or excesses, affecting health and production", "To save money", "It does not matter"]'::jsonb,
    '1'::jsonb,
    'Balanced rations are critical for animal health and productivity.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ',', 'F', 'e', 'e', 'd', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '289dda74-0868-5687-a480-4386993132b9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Why is protein important in livestock feed?',
    '["For energy only", "Protein is needed for growth, tissue repair, milk production, and egg formation", "For taste", "For colour"]'::jsonb,
    '1'::jsonb,
    'Protein supports multiple body functions beyond just energy.',
    ARRAY['[', 'G', 'r', 'o', 'w', 't', 'h', ' ', 'a', 'n', 'd', ' ', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ',', 'E', 's', 's', 'e', 'n', 't', 'i', 'a', 'l', ' ', 'n', 'u', 't', 'r', 'i', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '365bd69e-61d9-5243-9197-6045832beb5b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'fill_in_blank',
    'Name one locally available ingredient for poultry feed in Ghana.',
    NULL,
    '"maize"'::jsonb,
    'Maize, soybean meal, rice bran, fish meal, and palm kernel cake.',
    ARRAY['[', 'L', 'o', 'c', 'a', 'l', ' ', 'r', 'e', 's', 'o', 'u', 'r', 'c', 'e', 's', '.', ',', 'A', 'f', 'f', 'o', 'r', 'd', 'a', 'b', 'l', 'e', ' ', 'o', 'p', 't', 'i', 'o', 'n', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bea736c3-4687-5621-ada1-f2c04abea9b9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Why might a farmer add salt to animal feed?',
    '["To preserve it", "Animals need sodium and chlorine for nerve and muscle function", "To make it taste better", "To increase weight"]'::jsonb,
    '1'::jsonb,
    'Salt provides essential minerals (Na, Cl) in small amounts.',
    ARRAY['[', 'M', 'i', 'n', 'e', 'r', 'a', 'l', ' ', 's', 'u', 'p', 'p', 'l', 'e', 'm', 'e', 'n', 't', '.', ',', 'E', 's', 's', 'e', 'n', 't', 'i', 'a', 'l', ' ', 'n', 'u', 't', 'r', 'i', 'e', 'n', 't', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b6cdccfb-5af0-561e-9064-4026a4bc8cb5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'fill_in_blank',
    'How does feed quality affect milk production in dairy cattle?',
    NULL,
    '"nutrient conversion"'::jsonb,
    'Nutrients from feed are converted to milk - poor feed means poor milk yield and quality.',
    ARRAY['[', 'I', 'n', 'p', 'u', 't', '-', 'o', 'u', 't', 'p', 'u', 't', ' ', 'r', 'e', 'l', 'a', 't', 'i', 'o', 'n', 's', 'h', 'i', 'p', '.', ',', 'D', 'i', 'r', 'e', 'c', 't', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '97aab9da-17d7-5509-9407-bcdd14d0867c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'fill_in_blank',
    'A farmer notices their chickens are not growing well. Feed quality could be the issue. What should they check?',
    NULL,
    '"feed composition"'::jsonb,
    'Check protein content, freshness, storage conditions, and whether feed is balanced for the growth stage.',
    ARRAY['[', 'F', 'e', 'e', 'd', ' ', 'a', 'n', 'a', 'l', 'y', 's', 'i', 's', '.', ',', 'T', 'r', 'o', 'u', 'b', 'l', 'e', 's', 'h', 'o', 'o', 't', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e65df484-eaa1-5345-a196-05c8ca9199d2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Why is it cheaper for farmers to mix their own feed than to buy commercial feed?',
    '["It is not cheaper", "Using locally available ingredients reduces cost and allows customisation", "Commercial feed is always cheaper", "Mixing requires expensive equipment"]'::jsonb,
    '1'::jsonb,
    'Local ingredients are often cheaper and fresher than processed commercial feeds.',
    ARRAY['[', 'C', 'o', 's', 't', ' ', 's', 'a', 'v', 'i', 'n', 'g', 's', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 's', 'o', 'u', 'r', 'c', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'df2f7763-2623-5ebb-bc3b-f8e0eee13a42',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'How does the feed requirement of a layer hen differ from a broiler?',
    '["They are the same", "Layers need more calcium for eggshells; broilers need more protein for muscle growth", "Broilers need less food", "Layers need no protein"]'::jsonb,
    '1'::jsonb,
    'Different production goals require different nutritional profiles.',
    ARRAY['[', 'P', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'o', 'n', '-', 's', 'p', 'e', 'c', 'i', 'f', 'i', 'c', ' ', 'n', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', '.', ',', 'C', 'a', 'l', 'c', 'i', 'u', 'm', ' ', 'f', 'o', 'r', ' ', 'e', 'g', 'g', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e74b25da-7584-5e76-bd55-e5e641e6d6f2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Why should feed be stored away from rodents?',
    '["For cleanliness", "Rodents contaminate feed with droppings and urine, spreading diseases", "Rodents eat too much", "Rodents damage containers"]'::jsonb,
    '1'::jsonb,
    'Rodent contamination poses health risks to livestock.',
    ARRAY['[', 'F', 'e', 'e', 'd', ' ', 'h', 'y', 'g', 'i', 'e', 'n', 'e', '.', ',', 'D', 'i', 's', 'e', 'a', 's', 'e', ' ', 'p', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5b0a37cf-13d9-59de-8e7d-7b6fd43cf8d4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'fill_in_blank',
    'Explain why young animals need different feed than adult animals.',
    NULL,
    '"growth needs"'::jsonb,
    'Young animals need higher protein for rapid growth; adults need maintenance-level nutrients.',
    ARRAY['[', 'G', 'r', 'o', 'w', 't', 'h', ' ', 'r', 'e', 'q', 'u', 'i', 'r', 'e', 'm', 'e', 'n', 't', 's', '.', ',', 'L', 'i', 'f', 'e', '-', 's', 't', 'a', 'g', 'e', ' ', 'n', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fcbc4339-2004-5677-b0f9-f6a3fe417056',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'A farmer adds palm kernel cake to cattle feed. What nutrient does it provide?',
    '["Vitamins", "Protein and energy from oil extraction by-products", "Fibre only", "Water"]'::jsonb,
    '1'::jsonb,
    'Palm kernel cake is a protein-rich by-product of palm oil extraction.',
    ARRAY['[', 'B', 'y', '-', 'p', 'r', 'o', 'd', 'u', 'c', 't', ' ', 'u', 't', 'i', 'l', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 'f', 'e', 'e', 'd', ' ', 's', 'o', 'u', 'r', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7d90f6c2-316e-559f-8486-d72e682bbada',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'How can farmers test if their feed is of good quality?',
    '["By tasting it", "By checking colour, smell, texture, and observing animal performance", "By weighing it", "By price"]'::jsonb,
    '1'::jsonb,
    'Visual inspection and animal performance monitoring indicate feed quality.',
    ARRAY['[', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'a', 's', 's', 'e', 's', 's', 'm', 'e', 'n', 't', '.', ',', 'P', 'r', 'a', 'c', 't', 'i', 'c', 'a', 'l', ' ', 'e', 'v', 'a', 'l', 'u', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ec7281ad-0ee7-5b43-ad17-5b6d55b883d1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.1'), NULL, 'multiple_choice',
    'Why is feed conversion ratio important for farmers?',
    '["It is not", "FCR measures how efficiently animals convert feed to product (meat, eggs, milk) - lower is better", "For decoration", "Government requires it"]'::jsonb,
    '1'::jsonb,
    'Good FCR means less feed per unit of product, reducing costs.',
    ARRAY['[', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', ' ', 'm', 'e', 't', 'r', 'i', 'c', '.', ',', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'i', 'n', 'd', 'i', 'c', 'a', 't', 'o', 'r', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.2.4.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6293007c-2ec1-5b14-8303-4d6982a0e361',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Selecting appropriate feed for livestock depends on:',
    '["Price only", "The animal species, age, and production purpose", "Availability only", "Colour of the feed"]'::jsonb,
    '1'::jsonb,
    'Feed selection should match the animal''s specific needs.',
    ARRAY['[', 'S', 'p', 'e', 'c', 'i', 'e', 's', '-', 's', 'p', 'e', 'c', 'i', 'f', 'i', 'c', '.', ',', 'P', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'o', 'n', ' ', 'g', 'o', 'a', 'l', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8c14e6dd-5b45-5c93-a077-042286f6f858',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Ruminants (cattle, sheep) can digest:',
    '["Only grains", "Fibre from grasses and roughages using rumen bacteria", "Only concentrate feeds", "Only fruits"]'::jsonb,
    '1'::jsonb,
    'Rumen bacteria break down cellulose in plant fibre.',
    ARRAY['[', 'R', 'u', 'm', 'i', 'n', 'a', 'n', 't', ' ', 'd', 'i', 'g', 'e', 's', 't', 'i', 'o', 'n', '.', ',', 'F', 'i', 'b', 'r', 'e', ' ', 'u', 't', 'i', 'l', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '80410fb4-29a3-5adc-8025-fddc59a1308a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Poultry cannot digest fibre well because they:',
    '["Have no stomach", "Are monogastric with no rumen for fibre breakdown", "Are too small", "Have no teeth"]'::jsonb,
    '1'::jsonb,
    'Poultry are monogastric - limited ability to digest cellulose.',
    ARRAY['[', 'D', 'i', 'g', 'e', 's', 't', 'i', 'v', 'e', ' ', 'l', 'i', 'm', 'i', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'F', 'e', 'e', 'd', ' ', 'f', 'o', 'r', 'm', ' ', 'm', 'a', 't', 't', 'e', 'r', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '19c1895b-6ac8-5312-83fa-b0cea4c6efb9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Concentrate feeds are high in:',
    '["Fibre", "Energy and protein", "Water only", "Vitamins only"]'::jsonb,
    '1'::jsonb,
    'Concentrates provide dense nutrition with low fibre.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', '-', 'r', 'i', 'c', 'h', '.', ',', 'G', 'r', 'a', 'i', 'n', 's', ' ', 'a', 'n', 'd', ' ', 'o', 'i', 'l', 'c', 'a', 'k', 'e', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3e620a30-0e1e-50fd-a297-f7fe5dd5aef8',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Roughage feeds are high in:',
    '["Protein", "Fibre", "Sugar", "Fat"]'::jsonb,
    '1'::jsonb,
    'Roughages (grass, hay) are high in fibre for ruminant digestion.',
    ARRAY['[', 'B', 'u', 'l', 'k', ' ', 'f', 'e', 'e', 'd', 's', '.', ',', 'R', 'u', 'm', 'i', 'n', 'a', 'n', 't', ' ', 'd', 'i', 'e', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cbfb6857-d35a-5211-bed6-71662c475d55',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'A dairy cow needs feed high in:',
    '["Only fibre", "Energy, protein, and calcium for milk production", "Only water", "Only vitamins"]'::jsonb,
    '1'::jsonb,
    'Milk production requires high energy, protein, and minerals.',
    ARRAY['[', 'P', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'o', 'n', ' ', 'd', 'e', 'm', 'a', 'n', 'd', 's', '.', ',', 'N', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'n', 'e', 'e', 'd', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '22e0434b-d747-51d3-ab6d-c26420b4d807',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Why do layers (egg-laying hens) need more calcium than broilers?',
    '["They do not", "Calcium is needed for eggshell formation", "Layers are bigger", "Broilers need more calcium"]'::jsonb,
    '1'::jsonb,
    'Eggshells are made of calcium carbonate - layers need constant calcium supply.',
    ARRAY['[', 'E', 'g', 'g', 's', 'h', 'e', 'l', 'l', ' ', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ',', 'M', 'i', 'n', 'e', 'r', 'a', 'l', ' ', 'd', 'e', 'm', 'a', 'n', 'd', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ea2f7c33-4219-5c37-91a3-e5cba827516e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'A farmer wants to fatten cattle for market. What type of feed should they use?',
    '["Only grass", "High-energy concentrate feeds to promote weight gain", "Only water", "Low-energy feeds"]'::jsonb,
    '1'::jsonb,
    'Fattening requires high-energy feeds for rapid weight gain.',
    ARRAY['[', 'F', 'i', 'n', 'i', 's', 'h', 'i', 'n', 'g', ' ', 'd', 'i', 'e', 't', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', '-', 'd', 'e', 'n', 's', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '60e1d412-1357-59ee-9ce9-4e7121903e52',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Why is fresh grass better than dried hay for cattle?',
    '["It is not better", "Fresh grass has more moisture, vitamins, and is more palatable", "Hay is always better", "They are identical"]'::jsonb,
    '1'::jsonb,
    'Fresh grass retains more nutrients and moisture than dried hay.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'q', 'u', 'a', 'l', 'i', 't', 'y', '.', ',', 'P', 'a', 'l', 'a', 't', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7dbe50ba-899b-5e76-b9ee-d34c98b386dc',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'fill_in_blank',
    'Name one feed suitable for goats in Ghana.',
    NULL,
    '"browse plants"'::jsonb,
    'Browse plants (leaves, shrubs), grasses, crop residues, and kitchen scraps.',
    ARRAY['[', 'G', 'o', 'a', 't', 's', ' ', 'a', 'r', 'e', ' ', 'b', 'r', 'o', 'w', 's', 'e', 'r', 's', '.', ',', 'D', 'i', 'v', 'e', 'r', 's', 'e', ' ', 'd', 'i', 'e', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '930c46c9-668a-5bbf-8084-1dc8f0dac43f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Why should feed for young chicks (starter ration) have higher protein than feed for older chickens?',
    '["Young chicks eat more", "Young chicks need more protein for rapid growth and feather development", "Young chicks are smaller", "Protein is cheaper for chicks"]'::jsonb,
    '1'::jsonb,
    'Growth rate is highest in early life - protein supports rapid development.',
    ARRAY['[', 'G', 'r', 'o', 'w', 't', 'h', ' ', 's', 't', 'a', 'g', 'e', ' ', 'n', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', '.', ',', 'S', 't', 'a', 'r', 't', 'e', 'r', ' ', 'v', 's', ' ', 'g', 'r', 'o', 'w', 'e', 'r', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c90bf3f3-efad-5d1f-9751-b8fb43ef6fc6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'How does the feed requirement of a working ox differ from a resting ox?',
    '["No difference", "Working oxen need more energy for the extra physical labour", "Resting oxen need more food", "Working oxen need less water"]'::jsonb,
    '1'::jsonb,
    'Physical activity increases energy requirements.',
    ARRAY['[', 'M', 'a', 'i', 'n', 't', 'e', 'n', 'a', 'n', 'c', 'e', ' ', 'v', 's', ' ', 'w', 'o', 'r', 'k', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'd', 'e', 'm', 'a', 'n', 'd', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'afebba85-2222-5b9d-b7e7-e5c6f3b4cdd5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Why might a farmer choose to grow their own fodder crops?',
    '["For decoration", "Growing fodder reduces feed costs and ensures consistent supply", "It is easier than buying", "Government requires it"]'::jsonb,
    '1'::jsonb,
    'Own-grown fodder reduces costs and provides fresh, quality feed.',
    ARRAY['[', 'C', 'o', 's', 't', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ',', 'F', 'e', 'e', 'd', ' ', 's', 'e', 'c', 'u', 'r', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '46d2642d-441b-583a-aad3-4cf67aa80249',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'A farmer mixes maize bran and fish meal for poultry. Why is this combination effective?',
    '["For colour", "Maize bran provides energy; fish meal provides protein - complementary nutrients", "They are cheap", "They taste good together"]'::jsonb,
    '1'::jsonb,
    'Combining energy and protein sources creates a balanced ration.',
    ARRAY['[', 'C', 'o', 'm', 'p', 'l', 'e', 'm', 'e', 'n', 't', 'a', 'r', 'y', ' ', 'n', 'u', 't', 'r', 'i', 'e', 'n', 't', 's', '.', ',', 'F', 'e', 'e', 'd', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f59aeff4-d0aa-531b-9489-2e367cde8fdf',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'How does water availability affect feed selection?',
    '["It does not", "In water-scarce areas, feeds with higher moisture content (fresh grass) can supplement water needs", "Dry feed is always better", "Water does not affect feed"]'::jsonb,
    '1'::jsonb,
    'Fresh feeds provide both nutrients and moisture in dry conditions.',
    ARRAY['[', 'W', 'a', 't', 'e', 'r', ' ', 's', 'u', 'p', 'p', 'l', 'e', 'm', 'e', 'n', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'P', 'r', 'a', 'c', 't', 'i', 'c', 'a', 'l', ' ', 'c', 'o', 'n', 's', 'i', 'd', 'e', 'r', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ff5277d0-8dab-5f3f-91d2-4b06b832f103',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Why is it important to gradually change an animal''s feed rather than switching suddenly?',
    '["It is not important", "Sudden changes upset the digestive system, especially in ruminants, causing health problems", "Animals do not notice", "It saves time"]'::jsonb,
    '1'::jsonb,
    'Gradual changes allow gut bacteria to adapt to new feed.',
    ARRAY['[', 'D', 'i', 'g', 'e', 's', 't', 'i', 'v', 'e', ' ', 'h', 'e', 'a', 'l', 't', 'h', '.', ',', 'T', 'r', 'a', 'n', 's', 'i', 't', 'i', 'o', 'n', ' ', 'p', 'e', 'r', 'i', 'o', 'd', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dd28b5b3-8948-5151-a066-a39606b41914',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'fill_in_blank',
    'Explain why a balanced ration is more important than simply providing lots of food.',
    NULL,
    '"nutrient balance"'::jsonb,
    'Excess of one nutrient cannot compensate for deficiency of another - balance is key.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', 'a', 'l', ' ', 's', 'c', 'i', 'e', 'n', 'c', 'e', '.', ',', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'o', 'v', 'e', 'r', ' ', 'q', 'u', 'a', 'n', 't', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '02e9332a-61e9-5698-b1f5-a4fef175bb26',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'A farmer has access to maize stover (stalks after harvest). How can they use it?',
    '["Throw it away", "Use it as roughage feed for ruminants, or compost it for soil improvement", "Burn it", "It is useless"]'::jsonb,
    '1'::jsonb,
    'Crop residues are valuable feed resources for ruminants.',
    ARRAY['[', 'B', 'y', '-', 'p', 'r', 'o', 'd', 'u', 'c', 't', ' ', 'u', 't', 'i', 'l', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ',', 'W', 'a', 's', 't', 'e', ' ', 't', 'o', ' ', 'r', 'e', 's', 'o', 'u', 'r', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ceba2256-26f3-563a-9594-fd2bacc17a18',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'multiple_choice',
    'Why do commercial farms use feed formulation software?',
    '["For fun", "To calculate exact nutrient requirements and minimise cost while meeting animal needs", "To make feed look better", "Government requires it"]'::jsonb,
    '1'::jsonb,
    'Software optimises feed formulations for cost and nutrition.',
    ARRAY['[', 'P', 'r', 'e', 'c', 'i', 's', 'i', 'o', 'n', ' ', 'n', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 's', 't', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1049d351-0de4-5987-9ba9-82ddecea3977',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.2.4.2'), NULL, 'fill_in_blank',
    'Suggest a feeding strategy for a small-scale goat farmer in Ghana during the dry season.',
    NULL,
    '"supplementary feeding"'::jsonb,
    'Supplement natural browse with stored hay, crop residues, and small amounts of concentrate.',
    ARRAY['[', 'D', 'r', 'y', ' ', 's', 'e', 'a', 's', 'o', 'n', ' ', 'f', 'e', 'e', 'd', 'i', 'n', 'g', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 'r', 'e', 's', 'o', 'u', 'r', 'c', 'e', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.3.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'acbda810-0c44-5680-812f-2a58b0134647',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'The circulatory system transports:',
    '["Only oxygen", "Blood, oxygen, nutrients, hormones, and waste products", "Only food", "Only water"]'::jsonb,
    '1'::jsonb,
    'The circulatory system is the body''s transport network.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', 's', '.', ',', 'B', 'o', 'd', 'y', '-', 'w', 'i', 'd', 'e', ' ', 't', 'r', 'a', 'n', 's', 'p', 'o', 'r', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf78528c-e598-5c73-b203-f8e559f8db75',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'The heart is a muscular organ that:',
    '["Filters blood", "Pumps blood around the body", "Produces blood", "Stores blood"]'::jsonb,
    '1'::jsonb,
    'The heart pumps blood through the circulatory system.',
    ARRAY['[', 'M', 'u', 's', 'c', 'l', 'e', ' ', 'p', 'u', 'm', 'p', '.', ',', 'C', 'o', 'n', 't', 'i', 'n', 'u', 'o', 'u', 's', ' ', 'b', 'e', 'a', 't', 'i', 'n', 'g', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fcf475fd-5486-5f99-975c-765f041134c7',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'Arteries carry blood:',
    '["To the heart", "Away from the heart", "Both directions", "Only to the lungs"]'::jsonb,
    '1'::jsonb,
    'Arteries carry blood away from the heart under high pressure.',
    ARRAY['[', 'T', 'h', 'i', 'c', 'k', ' ', 'w', 'a', 'l', 'l', 's', '.', ',', 'H', 'i', 'g', 'h', ' ', 'p', 'r', 'e', 's', 's', 'u', 'r', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '51e7ef27-8523-52ef-9f12-e2faf51a3fb3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'Veins carry blood:',
    '["Away from the heart", "To the heart", "Only oxygen", "Only nutrients"]'::jsonb,
    '1'::jsonb,
    'Veins carry blood back to the heart under low pressure.',
    ARRAY['[', 'T', 'h', 'i', 'n', ' ', 'w', 'a', 'l', 'l', 's', '.', ',', 'H', 'a', 'v', 'e', ' ', 'v', 'a', 'l', 'v', 'e', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f26a55e3-2fa9-5081-960c-ad9a58806643',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'The smallest blood vessels are:',
    '["Arteries", "Veins", "Capillaries", "Nerves"]'::jsonb,
    '2'::jsonb,
    'Capillaries are microscopic vessels where exchange occurs.',
    ARRAY['[', 'E', 'x', 'c', 'h', 'a', 'n', 'g', 'e', ' ', 's', 'i', 't', 'e', '.', ',', 'T', 'h', 'i', 'n', ' ', 'w', 'a', 'l', 'l', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b91d1e7a-5421-56de-9fca-715cf2a3b814',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'fill_in_blank',
    'The human heart has ___ chambers.',
    NULL,
    '"four"'::jsonb,
    'Four chambers: two atria (upper) and two ventricles (lower).',
    ARRAY['[', 'D', 'o', 'u', 'b', 'l', 'e', ' ', 'p', 'u', 'm', 'p', '.', ',', 'L', 'e', 'f', 't', ' ', 'a', 'n', 'd', ' ', 'r', 'i', 'g', 'h', 't', ' ', 's', 'i', 'd', 'e', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5efec030-d457-51da-92bc-99b26f982677',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'Why do arteries have thick, elastic walls?',
    '["For decoration", "To withstand high pressure as blood is pumped from the heart", "To carry more blood", "To produce blood"]'::jsonb,
    '1'::jsonb,
    'Arterial walls are thick and elastic to handle high-pressure blood flow.',
    ARRAY['[', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'r', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', '.', ',', 'E', 'l', 'a', 's', 't', 'i', 'c', ' ', 'r', 'e', 'c', 'o', 'i', 'l', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c9f7b7d4-ddf0-59cb-8608-dd8c22905a88',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'Why do veins have valves?',
    '["To produce blood", "To prevent backflow of blood as it returns to the heart", "To filter blood", "To add oxygen"]'::jsonb,
    '1'::jsonb,
    'Valves ensure one-way flow back to the heart against gravity.',
    ARRAY['[', 'B', 'a', 'c', 'k', 'f', 'l', 'o', 'w', ' ', 'p', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', '.', ',', 'L', 'o', 'w', ' ', 'p', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 's', 'y', 's', 't', 'e', 'm', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f7374949-a40b-57c0-9afd-32e094275357',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'Gas exchange in the lungs occurs in the:',
    '["Bronchi", "Trachea", "Alveoli (air sacs)", "Nose"]'::jsonb,
    '1'::jsonb,
    'Alveoli have thin walls and large surface area for gas exchange.',
    ARRAY['[', 'O', 'x', 'y', 'g', 'e', 'n', ' ', 'i', 'n', ',', ' ', 'C', 'O', '2', ' ', 'o', 'u', 't', '.', ',', 'D', 'i', 'f', 'f', 'u', 's', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '27267f81-d277-5797-a05c-4d7aa89a3907',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'Oxygen is carried in blood by:',
    '["White blood cells", "Haemoglobin in red blood cells", "Platelets", "Plasma"]'::jsonb,
    '1'::jsonb,
    'Haemoglobin in RBCs binds to oxygen for transport.',
    ARRAY['[', 'O', 'x', 'y', 'g', 'e', 'n', ' ', 'c', 'a', 'r', 'r', 'i', 'e', 'r', '.', ',', 'R', 'e', 'd', ' ', 'p', 'i', 'g', 'm', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '69c6e561-91a5-5597-9d53-d46a2c8c254c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'The right side of the heart pumps blood to the:',
    '["Body", "Lungs", "Brain", "Kidneys"]'::jsonb,
    '1'::jsonb,
    'Right side: body → heart → lungs. Left side: lungs → heart → body.',
    ARRAY['[', 'P', 'u', 'l', 'm', 'o', 'n', 'a', 'r', 'y', ' ', 'c', 'i', 'r', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ',', 'O', 'x', 'y', 'g', 'e', 'n', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ff0a7a66-b3bf-56c3-b05f-897d810a7272',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'What is the function of capillaries?',
    '["Transport only", "Exchange of gases, nutrients, and waste between blood and tissues", "Filter blood", "Produce blood"]'::jsonb,
    '1'::jsonb,
    'Capillary walls are one cell thick - exchange happens by diffusion.',
    ARRAY['[', 'E', 'x', 'c', 'h', 'a', 'n', 'g', 'e', ' ', 'v', 'e', 's', 's', 'e', 'l', 's', '.', ',', 'T', 'h', 'i', 'n', ' ', 'w', 'a', 'l', 'l', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '83a23a84-bf07-54b4-84f7-bff158abfb3e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'fill_in_blank',
    'Why is the left ventricle wall thicker than the right?',
    NULL,
    '"higher pressure"'::jsonb,
    'The left ventricle pumps blood to the whole body, needing more force than the right (which pumps to lungs).',
    ARRAY['[', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'd', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 'c', 'e', '.', ',', 'M', 'u', 's', 'c', 'l', 'e', ' ', 't', 'h', 'i', 'c', 'k', 'n', 'e', 's', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '52e6a701-0194-55ee-b532-fe9e9e5d9e70',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'fill_in_blank',
    'Explain why high blood pressure can damage blood vessels.',
    NULL,
    '"pressure damage"'::jsonb,
    'Excessive pressure weakens vessel walls, causing damage, narrowing, or rupture.',
    ARRAY['[', 'H', 'y', 'p', 'e', 'r', 't', 'e', 'n', 's', 'i', 'o', 'n', '.', ',', 'C', 'a', 'r', 'd', 'i', 'o', 'v', 'a', 's', 'c', 'u', 'l', 'a', 'r', ' ', 'r', 'i', 's', 'k', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6fbece04-08b3-5936-b9ed-f65b24bc0a7a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'How does the circulatory system help maintain body temperature?',
    '["It does not", "Blood carries heat from active organs to the skin, where it is released", "By producing heat", "By insulating the body"]'::jsonb,
    '1'::jsonb,
    'Blood flow redistributes heat - vasodilation releases heat, vasoconstriction conserves it.',
    ARRAY['[', 'T', 'h', 'e', 'r', 'm', 'o', 'r', 'e', 'g', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ',', 'H', 'e', 'a', 't', ' ', 'd', 'i', 's', 't', 'r', 'i', 'b', 'u', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e157eb9e-4953-5b43-8937-adfe34ce54d1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'Why do athletes have lower resting heart rates?',
    '["They are lazier", "Their hearts are more efficient - each beat pumps more blood, so fewer beats are needed", "They exercise less", "They have smaller hearts"]'::jsonb,
    '1'::jsonb,
    'Training increases stroke volume, reducing the need for high heart rate.',
    ARRAY['[', 'C', 'a', 'r', 'd', 'i', 'a', 'c', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ',', 'T', 'r', 'a', 'i', 'n', 'i', 'n', 'g', ' ', 'a', 'd', 'a', 'p', 't', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3c94bfce-aa4f-5d40-a2f2-e30432d77999',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'What would happen if valves in veins stopped working?',
    '["Nothing", "Blood would pool in the lower limbs, causing swelling (varicose veins)", "Blood would flow faster", "The heart would stop"]'::jsonb,
    '1'::jsonb,
    'Faulty valves cause blood to pool, leading to varicose veins and poor circulation.',
    ARRAY['[', 'V', 'a', 'l', 'v', 'e', ' ', 'd', 'y', 's', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ',', 'C', 'i', 'r', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', ' ', 'p', 'r', 'o', 'b', 'l', 'e', 'm', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '53f151c8-b5f7-55e5-ae42-ef1b02c21494',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'fill_in_blank',
    'How does the lymphatic system relate to the circulatory system?',
    NULL,
    '"parallel network"'::jsonb,
    'The lymphatic system collects excess fluid from tissues and returns it to the blood.',
    ARRAY['[', 'F', 'l', 'u', 'i', 'd', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ',', 'I', 'm', 'm', 'u', 'n', 'e', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0b3dfcfd-9f0e-5b2b-88a9-bb55cecf97a1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'Why is the circulatory system called a "closed system"?',
    '["It is sealed from air", "Blood is always contained within vessels - it does not flow freely in body cavities", "It has no openings", "It does not interact with other systems"]'::jsonb,
    '1'::jsonb,
    'Blood stays within the heart and vessels at all times.',
    ARRAY['[', 'C', 'l', 'o', 's', 'e', 'd', ' ', 'l', 'o', 'o', 'p', '.', ',', 'C', 'o', 'n', 't', 'a', 'i', 'n', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8d59b213-cbfc-5b63-a435-695f35670db3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.1.1'), NULL, 'multiple_choice',
    'Compare the structure and function of arteries and veins.',
    '["They are identical", "Arteries: thick walls, carry blood away from heart. Veins: thin walls, valves, carry blood to heart.", "Arteries are always bigger", "Veins carry oxygen"]'::jsonb,
    '1'::jsonb,
    'Different structures match different functions and pressure levels.',
    ARRAY['[', 'S', 't', 'r', 'u', 'c', 't', 'u', 'r', 'a', 'l', ' ', 'a', 'd', 'a', 'p', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'F', 'u', 'n', 'c', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'm', 'a', 't', 'c', 'h', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.3.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd70fc5a1-aa09-5b79-ba0f-0f2d5d633c5e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'Non-planetary bodies in the solar system include asteroids, comets, and:',
    '["Stars", "Moons", "Black holes", "Galaxies"]'::jsonb,
    '1'::jsonb,
    'Moons, asteroids, comets, and meteoroids are non-planetary bodies.',
    ARRAY['[', 'S', 'o', 'l', 'a', 'r', ' ', 's', 'y', 's', 't', 'e', 'm', ' ', 'o', 'b', 'j', 'e', 'c', 't', 's', '.', ',', 'V', 'a', 'r', 'i', 'o', 'u', 's', ' ', 't', 'y', 'p', 'e', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7c74d2cf-ea9d-53bd-943f-23a2cf3836a5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'Asteroids are:',
    '["Large gas balls", "Rocky objects orbiting the sun, mostly found between Mars and Jupiter", "Made of ice", "As big as planets"]'::jsonb,
    '1'::jsonb,
    'Asteroids are rocky/metallic objects, mainly in the asteroid belt.',
    ARRAY['[', 'R', 'o', 'c', 'k', 'y', ' ', 'c', 'o', 'm', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n', '.', ',', 'A', 's', 't', 'e', 'r', 'o', 'i', 'd', ' ', 'b', 'e', 'l', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8da0dd51-53e1-5da3-aa3d-3a4f037304ac',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'A comet is made of:',
    '["Only rock", "Ice, dust, and rock (dirty snowball)", "Only gas", "Metal"]'::jsonb,
    '1'::jsonb,
    'Comets are icy bodies that develop tails when near the sun.',
    ARRAY['[', 'I', 'c', 'y', ' ', 'c', 'o', 'm', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n', '.', ',', 'T', 'a', 'i', 'l', ' ', 'f', 'o', 'r', 'm', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7825f163-6443-540d-afc0-bfcd73b551c8',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'A meteoroid that enters Earth''s atmosphere and burns up is called a:',
    '["Asteroid", "Meteor (shooting star)", "Comet", "Satellite"]'::jsonb,
    '1'::jsonb,
    'A meteor is the streak of light from a meteoroid burning up.',
    ARRAY['[', 'A', 't', 'm', 'o', 's', 'p', 'h', 'e', 'r', 'i', 'c', ' ', 'e', 'n', 't', 'r', 'y', '.', ',', 'V', 'i', 's', 'i', 'b', 'l', 'e', ' ', 's', 't', 'r', 'e', 'a', 'k', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a7ae5f25-b079-57be-a253-acb0c651c6fb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'If a meteoroid survives the atmosphere and hits the ground, it is called a:',
    '["Meteor", "Meteorite", "Comet", "Asteroid"]'::jsonb,
    '1'::jsonb,
    'A meteorite is a meteoroid that reaches Earth''s surface.',
    ARRAY['[', 'G', 'r', 'o', 'u', 'n', 'd', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ',', 'S', 'p', 'a', 'c', 'e', ' ', 'r', 'o', 'c', 'k', ' ', 'o', 'n', ' ', 'E', 'a', 'r', 't', 'h', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f573a6ef-e69e-5e0c-ba8a-7f403b2c517b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'The asteroid belt is located between:',
    '["Earth and Mars", "Mars and Jupiter", "Jupiter and Saturn", "Saturn and Neptune"]'::jsonb,
    '1'::jsonb,
    'The main asteroid belt is between Mars and Jupiter.',
    ARRAY['[', 'O', 'r', 'b', 'i', 't', 'a', 'l', ' ', 'l', 'o', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'G', 'r', 'a', 'v', 'i', 't', 'a', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'i', 'n', 'f', 'l', 'u', 'e', 'n', 'c', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aa3e30d9-ea3d-5e3d-b3e8-b24d18fbaa66',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'Why do comets develop tails when near the sun?',
    '["They are burning", "Solar radiation and solar wind vaporise ice, creating a glowing tail", "They are breaking apart", "They reflect sunlight"]'::jsonb,
    '1'::jsonb,
    'Heat from the sun vaporises comet ice, releasing gas and dust that form tails.',
    ARRAY['[', 'S', 'u', 'b', 'l', 'i', 'm', 'a', 't', 'i', 'o', 'n', '.', ',', 'S', 'o', 'l', 'a', 'r', ' ', 'w', 'i', 'n', 'd', ' ', 'e', 'f', 'f', 'e', 'c', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a74127d5-32f9-5604-9732-8e0f6c946a06',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'How are asteroids different from meteoroids?',
    '["They are the same", "Asteroids are larger (>1m); meteoroids are smaller (<1m)", "Asteroids are made of ice", "Meteoroids are bigger"]'::jsonb,
    '1'::jsonb,
    'Size is the main difference - both are rocky solar system objects.',
    ARRAY['[', 'S', 'i', 'z', 'e', ' ', 'c', 'l', 'a', 's', 's', 'i', 'f', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 'n', 't', 'i', 'n', 'u', 'o', 'u', 's', ' ', 's', 'p', 'e', 'c', 't', 'r', 'u', 'm', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '25928203-f365-5a5f-a69c-c44f04aa41ca',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'Why is the asteroid belt between Mars and Jupiter?',
    '["Random placement", "Jupiter''s strong gravity prevented the asteroids from forming into a planet", "Mars pushed them there", "The sun''s gravity holds them"]'::jsonb,
    '1'::jsonb,
    'Jupiter''s gravitational influence disrupted planet formation in this region.',
    ARRAY['[', 'G', 'r', 'a', 'v', 'i', 't', 'a', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'p', 'e', 'r', 't', 'u', 'r', 'b', 'a', 't', 'i', 'o', 'n', '.', ',', 'F', 'a', 'i', 'l', 'e', 'd', ' ', 'p', 'l', 'a', 'n', 'e', 't', ' ', 'f', 'o', 'r', 'm', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b365044b-4181-5121-a833-3014ee60cc90',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'What is the Kuiper Belt?',
    '["An asteroid belt near the sun", "A region beyond Neptune containing icy bodies and dwarf planets", "A ring around Saturn", "A type of comet"]'::jsonb,
    '1'::jsonb,
    'The Kuiper Belt contains Pluto and other icy objects beyond Neptune.',
    ARRAY['[', 'O', 'u', 't', 'e', 'r', ' ', 's', 'o', 'l', 'a', 'r', ' ', 's', 'y', 's', 't', 'e', 'm', '.', ',', 'I', 'c', 'y', ' ', 'b', 'o', 'd', 'i', 'e', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3fec295c-de32-51bb-9313-57e3ef4246c6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'fill_in_blank',
    'Name one difference between asteroids and comets.',
    NULL,
    '"composition"'::jsonb,
    'Asteroids are rocky/metallic; comets are icy with gas and dust.',
    ARRAY['[', 'C', 'o', 'm', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n', ' ', 'd', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 'c', 'e', '.', ',', 'R', 'o', 'c', 'k', 'y', ' ', 'v', 's', ' ', 'i', 'c', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e8af0197-d93e-51b5-b7c9-913af3660a5f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'Why are meteorites valuable to scientists?',
    '["They are expensive", "They contain information about the early solar system and formation of planets", "They are beautiful", "They are rare"]'::jsonb,
    '1'::jsonb,
    'Meteorites are samples of early solar system material.',
    ARRAY['[', 'S', 'c', 'i', 'e', 'n', 't', 'i', 'f', 'i', 'c', ' ', 'v', 'a', 'l', 'u', 'e', '.', ',', 'P', 'r', 'i', 'm', 'i', 't', 'i', 'v', 'e', ' ', 'm', 'a', 't', 'e', 'r', 'i', 'a', 'l', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bb4cbb4b-0685-555d-9f49-138fa1638da3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'fill_in_blank',
    'How do scientists detect potentially dangerous asteroids?',
    NULL,
    '"telescopes"'::jsonb,
    'Ground and space telescopes track near-Earth objects and calculate their orbits.',
    ARRAY['[', 'P', 'l', 'a', 'n', 'e', 't', 'a', 'r', 'y', ' ', 'd', 'e', 'f', 'e', 'n', 'c', 'e', '.', ',', 'D', 'e', 't', 'e', 'c', 't', 'i', 'o', 'n', ' ', 's', 'y', 's', 't', 'e', 'm', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1aab06b9-3a66-5cb3-b0ba-fddc501ff8ae',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'Why did the dinosaurs go extinct?',
    '["Disease", "An asteroid impact caused climate disruption, blocking sunlight", "Volcanoes only", "They evolved into birds"]'::jsonb,
    '1'::jsonb,
    'A large asteroid impact 66 million years ago caused mass extinction.',
    ARRAY['[', 'I', 'm', 'p', 'a', 'c', 't', ' ', 'e', 'v', 'e', 'n', 't', '.', ',', 'C', 'l', 'i', 'm', 'a', 't', 'e', ' ', 'c', 'a', 't', 'a', 's', 't', 'r', 'o', 'p', 'h', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0f0ee9af-419c-522f-ac82-a1bd734e12b2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'fill_in_blank',
    'Explain why Jupiter acts as a "cosmic vacuum cleaner."',
    NULL,
    '"gravity"'::jsonb,
    'Jupiter''s massive gravity captures or deflects many asteroids and comets, protecting inner planets.',
    ARRAY['[', 'G', 'r', 'a', 'v', 'i', 't', 'a', 't', 'i', 'o', 'n', 'a', 'l', ' ', 's', 'h', 'i', 'e', 'l', 'd', 'i', 'n', 'g', '.', ',', 'I', 'm', 'p', 'a', 'c', 't', ' ', 'p', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '419ebfdf-2f40-5de1-9bb2-fb89719eaa02',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'What is the difference between a meteor shower and a single meteor?',
    '["No difference", "Meteor showers occur when Earth passes through comet debris; many meteors appear", "Meteor showers are bigger", "Single meteors are brighter"]'::jsonb,
    '1'::jsonb,
    'Meteor showers happen at predictable times when Earth crosses debris trails.',
    ARRAY['[', 'C', 'o', 'm', 'e', 't', ' ', 'd', 'e', 'b', 'r', 'i', 's', '.', ',', 'A', 'n', 'n', 'u', 'a', 'l', ' ', 'e', 'v', 'e', 'n', 't', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4f1c6a09-a5a4-5f0b-9b75-1c4de93801a0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'How might asteroids be useful in the future?',
    '["They are not", "Asteroids contain valuable minerals and metals that could be mined", "For decoration", "As fuel sources"]'::jsonb,
    '1'::jsonb,
    'Asteroid mining could provide rare metals and resources.',
    ARRAY['[', 'S', 'p', 'a', 'c', 'e', ' ', 'r', 'e', 's', 'o', 'u', 'r', 'c', 'e', 's', '.', ',', 'F', 'u', 't', 'u', 'r', 'e', ' ', 'i', 'n', 'd', 'u', 's', 't', 'r', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a9e9a8ee-1099-5835-a838-f70af980a65b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'Why do some meteorites contain iron and nickel?',
    '["Random composition", "They come from the cores of destroyed asteroids or protoplanets", "They are from Earth", "They are man-made"]'::jsonb,
    '1'::jsonb,
    'Iron-nickel meteorites are fragments of differentiated bodies'' metallic cores.',
    ARRAY['[', 'P', 'l', 'a', 'n', 'e', 't', 'a', 'r', 'y', ' ', 'c', 'o', 'r', 'e', 's', '.', ',', 'D', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', 'i', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'af17c4bc-b3cb-5b1a-927e-7548f917558e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'multiple_choice',
    'A bright fireball is seen in the sky. Is it a meteor, meteoroid, or meteorite?',
    '["Meteorite", "Meteor - it is burning up in the atmosphere", "Meteoroid - it is still in space", "Cannot tell"]'::jsonb,
    '1'::jsonb,
    'A fireball visible in the sky is a meteor (atmospheric phenomenon).',
    ARRAY['[', 'T', 'e', 'r', 'm', 'i', 'n', 'o', 'l', 'o', 'g', 'y', '.', ',', 'L', 'o', 'c', 'a', 't', 'i', 'o', 'n', ' ', 'm', 'a', 't', 't', 'e', 'r', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '197b80c3-dd21-5c8a-a018-82b33b743a9a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.2.1'), NULL, 'fill_in_blank',
    'Why are comets called "dirty snowballs"?',
    NULL,
    '"ice and dust"'::jsonb,
    'They are made of ice mixed with dust and rock particles, like a dirty snowball.',
    ARRAY['[', 'C', 'o', 'm', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n', ' ', 'd', 'e', 's', 'c', 'r', 'i', 'p', 't', 'i', 'o', 'n', '.', ',', 'F', 'r', 'e', 'd', ' ', 'W', 'h', 'i', 'p', 'p', 'l', 'e', ' ', 't', 'e', 'r', 'm', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.3.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ea3a4a0d-8b21-5033-97ab-27800aec86f3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'An ecosystem includes:',
    '["Only living things", "All living and non-living things in an area interacting together", "Only animals", "Only plants"]'::jsonb,
    '1'::jsonb,
    'Ecosystems include biotic and abiotic components.',
    ARRAY['[', 'L', 'i', 'v', 'i', 'n', 'g', ' ', '+', ' ', 'n', 'o', 'n', '-', 'l', 'i', 'v', 'i', 'n', 'g', '.', ',', 'I', 'n', 't', 'e', 'r', 'a', 'c', 't', 'i', 'n', 'g', ' ', 'c', 'o', 'm', 'm', 'u', 'n', 'i', 't', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '060d7c23-898a-5d8f-a369-90627e561197',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'Biotic factors in an ecosystem are:',
    '["Non-living things", "Living organisms (plants, animals, microorganisms)", "Temperature and water", "Soil and rocks"]'::jsonb,
    '1'::jsonb,
    'Biotic factors are all living components.',
    ARRAY['[', 'O', 'r', 'g', 'a', 'n', 'i', 's', 'm', 's', '.', ',', 'B', 'i', 'o', 'l', 'o', 'g', 'i', 'c', 'a', 'l', ' ', 'i', 'n', 't', 'e', 'r', 'a', 'c', 't', 'i', 'o', 'n', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '894f822d-8eaa-55f0-8b32-57801dd4e166',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'Abiotic factors are:',
    '["Living organisms", "Non-living factors like temperature, water, light, and soil", "Only weather", "Only soil"]'::jsonb,
    '1'::jsonb,
    'Abiotic factors are non-living physical and chemical factors.',
    ARRAY['[', 'P', 'h', 'y', 's', 'i', 'c', 'a', 'l', ' ', 'e', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', '.', ',', 'C', 'h', 'e', 'm', 'i', 'c', 'a', 'l', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '89762d99-587a-52d0-b568-c9cb26ca8787',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'Producers in an ecosystem are:',
    '["Herbivores", "Organisms that make their own food (plants via photosynthesis)", "Carnivores", "Decomposers"]'::jsonb,
    '1'::jsonb,
    'Producers (autotrophs) convert light energy to food.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'b', 'a', 's', 'e', '.', ',', 'P', 'h', 'o', 't', 'o', 's', 'y', 'n', 't', 'h', 'e', 's', 'i', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b21ef288-af13-5d3b-b932-eb3a39a2b6b6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'Decomposers break down:',
    '["Living organisms", "Dead organic matter, recycling nutrients back into the soil", "Only plants", "Only rocks"]'::jsonb,
    '1'::jsonb,
    'Decomposers (fungi, bacteria) recycle dead matter.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 'r', 'e', 'c', 'y', 'c', 'l', 'i', 'n', 'g', '.', ',', 'E', 's', 's', 'e', 'n', 't', 'i', 'a', 'l', ' ', 'r', 'o', 'l', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a07f5839-5420-5d37-88ba-a898df57ca94',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'A habitat is:',
    '["A type of organism", "The natural environment where an organism lives", "A food chain", "A weather pattern"]'::jsonb,
    '1'::jsonb,
    'Habitat = the place where an organism lives.',
    ARRAY['[', 'L', 'i', 'v', 'i', 'n', 'g', ' ', 's', 'p', 'a', 'c', 'e', '.', ',', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'c', 'o', 'n', 'd', 'i', 't', 'i', 'o', 'n', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3a83111c-234d-5fff-92e4-8d3dcde0fce0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'Why is biodiversity important in an ecosystem?',
    '["It is not important", "Greater biodiversity makes ecosystems more stable and resilient", "More species means less food", "Biodiversity causes disease"]'::jsonb,
    '1'::jsonb,
    'Diverse ecosystems can better withstand disturbances and recover.',
    ARRAY['[', 'S', 't', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ',', 'R', 'e', 's', 'i', 'l', 'i', 'e', 'n', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd080e7b1-3639-53e7-aee1-e4620f2fa516',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'How do abiotic factors affect the organisms in an ecosystem?',
    '["They do not", "Temperature, water, and light determine which organisms can survive in an area", "Only plants are affected", "Only animals are affected"]'::jsonb,
    '1'::jsonb,
    'Abiotic factors set the conditions for life in an ecosystem.',
    ARRAY['[', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'l', 'i', 'm', 'i', 't', 's', '.', ',', 'D', 'i', 's', 't', 'r', 'i', 'b', 'u', 't', 'i', 'o', 'n', ' ', 'p', 'a', 't', 't', 'e', 'r', 'n', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '73f69d77-08e1-5a93-ab71-08e6770306fb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'What is the role of decomposers in an ecosystem?',
    '["They are not important", "They break down dead matter, releasing nutrients for producers to use", "They eat live plants", "They produce oxygen"]'::jsonb,
    '1'::jsonb,
    'Decomposers close the nutrient loop - recycling matter for producers.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 'c', 'y', 'c', 'l', 'i', 'n', 'g', '.', ',', 'D', 'e', 'c', 'o', 'm', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2478bdbe-6068-50e8-97d7-55f255719b57',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'fill_in_blank',
    'Name one biotic and one abiotic factor in a pond ecosystem.',
    NULL,
    '"fish, water temperature"'::jsonb,
    'Biotic: fish, algae, bacteria. Abiotic: water temperature, dissolved oxygen, light.',
    ARRAY['[', 'L', 'i', 'v', 'i', 'n', 'g', ' ', 'a', 'n', 'd', ' ', 'n', 'o', 'n', '-', 'l', 'i', 'v', 'i', 'n', 'g', '.', ',', 'P', 'o', 'n', 'd', ' ', 'c', 'o', 'm', 'p', 'o', 'n', 'e', 'n', 't', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b9dda955-7d5e-5397-a6c2-e6bc14b5dfea',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'Why can''t ecosystems survive without producers?',
    '["They can", "Producers are the energy base - without them, no energy enters the food web", "Decomposers are enough", "Consumers make their own food"]'::jsonb,
    '1'::jsonb,
    'Producers capture energy from the sun, supporting all other organisms.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'f', 'o', 'u', 'n', 'd', 'a', 't', 'i', 'o', 'n', '.', ',', 'P', 'h', 'o', 't', 'o', 's', 'y', 'n', 't', 'h', 'e', 's', 'i', 's', ' ', 'b', 'a', 's', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '51713d72-42e7-500b-a8a5-e94cbc543b95',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'How do organisms depend on each other in an ecosystem?',
    '["They do not", "Organisms depend on each other for food, shelter, pollination, and nutrient cycling", "Only predators need prey", "Only plants need animals"]'::jsonb,
    '1'::jsonb,
    'Ecosystems are networks of interdependence.',
    ARRAY['[', 'E', 'c', 'o', 'l', 'o', 'g', 'i', 'c', 'a', 'l', ' ', 'r', 'e', 'l', 'a', 't', 'i', 'o', 'n', 's', 'h', 'i', 'p', 's', '.', ',', 'M', 'u', 't', 'u', 'a', 'l', ' ', 'd', 'e', 'p', 'e', 'n', 'd', 'e', 'n', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3ac31dd4-06c4-5ba9-8841-0e00add98fe6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'What would happen if all decomposers were removed from an ecosystem?',
    '["Nothing", "Dead matter would accumulate, nutrients would not be recycled, and producers would starve", "Ecosystems would thrive", "Only animals would be affected"]'::jsonb,
    '1'::jsonb,
    'Without decomposers, nutrient cycling stops - the ecosystem collapses.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 'l', 'o', 'c', 'k', '-', 'u', 'p', '.', ',', 'S', 'y', 's', 't', 'e', 'm', ' ', 'f', 'a', 'i', 'l', 'u', 'r', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2faabce0-8999-57e5-9e55-768ef4b6b1ec',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'fill_in_blank',
    'Why are small changes in abiotic factors able to cause big ecosystem changes?',
    NULL,
    '"sensitivity"'::jsonb,
    'Many organisms have narrow tolerance ranges - small changes can exceed their limits.',
    ARRAY['[', 'T', 'o', 'l', 'e', 'r', 'a', 'n', 'c', 'e', ' ', 'r', 'a', 'n', 'g', 'e', '.', ',', 'T', 'i', 'p', 'p', 'i', 'n', 'g', ' ', 'p', 'o', 'i', 'n', 't', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '16c74417-1326-5fb3-874d-66e00a5a9f99',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'How does removing a top predator affect the rest of the ecosystem?',
    '["Nothing changes", "Herbivore populations increase, overgrazing occurs, and vegetation declines", "Plants increase", "Decomposers increase"]'::jsonb,
    '1'::jsonb,
    'Trophic cascade: predator removal causes herbivore explosion and plant destruction.',
    ARRAY['[', 'T', 'r', 'o', 'p', 'h', 'i', 'c', ' ', 'c', 'a', 's', 'c', 'a', 'd', 'e', '.', ',', 'E', 'c', 'o', 's', 'y', 's', 't', 'e', 'm', ' ', 'i', 'm', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3b308824-488b-5c06-a966-827d14462751',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'Why is the concept of "interdependence" important for conservation?',
    '["It is not", "Removing one species affects many others - conservation must consider whole ecosystems", "Only individual species matter", "Conservation is not needed"]'::jsonb,
    '1'::jsonb,
    'Ecosystem-level thinking is essential for effective conservation.',
    ARRAY['[', 'H', 'o', 'l', 'i', 's', 't', 'i', 'c', ' ', 'a', 'p', 'p', 'r', 'o', 'a', 'c', 'h', '.', ',', 'E', 'c', 'o', 'l', 'o', 'g', 'i', 'c', 'a', 'l', ' ', 'c', 'o', 'n', 'n', 'e', 'c', 't', 'i', 'o', 'n', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9a8064a2-32a4-5080-90df-a9f3da94badd',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'fill_in_blank',
    'Explain why a coral reef ecosystem is so productive.',
    NULL,
    '"biodiversity"'::jsonb,
    'High biodiversity, warm water, sunlight, and nutrient cycling create a highly productive ecosystem.',
    ARRAY['[', 'M', 'a', 'r', 'i', 'n', 'e', ' ', 'b', 'i', 'o', 'd', 'i', 'v', 'e', 'r', 's', 'i', 't', 'y', '.', ',', 'F', 'a', 'v', 'o', 'u', 'r', 'a', 'b', 'l', 'e', ' ', 'c', 'o', 'n', 'd', 'i', 't', 'i', 'o', 'n', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '23376ee3-3d0b-56dc-96be-f576cf8eb171',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'How might climate change affect ecosystem composition?',
    '["No effect", "Changing temperatures shift species ranges, alter interactions, and change community structure", "Only affects polar regions", "Only affects oceans"]'::jsonb,
    '1'::jsonb,
    'Climate change forces species to adapt, migrate, or face extinction.',
    ARRAY['[', 'R', 'a', 'n', 'g', 'e', ' ', 's', 'h', 'i', 'f', 't', 's', '.', ',', 'C', 'o', 'm', 'm', 'u', 'n', 'i', 't', 'y', ' ', 'c', 'h', 'a', 'n', 'g', 'e', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9db1379f-5df5-52f5-9202-09b84dddc108',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'multiple_choice',
    'Why do scientists study ecosystems?',
    '["For fun", "To understand ecological relationships, predict changes, and manage resources sustainably", "Only for academic interest", "To count animals"]'::jsonb,
    '1'::jsonb,
    'Ecosystem science informs conservation, resource management, and environmental policy.',
    ARRAY['[', 'A', 'p', 'p', 'l', 'i', 'e', 'd', ' ', 's', 'c', 'i', 'e', 'n', 'c', 'e', '.', ',', 'M', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', ' ', 't', 'o', 'o', 'l', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6a086ea1-f833-58e5-8032-bdf36674d219',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.3.1'), NULL, 'fill_in_blank',
    'How does pollution affect ecosystem health?',
    NULL,
    '"disruption"'::jsonb,
    'Pollution disrupts food webs, poisons organisms, and degrades habitat quality.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'i', 'm', 'p', 'a', 'c', 't', 's', '.', ',', 'H', 'e', 'a', 'l', 't', 'h', ' ', 'e', 'f', 'f', 'e', 'c', 't', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.3.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2faaf778-4a2e-5d97-ac15-b628bd49db58',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'Animal waste (manure) is used in farming as:',
    '["Waste disposal", "Organic fertiliser to improve soil fertility", "Building material", "Animal feed"]'::jsonb,
    '1'::jsonb,
    'Manure adds nutrients and organic matter to soil.',
    ARRAY['[', 'N', 'a', 't', 'u', 'r', 'a', 'l', ' ', 'f', 'e', 'r', 't', 'i', 'l', 'i', 's', 'e', 'r', '.', ',', 'S', 'o', 'i', 'l', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '99f36088-1b54-5b36-bb37-89bcb48d3576',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'Plant waste (crop residues) can be:',
    '["Thrown away", "Composted or used as mulch to improve soil", "Burned for energy", "Left to rot"]'::jsonb,
    '1'::jsonb,
    'Crop residues return nutrients to soil when composted or mulched.',
    ARRAY['[', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 'r', 'e', 'c', 'y', 'c', 'l', 'i', 'n', 'g', '.', ',', 'O', 'r', 'g', 'a', 'n', 'i', 'c', ' ', 'm', 'a', 't', 't', 'e', 'r', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'abe47abd-d95d-5ea6-a9a3-a96c3190777a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'Composting combines plant and animal waste to produce:',
    '["Plastic", "Nutrient-rich soil amendment", "Toxic waste", "Building material"]'::jsonb,
    '1'::jsonb,
    'Composting decomposes organic waste into valuable fertiliser.',
    ARRAY['[', 'N', 'a', 't', 'u', 'r', 'a', 'l', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ',', 'S', 'o', 'i', 'l', ' ', 'a', 'm', 'e', 'n', 'd', 'm', 'e', 'n', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '69b66f0a-33fa-56fa-b518-18f2b5d6fae9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'fill_in_blank',
    'Manure adds ___ to the soil, improving its structure.',
    NULL,
    '"organic matter"'::jsonb,
    'Organic matter improves soil texture, water retention, and microbial activity.',
    ARRAY['[', 'S', 'o', 'i', 'l', ' ', 'h', 'e', 'a', 'l', 't', 'h', '.', ',', 'M', 'i', 'c', 'r', 'o', 'b', 'i', 'a', 'l', ' ', 'f', 'o', 'o', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3633113a-1b2f-5b5b-85c3-ea0aa37b99d9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'Using manure instead of chemical fertiliser:',
    '["Is always worse", "Improves soil health over time and is more sustainable", "Produces less yield", "Is illegal"]'::jsonb,
    '1'::jsonb,
    'Organic manure builds soil health; chemicals alone do not.',
    ARRAY['[', 'L', 'o', 'n', 'g', '-', 't', 'e', 'r', 'm', ' ', 'b', 'e', 'n', 'e', 'f', 'i', 't', 's', '.', ',', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'p', 'r', 'a', 'c', 't', 'i', 'c', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0387fa58-4fca-51c5-afc8-5dce62d5f70f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'Fresh manure should be:',
    '["Applied directly to crops", "Composted or aged before use to kill pathogens and reduce burning", "Burned", "Thrown away"]'::jsonb,
    '1'::jsonb,
    'Fresh manure can burn plants and contain pathogens - composting is safer.',
    ARRAY['[', 'S', 'a', 'f', 'e', 't', 'y', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', 'i', 'n', 'g', '.', ',', 'P', 'a', 't', 'h', 'o', 'g', 'e', 'n', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1de7ac02-25fb-53cb-9f9f-5e985a4b4468',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'Why is mixing plant and animal waste better than using only one type?',
    '["It is not better", "Different waste types complement each other: plant adds carbon, animal adds nitrogen", "To make more waste", "For colour"]'::jsonb,
    '1'::jsonb,
    'Balanced C:N ratio speeds decomposition and improves compost quality.',
    ARRAY['[', 'C', 'a', 'r', 'b', 'o', 'n', '-', 'n', 'i', 't', 'r', 'o', 'g', 'e', 'n', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ',', 'C', 'o', 'm', 'p', 'o', 's', 't', 'i', 'n', 'g', ' ', 's', 'c', 'i', 'e', 'n', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b140e252-2aaf-5996-a665-21944fe3e8aa',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'What nutrients does animal manure primarily provide?',
    '["Only nitrogen", "Nitrogen, phosphorus, and potassium (NPK)", "Only phosphorus", "Only carbon"]'::jsonb,
    '1'::jsonb,
    'Manure provides all three primary nutrients plus micronutrients.',
    ARRAY['[', 'N', 'P', 'K', ' ', 'c', 'o', 'n', 't', 'e', 'n', 't', '.', ',', 'C', 'o', 'm', 'p', 'l', 'e', 't', 'e', ' ', 'f', 'e', 'r', 't', 'i', 'l', 'i', 's', 'e', 'r', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7dad7cd2-0ce6-59d7-9d44-fa819415c983',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'How does manure improve soil water retention?',
    '["It does not", "Organic matter in manure acts like a sponge, holding water in the soil", "By making soil heavier", "By reducing soil volume"]'::jsonb,
    '1'::jsonb,
    'Organic matter increases soil''s water-holding capacity.',
    ARRAY['[', 'S', 'o', 'i', 'l', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ',', 'D', 'r', 'o', 'u', 'g', 'h', 't', ' ', 'r', 'e', 's', 'i', 'l', 'i', 'e', 'n', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bae7f54b-42cf-5944-a92e-5e113370a5db',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'fill_in_blank',
    'Name one way to use crop residues in farming.',
    NULL,
    '"mulching"'::jsonb,
    'Mulching, composting, incorporation into soil, or feeding to livestock.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'u', 's', 'e', 's', '.', ',', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'r', 'e', 'c', 'o', 'v', 'e', 'r', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3a6c5384-97a7-530b-86c2-ef9c8b896e21',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'Why is it important to compost manure before applying it to food crops?',
    '["It is not important", "Composting kills harmful bacteria and parasites that could contaminate food", "To make it lighter", "To reduce volume"]'::jsonb,
    '1'::jsonb,
    'Pathogen reduction is critical for food safety.',
    ARRAY['[', 'F', 'o', 'o', 'd', ' ', 's', 'a', 'f', 'e', 't', 'y', '.', ',', 'P', 'a', 't', 'h', 'o', 'g', 'e', 'n', ' ', 'c', 'o', 'n', 't', 'r', 'o', 'l', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2f995bde-db94-56ad-a5da-85962acbd843',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'How does integrated waste management benefit a farm?',
    '["It does not", "Using both plant and animal waste creates a closed-loop system, reducing external inputs", "It increases costs", "It creates more waste"]'::jsonb,
    '1'::jsonb,
    'Integrated recycling reduces costs and environmental impact.',
    ARRAY['[', 'C', 'i', 'r', 'c', 'u', 'l', 'a', 'r', ' ', 'e', 'c', 'o', 'n', 'o', 'm', 'y', '.', ',', 'F', 'a', 'r', 'm', ' ', 's', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c6921b1c-be48-546a-87c8-32b633aff581',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'Why might a farmer prefer composted manure over fresh manure?',
    '["For appearance", "Composted manure is stable, has fewer pathogens, and does not burn plants", "Fresh is always better", "Compost is cheaper"]'::jsonb,
    '1'::jsonb,
    'Composting stabilises nutrients and reduces risks.',
    ARRAY['[', 'P', 'r', 'o', 'c', 'e', 's', 's', 'i', 'n', 'g', ' ', 'b', 'e', 'n', 'e', 'f', 'i', 't', 's', '.', ',', 'S', 'a', 'f', 'e', 't', 'y', ' ', 'a', 'n', 'd', ' ', 'q', 'u', 'a', 'l', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '520cab19-64b3-5b70-93ef-771a1307027a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'fill_in_blank',
    'Explain how animal waste contributes to the nutrient cycle in farming.',
    NULL,
    '"nutrient recycling"'::jsonb,
    'Animals eat crops → produce manure → manure fertilises soil → soil grows crops.',
    ARRAY['[', 'C', 'l', 'o', 's', 'e', 'd', ' ', 'l', 'o', 'o', 'p', '.', ',', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'c', 'y', 'c', 'l', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f8ebef91-fd0a-50ad-a2dd-47a10d66e35f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'A farmer has excess crop residues after harvest. What are three options?',
    '["Throw away", "Compost, mulch, or incorporate into soil; feed to livestock; or sell as biomass", "Burn all of it", "Leave in the field"]'::jsonb,
    '1'::jsonb,
    'Multiple options for different farming systems and needs.',
    ARRAY['[', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ',', 'W', 'a', 's', 't', 'e', ' ', 't', 'o', ' ', 'r', 'e', 's', 'o', 'u', 'r', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8e0db15d-de6f-5d68-8904-ec1ea1a7bcab',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'How does using organic waste as fertiliser reduce greenhouse gas emissions?',
    '["It does not", "It reduces the need for manufactured fertilisers, which require fossil fuels to produce", "It produces more CO2", "It has no effect"]'::jsonb,
    '1'::jsonb,
    'Chemical fertiliser production is energy-intensive; organic waste is a by-product.',
    ARRAY['[', 'C', 'a', 'r', 'b', 'o', 'n', ' ', 'f', 'o', 'o', 't', 'p', 'r', 'i', 'n', 't', '.', ',', 'M', 'a', 'n', 'u', 'f', 'a', 'c', 't', 'u', 'r', 'i', 'n', 'g', ' ', 'e', 'm', 'i', 's', 's', 'i', 'o', 'n', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4015939f-a415-5fb1-9c19-5c524e478f61',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'fill_in_blank',
    'Why is the ratio of carbon to nitrogen important in composting?',
    NULL,
    '"decomposition rate"'::jsonb,
    'The C:N ratio affects how fast microorganisms decompose the material - ideal is about 25-30:1.',
    ARRAY['[', 'M', 'i', 'c', 'r', 'o', 'b', 'i', 'a', 'l', ' ', 'a', 'c', 't', 'i', 'v', 'i', 't', 'y', '.', ',', 'C', 'o', 'm', 'p', 'o', 's', 't', 'i', 'n', 'g', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '63c29ee4-9650-573c-9b2e-a77bf1adc265',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'How can farmers in Ghana create a simple compost system?',
    '["They cannot", "Layer plant waste and manure in a pit or heap, turn regularly, and keep moist.", "Expensive equipment needed", "Only in laboratories"]'::jsonb,
    '1'::jsonb,
    'Simple pit or heap composting is accessible and effective.',
    ARRAY['[', 'L', 'o', 'w', '-', 't', 'e', 'c', 'h', ' ', 's', 'o', 'l', 'u', 't', 'i', 'o', 'n', '.', ',', 'P', 'r', 'a', 'c', 't', 'i', 'c', 'a', 'l', ' ', 'm', 'e', 't', 'h', 'o', 'd', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e8386332-c0e6-5d44-bc31-fc1365561c4e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'What problems can arise from using too much manure?',
    '["None", "Nutrient runoff polluting water, ammonia emissions, and salt buildup in soil", "Better crops always", "It is impossible to use too much"]'::jsonb,
    '1'::jsonb,
    'Excess manure can cause environmental problems if not managed.',
    ARRAY['[', 'O', 'v', 'e', 'r', '-', 'a', 'p', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', ' ', 'r', 'i', 's', 'k', '.', ',', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '56ff5408-04f5-5f85-b49c-96b2cdf82823',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.3.4.1'), NULL, 'multiple_choice',
    'Why is it important to record how much manure is applied to fields?',
    '["It is not important", "Records help optimise application rates and prevent over- or under-application", "For tax purposes", "Government requires it"]'::jsonb,
    '1'::jsonb,
    'Record keeping ensures balanced nutrient management.',
    ARRAY['[', 'P', 'r', 'e', 'c', 'i', 's', 'i', 'o', 'n', ' ', 'f', 'a', 'r', 'm', 'i', 'n', 'g', '.', ',', 'N', 'u', 't', 'r', 'i', 'e', 'n', 't', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.4.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ebb990b8-3d27-5f70-8ca1-635d53bc08cb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Energy conservation means:',
    '["Using more energy", "Using less energy and reducing waste", "Generating energy", "Storing energy"]'::jsonb,
    '1'::jsonb,
    'Conservation reduces energy consumption and waste.',
    ARRAY['[', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ',', 'R', 'e', 'd', 'u', 'c', 'i', 'n', 'g', ' ', 'd', 'e', 'm', 'a', 'n', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0237c5bd-a690-5206-8bc1-4f0038979970',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'One way to conserve energy at home is:',
    '["Leaving lights on", "Switching off lights when not in use", "Using more appliances", "Opening windows"]'::jsonb,
    '1'::jsonb,
    'Simple habits like switching off lights save energy.',
    ARRAY['[', 'B', 'e', 'h', 'a', 'v', 'i', 'o', 'u', 'r', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ',', 'E', 'a', 's', 'y', ' ', 'a', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '18711776-d067-50f9-aad8-4976cc0cb0bb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Energy-efficient appliances use:',
    '["More energy", "Less energy to perform the same task", "No energy", "More money"]'::jsonb,
    '1'::jsonb,
    'Efficient appliances convert more input energy to useful work.',
    ARRAY['[', 'L', 'e', 's', 's', ' ', 'w', 'a', 's', 't', 'e', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 's', 'a', 'v', 'i', 'n', 'g', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '591e5c1c-b21f-5ce8-9b3c-648727a0b87b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Insulating a building reduces:',
    '["Noise only", "Heat loss, reducing the energy needed for heating/cooling", "Light", "Air flow"]'::jsonb,
    '1'::jsonb,
    'Insulation slows heat transfer, keeping buildings warm or cool.',
    ARRAY['[', 'T', 'h', 'e', 'r', 'm', 'a', 'l', ' ', 'i', 'n', 's', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 's', 'a', 'v', 'i', 'n', 'g', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7c98d7ea-0952-569d-9434-0d41ec2de6cd',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'fill_in_blank',
    'LED bulbs use about ___% less energy than incandescent bulbs.',
    NULL,
    '"80"'::jsonb,
    'LEDs are about 80% more efficient than incandescent bulbs.',
    ARRAY['[', 'M', 'a', 'j', 'o', 'r', ' ', 's', 'a', 'v', 'i', 'n', 'g', '.', ',', 'L', 'o', 'n', 'g', ' ', 'l', 'i', 'f', 'e', 's', 'p', 'a', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0a118288-7a24-5541-a7b1-ac387cc0b085',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Renewable energy sources help conserve fossil fuels because:',
    '["They do not", "They provide alternative energy without depleting finite resources", "They are free", "They are unlimited"]'::jsonb,
    '1'::jsonb,
    'Renewables reduce dependence on non-renewable fossil fuels.',
    ARRAY['[', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'c', 'o', 'n', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ',', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '91a6c8f7-13b8-52b3-90b7-09084535aa93',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Why is energy conservation important for the environment?',
    '["It is not", "Less energy use means fewer emissions and less environmental damage", "Only for saving money", "Only for the government"]'::jsonb,
    '1'::jsonb,
    'Reduced energy consumption lowers pollution and greenhouse gas emissions.',
    ARRAY['[', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'b', 'e', 'n', 'e', 'f', 'i', 't', '.', ',', 'C', 'l', 'i', 'm', 'a', 't', 'e', ' ', 'p', 'r', 'o', 't', 'e', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ff4a3d6e-1d26-5cbe-b716-3f9b92a1baed',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'How does public transport help conserve energy?',
    '["It does not", "Shared transport uses less energy per person than individual cars", "Public transport uses more energy", "Only for the poor"]'::jsonb,
    '1'::jsonb,
    'Higher passenger density = less energy per person per trip.',
    ARRAY['[', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', ' ', 'g', 'a', 'i', 'n', '.', ',', 'R', 'e', 'd', 'u', 'c', 'e', 'd', ' ', 'e', 'm', 'i', 's', 's', 'i', 'o', 'n', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ba551506-1d2c-5ae4-a893-2664d798a345',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Why should buildings have proper ventilation in hot climates?',
    '["For decoration", "Natural ventilation reduces the need for air conditioning, saving energy", "To let in rain", "To increase heat"]'::jsonb,
    '1'::jsonb,
    'Good ventilation uses natural airflow to cool buildings.',
    ARRAY['[', 'P', 'a', 's', 's', 'i', 'v', 'e', ' ', 'c', 'o', 'o', 'l', 'i', 'n', 'g', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 's', 'a', 'v', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '50adc7c9-1b65-53d3-8d50-5fcf94abb7b2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'fill_in_blank',
    'Name one way industries can conserve energy.',
    NULL,
    '"efficient machinery"'::jsonb,
    'Use efficient machinery, recover waste heat, and optimise processes.',
    ARRAY['[', 'I', 'n', 'd', 'u', 's', 't', 'r', 'i', 'a', 'l', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ',', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 's', 't', 'r', 'a', 't', 'e', 'g', 'i', 'e', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '584de0a5-efe4-5164-b15f-53deeb1a4b2c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Why is turning off car engines when stationary important for energy conservation?',
    '["It is not important", "Idling wastes fuel without moving the vehicle", "Cars use no fuel when idling", "It protects the engine"]'::jsonb,
    '1'::jsonb,
    'Idling consumes fuel for no useful work - switching off saves energy.',
    ARRAY['[', 'F', 'u', 'e', 'l', ' ', 's', 'a', 'v', 'i', 'n', 'g', '.', ',', 'E', 'm', 'i', 's', 's', 'i', 'o', 'n', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd82be9d7-2f6c-5c5d-8f0d-c1b169c53f08',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'How does using natural light during the day conserve energy?',
    '["It does not", "Natural light replaces artificial lighting, reducing electricity consumption", "It makes rooms hotter", "It is not reliable"]'::jsonb,
    '1'::jsonb,
    'Daylighting reduces the need for electric lighting.',
    ARRAY['[', 'P', 'a', 's', 's', 'i', 'v', 'e', ' ', 'd', 'e', 's', 'i', 'g', 'n', '.', ',', 'L', 'i', 'g', 'h', 't', ' ', 'h', 'a', 'r', 'v', 'e', 's', 't', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4fbb06c7-2e4e-51bf-b4d5-3d3f068e71cb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'A factory uses 10,000 kWh per month. After efficiency improvements, they use 7,000 kWh. What percentage did they save?',
    '["3%", "30%", "70%", "300%"]'::jsonb,
    '1'::jsonb,
    'Savings = (10,000 - 7,000) / 10,000 = 30%.',
    ARRAY['[', 'P', 'e', 'r', 'c', 'e', 'n', 't', 'a', 'g', 'e', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 's', 'a', 'v', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4fc755e3-cd48-59af-81aa-abd39ccb1962',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Why do some countries offer incentives for energy conservation?',
    '["For fun", "Conservation reduces national energy costs, improves energy security, and meets climate targets", "To punish citizens", "To increase taxes"]'::jsonb,
    '1'::jsonb,
    'Government incentives align individual and national interests.',
    ARRAY['[', 'P', 'o', 'l', 'i', 'c', 'y', ' ', 't', 'o', 'o', 'l', '.', ',', 'N', 'a', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'b', 'e', 'n', 'e', 'f', 'i', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '51d71af8-e356-5e39-ab67-5bd4a5dc6b96',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'fill_in_blank',
    'Explain why "energy conservation" is often called the "first fuel."',
    NULL,
    '"cheapest energy"'::jsonb,
    'The cheapest energy is the energy you do not use - conservation is the most cost-effective resource.',
    ARRAY['[', 'D', 'e', 'm', 'a', 'n', 'd', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ',', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f092e010-1631-5b42-b7d5-9cf2ece4b69b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'How does urbanisation affect energy consumption?',
    '["No effect", "Cities concentrate energy demand; buildings, transport, and industry consume more energy", "Rural areas use more energy", "Urbanisation reduces energy use"]'::jsonb,
    '1'::jsonb,
    'Urban areas have higher per capita energy consumption.',
    ARRAY['[', 'C', 'o', 'n', 'c', 'e', 'n', 't', 'r', 'a', 't', 'i', 'o', 'n', ' ', 'e', 'f', 'f', 'e', 'c', 't', '.', ',', 'I', 'n', 'f', 'r', 'a', 's', 't', 'r', 'u', 'c', 't', 'u', 'r', 'e', ' ', 'd', 'e', 'm', 'a', 'n', 'd', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'be2b0d96-bd0e-55e5-a5a3-49c0cbf76eb9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Why is it important to teach children about energy conservation?',
    '["It is not", "Early habits persist - children who conserve energy grow into energy-conscious adults", "Only for exams", "Only for the environment"]'::jsonb,
    '1'::jsonb,
    'Education builds lifelong conservation habits.',
    ARRAY['[', 'B', 'e', 'h', 'a', 'v', 'i', 'o', 'u', 'r', 'a', 'l', ' ', 'f', 'o', 'u', 'n', 'd', 'a', 't', 'i', 'o', 'n', '.', ',', 'F', 'u', 't', 'u', 'r', 'e', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5b75fae0-2ba6-5f61-ab1d-4a8f4af2c30b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'How can smart meters help conserve energy?',
    '["They cannot", "Smart meters show real-time energy use, helping consumers identify waste and adjust behaviour", "They use more energy", "They are decorative"]'::jsonb,
    '1'::jsonb,
    'Awareness of consumption patterns drives conservation.',
    ARRAY['[', 'F', 'e', 'e', 'd', 'b', 'a', 'c', 'k', ' ', 'm', 'e', 'c', 'h', 'a', 'n', 'i', 's', 'm', '.', ',', 'B', 'e', 'h', 'a', 'v', 'i', 'o', 'u', 'r', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b70cbeda-df0c-56a9-9b68-398909a5b96b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'A household switches to solar panels. How does this contribute to energy conservation?',
    '["It does not", "Solar panels generate electricity without consuming fossil fuels, reducing overall resource depletion", "Solar panels use more energy", "They only work at night"]'::jsonb,
    '1'::jsonb,
    'Solar energy displaces fossil fuel consumption.',
    ARRAY['[', 'R', 'e', 'n', 'e', 'w', 'a', 'b', 'l', 'e', ' ', 'g', 'e', 'n', 'e', 'r', 'a', 't', 'i', 'o', 'n', '.', ',', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'c', 'o', 'n', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2c034d94-adae-5ad0-9fff-684bcb6f7c03',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.1'), NULL, 'multiple_choice',
    'Why is energy conservation important for developing countries like Ghana?',
    '["It is not", "Conservation reduces costs, improves energy access, and supports sustainable development", "Only for rich countries", "Only for industry"]'::jsonb,
    '1'::jsonb,
    'Efficient energy use stretches limited resources further.',
    ARRAY['[', 'D', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', ' ', 'e', 'n', 'a', 'b', 'l', 'e', 'r', '.', ',', 'C', 'o', 's', 't', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.4.1.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '59f3bdb1-8c21-504b-bd91-a87c4080bff6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'Energy consumption is measured in:',
    '["Metres", "Kilowatt-hours (kWh)", "Kilograms", "Degrees"]'::jsonb,
    '1'::jsonb,
    'kWh is the standard unit for measuring energy consumption.',
    ARRAY['[', 'E', 'l', 'e', 'c', 't', 'r', 'i', 'c', 'i', 't', 'y', ' ', 'b', 'i', 'l', 'l', 's', '.', ',', 'P', 'o', 'w', 'e', 'r', ' ', 'x', ' ', 't', 'i', 'm', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f8236616-a35b-5e42-a36c-237709110b71',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'A 100W bulb left on for 10 hours uses:',
    '["100 kWh", "1 kWh", "10 kWh", "0.1 kWh"]'::jsonb,
    '1'::jsonb,
    'Energy = Power x Time = 0.1 kW x 10 h = 1 kWh.',
    ARRAY['[', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ',', 'E', ' ', '=', ' ', 'P', ' ', 'x', ' ', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '97494e0f-a3b7-545b-b4c9-e84cf23943f9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'The formula for energy consumption is:',
    '["E = m x c", "E = P x t", "E = F x d", "E = m x v"]'::jsonb,
    '1'::jsonb,
    'Energy (kWh) = Power (kW) x Time (hours).',
    ARRAY['[', 'B', 'a', 's', 'i', 'c', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', '.', ',', 'U', 'n', 'i', 't', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', ' ', 'n', 'e', 'e', 'd', 'e', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fea1c43b-b7aa-5718-aa45-b986aa8f08f2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'A 2kW heater runs for 3 hours. Energy used is:',
    '["6 kWh", "5 kWh", "0.67 kWh", "600 kWh"]'::jsonb,
    '0'::jsonb,
    'E = P x t = 2 x 3 = 6 kWh.',
    ARRAY['[', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'm', 'u', 'l', 't', 'i', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'k', 'W', ' ', 'x', ' ', 'h', 'o', 'u', 'r', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a1c6211a-e3b8-536e-aafa-cb7647b6c17b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'Electricity bills are based on:',
    '["Time of use only", "Energy consumed in kilowatt-hours (kWh)", "Number of appliances", "Colour of wires"]'::jsonb,
    '1'::jsonb,
    'Bills charge for total energy consumed, measured in kWh.',
    ARRAY['[', 'M', 'e', 't', 'e', 'r', ' ', 'r', 'e', 'a', 'd', 'i', 'n', 'g', '.', ',', 'U', 's', 'a', 'g', 'e', '-', 'b', 'a', 's', 'e', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc2bac59-1f3f-5da0-bf66-31453559ca24',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'A 500W appliance runs for 4 hours. Energy consumed is:',
    '["2000 kWh", "2 kWh", "0.5 kWh", "500 kWh"]'::jsonb,
    '1'::jsonb,
    'E = 0.5 kW x 4 h = 2 kWh.',
    ARRAY['[', 'C', 'o', 'n', 'v', 'e', 'r', 't', ' ', 'W', ' ', 't', 'o', ' ', 'k', 'W', ' ', 'f', 'i', 'r', 's', 't', '.', ',', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd4189e14-eac1-5a1f-aa5b-a5a787eeaaa9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'How can a household reduce its electricity bill?',
    '["Use more appliances", "Use energy-efficient appliances and switch off unused devices", "Leave everything on", "Use only candles"]'::jsonb,
    '1'::jsonb,
    'Efficient use and switching off reduces consumption.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 's', 'a', 'v', 'i', 'n', 'g', '.', ',', 'C', 'o', 's', 't', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a03db6ef-8e6f-5252-a79f-999c5152e466',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'A family uses 150 kWh per month at $0.10 per kWh. Monthly cost is:',
    '["$15", "$150", "$1.50", "$1500"]'::jsonb,
    '0'::jsonb,
    'Cost = 150 x $0.10 = $15.',
    ARRAY['[', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'm', 'u', 'l', 't', 'i', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'B', 'i', 'l', 'l', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '426a835b-96b0-5ffd-9cde-4f6c91f7bfb0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'Why do some appliances use more energy than others?',
    '["They are bigger", "Higher power rating (watts) means more energy consumption per hour", "They are newer", "They are cheaper"]'::jsonb,
    '1'::jsonb,
    'Power rating determines energy use - a 2000W heater uses more than a 100W bulb.',
    ARRAY['[', 'P', 'o', 'w', 'e', 'r', ' ', 'r', 'a', 't', 'i', 'n', 'g', '.', ',', 'W', 'a', 't', 't', 'a', 'g', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4a156a13-344c-587e-bfa8-3c003b931c7d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'fill_in_blank',
    'Calculate the energy used by a 3kW iron used for 2 hours daily for 5 days.',
    NULL,
    '"30 kWh"'::jsonb,
    'E = 3 x 2 x 5 = 30 kWh.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'u', 's', 'e', 's', '.', ',', 'T', 'o', 't', 'a', 'l', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '27f9bbe9-7cce-5d03-9e83-951cb7e46d71',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'Why is it important to calculate energy consumption?',
    '["It is not important", "It helps manage costs, plan energy use, and identify waste", "For homework only", "For scientists only"]'::jsonb,
    '1'::jsonb,
    'Understanding consumption enables better energy management.',
    ARRAY['[', 'F', 'i', 'n', 'a', 'n', 'c', 'i', 'a', 'l', ' ', 'p', 'l', 'a', 'n', 'n', 'i', 'n', 'g', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'a', 'w', 'a', 'r', 'e', 'n', 'e', 's', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8f5beacc-3bc9-5ce4-a2a6-0a6cd4005910',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'A refrigerator runs 24 hours a day. If it uses 0.1 kWh per hour, daily consumption is:',
    '["1 kWh", "2.4 kWh", "24 kWh", "0.24 kWh"]'::jsonb,
    '1'::jsonb,
    'E = 0.1 x 24 = 2.4 kWh per day.',
    ARRAY['[', 'C', 'o', 'n', 't', 'i', 'n', 'u', 'o', 'u', 's', ' ', 'u', 's', 'e', '.', ',', 'D', 'a', 'i', 'l', 'y', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95f210f2-a386-524e-8aac-95343177c747',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'Why is it cheaper to use electricity at off-peak times in some countries?',
    '["It is not cheaper", "Demand is lower at off-peak times, so utilities charge less to spread consumption", "Peak times are cheaper", "Electricity is free at night"]'::jsonb,
    '1'::jsonb,
    'Time-of-use pricing encourages consumption when demand is low.',
    ARRAY['[', 'L', 'o', 'a', 'd', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'i', 'n', 'g', '.', ',', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'i', 'n', 'c', 'e', 'n', 't', 'i', 'v', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8aa98de4-b784-580d-bc0e-11f4bcc26211',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'fill_in_blank',
    'A school has 20 bulbs of 60W each, used 8 hours daily. Monthly energy (30 days)?',
    NULL,
    '"288 kWh"'::jsonb,
    'E = 20 x 0.06 kW x 8 h x 30 days = 288 kWh.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'b', 'u', 'l', 'b', 's', '.', ',', 'M', 'o', 'n', 't', 'h', 'l', 'y', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5010342a-722e-556f-a302-8a440a8d8adc',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'How can a business reduce energy costs without reducing output?',
    '["They cannot", "Use efficient equipment, optimise schedules, recover waste heat, and maintain equipment", "Only by shutting down", "By using candles"]'::jsonb,
    '1'::jsonb,
    'Efficiency improvements reduce costs without affecting productivity.',
    ARRAY['[', 'I', 'n', 'd', 'u', 's', 't', 'r', 'i', 'a', 'l', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ',', 'C', 'o', 's', 't', ' ', 's', 'a', 'v', 'i', 'n', 'g', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '62ba591f-6069-54f1-97e4-c86ce361e1d9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'Why might two houses with the same appliances have different energy bills?',
    '["Impossible", "Different usage patterns, appliance efficiency, insulation, and habits affect consumption", "Only size matters", "Only location matters"]'::jsonb,
    '1'::jsonb,
    'Behaviour and building factors significantly affect energy use.',
    ARRAY['[', 'U', 's', 'a', 'g', 'e', ' ', 'p', 'a', 't', 't', 'e', 'r', 'n', 's', '.', ',', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '00d741b2-03fc-5770-a08e-dd17b0ccd50d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'fill_in_blank',
    'Explain why energy monitoring is important for large buildings.',
    NULL,
    '"management"'::jsonb,
    'Monitoring identifies waste, tracks efficiency improvements, and verifies savings.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ',', 'P', 'e', 'r', 'f', 'o', 'r', 'm', 'a', 'n', 'c', 'e', ' ', 't', 'r', 'a', 'c', 'k', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5b9160ce-da63-589c-bb29-97745cd3497e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'A solar panel system generates 5 kWh daily. If a home uses 10 kWh daily, how much grid electricity is needed?',
    '["15 kWh", "5 kWh", "10 kWh", "0 kWh"]'::jsonb,
    '1'::jsonb,
    'Grid needed = 10 - 5 = 5 kWh (assuming no battery storage).',
    ARRAY['[', 'S', 'o', 'l', 'a', 'r', ' ', 'o', 'f', 'f', 's', 'e', 't', '.', ',', 'G', 'r', 'i', 'd', ' ', 's', 'u', 'p', 'p', 'l', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '113fe67b-e211-5353-a49a-9aba321a6ba0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'Why is energy literacy important for citizens?',
    '["It is not", "Understanding energy helps make informed decisions about consumption, costs, and sustainability", "Only for engineers", "Only for politicians"]'::jsonb,
    '1'::jsonb,
    'Energy literacy empowers individuals to manage their energy use.',
    ARRAY['[', 'I', 'n', 'f', 'o', 'r', 'm', 'e', 'd', ' ', 'd', 'e', 'c', 'i', 's', 'i', 'o', 'n', 's', '.', ',', 'P', 'e', 'r', 's', 'o', 'n', 'a', 'l', ' ', 'r', 'e', 's', 'p', 'o', 'n', 's', 'i', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a4065ee8-edfe-587b-b79b-0e0302d155de',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.2'), NULL, 'multiple_choice',
    'How does energy consumption relate to carbon emissions?',
    '["No relation", "Higher fossil fuel consumption = higher CO2 emissions", "Only renewable energy produces CO2", "Carbon is not related to energy"]'::jsonb,
    '1'::jsonb,
    'Burning fossil fuels for energy releases CO2 - consumption drives emissions.',
    ARRAY['[', 'C', 'l', 'i', 'm', 'a', 't', 'e', ' ', 'c', 'o', 'n', 'n', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'E', 'm', 'i', 's', 's', 'i', 'o', 'n', ' ', 'f', 'a', 'c', 't', 'o', 'r', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.4.1.3
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aa9e6193-1dc4-5b6d-ab39-e7fa00df84b1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'fill_in_blank',
    'Refraction is the bending of light as it passes from one ___ to another.',
    NULL,
    '"medium"'::jsonb,
    'Refraction occurs when light changes speed at a boundary between media.',
    ARRAY['[', 'S', 'p', 'e', 'e', 'd', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ',', 'B', 'o', 'u', 'n', 'd', 'a', 'r', 'y', ' ', 'e', 'f', 'f', 'e', 'c', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4c79a94a-9b88-5995-8a97-146fd4d93473',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'fill_in_blank',
    'Light bends towards the normal when entering a ___ medium.',
    NULL,
    '"denser"'::jsonb,
    'Light slows down and bends toward the normal in denser media.',
    ARRAY['[', 'A', 'i', 'r', ' ', 't', 'o', ' ', 'g', 'l', 'a', 's', 's', '.', ',', 'S', 'p', 'e', 'e', 'd', ' ', 'd', 'e', 'c', 'r', 'e', 'a', 's', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '63218962-9929-54af-9e5e-feb1989bee46',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'fill_in_blank',
    'Light bends away from the normal when entering a ___ medium.',
    NULL,
    '"less dense"'::jsonb,
    'Light speeds up and bends away from normal in less dense media.',
    ARRAY['[', 'G', 'l', 'a', 's', 's', ' ', 't', 'o', ' ', 'a', 'i', 'r', '.', ',', 'S', 'p', 'e', 'e', 'd', ' ', 'i', 'n', 'c', 'r', 'e', 'a', 's', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3fdfc103-3b7c-51da-be8d-270fd8e38992',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'A straw in water appears bent due to:',
    '["Reflection", "Refraction", "Diffraction", "Absorption"]'::jsonb,
    '1'::jsonb,
    'Refraction at the water surface makes the straw appear displaced.',
    ARRAY['[', 'O', 'p', 't', 'i', 'c', 'a', 'l', ' ', 'i', 'l', 'l', 'u', 's', 'i', 'o', 'n', '.', ',', 'L', 'i', 'g', 'h', 't', ' ', 'b', 'e', 'n', 'd', 'i', 'n', 'g', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3ff8c77d-5918-52f9-99d4-05cea64cab0a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'A prism splits white light into colours because of:',
    '["Reflection", "Different colours refract by different amounts", "Absorption", "Diffraction"]'::jsonb,
    '1'::jsonb,
    'Different wavelengths refract differently - dispersion.',
    ARRAY['[', 'S', 'p', 'e', 'c', 't', 'r', 'u', 'm', '.', ',', 'C', 'o', 'l', 'o', 'u', 'r', ' ', 's', 'e', 'p', 'a', 'r', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c3a04672-4ff9-5edc-b1ab-11ea63e7ca8c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'The seven colours of the rainbow are:',
    '["Red, blue, green", "Red, orange, yellow, green, blue, indigo, violet", "Red, yellow, blue", "White, black, grey"]'::jsonb,
    '1'::jsonb,
    'ROYGBIV - the visible spectrum.',
    ARRAY['[', 'N', 'e', 'w', 't', 'o', 'n', '''', 's', ' ', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '.', ',', 'V', 'i', 's', 'i', 'b', 'l', 'e', ' ', 'l', 'i', 'g', 'h', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'be8a6259-45b5-5e43-ac98-520e7412689b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'Why does a swimming pool look shallower than it really is?',
    '["It is not shallower", "Light from the bottom refracts at the surface, making the bottom appear closer", "The water is clear", "Reflection makes it deeper"]'::jsonb,
    '1'::jsonb,
    'Refraction bends light upward, creating a virtual image of the bottom.',
    ARRAY['[', 'A', 'p', 'p', 'a', 'r', 'e', 'n', 't', ' ', 'd', 'e', 'p', 't', 'h', '.', ',', 'O', 'p', 't', 'i', 'c', 'a', 'l', ' ', 'i', 'l', 'l', 'u', 's', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a72f5e26-9ecb-53dd-a39f-a6f2b409b78e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'Lenses work because of:',
    '["Reflection", "Refraction - they bend light to focus or spread it", "Diffraction", "Absorption"]'::jsonb,
    '1'::jsonb,
    'Convex and convex lenses refract light to form images.',
    ARRAY['[', 'F', 'o', 'c', 'a', 'l', ' ', 'p', 'o', 'i', 'n', 't', '.', ',', 'I', 'm', 'a', 'g', 'e', ' ', 'f', 'o', 'r', 'm', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '83985eaf-5838-51f1-8483-7c1f5a0c56c0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'A convex lens is:',
    '["Thinner in the middle", "Thicker in the middle, converging light to a focus", "Flat on both sides", "Thinner at the edges"]'::jsonb,
    '1'::jsonb,
    'Convex lenses are thicker in the middle - they converge light.',
    ARRAY['[', 'C', 'o', 'n', 'v', 'e', 'r', 'g', 'i', 'n', 'g', ' ', 'l', 'e', 'n', 's', '.', ',', 'F', 'o', 'c', 'a', 'l', ' ', 'p', 'o', 'i', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7ee48e0b-856e-56a3-b52b-60713fc21362',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'A concave lens:',
    '["Converges light", "Diverges (spreads) light", "Does not affect light", "Only reflects light"]'::jsonb,
    '1'::jsonb,
    'Concave lenses are thinner in the middle - they diverge light.',
    ARRAY['[', 'D', 'i', 'v', 'e', 'r', 'g', 'i', 'n', 'g', ' ', 'l', 'e', 'n', 's', '.', ',', 'V', 'i', 'r', 't', 'u', 'a', 'l', ' ', 'f', 'o', 'c', 'u', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1668b64c-2ef0-5546-8fac-8c2206271b9b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'Why does light refract when passing between media?',
    '["It does not refract", "Light changes speed at the boundary, causing a change in direction", "Reflection occurs", "Absorption occurs"]'::jsonb,
    '1'::jsonb,
    'Different media have different refractive indices - speed change causes bending.',
    ARRAY['[', 'S', 'p', 'e', 'e', 'd', ' ', 'd', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 'c', 'e', '.', ',', 'D', 'i', 'r', 'e', 'c', 't', 'i', 'o', 'n', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8d9890c5-b5fd-536c-873b-887ad0eb93f1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'The angle of incidence and angle of refraction are related by:',
    '["They are equal", "Snell''s Law (n1 sin \u03b81 = n2 sin \u03b82)", "They are always 90 degrees", "There is no relationship"]'::jsonb,
    '1'::jsonb,
    'Snell''s Law quantifies refraction.',
    ARRAY['[', 'M', 'a', 't', 'h', 'e', 'm', 'a', 't', 'i', 'c', 'a', 'l', ' ', 'r', 'e', 'l', 'a', 't', 'i', 'o', 'n', 's', 'h', 'i', 'p', '.', ',', 'R', 'e', 'f', 'r', 'a', 'c', 't', 'i', 'v', 'e', ' ', 'i', 'n', 'd', 'e', 'x', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ce14fe9b-315b-5099-af37-19aa682835af',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'Why do diamonds sparkle so much?',
    '["They are shiny", "High refractive index causes total internal reflection, trapping and reflecting light", "They are expensive", "They are clear"]'::jsonb,
    '1'::jsonb,
    'Diamonds have a very high refractive index, causing brilliant light effects.',
    ARRAY['[', 'T', 'o', 't', 'a', 'l', ' ', 'i', 'n', 't', 'e', 'r', 'n', 'a', 'l', ' ', 'r', 'e', 'f', 'l', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'B', 'r', 'i', 'l', 'l', 'i', 'a', 'n', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f17e3c65-a0df-5016-9c0b-57dfeec49626',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'fill_in_blank',
    'Explain why a mirage occurs on a hot road.',
    NULL,
    '"refraction"'::jsonb,
    'Hot air near the road has different density, refracting light and creating a reflection-like image.',
    ARRAY['[', 'A', 't', 'm', 'o', 's', 'p', 'h', 'e', 'r', 'i', 'c', ' ', 'r', 'e', 'f', 'r', 'a', 'c', 't', 'i', 'o', 'n', '.', ',', 'D', 'e', 'n', 's', 'i', 't', 'y', ' ', 'l', 'a', 'y', 'e', 'r', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '353a85cd-81f3-5449-adf6-0f31574afb69',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'fill_in_blank',
    'Why does a lens form an image?',
    NULL,
    '"refraction"'::jsonb,
    'Light rays from each point on the object refract through the lens, converging to form an image.',
    ARRAY['[', 'I', 'm', 'a', 'g', 'e', ' ', 'f', 'o', 'r', 'm', 'a', 't', 'i', 'o', 'n', '.', ',', 'R', 'a', 'y', ' ', 'd', 'i', 'a', 'g', 'r', 'a', 'm', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ed8959ea-ab23-51b5-a69c-2cb7d5e028bc',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'A ray of light enters a glass block at 30° to the normal. If it refracts to 20°, which medium is denser?',
    '["Air", "Glass", "Both are equal", "Cannot tell"]'::jsonb,
    '1'::jsonb,
    'Light bends toward the normal when entering a denser medium - glass is denser.',
    ARRAY['[', 'R', 'e', 'f', 'r', 'a', 'c', 't', 'i', 'o', 'n', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'D', 'e', 'n', 's', 'i', 't', 'y', ' ', 'i', 'n', 'd', 'i', 'c', 'a', 't', 'o', 'r', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '97fc366b-6ef2-5536-9335-399db97a52b9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'How do corrective glasses (spectacles) use refraction?',
    '["They do not", "Lenses refract light to correct vision - focusing light properly on the retina", "They reflect light", "They block light"]'::jsonb,
    '1'::jsonb,
    'Spectacle lenses compensate for eye defects by refracting light correctly.',
    ARRAY['[', 'V', 'i', 's', 'i', 'o', 'n', ' ', 'c', 'o', 'r', 'r', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'O', 'p', 't', 'i', 'c', 'a', 'l', ' ', 'a', 'i', 'd', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '58a8541d-5b0a-5941-8626-e7de96ad3c26',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'fill_in_blank',
    'Why does a rainbow appear when sunlight passes through raindrops?',
    NULL,
    '"dispersion"'::jsonb,
    'Raindrops refract and disperse sunlight into its component colours, creating a rainbow.',
    ARRAY['[', 'R', 'e', 'f', 'r', 'a', 'c', 't', 'i', 'o', 'n', ' ', '+', ' ', 'r', 'e', 'f', 'l', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 'l', 'o', 'u', 'r', ' ', 's', 'p', 'e', 'c', 't', 'r', 'u', 'm', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0479b996-3d80-5bd9-8024-9703cf9cdf86',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'What is total internal reflection?',
    '["Reflection from a mirror", "When light hits a boundary at an angle greater than the critical angle and is completely reflected", "Partial reflection", "Refraction"]'::jsonb,
    '1'::jsonb,
    'Total internal reflection occurs when light cannot exit a denser medium.',
    ARRAY['[', 'C', 'r', 'i', 't', 'i', 'c', 'a', 'l', ' ', 'a', 'n', 'g', 'l', 'e', '.', ',', 'F', 'i', 'b', 'r', 'e', ' ', 'o', 'p', 't', 'i', 'c', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ea03f20a-2ac2-5c8d-b9df-93cb2ec09fad',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.1.3'), NULL, 'multiple_choice',
    'Why are fibre optic cables important?',
    '["For decoration", "They use total internal reflection to transmit light (data) over long distances with minimal loss", "They are cheap", "They carry electricity"]'::jsonb,
    '1'::jsonb,
    'Fibre optics use TIR for high-speed data transmission.',
    ARRAY['[', 'C', 'o', 'm', 'm', 'u', 'n', 'i', 'c', 'a', 't', 'i', 'o', 'n', ' ', 't', 'e', 'c', 'h', 'n', 'o', 'l', 'o', 'g', 'y', '.', ',', 'L', 'i', 'g', 'h', 't', '-', 'b', 'a', 's', 'e', 'd', ' ', 'd', 'a', 't', 'a', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.4.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1d3b7b34-e06f-529b-9590-4311a0480d5a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'Electrical energy can be transformed to:',
    '["Only heat", "Heat, light, kinetic, sound, and chemical energy", "Only light", "Only kinetic"]'::jsonb,
    '1'::jsonb,
    'Electrical energy is versatile - it converts to many forms.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', 's', '.', ',', 'U', 'b', 'i', 'q', 'u', 'i', 't', 'o', 'u', 's', ' ', 'u', 's', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e6004d91-4b85-5527-ab5f-11a0202d0ae4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'An electric motor converts electrical energy to:',
    '["Heat only", "Kinetic energy (movement)", "Light energy", "Chemical energy"]'::jsonb,
    '1'::jsonb,
    'Electric motors convert electrical to mechanical (kinetic) energy.',
    ARRAY['[', 'R', 'o', 't', 'a', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'm', 'o', 't', 'i', 'o', 'n', '.', ',', 'M', 'o', 't', 'o', 'r', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e9529525-c6b2-5c5e-abf5-62873e69d5e8',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'A light bulb converts electrical energy to:',
    '["Only heat", "Light and heat", "Only light", "Chemical energy"]'::jsonb,
    '1'::jsonb,
    'Bulbs convert electricity to light (and waste heat).',
    ARRAY['[', 'I', 'l', 'l', 'u', 'm', 'i', 'n', 'a', 't', 'i', 'o', 'n', '.', ',', 'N', 'o', 't', ' ', '1', '0', '0', '%', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a974dd27-a72e-5d76-b76b-dd509813fc95',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'An electric heater converts electrical energy to:',
    '["Light only", "Heat energy", "Kinetic energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Heaters convert electricity to heat through resistance.',
    ARRAY['[', 'J', 'o', 'u', 'l', 'e', ' ', 'h', 'e', 'a', 't', 'i', 'n', 'g', '.', ',', 'R', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', ' ', 'h', 'e', 'a', 't', 'i', 'n', 'g', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '99394489-edd6-588f-9ae0-8145a0cf27c9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'A battery charger converts electrical energy to:',
    '["Only heat", "Chemical energy stored in the battery", "Light energy", "Kinetic energy"]'::jsonb,
    '1'::jsonb,
    'Chargers convert electrical energy to chemical energy in the battery.',
    ARRAY['[', 'R', 'e', 'c', 'h', 'a', 'r', 'g', 'i', 'n', 'g', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 's', 't', 'o', 'r', 'a', 'g', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '305c625a-8396-5a7c-85f0-e3e788a4edcb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'In a series circuit, the total resistance:',
    '["Decreases", "Increases as more components are added", "Stays the same", "Becomes zero"]'::jsonb,
    '1'::jsonb,
    'Series: R_total = R1 + R2 + R3...',
    ARRAY['[', 'A', 'd', 'd', 'i', 'n', 'g', ' ', 'r', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', 's', '.', ',', 'M', 'o', 'r', 'e', ' ', 'c', 'o', 'm', 'p', 'o', 'n', 'e', 'n', 't', 's', ' ', '=', ' ', 'm', 'o', 'r', 'e', ' ', 'r', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '596d2c27-ee46-5634-8e5f-1c0aa38b007d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'In a parallel circuit, the total resistance:',
    '["Increases", "Decreases as more branches are added", "Stays the same", "Is infinite"]'::jsonb,
    '1'::jsonb,
    'Parallel: 1/R_total = 1/R1 + 1/R2 + ...',
    ARRAY['[', 'R', 'e', 'c', 'i', 'p', 'r', 'o', 'c', 'a', 'l', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', '.', ',', 'M', 'o', 'r', 'e', ' ', 'b', 'r', 'a', 'n', 'c', 'h', 'e', 's', ' ', '=', ' ', 'l', 'e', 's', 's', ' ', 'r', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '24bd8d40-96e6-57de-85a3-fff5d7cbb4d9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'Why do houses use parallel circuits?',
    '["It uses less wire", "Each appliance gets full voltage and operates independently", "It is cheaper", "It is the law"]'::jsonb,
    '1'::jsonb,
    'Parallel circuits ensure each device gets the same voltage and can be switched independently.',
    ARRAY['[', 'I', 'n', 'd', 'e', 'p', 'e', 'n', 'd', 'e', 'n', 't', ' ', 'o', 'p', 'e', 'r', 'a', 't', 'i', 'o', 'n', '.', ',', 'V', 'o', 'l', 't', 'a', 'g', 'e', ' ', 'c', 'o', 'n', 's', 'i', 's', 't', 'e', 'n', 'c', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '11a866fc-35a8-5aed-8e74-889f0a279ad2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'A 12V battery connected to a 4ohm resistor produces current of:',
    '["48A", "3A", "0.33A", "4A"]'::jsonb,
    '1'::jsonb,
    'I = V/R = 12/4 = 3A.',
    ARRAY['[', 'O', 'h', 'm', '''', 's', ' ', 'L', 'a', 'w', '.', ',', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'd', 'i', 'v', 'i', 's', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd29bb729-ec22-5495-841a-182af9bd7a90',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'Power in an electrical circuit is measured in:',
    '["Volts", "Amperes", "Watts", "Ohms"]'::jsonb,
    '2'::jsonb,
    'Power is measured in Watts (W). P = V x I.',
    ARRAY['[', 'P', 'o', 'w', 'e', 'r', ' ', 'u', 'n', 'i', 't', '.', ',', 'P', ' ', '=', ' ', 'V', 'I', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a6dcea25-cd5b-53f6-96f5-63cc3a232f74',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'A 100W bulb connected to 240V draws current of:',
    '["24A", "0.42A", "100A", "2.4A"]'::jsonb,
    '1'::jsonb,
    'I = P/V = 100/240 = 0.42A.',
    ARRAY['[', 'P', 'o', 'w', 'e', 'r', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', ' ', 'r', 'e', 'a', 'r', 'r', 'a', 'n', 'g', 'e', 'd', '.', ',', 'C', 'u', 'r', 'r', 'e', 'n', 't', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bc0cdb50-da0e-545f-9cdd-69b7506c904d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'Why are fuses important in electrical circuits?',
    '["For decoration", "Fuses protect circuits by melting when current exceeds a safe level, breaking the circuit", "To increase current", "To reduce voltage"]'::jsonb,
    '1'::jsonb,
    'Fuses are safety devices that prevent overheating and fires.',
    ARRAY['[', 'O', 'v', 'e', 'r', 'c', 'u', 'r', 'r', 'e', 'n', 't', ' ', 'p', 'r', 'o', 't', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'S', 'a', 'f', 'e', 't', 'y', ' ', 'd', 'e', 'v', 'i', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '910b9f8e-1b3d-50c9-a6e0-20edda37a493',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'Why does a fuse have a thin wire?',
    '["To save material", "The thin wire melts easily when too much current flows, breaking the circuit", "To conduct better", "To look good"]'::jsonb,
    '1'::jsonb,
    'Thin wire has high resistance - it heats up and melts quickly at high current.',
    ARRAY['[', 'F', 'u', 's', 'e', ' ', 'd', 'e', 's', 'i', 'g', 'n', '.', ',', 'M', 'e', 'l', 't', 'i', 'n', 'g', ' ', 'p', 'o', 'i', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a19638c6-1eda-5528-89d2-4eafa3504954',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'fill_in_blank',
    'Explain why parallel circuits are used for lighting in houses.',
    NULL,
    '"independent operation"'::jsonb,
    'If one light fails in a parallel circuit, the others continue working; each gets full voltage.',
    ARRAY['[', 'R', 'e', 'l', 'i', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ',', 'V', 'o', 'l', 't', 'a', 'g', 'e', ' ', 'c', 'o', 'n', 's', 'i', 's', 't', 'e', 'n', 'c', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4f21f9b7-8c22-55f3-9b78-7df7179b0463',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'A circuit has a 9V battery and 3 resistors of 2ohm each in series. Total current?',
    '["4.5A", "1.5A", "0.67A", "9A"]'::jsonb,
    '1'::jsonb,
    'R_total = 2+2+2 = 6ohm. I = V/R = 9/6 = 1.5A.',
    ARRAY['[', 'S', 'e', 'r', 'i', 'e', 's', ' ', 'r', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', '.', ',', 'O', 'h', 'm', '''', 's', ' ', 'L', 'a', 'w', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4a228a3f-a8eb-5f0e-b2ae-b8e0b9696c65',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'Why do high-power appliances need thicker cables?',
    '["For decoration", "Thicker cables have lower resistance, reducing energy loss as heat", "To carry less current", "To be safer"]'::jsonb,
    '1'::jsonb,
    'Thicker cables reduce resistance and heat generation at high currents.',
    ARRAY['[', 'W', 'i', 'r', 'e', ' ', 'g', 'a', 'u', 'g', 'e', '.', ',', 'S', 'a', 'f', 'e', 't', 'y', ' ', 'a', 'n', 'd', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0cb42148-ba85-5480-948a-32c724651f64',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'How does a circuit breaker differ from a fuse?',
    '["No difference", "Circuit breakers can be reset; fuses must be replaced after melting", "Fuses are safer", "Circuit breakers are cheaper"]'::jsonb,
    '1'::jsonb,
    'Circuit breakers are reusable switches; fuses are one-time devices.',
    ARRAY['[', 'R', 'e', 's', 'e', 't', ' ', 'v', 's', ' ', 'r', 'e', 'p', 'l', 'a', 'c', 'e', '.', ',', 'M', 'o', 'd', 'e', 'r', 'n', ' ', 'p', 'r', 'o', 't', 'e', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ad5720cf-5224-5047-93c8-d825f799f0a7',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'multiple_choice',
    'What happens to the power dissipated in a resistor if the current doubles?',
    '["Stays the same", "Quadruples (P = I2R, so doubling I quadruples P)", "Doubles", "Halves"]'::jsonb,
    '1'::jsonb,
    'Power is proportional to current squared.',
    ARRAY['[', 'P', ' ', '=', ' ', 'I', '2', 'R', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', '.', ',', 'S', 'q', 'u', 'a', 'r', 'e', ' ', 'r', 'e', 'l', 'a', 't', 'i', 'o', 'n', 's', 'h', 'i', 'p', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f1de2de7-2b73-533c-9989-6952d3cfd987',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'fill_in_blank',
    'Why is the earth wire important in a 3-pin plug?',
    NULL,
    '"safety"'::jsonb,
    'The earth wire provides a safe path for fault current to flow to ground, preventing electric shock.',
    ARRAY['[', 'S', 'a', 'f', 'e', 't', 'y', ' ', 'g', 'r', 'o', 'u', 'n', 'd', 'i', 'n', 'g', '.', ',', 'F', 'a', 'u', 'l', 't', ' ', 'p', 'r', 'o', 't', 'e', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5b6cb389-5f7d-5682-a940-375a11dfc621',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.1'), NULL, 'fill_in_blank',
    'A 2kW kettle operates on 240V. What current does it draw?',
    NULL,
    '"8.33 A"'::jsonb,
    'I = P/V = 2000/240 = 8.33A.',
    ARRAY['[', 'P', 'o', 'w', 'e', 'r', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', '.', ',', 'C', 'u', 'r', 'r', 'e', 'n', 't', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.4.2.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f44264d0-e068-5cb1-a3f8-758e30978d03',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'A diode allows current to flow in:',
    '["Both directions", "One direction only", "No direction", "Randomly"]'::jsonb,
    '1'::jsonb,
    'Diodes are one-way valves for electric current.',
    ARRAY['[', 'F', 'o', 'r', 'w', 'a', 'r', 'd', ' ', 'b', 'i', 'a', 's', ' ', 'o', 'n', 'l', 'y', '.', ',', 'S', 'e', 'm', 'i', 'c', 'o', 'n', 'd', 'u', 'c', 't', 'o', 'r', ' ', 'd', 'e', 'v', 'i', 'c', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6d6de0f8-1f62-5110-b2bc-07a4091f30de',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'Forward bias means:',
    '["Current flows easily", "The diode is connected so current flows through it", "Current is blocked", "The diode is broken"]'::jsonb,
    '1'::jsonb,
    'Forward bias: anode (+) to cathode (-) - current flows.',
    ARRAY['[', 'C', 'o', 'r', 'r', 'e', 'c', 't', ' ', 'p', 'o', 'l', 'a', 'r', 'i', 't', 'y', '.', ',', 'L', 'o', 'w', ' ', 'r', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6634d616-25ae-5ae0-9428-279c927b995f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'Reverse bias means:',
    '["Current flows easily", "The diode blocks current", "The diode is damaged", "Current reverses"]'::jsonb,
    '1'::jsonb,
    'Reverse bias: cathode to anode - no current flows.',
    ARRAY['[', 'W', 'r', 'o', 'n', 'g', ' ', 'p', 'o', 'l', 'a', 'r', 'i', 't', 'y', '.', ',', 'H', 'i', 'g', 'h', ' ', 'r', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '193f824f-cff8-508c-a947-eaf4133bc0d7',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'An LED emits light when:',
    '["Reverse biased", "Forward biased", "Broken", "Cold"]'::jsonb,
    '1'::jsonb,
    'LEDs emit light when current flows through them (forward biased).',
    ARRAY['[', 'L', 'i', 'g', 'h', 't', ' ', 'e', 'm', 'i', 's', 's', 'i', 'o', 'n', '.', ',', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'l', 'u', 'm', 'i', 'n', 'e', 's', 'c', 'e', 'n', 'c', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c352500e-fbe3-59db-bec7-dd70c637cd58',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'A semiconductor has conductivity:',
    '["Higher than metals", "Between conductors and insulators", "Lower than insulators", "Equal to metals"]'::jsonb,
    '1'::jsonb,
    'Semiconductors have intermediate conductivity.',
    ARRAY['[', 'S', 'i', 'l', 'i', 'c', 'o', 'n', ',', ' ', 'g', 'e', 'r', 'm', 'a', 'n', 'i', 'u', 'm', '.', ',', 'D', 'o', 'p', 'i', 'n', 'g', ' ', 'a', 'd', 'j', 'u', 's', 't', 'a', 'b', 'l', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4b26bcc4-3197-50eb-94db-59d50472c31d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'Doping a semiconductor means:',
    '["Making it dirty", "Adding impurities to change its electrical properties", "Cooling it", "Heating it"]'::jsonb,
    '1'::jsonb,
    'Doping adds specific atoms to control conductivity.',
    ARRAY['[', 'N', '-', 't', 'y', 'p', 'e', ',', ' ', 'P', '-', 't', 'y', 'p', 'e', '.', ',', 'C', 'o', 'n', 't', 'r', 'o', 'l', 'l', 'e', 'd', ' ', 'c', 'o', 'n', 'd', 'u', 'c', 't', 'i', 'v', 'i', 't', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf510533-c9dd-5951-829b-7e9073b496bb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'An N-type semiconductor has:',
    '["Extra holes", "Extra electrons (negative charge carriers)", "No charge", "Only positive charges"]'::jsonb,
    '1'::jsonb,
    'N-type has extra electrons from doping with Group 5 elements.',
    ARRAY['[', 'N', 'e', 'g', 'a', 't', 'i', 'v', 'e', ' ', 'c', 'a', 'r', 'r', 'i', 'e', 'r', 's', '.', ',', 'P', 'h', 'o', 's', 'p', 'h', 'o', 'r', 'u', 's', ' ', 'd', 'o', 'p', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f9f97188-91a4-5736-962c-10dc2bf7dab5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'A P-type semiconductor has:',
    '["Extra electrons", "Extra holes (positive charge carriers)", "No charge carriers", "Only negative charges"]'::jsonb,
    '1'::jsonb,
    'P-type has extra holes from doping with Group 3 elements.',
    ARRAY['[', 'P', 'o', 's', 'i', 't', 'i', 'v', 'e', ' ', 'c', 'a', 'r', 'r', 'i', 'e', 'r', 's', '.', ',', 'B', 'o', 'r', 'o', 'n', ' ', 'd', 'o', 'p', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '47daf8c5-70f8-51b7-8ad1-601e5039d8b9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'A p-n junction diode is formed by:',
    '["Two N-type semiconductors", "Joining P-type and N-type semiconductors", "Two P-type semiconductors", "A metal and insulator"]'::jsonb,
    '1'::jsonb,
    'The junction between P and N type creates a diode.',
    ARRAY['[', 'D', 'e', 'p', 'l', 'e', 't', 'i', 'o', 'n', ' ', 'z', 'o', 'n', 'e', '.', ',', 'O', 'n', 'e', '-', 'w', 'a', 'y', ' ', 'c', 'u', 'r', 'r', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '318973f2-d183-56e9-8a8e-7c674dfb6baa',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'Why does a diode not conduct in reverse bias?',
    '["It is broken", "The depletion zone widens, blocking current flow", "Current always flows", "It conducts in both directions"]'::jsonb,
    '1'::jsonb,
    'Reverse bias expands the depletion zone, preventing carrier flow.',
    ARRAY['[', 'B', 'a', 'r', 'r', 'i', 'e', 'r', ' ', 'w', 'i', 'd', 'e', 'n', 'i', 'n', 'g', '.', ',', 'C', 'u', 'r', 'r', 'e', 'n', 't', ' ', 'b', 'l', 'o', 'c', 'k', 'e', 'd', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2b2070eb-936a-5562-a1a1-76fdabb2bb57',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'fill_in_blank',
    'Name one application of LEDs.',
    NULL,
    '"displays"'::jsonb,
    'LEDs are used in displays, indicator lights,照明, and vehicle lights.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 't', '.', ',', 'L', 'o', 'n', 'g', ' ', 'l', 'a', 's', 't', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '39c55e33-52f5-54a3-8d14-6f109ab0dc2f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'Why are LEDs more efficient than filament bulbs?',
    '["They are brighter", "LEDs convert more electrical energy to light, less to waste heat", "They are cheaper", "They last shorter"]'::jsonb,
    '1'::jsonb,
    'LEDs waste less energy as heat - higher luminous efficiency.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 's', 'a', 'v', 'i', 'n', 'g', '.', ',', 'L', 'e', 's', 's', ' ', 'h', 'e', 'a', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'acc3df49-2b08-5aef-a5fc-5542388d15ca',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'fill_in_blank',
    'What is the threshold voltage of a silicon diode?',
    NULL,
    '"0.7V"'::jsonb,
    'Silicon diodes need about 0.7V forward bias to start conducting.',
    ARRAY['[', 'T', 'u', 'r', 'n', '-', 'o', 'n', ' ', 'v', 'o', 'l', 't', 'a', 'g', 'e', '.', ',', 'S', 'i', 'l', 'i', 'c', 'o', 'n', ' ', 's', 'p', 'e', 'c', 'i', 'f', 'i', 'c', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '837fb2e1-08ee-5996-922e-15f6574f24dd',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'fill_in_blank',
    'Explain why a diode is like a one-way valve for electricity.',
    NULL,
    '"one-way flow"'::jsonb,
    'Like a valve allows water in one direction, a diode allows current in one direction only.',
    ARRAY['[', 'A', 'n', 'a', 'l', 'o', 'g', 'y', '.', ',', 'F', 'o', 'r', 'w', 'a', 'r', 'd', ' ', 'b', 'i', 'a', 's', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2912ddfc-add3-57b3-bf51-26ca9110e5b2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'Why are semiconductor devices important in modern electronics?',
    '["They are not", "They can switch on/off billions of times per second, enabling computers and digital devices", "They are only for lights", "They generate electricity"]'::jsonb,
    '1'::jsonb,
    'Semiconductor switching speed enables digital computing.',
    ARRAY['[', 'T', 'r', 'a', 'n', 's', 'i', 's', 't', 'o', 'r', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ',', 'D', 'i', 'g', 'i', 't', 'a', 'l', ' ', 'r', 'e', 'v', 'o', 'l', 'u', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5220f060-3910-5473-81a1-9fdad3c79f25',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'A diode is connected to a battery in reverse bias. What happens to the current?',
    '["It flows normally", "No current flows - the diode blocks it", "Current increases", "The diode explodes"]'::jsonb,
    '1'::jsonb,
    'Reverse bias blocks current - the circuit is effectively open.',
    ARRAY['[', 'D', 'i', 'o', 'd', 'e', ' ', 'b', 'e', 'h', 'a', 'v', 'i', 'o', 'u', 'r', '.', ',', 'C', 'u', 'r', 'r', 'e', 'n', 't', ' ', 'b', 'l', 'o', 'c', 'k', 'e', 'd', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4e2064d9-16f1-5a53-8dc1-59742bf10a20',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'How does temperature affect semiconductor conductivity?',
    '["No effect", "Higher temperature increases conductivity (more carriers available)", "Lower temperature increases conductivity", "Temperature only affects metals"]'::jsonb,
    '1'::jsonb,
    'Heat excites electrons, creating more charge carriers.',
    ARRAY['[', 'T', 'h', 'e', 'r', 'm', 'a', 'l', ' ', 'e', 'x', 'c', 'i', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'T', 'e', 'm', 'p', 'e', 'r', 'a', 't', 'u', 'r', 'e', ' ', 'd', 'e', 'p', 'e', 'n', 'd', 'e', 'n', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '31d8a6a8-3c70-5636-93c4-2001a8a1a55e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'Why are Zener diodes different from regular diodes?',
    '["They are not", "Zener diodes are designed to conduct in reverse at a specific voltage (for voltage regulation)", "They only work in AC", "They are bigger"]'::jsonb,
    '1'::jsonb,
    'Zener diodes have a controlled reverse breakdown voltage.',
    ARRAY['[', 'V', 'o', 'l', 't', 'a', 'g', 'e', ' ', 'r', 'e', 'g', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ',', 'S', 'p', 'e', 'c', 'i', 'a', 'l', ' ', 'p', 'u', 'r', 'p', 'o', 's', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e21fadd3-8b7c-58f2-9849-bfab9e5c2f9e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'What is the purpose of a rectifier circuit?',
    '["To amplify signals", "To convert AC to DC using diodes", "To store energy", "To generate AC"]'::jsonb,
    '1'::jsonb,
    'Rectifiers use diodes to convert alternating current to direct current.',
    ARRAY['[', 'A', 'C', ' ', 't', 'o', ' ', 'D', 'C', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', '.', ',', 'P', 'o', 'w', 'e', 'r', ' ', 's', 'u', 'p', 'p', 'l', 'y', ' ', 'e', 's', 's', 'e', 'n', 't', 'i', 'a', 'l', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a504f62c-2506-5ee3-8e78-bbd61ded8c59',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.2.2'), NULL, 'multiple_choice',
    'Why is silicon the most widely used semiconductor material?',
    '["It is the cheapest", "Silicon is abundant, has suitable properties, and can be precisely doped", "It is the best conductor", "It glows in the dark"]'::jsonb,
    '1'::jsonb,
    'Silicon is abundant (sand) and has ideal semiconductor properties.',
    ARRAY['[', 'M', 'a', 't', 'e', 'r', 'i', 'a', 'l', ' ', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'i', 'e', 's', '.', ',', 'A', 'b', 'u', 'n', 'd', 'a', 'n', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.4.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'afa7916b-f457-552c-9990-503715853bd8',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Energy can be converted from one form to another. This is the principle of:',
    '["Energy destruction", "Energy conversion", "Energy creation", "Energy storage"]'::jsonb,
    '1'::jsonb,
    'Energy conversion is the transformation from one form to another.',
    ARRAY['[', 'F', 'u', 'n', 'd', 'a', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', '.', ',', 'A', 'l', 'w', 'a', 'y', 's', ' ', 'c', 'o', 'n', 's', 'e', 'r', 'v', 'e', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1ecaae9b-3cc5-57ce-9575-525fb90de6d2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'A generator converts:',
    '["Electrical to mechanical", "Mechanical to electrical", "Chemical to light", "Heat to nuclear"]'::jsonb,
    '1'::jsonb,
    'Generators convert mechanical rotation to electrical energy.',
    ARRAY['[', 'E', 'l', 'e', 'c', 't', 'r', 'o', 'm', 'a', 'g', 'n', 'e', 't', 'i', 'c', ' ', 'i', 'n', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ',', 'S', 'p', 'i', 'n', 'n', 'i', 'n', 'g', ' ', 'c', 'o', 'i', 'l', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0346f85a-af89-5153-a3c0-ada8886625f4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'An electric motor converts:',
    '["Mechanical to electrical", "Electrical to mechanical", "Chemical to heat", "Light to sound"]'::jsonb,
    '1'::jsonb,
    'Motors convert electrical energy to mechanical rotation.',
    ARRAY['[', 'M', 'o', 't', 'o', 'r', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', '.', ',', 'O', 'p', 'p', 'o', 's', 'i', 't', 'e', ' ', 'o', 'f', ' ', 'g', 'e', 'n', 'e', 'r', 'a', 't', 'o', 'r', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3e6acff3-243b-59a5-97b8-92bb2d8d7909',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Photosynthesis converts light energy to:',
    '["Heat energy", "Chemical energy (glucose)", "Nuclear energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Plants convert solar energy to chemical energy in glucose.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 's', 't', 'o', 'r', 'a', 'g', 'e', '.', ',', 'S', 'o', 'l', 'a', 'r', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8dba80f5-0522-5407-b09d-f2b90c41f30e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Respiration converts chemical energy to:',
    '["Light only", "ATP (usable energy) and heat", "Nuclear energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Cellular respiration releases energy from food as ATP.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'r', 'e', 'l', 'e', 'a', 's', 'e', '.', ',', 'M', 'e', 't', 'a', 'b', 'o', 'l', 'i', 'c', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd47b24c7-4870-5bba-8c5d-919159b35729',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Conservation of energy means energy:',
    '["Can be created", "Cannot be created or destroyed, only transformed", "Disappears", "Is always lost"]'::jsonb,
    '1'::jsonb,
    'Energy is conserved - it changes form but is never created or destroyed.',
    ARRAY['[', 'F', 'i', 'r', 's', 't', ' ', 'l', 'a', 'w', ' ', 'o', 'f', ' ', 't', 'h', 'e', 'r', 'm', 'o', 'd', 'y', 'n', 'a', 'm', 'i', 'c', 's', '.', ',', 'F', 'u', 'n', 'd', 'a', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'l', 'a', 'w', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c7ae8fd1-db9a-5a4b-8f22-7b0bc3cfb5ff',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'When you climb stairs, chemical energy converts to:',
    '["Only heat", "Potential energy and kinetic energy, plus heat from muscle activity", "Electrical energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Muscles convert food energy to movement (kinetic) and height (potential).',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', 's', '.', ',', 'B', 'o', 'd', 'y', ' ', 'm', 'e', 'c', 'h', 'a', 'n', 'i', 'c', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '895492db-1148-5ae0-8b16-3fb085537bd1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'A hydroelectric dam converts:',
    '["Chemical to electrical", "Potential energy \u2192 kinetic energy \u2192 electrical energy", "Nuclear to electrical", "Wind to electrical"]'::jsonb,
    '1'::jsonb,
    'Water falls (potential→kinetic), turns turbines (mechanical), generates electricity.',
    ARRAY['[', 'T', 'h', 'r', 'e', 'e', '-', 's', 't', 'e', 'p', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', '.', ',', 'R', 'e', 'n', 'e', 'w', 'a', 'b', 'l', 'e', ' ', 'e', 'n', 'e', 'r', 'g', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3e5809d6-c655-574f-8201-a3b585823f97',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Why is no energy conversion 100% efficient?',
    '["We do not try enough", "Some energy always becomes waste heat due to friction and resistance", "Machines are poorly designed", "Energy is destroyed"]'::jsonb,
    '1'::jsonb,
    'Thermodynamic losses (heat, friction) prevent perfect efficiency.',
    ARRAY['[', 'S', 'e', 'c', 'o', 'n', 'd', ' ', 'l', 'a', 'w', '.', ',', 'E', 'n', 't', 'r', 'o', 'p', 'y', ' ', 'i', 'n', 'c', 'r', 'e', 'a', 's', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '507a6067-c282-5c82-9e12-d55a514f19c5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'A coal power station has efficiency 35%. If 1000 J of chemical energy is input, useful electrical output is:',
    '["1000 J", "350 J", "650 J", "35 J"]'::jsonb,
    '1'::jsonb,
    'Useful output = 35% x 1000 = 350 J. 650 J is waste heat.',
    ARRAY['[', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0d61c28d-8d5b-58f9-8cfc-a15380d96bd5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'fill_in_blank',
    'Name one device that converts electrical energy to sound energy.',
    NULL,
    '"speaker"'::jsonb,
    'Speakers, buzzers, and headphones convert electrical signals to sound vibrations.',
    ARRAY['[', 'E', 'l', 'e', 'c', 't', 'r', 'i', 'c', 'a', 'l', ' ', 't', 'o', ' ', 's', 'o', 'u', 'n', 'd', '.', ',', 'V', 'i', 'b', 'r', 'a', 't', 'i', 'o', 'n', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3bbf2ab0-c955-53f5-a382-2e18dd34d85e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Why is energy conversion important for renewable energy?',
    '["It is not", "Renewable energy converts natural flows (sunlight, wind, water) to usable electricity", "Only for fossil fuels", "Only for nuclear energy"]'::jsonb,
    '1'::jsonb,
    'Renewable technologies harness natural energy flows.',
    ARRAY['[', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', '.', ',', 'C', 'l', 'e', 'a', 'n', ' ', 'e', 'n', 'e', 'r', 'g', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd99b5170-4c81-5227-92be-ee76e571a1b0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Compare the energy conversions in a petrol car vs an electric car.',
    '["They are identical", "Petrol: chemical\u2192heat\u2192mechanical (25% efficient). Electric: electrical\u2192mechanical (90% efficient).", "Petrol is more efficient", "Electric cars have no conversions"]'::jsonb,
    '1'::jsonb,
    'Electric cars have fewer conversion steps and higher efficiency.',
    ARRAY['[', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', ' ', 'c', 'o', 'm', 'p', 'a', 'r', 'i', 's', 'o', 'n', '.', ',', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6998ebd4-c54a-52ef-8296-0a24087b9b17',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'fill_in_blank',
    'Explain why energy "losses" in conversion are not truly lost.',
    NULL,
    '"waste heat"'::jsonb,
    'The energy becomes low-grade heat dispersed into the environment - it still exists but is hard to use.',
    ARRAY['[', 'T', 'h', 'e', 'r', 'm', 'o', 'd', 'y', 'n', 'a', 'm', 'i', 'c', 's', '.', ',', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'o', 'f', ' ', 'e', 'n', 'e', 'r', 'g', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '139aa8af-9686-574a-9dbc-420063266bc6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Why does a bouncing ball eventually stop?',
    '["It loses energy", "Kinetic energy converts to heat and sound through impacts until all energy is dissipated", "Gravity stops it", "Air resistance only"]'::jsonb,
    '1'::jsonb,
    'Energy is not lost - it converts to heat and sound with each bounce.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'd', 'i', 's', 's', 'i', 'p', 'a', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 'n', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', ' ', 's', 't', 'i', 'l', 'l', ' ', 'h', 'o', 'l', 'd', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dd8c04c2-b42c-5f2f-8784-87a0c3877e7f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'How does a nuclear power station convert energy?',
    '["Chemical to electrical", "Nuclear fission \u2192 heat \u2192 steam \u2192 mechanical \u2192 electrical", "Light to electrical", "Wind to electrical"]'::jsonb,
    '1'::jsonb,
    'Nuclear fission produces heat, driving turbines to generate electricity.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', '-', 's', 't', 'e', 'p', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', '.', ',', 'F', 'i', 's', 's', 'i', 'o', 'n', ' ', 'e', 'n', 'e', 'r', 'g', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '687fbe6e-3cf5-58d7-b120-1bf87d1d1f01',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Why is understanding energy conversion important for engineers?',
    '["It is not", "Engineers design systems to maximise useful energy output and minimise waste", "Only for scientists", "Only for teachers"]'::jsonb,
    '1'::jsonb,
    'Engineering is about optimising energy conversion for useful work.',
    ARRAY['[', 'D', 'e', 's', 'i', 'g', 'n', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', '.', ',', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', ' ', 'f', 'o', 'c', 'u', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4f7b8ead-bdc6-5c2f-ae4f-42e8d3624f7b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'A solar cell converts light to electrical energy. Why is it not 100% efficient?',
    '["It is 100% efficient", "Not all wavelengths of light are absorbed; some energy becomes heat", "Solar cells are defective", "Light has no energy"]'::jsonb,
    '1'::jsonb,
    'Spectrum mismatch and thermal losses limit solar cell efficiency.',
    ARRAY['[', 'P', 'h', 'o', 't', 'o', 'v', 'o', 'l', 't', 'a', 'i', 'c', ' ', 'l', 'i', 'm', 'i', 't', 's', '.', ',', 'M', 'a', 't', 'e', 'r', 'i', 'a', 'l', ' ', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'i', 'e', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '296850ff-4c22-58ed-9102-aa83c0891f8b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'How do transformers convert energy?',
    '["They do not convert", "Transformers change voltage levels using electromagnetic induction (not energy form)", "They create energy", "They destroy energy"]'::jsonb,
    '1'::jsonb,
    'Transformers change voltage/current ratio but not the form of energy.',
    ARRAY['[', 'V', 'o', 'l', 't', 'a', 'g', 'e', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', '.', ',', 'N', 'o', 't', ' ', 'e', 'n', 'e', 'r', 'g', 'y', ' ', 'c', 'o', 'n', 'v', 'e', 'r', 's', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9353cdc9-aad3-529e-8db4-5747643abaf7',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.3.1'), NULL, 'multiple_choice',
    'Why is the concept of energy conversion central to understanding technology?',
    '["It is not", "All technology involves converting energy from one form to another for useful purposes", "Only for physics", "Only for chemistry"]'::jsonb,
    '1'::jsonb,
    'Every device, from phones to power stations, relies on energy conversion.',
    ARRAY['[', 'U', 'n', 'i', 'v', 'e', 'r', 's', 'a', 'l', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', '.', ',', 'T', 'e', 'c', 'h', 'n', 'o', 'l', 'o', 'g', 'y', ' ', 'f', 'o', 'u', 'n', 'd', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.4.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '564017bb-f2c5-5fa6-8c5a-a8a691c0c91b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Pressure is defined as:',
    '["Force x area", "Force per unit area", "Area per unit force", "Mass x volume"]'::jsonb,
    '1'::jsonb,
    'Pressure = Force / Area. P = F/A.',
    ARRAY['[', 'F', 'o', 'r', 'c', 'e', ' ', 'd', 'i', 's', 't', 'r', 'i', 'b', 'u', 't', 'i', 'o', 'n', '.', ',', 'M', 'e', 'a', 's', 'u', 'r', 'e', 'd', ' ', 'i', 'n', ' ', 'P', 'a', 's', 'c', 'a', 'l', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3156c0bf-3065-55c0-ae60-64e6bd949b59',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'The SI unit of pressure is the:',
    '["Newton", "Joule", "Pascal", "Watt"]'::jsonb,
    '2'::jsonb,
    'Pressure is measured in Pascals (Pa). 1 Pa = 1 N/m2.',
    ARRAY['[', 'N', 'a', 'm', 'e', 'd', ' ', 'a', 'f', 't', 'e', 'r', ' ', 'P', 'a', 's', 'c', 'a', 'l', '.', ',', 'F', 'o', 'r', 'c', 'e', ' ', 'p', 'e', 'r', ' ', 'a', 'r', 'e', 'a', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '73981bb1-de8c-563a-a6c2-15d42a58ac3b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'A sharp knife cuts better than a blunt one because:',
    '["It is stronger", "The smaller area creates higher pressure for the same force", "It is heavier", "It is sharper"]'::jsonb,
    '1'::jsonb,
    'P = F/A. Smaller area = higher pressure = easier cutting.',
    ARRAY['[', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', '.', ',', 'A', 'r', 'e', 'a', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '63b34aab-d1c5-5a53-b238-fd3f1a4038ea',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Snowshoes prevent sinking because:',
    '["They are light", "They increase area, reducing pressure on the snow", "They are warm", "They are waterproof"]'::jsonb,
    '1'::jsonb,
    'Large area distributes weight over more snow surface.',
    ARRAY['[', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'd', 'i', 's', 't', 'r', 'i', 'b', 'u', 't', 'i', 'o', 'n', '.', ',', 'A', 'r', 'e', 'a', ' ', 'i', 'n', 'c', 'r', 'e', 'a', 's', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '24981580-b32f-5642-9deb-1bfc8043d005',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Pressure in liquids:',
    '["Only acts downward", "Acts equally in all directions", "Only acts at the bottom", "Only acts at the surface"]'::jsonb,
    '1'::jsonb,
    'Liquid pressure acts equally in all directions (Pascal''s principle).',
    ARRAY['[', 'I', 's', 'o', 't', 'r', 'o', 'p', 'i', 'c', ' ', 'p', 'r', 'e', 's', 's', 'u', 'r', 'e', '.', ',', 'H', 'y', 'd', 'r', 'a', 'u', 'l', 'i', 'c', ' ', 's', 'y', 's', 't', 'e', 'm', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9c116e37-63a8-56c9-af83-0821c68e8d3e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Liquid pressure increases with:',
    '["Temperature", "Depth", "Volume", "Speed"]'::jsonb,
    '1'::jsonb,
    'P = ρgh. Pressure increases with depth due to the weight of liquid above.',
    ARRAY['[', 'D', 'e', 'p', 't', 'h', ' ', 'r', 'e', 'l', 'a', 't', 'i', 'o', 'n', 's', 'h', 'i', 'p', '.', ',', 'W', 'e', 'i', 'g', 'h', 't', ' ', 'o', 'f', ' ', 'l', 'i', 'q', 'u', 'i', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c88bc4e0-5795-5e92-80f3-2d05e9cae203',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'A force of 100N is applied over 0.5 m2. Pressure is:',
    '["50 Pa", "200 Pa", "500 Pa", "100 Pa"]'::jsonb,
    '1'::jsonb,
    'P = F/A = 100/0.5 = 200 Pa.',
    ARRAY['[', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'd', 'i', 'v', 'i', 's', 'i', 'o', 'n', '.', ',', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8da6a3a0-9f6e-5183-a0b2-41b31ef1c220',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Why do high heels sink into soft ground more than flat shoes?',
    '["They are lighter", "Smaller area creates higher pressure, sinking deeper into the ground", "They are sharper", "They are newer"]'::jsonb,
    '1'::jsonb,
    'Same force (body weight) concentrated on smaller area = higher pressure.',
    ARRAY['[', 'A', 'r', 'e', 'a', '-', 'p', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'r', 'e', 'l', 'a', 't', 'i', 'o', 'n', 's', 'h', 'i', 'p', '.', ',', 'G', 'r', 'o', 'u', 'n', 'd', ' ', 'p', 'r', 'e', 's', 's', 'u', 'r', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8ac2c379-bac2-51c2-9175-d6380ec1f315',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Hydraulic systems work because:',
    '["Water is compressible", "Pressure applied to a confined liquid is transmitted equally in all directions", "Liquids expand", "Gravity acts"]'::jsonb,
    '1'::jsonb,
    'Pascal''s principle: pressure in a confined fluid is transmitted undiminished.',
    ARRAY['[', 'H', 'y', 'd', 'r', 'a', 'u', 'l', 'i', 'c', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', '.', ',', 'F', 'o', 'r', 'c', 'e', ' ', 'm', 'u', 'l', 't', 'i', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd1385160-df73-510c-a516-5ac4033260ed',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'fill_in_blank',
    'Calculate the pressure at 5m depth in water (density 1000 kg/m³, g = 10 m/s2).',
    NULL,
    '"50000 Pa"'::jsonb,
    'P = ρgh = 1000 x 10 x 5 = 50,000 Pa = 50 kPa.',
    ARRAY['[', 'L', 'i', 'q', 'u', 'i', 'd', ' ', 'p', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'f', 'o', 'r', 'm', 'u', 'l', 'a', '.', ',', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0c79e0ad-794a-5a22-97e3-cabe4ff92619',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Why do dams have thicker walls at the bottom?',
    '["For decoration", "Water pressure increases with depth - thicker walls withstand greater pressure at the bottom", "To look strong", "To save material"]'::jsonb,
    '1'::jsonb,
    'Greater depth = greater pressure = need for stronger walls.',
    ARRAY['[', 'S', 't', 'r', 'u', 'c', 't', 'u', 'r', 'a', 'l', ' ', 'd', 'e', 's', 'i', 'g', 'n', '.', ',', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'v', 'a', 'r', 'i', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd5166661-09ee-5407-9d92-e68bfa0c8f18',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Why cant you feel atmospheric pressure on your body?',
    '["You can feel it", "Pressure inside your body balances external atmospheric pressure", "Atmospheric pressure is zero", "It only acts on your skin"]'::jsonb,
    '1'::jsonb,
    'Internal body pressure equals external atmospheric pressure - balanced forces.',
    ARRAY['[', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'e', 'q', 'u', 'i', 'l', 'i', 'b', 'r', 'i', 'u', 'm', '.', ',', 'A', 'd', 'a', 'p', 't', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5c89536-b15a-5902-aa6b-8c188f2d5e49',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'fill_in_blank',
    'A hydraulic jack has a small piston of 0.01 m2 and a large piston of 0.1 m2. If 100N is applied to the small piston, what force does the large piston exert?',
    NULL,
    '"1000 N"'::jsonb,
    'F2 = F1 x (A2/A1) = 100 x (0.1/0.01) = 1000 N.',
    ARRAY['[', 'H', 'y', 'd', 'r', 'a', 'u', 'l', 'i', 'c', ' ', 'm', 'u', 'l', 't', 'i', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'P', 'a', 's', 'c', 'a', 'l', '''', 's', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fc455e76-78e0-53c3-a6be-aa57dfc06d08',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'fill_in_blank',
    'Explain why a drawing pin (thumbtack) has a sharp point.',
    NULL,
    '"pressure concentration"'::jsonb,
    'The sharp point has very small area, creating high pressure to push into the wall with little force.',
    ARRAY['[', 'P', ' ', '=', ' ', 'F', '/', 'A', ' ', 'a', 'p', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'P', 'r', 'a', 'c', 't', 'i', 'c', 'a', 'l', ' ', 'd', 'e', 's', 'i', 'g', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '21055d88-0c61-5d9a-9330-6092e44ac5c4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Why do deep-sea divers need special suits?',
    '["For warmth", "Water pressure increases with depth - suits protect against crushing pressure", "To look professional", "To swim faster"]'::jsonb,
    '1'::jsonb,
    'Deep water pressure can crush unprotected bodies - suits maintain safe pressure.',
    ARRAY['[', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'e', 'f', 'f', 'e', 'c', 't', 's', '.', ',', 'S', 'a', 'f', 'e', 't', 'y', ' ', 'e', 'q', 'u', 'i', 'p', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd8d3176b-8027-5fca-9925-82486dc2fb52',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'How do hydraulic brakes in a car work?',
    '["They do not work", "Force on the brake pedal creates pressure in brake fluid, which transmits force to all brake pads equally", "Electrical signals", "Mechanical linkage only"]'::jsonb,
    '1'::jsonb,
    'Pascal''s principle ensures equal braking force on all wheels.',
    ARRAY['[', 'B', 'r', 'a', 'k', 'e', ' ', 's', 'y', 's', 't', 'e', 'm', '.', ',', 'F', 'o', 'r', 'c', 'e', ' ', 't', 'r', 'a', 'n', 's', 'm', 'i', 's', 's', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '732d6a75-c04c-53ab-af6f-d30202e5d8ab',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Why does a submarine need thick walls?',
    '["For decoration", "To withstand enormous water pressure at depth without crushing", "To block light", "To generate heat"]'::jsonb,
    '1'::jsonb,
    'Submarine walls must resist external water pressure while maintaining internal pressure.',
    ARRAY['[', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'r', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', '.', ',', 'S', 't', 'r', 'u', 'c', 't', 'u', 'r', 'a', 'l', ' ', 'e', 'n', 'g', 'i', 'n', 'e', 'e', 'r', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0d6504c7-d0eb-5a4a-913a-a2756f56d82f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'A student stands on a table. The pressure on the table is:',
    '["Same as on the floor", "Less than on the floor (table area is larger)", "More than on the floor", "Zero"]'::jsonb,
    '1'::jsonb,
    'If the table area is larger, pressure is lower for the same force.',
    ARRAY['[', 'A', 'r', 'e', 'a', ' ', 'e', 'f', 'f', 'e', 'c', 't', '.', ',', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf00abd8-2fcf-53a4-982e-34f65f7c44ea',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'Why are wide tyres used on vehicles that drive on soft ground?',
    '["For looks", "Wide tyres increase contact area, reducing pressure and preventing sinking", "To go faster", "To use more rubber"]'::jsonb,
    '1'::jsonb,
    'Lower ground pressure prevents the vehicle from getting stuck.',
    ARRAY['[', 'P', 'r', 'e', 's', 's', 'u', 'r', 'e', ' ', 'd', 'i', 's', 't', 'r', 'i', 'b', 'u', 't', 'i', 'o', 'n', '.', ',', 'P', 'r', 'a', 'c', 't', 'i', 'c', 'a', 'l', ' ', 'd', 'e', 's', 'i', 'g', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aea8ec5f-0391-5b3b-bbe4-ff3f76caa066',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.1'), NULL, 'multiple_choice',
    'At what depth does water pressure double atmospheric pressure?',
    '["10m", "1m", "100m", "1000m"]'::jsonb,
    '0'::jsonb,
    'At 10m depth, water pressure is about 1 atm (total 2 atm with atmospheric).',
    ARRAY['[', 'D', 'e', 'p', 't', 'h', ' ', 'r', 'u', 'l', 'e', '.', ',', '1', '0', 'm', ' ', 'p', 'e', 'r', ' ', 'a', 't', 'm', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.4.4.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8a17a6f2-f1e7-524b-b2b3-ae938d93d387',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'Newton''s Third Law states:',
    '["F = ma", "For every action, there is an equal and opposite reaction", "Objects at rest stay at rest", "Energy is conserved"]'::jsonb,
    '1'::jsonb,
    'Action and reaction forces are equal in magnitude and opposite in direction.',
    ARRAY['[', 'F', 'o', 'r', 'c', 'e', ' ', 'p', 'a', 'i', 'r', 's', '.', ',', 'A', 'l', 'w', 'a', 'y', 's', ' ', 't', 'o', 'g', 'e', 't', 'h', 'e', 'r', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '71efcfee-25dd-596a-ac03-06d309561a40',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'When you push against a wall, the wall:',
    '["Does nothing", "Pushes back with equal force", "Moves forward", "Falls down"]'::jsonb,
    '1'::jsonb,
    'The wall exerts an equal and opposite reaction force.',
    ARRAY['[', 'N', 'e', 'w', 't', 'o', 'n', '''', 's', ' ', 'T', 'h', 'i', 'r', 'd', ' ', 'L', 'a', 'w', '.', ',', 'F', 'o', 'r', 'c', 'e', ' ', 'p', 'a', 'i', 'r', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7fafd1a1-a642-5049-b3fe-ee68174d7b7a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'A rocket works because:',
    '["It pushes air", "Hot gases are expelled downward, and the reaction force pushes the rocket upward", "It has wings", "Gravity pushes it"]'::jsonb,
    '1'::jsonb,
    'Rocket exhaust (action) creates upward thrust (reaction).',
    ARRAY['[', 'A', 'c', 't', 'i', 'o', 'n', '-', 'r', 'e', 'a', 'c', 't', 'i', 'o', 'n', '.', ',', 'T', 'h', 'r', 'u', 's', 't', ' ', 'g', 'e', 'n', 'e', 'r', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '88d17eb1-b41f-5ae9-b69c-754fd408b7af',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'When you walk, your foot pushes:',
    '["Forward on the ground", "Backward on the ground, and the ground pushes you forward", "Upward only", "Downward only"]'::jsonb,
    '1'::jsonb,
    'Foot pushes backward (action); ground pushes forward (reaction).',
    ARRAY['[', 'W', 'a', 'l', 'k', 'i', 'n', 'g', ' ', 'm', 'e', 'c', 'h', 'a', 'n', 'i', 's', 'm', '.', ',', 'G', 'r', 'o', 'u', 'n', 'd', ' ', 'f', 'r', 'i', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0ee14e40-8f3a-5129-a514-418b33ff5b52',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'Action and reaction forces act on:',
    '["The same object", "Different objects", "Only moving objects", "Only heavy objects"]'::jsonb,
    '1'::jsonb,
    'Action and reaction always act on different objects.',
    ARRAY['[', 'K', 'e', 'y', ' ', 'p', 'o', 'i', 'n', 't', '.', ',', 'N', 'o', 't', ' ', 'a', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', 'd', ' ', 'p', 'a', 'i', 'r', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9a84ec49-6f15-5aea-9eb8-7f37e510fa62',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'A swimmer pushes water backward. The water pushes the swimmer:',
    '["Backward", "Forward", "Downward", "Not at all"]'::jsonb,
    '1'::jsonb,
    'Swimmer pushes water back (action); water pushes swimmer forward (reaction).',
    ARRAY['[', 'S', 'w', 'i', 'm', 'm', 'i', 'n', 'g', ' ', 'p', 'r', 'o', 'p', 'u', 'l', 's', 'i', 'o', 'n', '.', ',', 'N', 'e', 'w', 't', 'o', 'n', '''', 's', ' ', 'T', 'h', 'i', 'r', 'd', ' ', 'L', 'a', 'w', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c30bae54-f5f2-55d1-a1f5-55629005eeff',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'Why don''t action and reaction forces cancel each other?',
    '["They do cancel", "They act on different objects, so they do not cancel - each object experiences its own force", "They are not real", "Gravity cancels them"]'::jsonb,
    '1'::jsonb,
    'Cancellation only happens when forces act on the same object.',
    ARRAY['[', 'D', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', ' ', 'o', 'b', 'j', 'e', 'c', 't', 's', '.', ',', 'C', 'o', 'm', 'm', 'o', 'n', ' ', 'm', 'i', 's', 'c', 'o', 'n', 'c', 'e', 'p', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3d744d50-5ff0-5bfb-8301-06e83ac27295',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'A gun recoils when fired because:',
    '["The shooter pushes it", "The bullet pushes forward on the gun (action), and the gun pushes backward on the bullet (reaction)", "Gravity pulls it", "Air resistance"]'::jsonb,
    '1'::jsonb,
    'Bullet''s forward motion creates an equal backward reaction on the gun.',
    ARRAY['[', 'R', 'e', 'c', 'o', 'i', 'l', ' ', 'e', 'x', 'p', 'l', 'a', 'n', 'a', 't', 'i', 'o', 'n', '.', ',', 'M', 'o', 'm', 'e', 'n', 't', 'u', 'm', ' ', 'c', 'o', 'n', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '49a8c782-4d9d-541d-b787-e295bcd676d3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'How do birds fly using Newton''s Third Law?',
    '["They float", "Wings push air downward; air pushes wings upward (lift)", "They are light", "Wind carries them"]'::jsonb,
    '1'::jsonb,
    'Wing downstroke pushes air down; reaction force pushes bird up.',
    ARRAY['[', 'F', 'l', 'i', 'g', 'h', 't', ' ', 'm', 'e', 'c', 'h', 'a', 'n', 'i', 'c', 's', '.', ',', 'L', 'i', 'f', 't', ' ', 'g', 'e', 'n', 'e', 'r', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1c2a3930-9175-5caf-8a0c-e946cccb6b3b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'A book rests on a table. The book''s weight and the table''s normal force are:',
    '["Action-reaction pairs", "Equal and opposite but NOT action-reaction (both act on the book)", "Not equal", "Not related"]'::jsonb,
    '1'::jsonb,
    'Weight (Earth on book) and normal force (table on book) are balanced, not action-reaction.',
    ARRAY['[', 'C', 'o', 'm', 'm', 'o', 'n', ' ', 'c', 'o', 'n', 'f', 'u', 's', 'i', 'o', 'n', '.', ',', 'S', 'a', 'm', 'e', ' ', 'o', 'b', 'j', 'e', 'c', 't', ' ', 'f', 'o', 'r', 'c', 'e', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f0f742ad-ffc0-5ab2-a4ef-8487b08c0cfa',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'fill_in_blank',
    'Name one everyday example of Newton''s Third Law.',
    NULL,
    '"walking"'::jsonb,
    'Walking, swimming, rocket propulsion, gun recoil, jumping.',
    ARRAY['[', 'M', 'a', 'n', 'y', ' ', 'e', 'x', 'a', 'm', 'p', 'l', 'e', 's', '.', ',', 'D', 'a', 'i', 'l', 'y', ' ', 'l', 'i', 'f', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '158f85af-681f-5080-92cd-1086f3d7f22b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'Why does a balloon fly forward when released?',
    '["It is light", "Air rushes out backward (action); the balloon moves forward (reaction)", "Gravity pulls it", "Air pushes it"]'::jsonb,
    '1'::jsonb,
    'Air escaping backward creates a forward reaction force on the balloon.',
    ARRAY['[', 'B', 'a', 'l', 'l', 'o', 'o', 'n', ' ', 'r', 'o', 'c', 'k', 'e', 't', '.', ',', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'd', 'e', 'm', 'o', 'n', 's', 't', 'r', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f90c1776-03c4-5876-a2f6-0deff8ec8e6f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'fill_in_blank',
    'Explain why a person cannot lift themselves by pulling on their own bootstraps.',
    NULL,
    '"internal forces"'::jsonb,
    'Internal forces cannot create net external force - the person pulls down on boots, boots pull up on person (same system).',
    ARRAY['[', 'S', 'y', 's', 't', 'e', 'm', ' ', 'b', 'o', 'u', 'n', 'd', 'a', 'r', 'i', 'e', 's', '.', ',', 'N', 'o', ' ', 'e', 'x', 't', 'e', 'r', 'n', 'a', 'l', ' ', 'f', 'o', 'r', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ab737997-2096-5e24-be3a-588e98c9e106',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'Why is the recoil of a gun less damaging than the bullet?',
    '["It is not less damaging", "Same force, but gun has much more mass, so acceleration (and velocity) is much smaller", "The bullet has no force", "The gun absorbs all energy"]'::jsonb,
    '1'::jsonb,
    'F = ma. Same F, much larger m for gun = much smaller a.',
    ARRAY['[', 'M', 'a', 's', 's', ' ', 'd', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 'c', 'e', '.', ',', 'A', 'c', 'c', 'e', 'l', 'e', 'r', 'a', 't', 'i', 'o', 'n', ' ', 'e', 'f', 'f', 'e', 'c', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '830a5636-fe21-59c5-9185-9762e4386502',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'fill_in_blank',
    'How does a jet engine demonstrate Newton''s Third Law?',
    NULL,
    '"exhaust thrust"'::jsonb,
    'Jet engine expels hot gases backward (action); the reaction pushes the plane forward.',
    ARRAY['[', 'J', 'e', 't', ' ', 'p', 'r', 'o', 'p', 'u', 'l', 's', 'i', 'o', 'n', '.', ',', 'T', 'h', 'r', 'u', 's', 't', ' ', 'g', 'e', 'n', 'e', 'r', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd7eeeec2-0bfb-58ef-a7c5-9ccdc2105f9f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'Why can''t you walk on frictionless ice?',
    '["You can walk", "Without friction, your foot cannot push backward, so there is no reaction force to push you forward", "Ice is cold", "You are too heavy"]'::jsonb,
    '1'::jsonb,
    'Friction provides the reaction force for walking - no friction = no forward push.',
    ARRAY['[', 'F', 'r', 'i', 'c', 't', 'i', 'o', 'n', ' ', 'r', 'e', 'q', 'u', 'i', 'r', 'e', 'm', 'e', 'n', 't', '.', ',', 'W', 'a', 'l', 'k', 'i', 'n', 'g', ' ', 'm', 'e', 'c', 'h', 'a', 'n', 'i', 's', 'm', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '85ad405b-47dc-5459-880c-cf2119582e53',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'Two ice skaters push off each other. What happens?',
    '["Both move backward", "Both move in opposite directions with equal momentum", "Only one moves", "They stay still"]'::jsonb,
    '1'::jsonb,
    'Equal and opposite forces create equal and opposite momenta.',
    ARRAY['[', 'C', 'o', 'n', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', ' ', 'o', 'f', ' ', 'm', 'o', 'm', 'e', 'n', 't', 'u', 'm', '.', ',', 'I', 'c', 'e', ' ', 'f', 'r', 'i', 'c', 't', 'i', 'o', 'n', ' ', 'm', 'i', 'n', 'i', 'm', 'a', 'l', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ad192fdb-e90e-528a-9c15-f7b0a66cc620',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'Why do rockets work in space where there is no air?',
    '["They do not work", "Rockets carry their own fuel - the exhaust gases provide the action; no external medium needed", "Air is needed", "Gravity only"]'::jsonb,
    '1'::jsonb,
    'Rockets work by expelling mass - no external medium required.',
    ARRAY['[', 'S', 'p', 'a', 'c', 'e', ' ', 'p', 'r', 'o', 'p', 'u', 'l', 's', 'i', 'o', 'n', '.', ',', 'S', 'e', 'l', 'f', '-', 'c', 'o', 'n', 't', 'a', 'i', 'n', 'e', 'd', ' ', 's', 'y', 's', 't', 'e', 'm', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '088db9cb-8053-5863-9b54-b7fe398742b3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'A horse pulls a cart. Why does the cart move if the cart pulls back with equal force?',
    '["The cart does not move", "The horse pushes against the ground (action); ground pushes horse forward (reaction) - net force moves the system", "The horse is stronger", "The cart has wheels"]'::jsonb,
    '1'::jsonb,
    'The horse-ground interaction provides the net force, not the horse-cart interaction.',
    ARRAY['[', 'S', 'y', 's', 't', 'e', 'm', ' ', 'a', 'n', 'a', 'l', 'y', 's', 'i', 's', '.', ',', 'E', 'x', 't', 'e', 'r', 'n', 'a', 'l', ' ', 'f', 'o', 'r', 'c', 'e', ' ', 's', 'o', 'u', 'r', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9c8df7d1-96a6-5215-94ac-f215de970958',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.4.2'), NULL, 'multiple_choice',
    'How is Newton''s Third Law used in rocket design?',
    '["It is not used", "Engineers design nozzles to maximise exhaust velocity, increasing the reaction force (thrust)", "For decoration", "For fuel storage"]'::jsonb,
    '1'::jsonb,
    'Nozzle design optimises exhaust speed for maximum thrust.',
    ARRAY['[', 'E', 'n', 'g', 'i', 'n', 'e', 'e', 'r', 'i', 'n', 'g', ' ', 'a', 'p', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'T', 'h', 'r', 'u', 's', 't', ' ', 'o', 'p', 't', 'i', 'm', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.4.5.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a9276ee9-2bdb-5760-b8e7-6e024ad16398',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Simple farming tools are made from materials like:',
    '["Plastic only", "Metal (steel), wood, and sometimes plastic", "Glass", "Paper"]'::jsonb,
    '1'::jsonb,
    'Metal for blades, wood for handles, plastic for some parts.',
    ARRAY['[', 'M', 'a', 't', 'e', 'r', 'i', 'a', 'l', ' ', 's', 'e', 'l', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'F', 'u', 'n', 'c', 't', 'i', 'o', 'n', '-', 'b', 'a', 's', 'e', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ec6136c6-e45a-5491-aa93-b6f0e2db5837',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Steel is used for tool blades because it is:',
    '["Soft and flexible", "Hard, strong, and holds a sharp edge", "Cheap and light", "Transparent"]'::jsonb,
    '1'::jsonb,
    'Steel''s hardness and edge retention make it ideal for cutting tools.',
    ARRAY['[', 'M', 'a', 't', 'e', 'r', 'i', 'a', 'l', ' ', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'i', 'e', 's', '.', ',', 'C', 'u', 't', 't', 'i', 'n', 'g', ' ', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c9e326b6-63dc-5b4e-a715-cea96c578c23',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Wood is used for tool handles because it is:',
    '["Stronger than metal", "Light, absorbs shock, and provides good grip", "Waterproof", "Flexible"]'::jsonb,
    '1'::jsonb,
    'Wood handles absorb vibration and are comfortable to grip.',
    ARRAY['[', 'E', 'r', 'g', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'i', 'e', 's', '.', ',', 'S', 'h', 'o', 'c', 'k', ' ', 'a', 'b', 's', 'o', 'r', 'p', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b21e898b-8501-57f5-ab86-ba15a0400bb8',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Heat treatment of metals makes them:',
    '["Softer", "Harder or more flexible depending on the process", "Heavier", "Transparent"]'::jsonb,
    '1'::jsonb,
    'Quenching hardens; tempering reduces brittleness.',
    ARRAY['[', 'M', 'e', 't', 'a', 'l', 'l', 'u', 'r', 'g', 'y', '.', ',', 'P', 'r', 'o', 'p', 'e', 'r', 't', 'y', ' ', 'm', 'o', 'd', 'i', 'f', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd2a1cf49-405b-5b1d-a6ff-794de7e970b5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'A blacksmith heats metal to:',
    '["Melt it completely", "Shape it by making it soft and malleable", "Make it lighter", "Change its colour"]'::jsonb,
    '1'::jsonb,
    'Heating makes metal malleable for forging into shape.',
    ARRAY['[', 'F', 'o', 'r', 'g', 'i', 'n', 'g', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ',', 'H', 'e', 'a', 't', ' ', 'a', 'n', 'd', ' ', 'h', 'a', 'm', 'm', 'e', 'r', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '98e92714-e4d1-5921-b8fe-9bb36850d624',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Welding joins metals by:',
    '["Using glue", "Melting the edges together with heat", "Screwing them", "Tying them"]'::jsonb,
    '1'::jsonb,
    'Welding uses intense heat to fuse metal pieces.',
    ARRAY['[', 'M', 'e', 't', 'a', 'l', ' ', 'j', 'o', 'i', 'n', 'i', 'n', 'g', '.', ',', 'F', 'u', 's', 'i', 'o', 'n', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9d6f14ad-afed-546a-9a3b-23d1ed38f44c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Why is steel preferred over iron for making tools?',
    '["It is cheaper", "Steel is harder, stronger, and more resistant to deformation than pure iron", "Iron is stronger", "Steel is lighter"]'::jsonb,
    '1'::jsonb,
    'Steel (iron + carbon) has superior mechanical properties.',
    ARRAY['[', 'A', 'l', 'l', 'o', 'y', ' ', 'a', 'd', 'v', 'a', 'n', 't', 'a', 'g', 'e', '.', ',', 'C', 'a', 'r', 'b', 'o', 'n', ' ', 'a', 'd', 'd', 'i', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '31ae3217-d4fb-5c80-8974-6fada6ed0156',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Why are some tool handles wrapped with rubber?',
    '["For decoration", "Rubber provides better grip and absorbs vibration", "To make them heavier", "To protect the wood"]'::jsonb,
    '1'::jsonb,
    'Rubber grips improve comfort and reduce hand fatigue.',
    ARRAY['[', 'E', 'r', 'g', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'd', 'e', 's', 'i', 'g', 'n', '.', ',', 'V', 'i', 'b', 'r', 'a', 't', 'i', 'o', 'n', ' ', 'd', 'a', 'm', 'p', 'e', 'n', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5d302b4e-bc45-5163-bebc-632619181ef0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Why should metal tools be oiled after use?',
    '["To make them shiny", "Oil prevents moisture from reaching the metal surface, preventing rust", "To make them heavier", "To sharpen them"]'::jsonb,
    '1'::jsonb,
    'Oil creates a barrier against moisture and oxygen.',
    ARRAY['[', 'C', 'o', 'r', 'r', 'o', 's', 'i', 'o', 'n', ' ', 'p', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', '.', ',', 'M', 'a', 'i', 'n', 't', 'e', 'n', 'a', 'n', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '35349eba-9c61-5aef-9a79-5a572341f898',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'fill_in_blank',
    'Name one material used for making agricultural tool handles.',
    NULL,
    '"wood"'::jsonb,
    'Wood (ash, hickory, teak), fibreglass, and plastic.',
    ARRAY['[', 'H', 'a', 'n', 'd', 'l', 'e', ' ', 'm', 'a', 't', 'e', 'r', 'i', 'a', 'l', 's', '.', ',', 'C', 'o', 'm', 'f', 'o', 'r', 't', ' ', 'a', 'n', 'd', ' ', 's', 't', 'r', 'e', 'n', 'g', 't', 'h', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5975a9d0-10b4-566c-8663-f76e5fe0bb8c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Why are ploughshares made of hardened steel?',
    '["For decoration", "They need to be extremely hard to cut through soil without wearing down", "To be lighter", "To be cheaper"]'::jsonb,
    '1'::jsonb,
    'Soil abrasion requires very hard, wear-resistant material.',
    ARRAY['[', 'W', 'e', 'a', 'r', ' ', 'r', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', '.', ',', 'H', 'a', 'r', 'd', 'e', 'n', 'i', 'n', 'g', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3e13675c-ddb7-589e-b989-742d67a5ce2b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'How does the design of a tool affect its efficiency?',
    '["It does not", "Shape, weight distribution, and handle length all affect how effectively force is applied", "Only colour matters", "Only size matters"]'::jsonb,
    '1'::jsonb,
    'Ergonomic design maximises force application and reduces fatigue.',
    ARRAY['[', 'D', 'e', 's', 'i', 'g', 'n', ' ', 'p', 'r', 'i', 'n', 'c', 'i', 'p', 'l', 'e', 's', '.', ',', 'U', 's', 'e', 'r', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bb1c5ea0-66d3-54a5-9905-de6078caa521',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Why might a farmer choose fibreglass handles over wooden ones?',
    '["For decoration", "Fibreglass is lighter, stronger, and does not rot or break like wood", "Wood is always better", "Fibreglass is cheaper"]'::jsonb,
    '1'::jsonb,
    'Fibreglass offers durability and weather resistance.',
    ARRAY['[', 'M', 'a', 't', 'e', 'r', 'i', 'a', 'l', ' ', 'c', 'o', 'm', 'p', 'a', 'r', 'i', 's', 'o', 'n', '.', ',', 'M', 'o', 'd', 'e', 'r', 'n', ' ', 'a', 'l', 't', 'e', 'r', 'n', 'a', 't', 'i', 'v', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7e68e304-c7c4-5816-af18-f07cda937fcc',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'fill_in_blank',
    'Explain why a blacksmith quenches heated steel in water.',
    NULL,
    '"rapid cooling"'::jsonb,
    'Rapid cooling (quenching) hardens the steel by trapping carbon in the crystal structure.',
    ARRAY['[', 'H', 'e', 'a', 't', ' ', 't', 'r', 'e', 'a', 't', 'm', 'e', 'n', 't', '.', ',', 'H', 'a', 'r', 'd', 'e', 'n', 'i', 'n', 'g', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9e045d01-bb5f-5149-b153-a05dfb114d76',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Why is it important to balance the weight of a farming tool?',
    '["It is not important", "Balanced tools reduce fatigue and allow more precise control during use", "To make them heavier", "To look professional"]'::jsonb,
    '1'::jsonb,
    'Weight balance affects user comfort and accuracy.',
    ARRAY['[', 'E', 'r', 'g', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'f', 'a', 'c', 't', 'o', 'r', '.', ',', 'U', 's', 'e', 'r', ' ', 'e', 'x', 'p', 'e', 'r', 'i', 'e', 'n', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3c308cbc-c7bb-50b1-93b7-eaa6a655d732',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'How are simple tools manufactured in rural Ghana?',
    '["Only in factories", "Many are made by local blacksmiths using traditional forging techniques", "Only imported", "Only by hand"]'::jsonb,
    '1'::jsonb,
    'Local blacksmiths forge tools from scrap metal using traditional methods.',
    ARRAY['[', 'L', 'o', 'c', 'a', 'l', ' ', 'm', 'a', 'n', 'u', 'f', 'a', 'c', 't', 'u', 'r', 'i', 'n', 'g', '.', ',', 'T', 'r', 'a', 'd', 'i', 't', 'i', 'o', 'n', 'a', 'l', ' ', 's', 'k', 'i', 'l', 'l', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '318464b6-aca0-5ad1-9847-2a3343038b30',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Why do some tools have serrated edges?',
    '["For decoration", "Serrations grip and cut tough materials more effectively than smooth edges", "To be sharper", "To be heavier"]'::jsonb,
    '1'::jsonb,
    'Serrated edges catch and tear fibrous materials.',
    ARRAY['[', 'C', 'u', 't', 't', 'i', 'n', 'g', ' ', 'd', 'e', 's', 'i', 'g', 'n', '.', ',', 'M', 'a', 't', 'e', 'r', 'i', 'a', 'l', '-', 's', 'p', 'e', 'c', 'i', 'f', 'i', 'c', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ab7631f6-a18d-574e-b539-bbcdf21d5558',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'What factors should a farmer consider when choosing a tool?',
    '["Only price", "Task, soil type, durability, ergonomics, and cost", "Only colour", "Only brand"]'::jsonb,
    '1'::jsonb,
    'Multiple factors determine the best tool for each task.',
    ARRAY['[', 'S', 'e', 'l', 'e', 'c', 't', 'i', 'o', 'n', ' ', 'c', 'r', 'i', 't', 'e', 'r', 'i', 'a', '.', ',', 'C', 'o', 'n', 't', 'e', 'x', 't', '-', 'd', 'e', 'p', 'e', 'n', 'd', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dd23e17e-e7b7-52d3-b4a0-446d311b6f30',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'fill_in_blank',
    'How does proper tool maintenance extend tool life?',
    NULL,
    '"preventive care"'::jsonb,
    'Cleaning, oiling, sharpening, and proper storage prevent rust, wear, and damage.',
    ARRAY['[', 'M', 'a', 'i', 'n', 't', 'e', 'n', 'a', 'n', 'c', 'e', ' ', 'p', 'r', 'a', 'c', 't', 'i', 'c', 'e', 's', '.', ',', 'C', 'o', 's', 't', ' ', 's', 'a', 'v', 'i', 'n', 'g', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2fb6d362-b868-55b3-aad1-8b9e36aef9e6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.4.5.1'), NULL, 'multiple_choice',
    'Why is it important to use the right tool for each farming task?',
    '["It is not important", "The right tool is more efficient, safer, and causes less fatigue", "Any tool works", "Only for professionals"]'::jsonb,
    '1'::jsonb,
    'Using the correct tool improves productivity and safety.',
    ARRAY['[', 'T', 'a', 's', 'k', ' ', 'm', 'a', 't', 'c', 'h', 'i', 'n', 'g', '.', ',', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', ' ', 'a', 'n', 'd', ' ', 's', 'a', 'f', 'e', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.5.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b85688a9-35fd-5132-aba6-44c101e4612b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Scientific methods in waste management include:',
    '["Only burning", "Research, data collection, analysis, and evidence-based solutions", "Only burying", "Only guessing"]'::jsonb,
    '1'::jsonb,
    'Scientific approaches use evidence to solve waste problems.',
    ARRAY['[', 'E', 'v', 'i', 'd', 'e', 'n', 'c', 'e', '-', 'b', 'a', 's', 'e', 'd', '.', ',', 'S', 'y', 's', 't', 'e', 'm', 'a', 't', 'i', 'c', ' ', 'a', 'p', 'p', 'r', 'o', 'a', 'c', 'h', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8e9c19ca-bca1-5254-baf9-6bcb617b7de8',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Waste auditing involves:',
    '["Ignoring waste", "Systematically recording and analysing types and amounts of waste produced", "Burning all waste", "Recycling everything"]'::jsonb,
    '1'::jsonb,
    'Waste audits identify what waste is produced and how much.',
    ARRAY['[', 'D', 'a', 't', 'a', ' ', 'c', 'o', 'l', 'l', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'B', 'a', 's', 'e', 'l', 'i', 'n', 'e', ' ', 'a', 's', 's', 'e', 's', 's', 'm', 'e', 'n', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95f62501-cbde-5398-9a56-4fe70ef2d167',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Life cycle analysis examines:',
    '["Only production", "The environmental impact of a product from creation to disposal", "Only disposal", "Only transportation"]'::jsonb,
    '1'::jsonb,
    'LCA considers all stages: raw materials, production, use, disposal.',
    ARRAY['[', 'H', 'o', 'l', 'i', 's', 't', 'i', 'c', ' ', 'a', 's', 's', 'e', 's', 's', 'm', 'e', 'n', 't', '.', ',', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '216bc452-47ce-5a19-b24d-11545f915a5f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Monitoring waste composition helps:',
    '["Nothing", "Identify which materials can be reduced, reused, or recycled", "Make waste heavier", "Increase waste"]'::jsonb,
    '1'::jsonb,
    'Composition data guides targeted waste reduction strategies.',
    ARRAY['[', 'W', 'a', 's', 't', 'e', ' ', 'c', 'h', 'a', 'r', 'a', 'c', 't', 'e', 'r', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ',', 'S', 't', 'r', 'a', 't', 'e', 'g', 'y', ' ', 'd', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4df18620-e92c-5c60-aa8b-34c097543f3e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Data-driven waste management uses:',
    '["Guesswork", "Evidence and measurements to guide waste reduction decisions", "Only tradition", "Only intuition"]'::jsonb,
    '1'::jsonb,
    'Scientific data leads to more effective waste management.',
    ARRAY['[', 'E', 'v', 'i', 'd', 'e', 'n', 'c', 'e', '-', 'b', 'a', 's', 'e', 'd', ' ', 'd', 'e', 'c', 'i', 's', 'i', 'o', 'n', 's', '.', ',', 'M', 'e', 'a', 's', 'u', 'r', 'a', 'b', 'l', 'e', ' ', 'o', 'u', 't', 'c', 'o', 'm', 'e', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '86d19f82-ccc2-545c-b2c1-3e33c18ec369',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Pilot testing waste solutions means:',
    '["Implementing everywhere", "Testing on a small scale before full implementation", "Ignoring the problem", "Only planning"]'::jsonb,
    '1'::jsonb,
    'Pilot tests identify problems before large-scale rollout.',
    ARRAY['[', 'R', 'i', 's', 'k', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ',', 'I', 't', 'e', 'r', 'a', 't', 'i', 'v', 'e', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2c75810e-4c97-598a-888e-a7ccce8c02ca',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Why is waste characterisation important?',
    '["It is not important", "It identifies the types and quantities of waste, guiding appropriate management strategies", "For fun", "Only for scientists"]'::jsonb,
    '1'::jsonb,
    'Knowing what waste you have determines how to manage it.',
    ARRAY['[', 'W', 'a', 's', 't', 'e', ' ', 'p', 'r', 'o', 'f', 'i', 'l', 'i', 'n', 'g', '.', ',', 'S', 't', 'r', 'a', 't', 'e', 'g', 'y', ' ', 'f', 'o', 'u', 'n', 'd', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b216efc5-c421-5a65-a1ee-88c2a16bf607',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'How can communities use scientific methods to improve waste management?',
    '["They cannot", "Conduct waste audits, monitor disposal sites, and evaluate recycling programmes", "Only governments can", "Only scientists can"]'::jsonb,
    '1'::jsonb,
    'Community-level data collection enables local solutions.',
    ARRAY['[', 'C', 'i', 't', 'i', 'z', 'e', 'n', ' ', 's', 'c', 'i', 'e', 'n', 'c', 'e', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 'a', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8395f824-2bd6-598f-b2e0-aeaa567337ac',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'What is a waste management plan?',
    '["A drawing", "A documented strategy for reducing, recycling, and disposing of waste", "A type of waste", "A building plan"]'::jsonb,
    '1'::jsonb,
    'Waste management plans outline goals, methods, and responsibilities.',
    ARRAY['[', 'S', 't', 'r', 'a', 't', 'e', 'g', 'i', 'c', ' ', 'd', 'o', 'c', 'u', 'm', 'e', 'n', 't', '.', ',', 'I', 'm', 'p', 'l', 'e', 'm', 'e', 'n', 't', 'a', 't', 'i', 'o', 'n', ' ', 'g', 'u', 'i', 'd', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '236c5ab7-71e0-5d67-9c1b-fbd5e488212f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'fill_in_blank',
    'Name one scientific tool used in waste management.',
    NULL,
    '"waste audit"'::jsonb,
    'Waste audits, surveys, environmental monitoring, and data analysis.',
    ARRAY['[', 'A', 's', 's', 'e', 's', 's', 'm', 'e', 'n', 't', ' ', 't', 'o', 'o', 'l', 's', '.', ',', 'E', 'v', 'i', 'd', 'e', 'n', 'c', 'e', ' ', 'g', 'a', 't', 'h', 'e', 'r', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6a820356-04d7-5767-b6f4-2df4642aaa7a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Why is monitoring landfill sites important?',
    '["It is not important", "Monitoring detects groundwater contamination, gas emissions, and structural stability", "For decoration", "Only for government"]'::jsonb,
    '1'::jsonb,
    'Landfill monitoring prevents environmental and health hazards.',
    ARRAY['[', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'p', 'r', 'o', 't', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'H', 'a', 'z', 'a', 'r', 'd', ' ', 'p', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5e5a9af1-e65b-5ef3-acf0-462cd82ea887',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'How does data help in designing recycling programmes?',
    '["It does not", "Data on waste composition and quantities guide collection schedules, facility sizing, and material recovery", "Only for statistics", "Only for reports"]'::jsonb,
    '1'::jsonb,
    'Data-driven design optimises recycling programme efficiency.',
    ARRAY['[', 'P', 'r', 'o', 'g', 'r', 'a', 'm', 'm', 'e', ' ', 'd', 'e', 's', 'i', 'g', 'n', '.', ',', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'a', 'l', 'l', 'o', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2a41ebc5-09e8-588d-b9d2-c106ab1437bd',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Why might a waste management solution that works in one community fail in another?',
    '["It will always work", "Different communities have different waste compositions, resources, and cultural practices", "All communities are the same", "Solutions are universal"]'::jsonb,
    '1'::jsonb,
    'Context-specific factors affect solution effectiveness.',
    ARRAY['[', 'L', 'o', 'c', 'a', 'l', ' ', 'a', 'd', 'a', 'p', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 'n', 't', 'e', 'x', 't', ' ', 'm', 'a', 't', 't', 'e', 'r', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4e248fc8-e2b8-5d18-b12c-02bdeb700d50',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'How can waste management contribute to a circular economy?',
    '["It cannot", "By designing systems that recover and reuse materials, minimising waste sent to landfill", "Only through burning", "Only through burial"]'::jsonb,
    '1'::jsonb,
    'Circular economy aims for zero waste through material recovery.',
    ARRAY['[', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'r', 'e', 'c', 'o', 'v', 'e', 'r', 'y', '.', ',', 'C', 'l', 'o', 's', 'e', 'd', '-', 'l', 'o', 'o', 'p', ' ', 's', 'y', 's', 't', 'e', 'm', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8c40105a-c655-5491-9a54-3104fafadd29',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'What role does technology play in modern waste management?',
    '["No role", "Technology enables sorting, recycling, waste-to-energy conversion, and monitoring", "Only for entertainment", "Only for communication"]'::jsonb,
    '1'::jsonb,
    'Technology improves efficiency and enables new waste treatment methods.',
    ARRAY['[', 'A', 'u', 't', 'o', 'm', 'a', 't', 'i', 'o', 'n', '.', ',', 'I', 'n', 'n', 'o', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '70cd7b5d-efd1-56bf-8012-521d3e08201c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Why is public participation important in waste management?',
    '["It is not important", "Effective waste management requires community cooperation in segregation, reduction, and proper disposal", "Only government matters", "Only businesses matter"]'::jsonb,
    '1'::jsonb,
    'Community involvement is essential for programme success.',
    ARRAY['[', 'B', 'e', 'h', 'a', 'v', 'i', 'o', 'u', 'r', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ',', 'C', 'o', 'l', 'l', 'e', 'c', 't', 'i', 'v', 'e', ' ', 'a', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cbfa3d7e-9de3-535f-b3cd-b1ced5814165',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'How can education improve waste management outcomes?',
    '["It cannot", "Educated communities understand the importance of proper waste management and participate more actively", "Only for children", "Only for scientists"]'::jsonb,
    '1'::jsonb,
    'Education builds awareness and drives behaviour change.',
    ARRAY['[', 'K', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', ' ', 't', 'r', 'a', 'n', 's', 'f', 'e', 'r', '.', ',', 'C', 'o', 'm', 'm', 'u', 'n', 'i', 't', 'y', ' ', 'e', 'm', 'p', 'o', 'w', 'e', 'r', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '82b083cd-19eb-526d-953f-cb408ac32f04',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'What metrics should be used to evaluate waste management programmes?',
    '["Only cost", "Tons diverted from landfill, recycling rates, cost per ton, and community satisfaction", "Only recycling rates", "Only complaints"]'::jsonb,
    '1'::jsonb,
    'Multiple metrics provide a comprehensive evaluation.',
    ARRAY['[', 'P', 'e', 'r', 'f', 'o', 'r', 'm', 'a', 'n', 'c', 'e', ' ', 'i', 'n', 'd', 'i', 'c', 'a', 't', 'o', 'r', 's', '.', ',', 'P', 'r', 'o', 'g', 'r', 'a', 'm', 'm', 'e', ' ', 'a', 's', 's', 'e', 's', 's', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c087bdf3-a96d-5a60-a51e-76dc7169e21a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'Why is it important to adapt waste management strategies over time?',
    '["It is not important", "Waste composition changes, new technologies emerge, and community needs evolve", "Strategies never change", "Only for the government"]'::jsonb,
    '1'::jsonb,
    'Adaptive management ensures continued effectiveness.',
    ARRAY['[', 'C', 'o', 'n', 't', 'i', 'n', 'u', 'o', 'u', 's', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ',', 'R', 'e', 's', 'p', 'o', 'n', 's', 'i', 'v', 'e', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '06279b43-eac0-5b4a-9861-01cb64f138cf',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.1'), NULL, 'multiple_choice',
    'How can waste management research benefit developing countries?',
    '["It cannot", "Research identifies low-cost, locally appropriate solutions for waste challenges", "Only for rich countries", "Only for academics"]'::jsonb,
    '1'::jsonb,
    'Research enables evidence-based, context-appropriate solutions.',
    ARRAY['[', 'L', 'o', 'c', 'a', 'l', ' ', 's', 'o', 'l', 'u', 't', 'i', 'o', 'n', 's', '.', ',', 'D', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.5.1.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c2cf24d0-fcc6-57f5-8161-f92014280786',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Innovative waste management approaches include:',
    '["Only landfill", "Waste-to-energy, upcycling, and biodegradable packaging", "Only burning", "Only recycling"]'::jsonb,
    '1'::jsonb,
    'Innovation creates new solutions for waste reduction and resource recovery.',
    ARRAY['[', 'C', 'r', 'e', 'a', 't', 'i', 'v', 'e', ' ', 's', 'o', 'l', 'u', 't', 'i', 'o', 'n', 's', '.', ',', 'B', 'e', 'y', 'o', 'n', 'd', ' ', 't', 'r', 'a', 'd', 'i', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'm', 'e', 't', 'h', 'o', 'd', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dda421c4-7ad1-5ebd-9cd4-2f2f0178c4de',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Waste-to-energy converts waste into:',
    '["Plastic", "Electricity or heat through combustion or gasification", "Water", "Soil"]'::jsonb,
    '1'::jsonb,
    'Waste-to-energy facilities burn waste to generate power.',
    ARRAY['[', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'r', 'e', 'c', 'o', 'v', 'e', 'r', 'y', '.', ',', 'R', 'e', 'd', 'u', 'c', 'e', 's', ' ', 'l', 'a', 'n', 'd', 'f', 'i', 'l', 'l', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5e6e3f79-94dd-5d5f-9e59-0b310e9d0dc6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Upcycling means:',
    '["Throwing away waste", "Converting waste materials into products of higher value", "Burying waste", "Burning waste"]'::jsonb,
    '1'::jsonb,
    'Upcycling creates higher-value products from waste materials.',
    ARRAY['[', 'V', 'a', 'l', 'u', 'e', ' ', 'a', 'd', 'd', 'i', 't', 'i', 'o', 'n', '.', ',', 'C', 'r', 'e', 'a', 't', 'i', 'v', 'e', ' ', 'r', 'e', 'u', 's', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '13ef7dd4-e8d7-54c7-a23f-ddc9d051ae33',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Biodegradable packaging is made from:',
    '["Plastic", "Materials that decompose naturally (plant starch, paper)", "Metal", "Glass"]'::jsonb,
    '1'::jsonb,
    'Biodegradable materials break down naturally without harming the environment.',
    ARRAY['[', 'D', 'e', 'c', 'o', 'm', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n', '.', ',', 'A', 'l', 't', 'e', 'r', 'n', 'a', 't', 'i', 'v', 'e', ' ', 't', 'o', ' ', 'p', 'l', 'a', 's', 't', 'i', 'c', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8e46555c-cad1-55cf-9483-44d491e08386',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Composting toilets convert human waste into:',
    '["Plastic", "Compost (safe soil amendment)", "Energy", "Water"]'::jsonb,
    '1'::jsonb,
    'Composting toilets process human waste into usable compost.',
    ARRAY['[', 'S', 'a', 'n', 'i', 't', 'a', 't', 'i', 'o', 'n', ' ', 's', 'o', 'l', 'u', 't', 'i', 'o', 'n', '.', ',', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'r', 'e', 'c', 'o', 'v', 'e', 'r', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b8393e6d-9ecd-5e92-bf12-6fc8448c645c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'The circular economy aims to:',
    '["Create more waste", "Eliminate waste by keeping materials in use", "Burn all waste", "Bury all waste"]'::jsonb,
    '1'::jsonb,
    'Circular economy designs out waste and keeps resources in use.',
    ARRAY['[', 'Z', 'e', 'r', 'o', ' ', 'w', 'a', 's', 't', 'e', ' ', 'g', 'o', 'a', 'l', '.', ',', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'c', 'i', 'r', 'c', 'u', 'l', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'db076de3-1acf-5aeb-ae7e-525e5e379b39',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Why is waste-to-energy controversial?',
    '["It is not controversial", "It reduces landfill but can release emissions; recycling is generally preferred", "It is always good", "It is always bad"]'::jsonb,
    '1'::jsonb,
    'WtE has trade-offs: reduces landfill but may produce air pollution.',
    ARRAY['[', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'd', 'e', 'b', 'a', 't', 'e', '.', ',', 'H', 'i', 'e', 'r', 'a', 'r', 'c', 'h', 'y', ' ', 'p', 'o', 's', 'i', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc17b0b1-301f-5a14-9fe0-ea6856748a03',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'How does upcycling differ from recycling?',
    '["They are the same", "Upcycling creates higher-value products; recycling breaks materials down to remake similar products", "Upcycling is worse", "Recycling is worse"]'::jsonb,
    '1'::jsonb,
    'Upcycling adds value; recycling maintains value.',
    ARRAY['[', 'V', 'a', 'l', 'u', 'e', ' ', 'c', 'r', 'e', 'a', 't', 'i', 'o', 'n', '.', ',', 'C', 'r', 'e', 'a', 't', 'i', 'v', 'e', ' ', 't', 'r', 'a', 'n', 's', 'f', 'o', 'r', 'm', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cdbbd4dc-25a7-5bcb-b838-1c870f2c52c5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'What is Extended Producer Responsibility (EPR)?',
    '["Consumer responsibility", "Producers are responsible for the end-of-life management of their products", "Government responsibility", "Nobody is responsible"]'::jsonb,
    '1'::jsonb,
    'EPR shifts waste management costs to producers.',
    ARRAY['[', 'P', 'o', 'l', 'i', 'c', 'y', ' ', 't', 'o', 'o', 'l', '.', ',', 'P', 'r', 'o', 'd', 'u', 'c', 'e', 'r', ' ', 'a', 'c', 'c', 'o', 'u', 'n', 't', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f7bd351c-b4ce-58c8-af98-82361cc40b21',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'fill_in_blank',
    'Name one innovative waste solution used in Ghana.',
    NULL,
    '"recycling cooperatives"'::jsonb,
    'Recycling cooperatives, composting programmes, plastic brick making, and upcycling initiatives.',
    ARRAY['[', 'L', 'o', 'c', 'a', 'l', ' ', 'i', 'n', 'n', 'o', 'v', 'a', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 'm', 'm', 'u', 'n', 'i', 't', 'y', '-', 'b', 'a', 's', 'e', 'd', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '81894413-3453-5353-8102-e2f9d829ae83',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Why is plastic waste a particular challenge in Ghana?',
    '["It is not a challenge", "Plastic does not decompose, blocks drains, and causes flooding; recycling infrastructure is limited", "Plastic is useful", "Ghana has no plastic"]'::jsonb,
    '1'::jsonb,
    'Plastic persistence and infrastructure gaps create major waste challenges.',
    ARRAY['[', 'N', 'o', 'n', '-', 'b', 'i', 'o', 'd', 'e', 'g', 'r', 'a', 'd', 'a', 'b', 'l', 'e', '.', ',', 'I', 'n', 'f', 'r', 'a', 's', 't', 'r', 'u', 'c', 't', 'u', 'r', 'e', ' ', 'n', 'e', 'e', 'd', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b4f31e1b-dd2c-5718-8030-91ba4d17007f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'How can technology help solve waste management problems?',
    '["It cannot", "Technology enables sorting, recycling, waste-to-energy, and smart collection systems", "Only for entertainment", "Only for communication"]'::jsonb,
    '1'::jsonb,
    'Technological innovation drives waste management improvements.',
    ARRAY['[', 'A', 'u', 't', 'o', 'm', 'a', 't', 'i', 'o', 'n', '.', ',', 'S', 'm', 'a', 'r', 't', ' ', 's', 'y', 's', 't', 'e', 'm', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e2ef92b7-7782-52ea-b5ed-8bf9cd163fbe',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Why might developing countries leapfrog to innovative waste solutions?',
    '["They cannot", "Skipping traditional approaches (landfill) and adopting modern solutions directly is more efficient", "They should follow developed countries", "Innovation is too expensive"]'::jsonb,
    '1'::jsonb,
    'Leapfrogging avoids the mistakes of developed countries.',
    ARRAY['[', 'D', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', ' ', 's', 'h', 'o', 'r', 't', 'c', 'u', 't', '.', ',', 'C', 'o', 'n', 't', 'e', 'x', 't', '-', 'a', 'p', 'p', 'r', 'o', 'p', 'r', 'i', 'a', 't', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b4934642-7a56-5bd2-bf1b-57cd20222e44',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'How can waste innovation create economic opportunities?',
    '["It cannot", "Recycling industries, upcycling businesses, and waste-to-energy create jobs and income", "Only for the rich", "Only for government"]'::jsonb,
    '1'::jsonb,
    'Waste innovation drives green economy and job creation.',
    ARRAY['[', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'o', 'p', 'p', 'o', 'r', 't', 'u', 'n', 'i', 't', 'y', '.', ',', 'G', 'r', 'e', 'e', 'n', ' ', 'j', 'o', 'b', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4465f664-c4ee-5ca9-b699-b3685a7ad719',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'What is industrial symbiosis?',
    '["Factories competing", "One industry''s waste becomes another industry''s raw material", "Factories merging", "Only for large companies"]'::jsonb,
    '1'::jsonb,
    'Industrial symbiosis creates closed-loop material flows between industries.',
    ARRAY['[', 'W', 'a', 's', 't', 'e', ' ', 'e', 'x', 'c', 'h', 'a', 'n', 'g', 'e', '.', ',', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0443aa2d-8711-5c7d-aa03-eb76f6812db0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Why is it important to consider the full life cycle of products?',
    '["It is not important", "Life cycle thinking reveals hidden environmental impacts at each stage", "Only production matters", "Only disposal matters"]'::jsonb,
    '1'::jsonb,
    'LCA identifies hotspots for improvement.',
    ARRAY['[', 'H', 'o', 'l', 'i', 's', 't', 'i', 'c', ' ', 'v', 'i', 'e', 'w', '.', ',', 'I', 'm', 'p', 'a', 'c', 't', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b50b9c06-ec8f-5514-aecf-584a7ef9a91a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'How can consumers contribute to innovative waste management?',
    '["They cannot", "Choose products with less packaging, support upcycled products, and segregate waste properly", "Only businesses matter", "Only government matters"]'::jsonb,
    '1'::jsonb,
    'Consumer choices drive market demand for sustainable products.',
    ARRAY['[', 'C', 'o', 'n', 's', 'u', 'm', 'e', 'r', ' ', 'p', 'o', 'w', 'e', 'r', '.', ',', 'M', 'a', 'r', 'k', 'e', 't', ' ', 'i', 'n', 'f', 'l', 'u', 'e', 'n', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '26dbfea3-e0bd-53a7-a4d6-f9a59f19f257',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'What challenges do innovative waste solutions face in Ghana?',
    '["No challenges", "Funding, infrastructure, awareness, and policy support are major barriers", "They are too easy", "Only technology is needed"]'::jsonb,
    '1'::jsonb,
    'Multiple barriers need to be overcome for innovation to succeed.',
    ARRAY['[', 'I', 'm', 'p', 'l', 'e', 'm', 'e', 'n', 't', 'a', 't', 'i', 'o', 'n', ' ', 'c', 'h', 'a', 'l', 'l', 'e', 'n', 'g', 'e', 's', '.', ',', 'S', 'y', 's', 't', 'e', 'm', 'i', 'c', ' ', 'b', 'a', 'r', 'r', 'i', 'e', 'r', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4580efc7-a80a-59de-b2a2-80cf2b47edd2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'Why is waste segregation at source important for innovative solutions?',
    '["It is not important", "Segregation enables efficient recycling, composting, and resource recovery", "To make waste heavier", "For cleanliness"]'::jsonb,
    '1'::jsonb,
    'Clean waste streams are essential for effective processing.',
    ARRAY['[', 'S', 'o', 'u', 'r', 'c', 'e', ' ', 's', 'e', 'p', 'a', 'r', 'a', 't', 'i', 'o', 'n', '.', ',', 'P', 'r', 'o', 'c', 'e', 's', 's', 'i', 'n', 'g', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3b833f5c-35c6-5fa2-8748-c48fa29a1eb3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.1.2'), NULL, 'multiple_choice',
    'How can schools promote innovative waste management?',
    '["They cannot", "Schools can implement recycling programmes, composting, and educate students about waste reduction", "Only for adults", "Only for government"]'::jsonb,
    '1'::jsonb,
    'Schools are ideal for building waste management culture.',
    ARRAY['[', 'E', 'd', 'u', 'c', 'a', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'r', 'o', 'l', 'e', '.', ',', 'B', 'e', 'h', 'a', 'v', 'i', 'o', 'u', 'r', ' ', 's', 'h', 'a', 'p', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.5.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aaed787a-58d5-5770-8dea-335e6e4a836a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Common communicable diseases in Ghana include malaria, cholera, and:',
    '["Diabetes", "Typhoid", "Cancer", "Hypertension"]'::jsonb,
    '1'::jsonb,
    'Malaria, cholera, and typhoid are major communicable diseases in Ghana.',
    ARRAY['[', 'I', 'n', 'f', 'e', 'c', 't', 'i', 'o', 'u', 's', ' ', 'd', 'i', 's', 'e', 'a', 's', 'e', 's', '.', ',', 'P', 'u', 'b', 'l', 'i', 'c', ' ', 'h', 'e', 'a', 'l', 't', 'h', ' ', 'c', 'o', 'n', 'c', 'e', 'r', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2bfa67cd-12bf-5c83-b46c-1d0032851e44',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Malaria is transmitted by:',
    '["Contaminated water", "Anopheles mosquitoes", "Touching an infected person", "Breathing polluted air"]'::jsonb,
    '1'::jsonb,
    'Anopheles mosquitoes transmit the Plasmodium parasite.',
    ARRAY['[', 'V', 'e', 'c', 't', 'o', 'r', '-', 'b', 'o', 'r', 'n', 'e', '.', ',', 'P', 'r', 'e', 'v', 'e', 'n', 't', 'a', 'b', 'l', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5177101d-044e-559a-8658-436388a6898d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Cholera spreads through:',
    '["Mosquito bites", "Contaminated water and food", "Air", "Touching"]'::jsonb,
    '1'::jsonb,
    'Cholera spreads via faecal contamination of water and food.',
    ARRAY['[', 'W', 'a', 't', 'e', 'r', 'b', 'o', 'r', 'n', 'e', '.', ',', 'S', 'a', 'n', 'i', 't', 'a', 't', 'i', 'o', 'n', ' ', 'r', 'e', 'l', 'a', 't', 'e', 'd', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd9997528-83e4-5677-8265-f1449daf6091',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Tuberculosis (TB) spreads through:',
    '["Water", "Air (respiratory droplets)", "Mosquitoes", "Food"]'::jsonb,
    '1'::jsonb,
    'TB spreads through coughing and sneezing.',
    ARRAY['[', 'A', 'i', 'r', 'b', 'o', 'r', 'n', 'e', '.', ',', 'R', 'e', 's', 'p', 'i', 'r', 'a', 't', 'o', 'r', 'y', ' ', 'd', 'i', 's', 'e', 'a', 's', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8b0579c9-04f6-5ff5-9d51-d402b80a562a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Prevention of malaria includes:',
    '["Antibiotics", "Sleeping under treated bed nets and eliminating mosquito breeding sites", "Drinking clean water", "Eating healthy"]'::jsonb,
    '1'::jsonb,
    'Vector control is key to malaria prevention.',
    ARRAY['[', 'B', 'e', 'd', ' ', 'n', 'e', 't', 's', '.', ',', 'S', 'o', 'u', 'r', 'c', 'e', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2d86a423-a9d6-5e87-80a5-9d4d7e223cfa',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Washing hands with soap prevents disease by:',
    '["Killing all germs", "Removing pathogens before they enter the body", "Making hands smell good", "Drying hands"]'::jsonb,
    '1'::jsonb,
    'Handwashing mechanically removes germs.',
    ARRAY['[', 'P', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', ' ', 'm', 'e', 't', 'h', 'o', 'd', '.', ',', 'S', 'i', 'm', 'p', 'l', 'e', ' ', 'a', 'n', 'd', ' ', 'e', 'f', 'f', 'e', 'c', 't', 'i', 'v', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '54b8f6e9-9700-5677-b54e-7d474f4d8baa',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Why is early treatment important for communicable diseases?',
    '["It is not important", "Early treatment reduces severity, prevents complications, and reduces spread", "Only for comfort", "Only for serious cases"]'::jsonb,
    '1'::jsonb,
    'Early intervention improves outcomes and prevents transmission.',
    ARRAY['[', 'T', 'r', 'e', 'a', 't', 'm', 'e', 'n', 't', ' ', 't', 'i', 'm', 'i', 'n', 'g', '.', ',', 'P', 'u', 'b', 'l', 'i', 'c', ' ', 'h', 'e', 'a', 'l', 't', 'h', ' ', 'b', 'e', 'n', 'e', 'f', 'i', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3b4046f8-beed-5ff5-891a-1e5c7ad6be7f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'How does poverty contribute to disease spread?',
    '["It does not", "Poverty limits access to clean water, sanitation, healthcare, and nutrition", "Only for poor people", "Only for rich people"]'::jsonb,
    '1'::jsonb,
    'Social determinants of health affect disease vulnerability.',
    ARRAY['[', 'H', 'e', 'a', 'l', 't', 'h', ' ', 'i', 'n', 'e', 'q', 'u', 'a', 'l', 'i', 't', 'y', '.', ',', 'S', 't', 'r', 'u', 'c', 't', 'u', 'r', 'a', 'l', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '556588bb-2620-5bd6-b785-37a473f3eff8',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Why is vaccination important for disease prevention?',
    '["It is not important", "Vaccines build immunity before exposure, preventing infection and spread", "To cure diseases", "To make people stronger"]'::jsonb,
    '1'::jsonb,
    'Vaccination is the most effective disease prevention tool.',
    ARRAY['[', 'I', 'm', 'm', 'u', 'n', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ',', 'H', 'e', 'r', 'd', ' ', 'i', 'm', 'm', 'u', 'n', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1740af05-7c34-5c3f-aaa1-5944833e31ac',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'fill_in_blank',
    'Name two ways to prevent cholera.',
    NULL,
    '"clean water"'::jsonb,
    'Clean water, proper sanitation, handwashing, and food hygiene.',
    ARRAY['[', 'W', 'a', 't', 'e', 'r', ' ', 's', 'a', 'f', 'e', 't', 'y', '.', ',', 'S', 'a', 'n', 'i', 't', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '23263f19-c03d-5938-98bf-17cfd34dc4a1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Why are children more vulnerable to communicable diseases?',
    '["They are not", "Children have developing immune systems and are more exposed through play and behaviour", "Only adults get sick", "Children are immune"]'::jsonb,
    '1'::jsonb,
    'Immature immune systems and behaviour increase children''s vulnerability.',
    ARRAY['[', 'A', 'g', 'e', '-', 'r', 'e', 'l', 'a', 't', 'e', 'd', ' ', 'r', 'i', 's', 'k', '.', ',', 'I', 'm', 'm', 'u', 'n', 'e', ' ', 'd', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a16687dd-bf3f-5071-8b87-a889baa11f77',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'How does climate change affect communicable disease patterns?',
    '["No effect", "Warmer temperatures expand mosquito habitats and alter disease transmission patterns", "Only affects cold countries", "Reduces diseases"]'::jsonb,
    '1'::jsonb,
    'Climate change shifts disease ranges and transmission seasons.',
    ARRAY['[', 'R', 'a', 'n', 'g', 'e', ' ', 'e', 'x', 'p', 'a', 'n', 's', 'i', 'o', 'n', '.', ',', 'S', 'e', 'a', 's', 'o', 'n', 'a', 'l', ' ', 'c', 'h', 'a', 'n', 'g', 'e', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ec0d69d0-ad7d-5cdf-8697-f3cd88341997',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Why is disease surveillance important?',
    '["It is not important", "Surveillance detects outbreaks early, allowing rapid response and containment", "Only for scientists", "Only for government"]'::jsonb,
    '1'::jsonb,
    'Early detection prevents epidemics.',
    ARRAY['[', 'P', 'u', 'b', 'l', 'i', 'c', ' ', 'h', 'e', 'a', 'l', 't', 'h', ' ', 't', 'o', 'o', 'l', '.', ',', 'O', 'u', 't', 'b', 'r', 'e', 'a', 'k', ' ', 'r', 'e', 's', 'p', 'o', 'n', 's', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a4d90a33-c67c-5bc1-a89b-a3fd1ea146cf',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'How can communities prevent the spread of respiratory diseases?',
    '["They cannot", "Cover coughs, wash hands, improve ventilation, and get vaccinated", "Only medicine works", "Only isolation works"]'::jsonb,
    '1'::jsonb,
    'Multiple interventions reduce respiratory disease transmission.',
    ARRAY['[', 'P', 'e', 'r', 's', 'o', 'n', 'a', 'l', ' ', 'h', 'y', 'g', 'i', 'e', 'n', 'e', '.', ',', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'm', 'e', 'a', 's', 'u', 'r', 'e', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '01704e8d-f4c1-5cce-b111-f92b964b713b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Why is clean water critical for preventing waterborne diseases?',
    '["It is not critical", "Clean water prevents ingestion of pathogens that cause cholera, typhoid, and diarrhoea", "Only for drinking", "For cooking only"]'::jsonb,
    '1'::jsonb,
    'Water quality directly affects disease risk.',
    ARRAY['[', 'W', 'a', 't', 'e', 'r', ' ', 's', 'a', 'n', 'i', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'H', 'e', 'a', 'l', 't', 'h', ' ', 'f', 'o', 'u', 'n', 'd', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '50ebbf0a-2c33-5342-857f-8929c56d05cf',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'What role do health workers play in disease prevention?',
    '["No role", "Health workers educate communities, provide vaccinations, and treat infections early", "Only for treatment", "Only for research"]'::jsonb,
    '1'::jsonb,
    'Health workers are frontline defenders against disease.',
    ARRAY['[', 'C', 'o', 'm', 'm', 'u', 'n', 'i', 't', 'y', ' ', 'h', 'e', 'a', 'l', 't', 'h', '.', ',', 'P', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', ' ', 'a', 'n', 'd', ' ', 't', 'r', 'e', 'a', 't', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c1f85e1d-276e-5ed8-aa76-8ba29e75c235',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Why is antibiotic resistance a growing concern?',
    '["It is not a concern", "Overuse of antibiotics creates resistant bacteria that are harder to treat", "Antibiotics are too expensive", "Only doctors care"]'::jsonb,
    '1'::jsonb,
    'Antimicrobial resistance threatens modern medicine.',
    ARRAY['[', 'P', 'u', 'b', 'l', 'i', 'c', ' ', 'h', 'e', 'a', 'l', 't', 'h', ' ', 't', 'h', 'r', 'e', 'a', 't', '.', ',', 'G', 'l', 'o', 'b', 'a', 'l', ' ', 'c', 'o', 'n', 'c', 'e', 'r', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7ce8b39f-6215-50eb-a43b-ca35a0536e9a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'How can schools help prevent disease outbreaks?',
    '["They cannot", "Schools can promote hygiene, provide clean water, and educate students about disease prevention", "Only hospitals matter", "Only government matters"]'::jsonb,
    '1'::jsonb,
    'Schools are key settings for health education and prevention.',
    ARRAY['[', 'H', 'e', 'a', 'l', 't', 'h', ' ', 'p', 'r', 'o', 'm', 'o', 't', 'i', 'o', 'n', '.', ',', 'B', 'e', 'h', 'a', 'v', 'i', 'o', 'u', 'r', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ec0ea645-cd2d-5e98-bd26-8e6a8f3f05de',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'Why is it important to complete a full course of antibiotics?',
    '["It is not important", "Stopping early allows resistant bacteria to survive and multiply", "To save money", "Because doctors say so"]'::jsonb,
    '1'::jsonb,
    'Incomplete courses promote antibiotic resistance.',
    ARRAY['[', 'R', 'e', 's', 'i', 's', 't', 'a', 'n', 'c', 'e', ' ', 'p', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', '.', ',', 'F', 'u', 'l', 'l', ' ', 'c', 'o', 'u', 'r', 's', 'e', ' ', 'e', 's', 's', 'e', 'n', 't', 'i', 'a', 'l', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5e0d95f3-6552-571d-8505-3633b4a3bcf3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.1'), NULL, 'multiple_choice',
    'What is the difference between an endemic disease and an epidemic?',
    '["They are the same", "Endemic: always present in a community. Epidemic: sudden increase above normal levels", "Endemic is worse", "Epidemic is milder"]'::jsonb,
    '1'::jsonb,
    'Endemic = baseline presence; epidemic = outbreak above baseline.',
    ARRAY['[', 'D', 'i', 's', 'e', 'a', 's', 'e', ' ', 't', 'e', 'r', 'm', 'i', 'n', 'o', 'l', 'o', 'g', 'y', '.', ',', 'S', 'u', 'r', 'v', 'e', 'i', 'l', 'l', 'a', 'n', 'c', 'e', ' ', 'd', 'e', 'f', 'i', 'n', 'i', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.5.2.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4aa8ad33-e952-579a-a2ae-7e86c4fe3a78',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Health is defined as:',
    '["Only physical fitness", "A state of complete physical, mental, and social well-being", "Only absence of disease", "Only mental wellness"]'::jsonb,
    '1'::jsonb,
    'WHO defines health as complete well-being, not just absence of disease.',
    ARRAY['[', 'H', 'o', 'l', 'i', 's', 't', 'i', 'c', ' ', 'd', 'e', 'f', 'i', 'n', 'i', 't', 'i', 'o', 'n', '.', ',', 'T', 'h', 'r', 'e', 'e', ' ', 'd', 'i', 'm', 'e', 'n', 's', 'i', 'o', 'n', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'de230ccf-80e9-59f2-94bf-047ff3ab23c0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'A disease is:',
    '["Any discomfort", "A condition that impairs normal body function", "Only a virus", "Only a bacteria"]'::jsonb,
    '1'::jsonb,
    'Diseases disrupt normal body functions.',
    ARRAY['[', 'F', 'u', 'n', 'c', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'i', 'm', 'p', 'a', 'i', 'r', 'm', 'e', 'n', 't', '.', ',', 'V', 'a', 'r', 'i', 'o', 'u', 's', ' ', 'c', 'a', 'u', 's', 'e', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8b46d5b2-6e24-5fc9-90e5-084ad2d03ff0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Communicable diseases are caused by:',
    '["Genetics only", "Pathogens (bacteria, viruses, fungi, parasites)", "Lifestyle only", "Age only"]'::jsonb,
    '1'::jsonb,
    'Pathogens cause communicable (infectious) diseases.',
    ARRAY['[', 'B', 'i', 'o', 'l', 'o', 'g', 'i', 'c', 'a', 'l', ' ', 'a', 'g', 'e', 'n', 't', 's', '.', ',', 'T', 'r', 'a', 'n', 's', 'm', 'i', 's', 's', 'i', 'b', 'l', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '54b8c3cc-4534-588f-b49a-fab3ca1d291b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Non-communicable diseases include:',
    '["Malaria", "Diabetes, cancer, and heart disease", "Cholera", "TB"]'::jsonb,
    '1'::jsonb,
    'NCDs are not transmissible between people.',
    ARRAY['[', 'C', 'h', 'r', 'o', 'n', 'i', 'c', ' ', 'd', 'i', 's', 'e', 'a', 's', 'e', 's', '.', ',', 'L', 'i', 'f', 'e', 's', 't', 'y', 'l', 'e', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3d5fb077-7b1d-5074-9c8d-376d758dc3b6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Prevention of disease includes:',
    '["Only medicine", "Hygiene, vaccination, nutrition, and clean water", "Only exercise", "Only rest"]'::jsonb,
    '1'::jsonb,
    'Multiple strategies prevent different types of diseases.',
    ARRAY['[', 'P', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', ' ', 's', 't', 'r', 'a', 't', 'e', 'g', 'i', 'e', 's', '.', ',', 'C', 'o', 'm', 'p', 'r', 'e', 'h', 'e', 'n', 's', 'i', 'v', 'e', ' ', 'a', 'p', 'p', 'r', 'o', 'a', 'c', 'h', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '466dd787-3735-5155-956e-95eee614a14f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'A healthy lifestyle includes:',
    '["Only exercise", "Balanced diet, regular exercise, adequate sleep, and avoiding harmful substances", "Only eating well", "Only sleeping"]'::jsonb,
    '1'::jsonb,
    'Health requires balanced habits across multiple dimensions.',
    ARRAY['[', 'L', 'i', 'f', 'e', 's', 't', 'y', 'l', 'e', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ',', 'P', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'v', 'e', ' ', 'h', 'e', 'a', 'l', 't', 'h', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '88cf5c13-3772-52b5-b681-6e6b6afb377c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Why is mental health considered part of overall health?',
    '["It is not", "Mental health affects physical health, relationships, and daily functioning", "Only physical health matters", "Mental health is not real"]'::jsonb,
    '1'::jsonb,
    'Mental and physical health are interconnected.',
    ARRAY['[', 'H', 'o', 'l', 'i', 's', 't', 'i', 'c', ' ', 'h', 'e', 'a', 'l', 't', 'h', '.', ',', 'W', 'e', 'l', 'l', '-', 'b', 'e', 'i', 'n', 'g', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd36959aa-ddbf-5c92-9398-c236a9831dad',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'How does nutrition affect disease prevention?',
    '["It does not", "Good nutrition strengthens the immune system, reducing vulnerability to infections", "Only for energy", "Only for growth"]'::jsonb,
    '1'::jsonb,
    'Nutrition directly impacts immune function and disease resistance.',
    ARRAY['[', 'I', 'm', 'm', 'u', 'n', 'e', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', '.', ',', 'P', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'v', 'e', ' ', 'n', 'u', 't', 'r', 'i', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e48549a7-7a1a-5749-9aaf-2a84a1ee10ef',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Why is clean water important for health?',
    '["It is not important", "Clean water prevents waterborne diseases and supports all body functions", "Only for drinking", "For cooking only"]'::jsonb,
    '1'::jsonb,
    'Water quality is fundamental to health.',
    ARRAY['[', 'D', 'i', 's', 'e', 'a', 's', 'e', ' ', 'p', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', '.', ',', 'B', 'o', 'd', 'y', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9f9c7be3-9677-5780-aefd-02f0a0aa05e0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'fill_in_blank',
    'Name one non-communicable disease and its risk factor.',
    NULL,
    '"diabetes"'::jsonb,
    'Diabetes (risk: obesity, sedentary lifestyle), cancer (smoking), heart disease (high cholesterol).',
    ARRAY['[', 'N', 'C', 'D', ' ', 'e', 'x', 'a', 'm', 'p', 'l', 'e', 's', '.', ',', 'L', 'i', 'f', 'e', 's', 't', 'y', 'l', 'e', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dac742ef-fa82-5d40-9428-1675c3e142fd',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Why is regular exercise important for disease prevention?',
    '["It is not important", "Exercise strengthens the heart, improves immunity, and reduces risk of chronic diseases", "Only for muscles", "Only for weight loss"]'::jsonb,
    '1'::jsonb,
    'Physical activity has wide-ranging health benefits.',
    ARRAY['[', 'C', 'a', 'r', 'd', 'i', 'o', 'v', 'a', 's', 'c', 'u', 'l', 'a', 'r', ' ', 'h', 'e', 'a', 'l', 't', 'h', '.', ',', 'I', 'm', 'm', 'u', 'n', 'e', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '51618e74-5923-5759-b2c9-f21c17b09525',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'How does stress affect health?',
    '["It does not", "Chronic stress weakens the immune system, increases blood pressure, and contributes to mental illness", "Only for mental health", "Only for physical health"]'::jsonb,
    '1'::jsonb,
    'Stress has both physical and mental health impacts.',
    ARRAY['[', 'S', 't', 'r', 'e', 's', 's', ' ', 'r', 'e', 's', 'p', 'o', 'n', 's', 'e', '.', ',', 'H', 'e', 'a', 'l', 't', 'h', ' ', 'e', 'f', 'f', 'e', 'c', 't', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0a89b759-2719-5a81-931c-7878c85cf32b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Why is vaccination considered one of the greatest public health achievements?',
    '["It is not", "Vaccines have eradicated smallpox, nearly eliminated polio, and prevent millions of deaths annually", "Only for children", "Only for rich countries"]'::jsonb,
    '1'::jsonb,
    'Vaccination has saved more lives than almost any other intervention.',
    ARRAY['[', 'D', 'i', 's', 'e', 'a', 's', 'e', ' ', 'e', 'r', 'a', 'd', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'P', 'u', 'b', 'l', 'i', 'c', ' ', 'h', 'e', 'a', 'l', 't', 'h', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '71dfed89-11be-55e0-b10e-c78c27cc4e0c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'How can communities promote health beyond treating disease?',
    '["They cannot", "Health promotion, education, clean environments, and access to healthcare prevent disease", "Only hospitals matter", "Only medicine works"]'::jsonb,
    '1'::jsonb,
    'Prevention and health promotion are more effective than treatment alone.',
    ARRAY['[', 'P', 'u', 'b', 'l', 'i', 'c', ' ', 'h', 'e', 'a', 'l', 't', 'h', ' ', 'a', 'p', 'p', 'r', 'o', 'a', 'c', 'h', '.', ',', 'U', 'p', 's', 't', 'r', 'e', 'a', 'm', ' ', 'i', 'n', 't', 'e', 'r', 'v', 'e', 'n', 't', 'i', 'o', 'n', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '05de392f-f038-5fa8-96ef-340462f391c2',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Why is the concept of "health as a human right" important?',
    '["It is not important", "It ensures everyone deserves access to healthcare, clean water, and healthy conditions", "Only for the wealthy", "Only for developed countries"]'::jsonb,
    '1'::jsonb,
    'Health equity requires universal access to health resources.',
    ARRAY['[', 'H', 'u', 'm', 'a', 'n', ' ', 'r', 'i', 'g', 'h', 't', 's', '.', ',', 'H', 'e', 'a', 'l', 't', 'h', ' ', 'e', 'q', 'u', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b299a854-2fab-5613-9098-c98136d0c317',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'How does housing quality affect health?',
    '["It does not", "Poor housing (overcrowding, dampness, no ventilation) increases disease risk", "Only for comfort", "Only for appearance"]'::jsonb,
    '1'::jsonb,
    'Housing conditions directly impact respiratory health and disease transmission.',
    ARRAY['[', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'h', 'e', 'a', 'l', 't', 'h', '.', ',', 'L', 'i', 'v', 'i', 'n', 'g', ' ', 'c', 'o', 'n', 'd', 'i', 't', 'i', 'o', 'n', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b93e3579-1e9c-5f30-b1f9-20cd7a893476',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Why is health education important in schools?',
    '["It is not important", "Schools reach children at a formative age, building lifelong healthy habits", "Only for adults", "Only for hospitals"]'::jsonb,
    '1'::jsonb,
    'Early health education shapes behaviour for life.',
    ARRAY['[', 'P', 'r', 'e', 'v', 'e', 'n', 't', 'i', 'o', 'n', ' ', 't', 'h', 'r', 'o', 'u', 'g', 'h', ' ', 'e', 'd', 'u', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'L', 'i', 'f', 'e', 'l', 'o', 'n', 'g', ' ', 'h', 'a', 'b', 'i', 't', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc5e0445-0c01-5536-8f37-4db6f225cf7d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'What is the relationship between poverty and health?',
    '["No relationship", "Poverty limits access to healthcare, nutrition, clean water, and safe housing, worsening health outcomes", "Poverty improves health", "Health improves poverty"]'::jsonb,
    '1'::jsonb,
    'Poverty is a major determinant of health.',
    ARRAY['[', 'S', 'o', 'c', 'i', 'a', 'l', ' ', 'd', 'e', 't', 'e', 'r', 'm', 'i', 'n', 'a', 'n', 't', 's', '.', ',', 'H', 'e', 'a', 'l', 't', 'h', ' ', 'i', 'n', 'e', 'q', 'u', 'a', 'l', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cb2e0de8-873f-5be2-82df-13bbd398ba18',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'How can governments improve public health?',
    '["They cannot", "Provide clean water, sanitation, vaccination, healthcare access, and health education", "Only through hospitals", "Only through medicine"]'::jsonb,
    '1'::jsonb,
    'Government action on multiple fronts improves population health.',
    ARRAY['[', 'P', 'u', 'b', 'l', 'i', 'c', ' ', 'h', 'e', 'a', 'l', 't', 'h', ' ', 'p', 'o', 'l', 'i', 'c', 'y', '.', ',', 'S', 'y', 's', 't', 'e', 'm', '-', 'l', 'e', 'v', 'e', 'l', ' ', 'i', 'n', 't', 'e', 'r', 'v', 'e', 'n', 't', 'i', 'o', 'n', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '58f3a08d-c3a8-56ef-8c08-46b31767599e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.2.2'), NULL, 'multiple_choice',
    'Why is disease prevention more cost-effective than treatment?',
    '["It is not", "Prevention avoids the costs of illness, treatment, and lost productivity", "Treatment is cheaper", "They cost the same"]'::jsonb,
    '1'::jsonb,
    'Prevention saves money and suffering compared to treating disease.',
    ARRAY['[', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'a', 'r', 'g', 'u', 'm', 'e', 'n', 't', '.', ',', 'C', 'o', 's', 't', '-', 'e', 'f', 'f', 'e', 'c', 't', 'i', 'v', 'e', 'n', 'e', 's', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.5.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd3076b90-42db-5e23-828d-7c35f20fb43c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Science in industry refers to:',
    '["Only laboratory work", "Applying scientific knowledge to develop products, processes, and technologies", "Only research", "Only testing"]'::jsonb,
    '1'::jsonb,
    'Industrial science applies research to practical production.',
    ARRAY['[', 'A', 'p', 'p', 'l', 'i', 'e', 'd', ' ', 's', 'c', 'i', 'e', 'n', 'c', 'e', '.', ',', 'I', 'n', 'n', 'o', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd760c28d-5f47-59a4-ac77-e2cc54ca34a1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Quality control in industry uses:',
    '["Guesswork", "Scientific testing to ensure products meet standards", "Only appearance checks", "Only customer feedback"]'::jsonb,
    '1'::jsonb,
    'Quality control uses measurements and tests to verify product standards.',
    ARRAY['[', 'S', 't', 'a', 'n', 'd', 'a', 'r', 'd', 's', ' ', 'c', 'o', 'm', 'p', 'l', 'i', 'a', 'n', 'c', 'e', '.', ',', 'T', 'e', 's', 't', 'i', 'n', 'g', ' ', 'm', 'e', 't', 'h', 'o', 'd', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd2f3a9b1-9a3b-5981-8b6a-02381e753966',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Research and development (R&D) in industry means:',
    '["Only research", "Systematic investigation to create new products or improve existing ones", "Only development", "Only buying equipment"]'::jsonb,
    '1'::jsonb,
    'R&D combines research (discovery) with development (application).',
    ARRAY['[', 'I', 'n', 'n', 'o', 'v', 'a', 't', 'i', 'o', 'n', ' ', 'p', 'i', 'p', 'e', 'l', 'i', 'n', 'e', '.', ',', 'P', 'r', 'o', 'd', 'u', 'c', 't', ' ', 'd', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '24da3bcc-aefe-5935-a9db-8d9577a859c9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Technology transfer is:',
    '["Moving equipment", "Applying scientific discoveries from research to practical industry use", "Moving offices", "Selling products"]'::jsonb,
    '1'::jsonb,
    'Technology transfer bridges research and commercial application.',
    ARRAY['[', 'K', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', ' ', 't', 'r', 'a', 'n', 's', 'f', 'e', 'r', '.', ',', 'C', 'o', 'm', 'm', 'e', 'r', 'c', 'i', 'a', 'l', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e84ecef5-53f9-552a-9b4e-7188910681f5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Standards in industry ensure:',
    '["Products look nice", "Products are safe, reliable, and meet quality requirements", "Only profit", "Only speed"]'::jsonb,
    '1'::jsonb,
    'Standards protect consumers and ensure consistency.',
    ARRAY['[', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'a', 's', 's', 'u', 'r', 'a', 'n', 'c', 'e', '.', ',', 'S', 'a', 'f', 'e', 't', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5b1a0829-9566-5852-a252-e32bec3d3b14',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Innovation in industry means:',
    '["Copying others", "Creating new or significantly improved products, processes, or services", "Only buying new equipment", "Only changing names"]'::jsonb,
    '1'::jsonb,
    'Innovation drives competitiveness and economic growth.',
    ARRAY['[', 'C', 'r', 'e', 'a', 't', 'i', 'v', 'e', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ',', 'M', 'a', 'r', 'k', 'e', 't', ' ', 'a', 'd', 'v', 'a', 'n', 't', 'a', 'g', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8ce71b68-ad54-5abd-b93c-87a64fdee09e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Why is science important for industrial development?',
    '["It is not important", "Science provides the knowledge base for developing new technologies and improving processes", "Only for academics", "Only for the environment"]'::jsonb,
    '1'::jsonb,
    'Science drives innovation and industrial competitiveness.',
    ARRAY['[', 'K', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', ' ', 'a', 'p', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'T', 'e', 'c', 'h', 'n', 'o', 'l', 'o', 'g', 'i', 'c', 'a', 'l', ' ', 'p', 'r', 'o', 'g', 'r', 'e', 's', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c2101bfa-05c9-5423-ba42-3459c8a275ad',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'How does quality control benefit consumers?',
    '["It does not", "QC ensures products are safe, reliable, and meet advertised standards", "Only for companies", "Only for profit"]'::jsonb,
    '1'::jsonb,
    'QC protects consumers from defective or dangerous products.',
    ARRAY['[', 'C', 'o', 'n', 's', 'u', 'm', 'e', 'r', ' ', 'p', 'r', 'o', 't', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'P', 'r', 'o', 'd', 'u', 'c', 't', ' ', 's', 'a', 'f', 'e', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e45ef4b8-c1b0-557d-abc3-04359e7488ab',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'fill_in_blank',
    'Name one industry in Ghana that uses science in its processes.',
    NULL,
    '"mining"'::jsonb,
    'Mining, food processing, pharmaceuticals, oil and gas, and agriculture all use science.',
    ARRAY['[', 'I', 'n', 'd', 'u', 's', 't', 'r', 'i', 'a', 'l', ' ', 'a', 'p', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', 's', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 'e', 'x', 'a', 'm', 'p', 'l', 'e', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '351ed81c-a610-5418-bd59-5d1740f9c73e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Why do companies invest in R&D?',
    '["For fun", "R&D creates competitive advantage through new products and improved processes", "Only for tax benefits", "Only for reputation"]'::jsonb,
    '1'::jsonb,
    'R&D investment drives innovation and market leadership.',
    ARRAY['[', 'C', 'o', 'm', 'p', 'e', 't', 'i', 't', 'i', 'v', 'e', ' ', 'a', 'd', 'v', 'a', 'n', 't', 'a', 'g', 'e', '.', ',', 'I', 'n', 'n', 'o', 'v', 'a', 't', 'i', 'o', 'n', ' ', 'i', 'n', 'v', 'e', 's', 't', 'm', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9566752a-bc4a-5f8b-84dd-0adbd37848be',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'How does science help in food processing industry?',
    '["It does not", "Science ensures food safety, extends shelf life, and improves nutritional value", "Only for cooking", "Only for packaging"]'::jsonb,
    '1'::jsonb,
    'Food science applies chemistry, biology, and engineering to food production.',
    ARRAY['[', 'F', 'o', 'o', 'd', ' ', 's', 'a', 'f', 'e', 't', 'y', '.', ',', 'P', 'r', 'o', 'c', 'e', 's', 's', 'i', 'n', 'g', ' ', 't', 'e', 'c', 'h', 'n', 'o', 'l', 'o', 'g', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5b82b7c6-3274-5c26-ab37-4d86d621504d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'What is the role of scientists in industry?',
    '["No role", "Scientists conduct research, develop products, solve problems, and ensure quality", "Only for decoration", "Only for teaching"]'::jsonb,
    '1'::jsonb,
    'Scientists are essential for industrial innovation and quality.',
    ARRAY['[', 'R', 'e', 's', 'e', 'a', 'r', 'c', 'h', ' ', 'a', 'n', 'd', ' ', 'd', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', '.', ',', 'P', 'r', 'o', 'b', 'l', 'e', 'm', ' ', 's', 'o', 'l', 'v', 'i', 'n', 'g', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '33792aaf-03b0-5f54-bbea-98db16b83d76',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Why is Ghana investing in science and technology education?',
    '["It is not investing", "To build a skilled workforce for industrial development and economic growth", "Only for prestige", "Only for international image"]'::jsonb,
    '1'::jsonb,
    'STEM education drives national development and competitiveness.',
    ARRAY['[', 'H', 'u', 'm', 'a', 'n', ' ', 'c', 'a', 'p', 'i', 't', 'a', 'l', '.', ',', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'd', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f70480ee-dbc6-5d47-b988-7cbdc4540767',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'How can small industries in Ghana benefit from science?',
    '["They cannot", "Science can improve product quality, reduce waste, and open new markets", "Only large companies benefit", "Only for exports"]'::jsonb,
    '1'::jsonb,
    'Even small-scale industries benefit from scientific methods.',
    ARRAY['[', 'Q', 'u', 'a', 'l', 'i', 't', 'y', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ',', 'P', 'r', 'o', 'c', 'e', 's', 's', ' ', 'o', 'p', 't', 'i', 'm', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '644757eb-3218-544d-a0e3-a7dd1190180c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Why is intellectual property important in industrial science?',
    '["It is not important", "IP protection (patents, trademarks) encourages innovation by protecting inventors", "Only for lawyers", "Only for large companies"]'::jsonb,
    '1'::jsonb,
    'IP rights incentivise investment in research and innovation.',
    ARRAY['[', 'I', 'n', 'n', 'o', 'v', 'a', 't', 'i', 'o', 'n', ' ', 'i', 'n', 'c', 'e', 'n', 't', 'i', 'v', 'e', '.', ',', 'L', 'e', 'g', 'a', 'l', ' ', 'p', 'r', 'o', 't', 'e', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3a5aca25-d505-548a-88ec-e2ce4502156a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'How does industrialisation affect a country''s economy?',
    '["No effect", "Industrialisation creates jobs, increases exports, and drives economic growth", "Only for rich countries", "Negative effects only"]'::jsonb,
    '1'::jsonb,
    'Industrialisation is a key driver of economic development.',
    ARRAY['[', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'g', 'r', 'o', 'w', 't', 'h', '.', ',', 'J', 'o', 'b', ' ', 'c', 'r', 'e', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '79fcf491-9b83-5653-a865-84f9ffd22149',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Why is safety important in industrial processes?',
    '["It is not important", "Safety protects workers, consumers, and the environment from hazards", "Only for compliance", "Only for reputation"]'::jsonb,
    '1'::jsonb,
    'Industrial safety prevents accidents, injuries, and environmental damage.',
    ARRAY['[', 'W', 'o', 'r', 'k', 'e', 'r', ' ', 'p', 'r', 'o', 't', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'R', 'e', 'g', 'u', 'l', 'a', 't', 'o', 'r', 'y', ' ', 'c', 'o', 'm', 'p', 'l', 'i', 'a', 'n', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bbb61165-3c57-5999-b39d-8a510341739f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'How can science help Ghana''s manufacturing sector?',
    '["It cannot", "Science can improve efficiency, product quality, and enable new product development", "Only for agriculture", "Only for mining"]'::jsonb,
    '1'::jsonb,
    'Science and technology are essential for manufacturing competitiveness.',
    ARRAY['[', 'P', 'r', 'o', 'c', 'e', 's', 's', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ',', 'P', 'r', 'o', 'd', 'u', 'c', 't', ' ', 'i', 'n', 'n', 'o', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1fe6a653-051a-54bc-b515-0101dc13c1be',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'What is the difference between science and technology?',
    '["They are the same", "Science seeks knowledge; technology applies knowledge to solve practical problems", "Science is better", "Technology is better"]'::jsonb,
    '1'::jsonb,
    'Science discovers; technology applies discoveries.',
    ARRAY['[', 'K', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', ' ', 'v', 's', ' ', 'a', 'p', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 'm', 'p', 'l', 'e', 'm', 'e', 'n', 't', 'a', 'r', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf1f227c-d9c7-596c-9a16-98f955227642',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.1'), NULL, 'multiple_choice',
    'Why is collaboration between universities and industry important?',
    '["It is not important", "Universities generate knowledge; industry applies it - collaboration accelerates innovation", "Only for academics", "Only for companies"]'::jsonb,
    '1'::jsonb,
    'University-industry partnerships drive innovation and economic growth.',
    ARRAY['[', 'K', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', ' ', 't', 'r', 'a', 'n', 's', 'f', 'e', 'r', '.', ',', 'I', 'n', 'n', 'o', 'v', 'a', 't', 'i', 'o', 'n', ' ', 'e', 'c', 'o', 's', 'y', 's', 't', 'e', 'm', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.5.3.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'db4cc342-318c-5e07-80bf-00e4303cc072',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Modern industries use:',
    '["Only manual labour", "Advanced technology, automation, and scientific methods", "Only traditional methods", "Only hand tools"]'::jsonb,
    '1'::jsonb,
    'Modern industries leverage technology for efficiency and quality.',
    ARRAY['[', 'T', 'e', 'c', 'h', 'n', 'o', 'l', 'o', 'g', 'y', '-', 'd', 'r', 'i', 'v', 'e', 'n', '.', ',', 'A', 'u', 't', 'o', 'm', 'a', 't', 'e', 'd', ' ', 'p', 'r', 'o', 'c', 'e', 's', 's', 'e', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '98b37a9c-a296-5117-a4ee-e558ffe0111d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Indigenous industries are:',
    '["Imported", "Traditional, locally-developed industries using local knowledge and materials", "Only for export", "Only modern"]'::jsonb,
    '1'::jsonb,
    'Indigenous industries are based on local skills and resources.',
    ARRAY['[', 'T', 'r', 'a', 'd', 'i', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'k', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 'r', 'e', 's', 'o', 'u', 'r', 'c', 'e', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8a7483fc-986d-597a-9848-0d300f5dff1a',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'An example of an indigenous industry in Ghana is:',
    '["Car manufacturing", "Kente weaving or shea butter processing", "Computer assembly", "Aircraft building"]'::jsonb,
    '1'::jsonb,
    'Kente weaving, shea butter, and pottery are indigenous industries.',
    ARRAY['[', 'C', 'u', 'l', 't', 'u', 'r', 'a', 'l', ' ', 'h', 'e', 'r', 'i', 't', 'a', 'g', 'e', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 's', 'k', 'i', 'l', 'l', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9caf99bd-e3e1-5e21-8f88-681cc0523a3e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Modernising indigenous industries means:',
    '["Replacing them", "Adding technology to improve efficiency while preserving traditional knowledge", "Destroying traditions", "Importing everything"]'::jsonb,
    '1'::jsonb,
    'Modernisation enhances traditional industries without replacing them.',
    ARRAY['[', 'T', 'e', 'c', 'h', 'n', 'o', 'l', 'o', 'g', 'y', ' ', 'a', 'd', 'd', 'i', 't', 'i', 'o', 'n', '.', ',', 'P', 'r', 'e', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '46e4d35f-d41a-5b04-82fb-86b55e127cb0',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Quality standards in modern industry are:',
    '["Optional", "Essential for safety, reliability, and market access", "Only for export", "Only for large companies"]'::jsonb,
    '1'::jsonb,
    'Standards ensure products meet minimum quality requirements.',
    ARRAY['[', 'R', 'e', 'g', 'u', 'l', 'a', 't', 'o', 'r', 'y', ' ', 'r', 'e', 'q', 'u', 'i', 'r', 'e', 'm', 'e', 'n', 't', '.', ',', 'M', 'a', 'r', 'k', 'e', 't', ' ', 'a', 'c', 'c', 'e', 's', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1ed39743-f331-5b92-a016-30d8f6ea1030',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Automation in industry means:',
    '["Using only humans", "Using machines and technology to perform tasks with minimal human intervention", "Using only hand tools", "Working faster"]'::jsonb,
    '1'::jsonb,
    'Automation increases efficiency and consistency.',
    ARRAY['[', 'M', 'a', 'c', 'h', 'i', 'n', 'e', '-', 'b', 'a', 's', 'e', 'd', ' ', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ',', 'R', 'e', 'd', 'u', 'c', 'e', 'd', ' ', 'h', 'u', 'm', 'a', 'n', ' ', 'i', 'n', 'p', 'u', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ebe3d3b4-0887-5230-a688-4a06903940d4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Why should indigenous industries be preserved?',
    '["They should not", "They preserve cultural heritage, provide livelihoods, and use sustainable local resources", "Only for tourists", "Only for tradition"]'::jsonb,
    '1'::jsonb,
    'Indigenous industries have cultural, economic, and environmental value.',
    ARRAY['[', 'C', 'u', 'l', 't', 'u', 'r', 'a', 'l', ' ', 'p', 'r', 'e', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ',', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'p', 'r', 'a', 'c', 't', 'i', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a616bf0f-9abe-5caa-bec9-be4cb75743fb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'How can modern technology help indigenous industries?',
    '["It cannot", "Technology can improve production efficiency, product quality, and market access", "It will destroy them", "Only for large industries"]'::jsonb,
    '1'::jsonb,
    'Appropriate technology enhances traditional industries.',
    ARRAY['[', 'T', 'e', 'c', 'h', 'n', 'o', 'l', 'o', 'g', 'y', ' ', 'a', 'd', 'o', 'p', 't', 'i', 'o', 'n', '.', ',', 'E', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '504deb09-6bdc-5df4-a473-6486bac3c842',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'What challenges do indigenous industries face?',
    '["No challenges", "Competition from mass-produced goods, limited technology, and market access issues", "Only funding", "Only labour"]'::jsonb,
    '1'::jsonb,
    'Indigenous industries face multiple challenges in modern markets.',
    ARRAY['[', 'C', 'o', 'm', 'p', 'e', 't', 'i', 't', 'i', 'o', 'n', '.', ',', 'T', 'e', 'c', 'h', 'n', 'o', 'l', 'o', 'g', 'y', ' ', 'g', 'a', 'p', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f22bcc1e-cabd-5fa6-aa73-37ca0695982e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'fill_in_blank',
    'Name one way to modernise an indigenous industry in Ghana.',
    NULL,
    '"training"'::jsonb,
    'Training, technology introduction, quality improvement, and market development.',
    ARRAY['[', 'C', 'a', 'p', 'a', 'c', 'i', 't', 'y', ' ', 'b', 'u', 'i', 'l', 'd', 'i', 'n', 'g', '.', ',', 'M', 'o', 'd', 'e', 'r', 'n', 'i', 's', 'a', 't', 'i', 'o', 'n', ' ', 's', 't', 'r', 'a', 't', 'e', 'g', 'i', 'e', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '04c00c0a-4023-5c33-bb4f-69c2cb7c7c23',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Why is it important to distinguish between modern and indigenous industries?',
    '["It is not important", "Each has different strengths, challenges, and needs for support", "They are identical", "Only modern matters"]'::jsonb,
    '1'::jsonb,
    'Understanding differences guides appropriate support and policy.',
    ARRAY['[', 'P', 'o', 'l', 'i', 'c', 'y', ' ', 'd', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', 'i', 'a', 't', 'i', 'o', 'n', '.', ',', 'T', 'a', 'r', 'g', 'e', 't', 'e', 'd', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0b97a051-06f9-573e-aa5b-e2ed0532ed5c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'How does globalisation affect indigenous industries?',
    '["No effect", "Globalisation creates competition but also new markets for traditional products", "Only positive effects", "Only negative effects"]'::jsonb,
    '1'::jsonb,
    'Globalisation presents both challenges and opportunities.',
    ARRAY['[', 'M', 'a', 'r', 'k', 'e', 't', ' ', 'a', 'c', 'c', 'e', 's', 's', '.', ',', 'C', 'o', 'm', 'p', 'e', 't', 'i', 't', 'i', 'o', 'n', ' ', 'p', 'r', 'e', 's', 's', 'u', 'r', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd4c82f9b-35c9-5ebe-8860-2100eb248ef5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Why might a modern factory coexist with an indigenous workshop?',
    '["They cannot", "They serve different markets and needs - mass production vs custom/traditional products", "Only one can survive", "They are the same"]'::jsonb,
    '1'::jsonb,
    'Different market segments support different production methods.',
    ARRAY['[', 'M', 'a', 'r', 'k', 'e', 't', ' ', 's', 'e', 'g', 'm', 'e', 'n', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'C', 'o', 'e', 'x', 'i', 's', 't', 'e', 'n', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a3038974-b39b-574b-9827-45f5a15b2a08',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'How can government support both modern and indigenous industries?',
    '["It cannot", "Through different policies: technology grants for modern, cultural preservation and market access for indigenous", "Only support modern", "Only support indigenous"]'::jsonb,
    '1'::jsonb,
    'Tailored policies address different industry needs.',
    ARRAY['[', 'P', 'o', 'l', 'i', 'c', 'y', ' ', 'd', 'i', 'f', 'f', 'e', 'r', 'e', 'n', 't', 'i', 'a', 't', 'i', 'o', 'n', '.', ',', 'T', 'a', 'r', 'g', 'e', 't', 'e', 'd', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9cfa01e4-dd74-5a6a-b1dc-4cb4d7018c27',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Why is it important to add value to indigenous products?',
    '["It is not important", "Value addition (better packaging, branding, quality) increases market appeal and income", "Only for export", "Only for tourists"]'::jsonb,
    '1'::jsonb,
    'Value addition makes traditional products competitive in modern markets.',
    ARRAY['[', 'M', 'a', 'r', 'k', 'e', 't', ' ', 'c', 'o', 'm', 'p', 'e', 't', 'i', 't', 'i', 'v', 'e', 'n', 'e', 's', 's', '.', ',', 'I', 'n', 'c', 'o', 'm', 'e', ' ', 'i', 'n', 'c', 'r', 'e', 'a', 's', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '823c781b-6ad3-50c7-a4f6-6461e5545778',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'How can education help bridge modern and indigenous industries?',
    '["It cannot", "Education can teach modern skills while respecting and preserving traditional knowledge", "Only for modern industries", "Only for traditional industries"]'::jsonb,
    '1'::jsonb,
    'Education that combines modern and traditional knowledge benefits both.',
    ARRAY['[', 'K', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', ' ', 'i', 'n', 't', 'e', 'g', 'r', 'a', 't', 'i', 'o', 'n', '.', ',', 'C', 'u', 'l', 't', 'u', 'r', 'a', 'l', ' ', 'r', 'e', 's', 'p', 'e', 'c', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f1250db4-1c15-57fc-8711-a335c5fe7c56',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'What role does science play in preserving indigenous industries?',
    '["No role", "Science can analyse traditional processes, improve them, and document traditional knowledge", "Only for modern industries", "Science destroys traditions"]'::jsonb,
    '1'::jsonb,
    'Science can enhance and preserve traditional practices.',
    ARRAY['[', 'D', 'o', 'c', 'u', 'm', 'e', 'n', 't', 'a', 't', 'i', 'o', 'n', '.', ',', 'P', 'r', 'o', 'c', 'e', 's', 's', ' ', 'i', 'm', 'p', 'r', 'o', 'v', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4d664fd7-f8f9-5648-8cc1-9557db79e64d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Why is market access important for indigenous industries?',
    '["It is not important", "Access to markets allows indigenous producers to sell their products and sustain their livelihoods", "Only for profit", "Only for export"]'::jsonb,
    '1'::jsonb,
    'Market access is crucial for economic viability.',
    ARRAY['[', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 's', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ',', 'L', 'i', 'v', 'e', 'l', 'i', 'h', 'o', 'o', 'd', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6fc66d9e-b519-5d98-aee3-48c4e6c221a7',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'How can technology help preserve traditional crafts?',
    '["It cannot", "Technology can document techniques, improve tools, and create online markets for traditional products", "It will replace crafts", "Only for modern products"]'::jsonb,
    '1'::jsonb,
    'Technology can support traditional crafts without replacing them.',
    ARRAY['[', 'D', 'i', 'g', 'i', 't', 'a', 'l', ' ', 'p', 'r', 'e', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ',', 'M', 'a', 'r', 'k', 'e', 't', ' ', 'c', 'r', 'e', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf2f7b9b-5677-51e3-90bb-7fd831df62e1',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.3.2'), NULL, 'multiple_choice',
    'Why is it important for Ghana to develop both modern and indigenous industries?',
    '["It is not important", "Both contribute to economic growth, employment, and cultural identity in different ways", "Only modern matters", "Only indigenous matters"]'::jsonb,
    '1'::jsonb,
    'A balanced approach maximises economic and cultural benefits.',
    ARRAY['[', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'd', 'i', 'v', 'e', 'r', 's', 'i', 't', 'y', '.', ',', 'C', 'u', 'l', 't', 'u', 'r', 'a', 'l', ' ', 'p', 'r', 'e', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.5.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1ebe6759-d0ce-54be-84aa-4b750e706d8d',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Natural factors that influence climate change include:',
    '["Only human activities", "Volcanic eruptions, solar variations, and natural cycles", "Only deforestation", "Only fossil fuels"]'::jsonb,
    '1'::jsonb,
    'Natural factors have always influenced climate.',
    ARRAY['[', 'N', 'a', 't', 'u', 'r', 'a', 'l', ' ', 'v', 'a', 'r', 'i', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ',', 'B', 'a', 'c', 'k', 'g', 'r', 'o', 'u', 'n', 'd', ' ', 'f', 'a', 'c', 't', 'o', 'r', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7b2b5abb-9733-5f35-b971-235acf0cc584',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Human activities that cause climate change include:',
    '["Only breathing", "Burning fossil fuels, deforestation, and industrial emissions", "Only farming", "Only building"]'::jsonb,
    '1'::jsonb,
    'Anthropogenic factors are the dominant cause of current climate change.',
    ARRAY['[', 'G', 'r', 'e', 'e', 'n', 'h', 'o', 'u', 's', 'e', ' ', 'g', 'a', 's', 'e', 's', '.', ',', 'H', 'u', 'm', 'a', 'n', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '81109565-4a90-5e00-8de0-e69ec2a83680',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'The greenhouse effect is:',
    '["Always harmful", "A natural process intensified by human emissions", "Only in greenhouses", "A new phenomenon"]'::jsonb,
    '1'::jsonb,
    'Natural greenhouse effect is essential; human activities have enhanced it.',
    ARRAY['[', 'E', 'n', 'h', 'a', 'n', 'c', 'e', 'd', ' ', 'e', 'f', 'f', 'e', 'c', 't', '.', ',', 'G', 'l', 'o', 'b', 'a', 'l', ' ', 'w', 'a', 'r', 'm', 'i', 'n', 'g', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '52037d0c-87cc-5ada-8776-61c028a29dfb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Fossil fuels release CO2 when:',
    '["They are mined", "They are burned for energy", "They are stored", "They are transported"]'::jsonb,
    '1'::jsonb,
    'Combustion of fossil fuels releases CO2 into the atmosphere.',
    ARRAY['[', 'C', 'o', 'm', 'b', 'u', 's', 't', 'i', 'o', 'n', '.', ',', 'C', 'a', 'r', 'b', 'o', 'n', ' ', 'r', 'e', 'l', 'e', 'a', 's', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '20cc8254-8a99-5c27-9c74-71640fe5b5b4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Deforestation contributes to climate change by:',
    '["Creating oxygen", "Removing trees that absorb CO2 and releasing stored carbon", "Increasing rainfall", "Cooling the atmosphere"]'::jsonb,
    '1'::jsonb,
    'Trees are carbon sinks - removing them increases atmospheric CO2.',
    ARRAY['[', 'C', 'a', 'r', 'b', 'o', 'n', ' ', 's', 'i', 'n', 'k', ' ', 'l', 'o', 's', 's', '.', ',', 'D', 'o', 'u', 'b', 'l', 'e', ' ', 'i', 'm', 'p', 'a', 'c', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0bfaa600-37aa-595a-bb3b-bef94369d818',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Volcanic eruptions can affect climate by:',
    '["Only causing earthquakes", "Releasing particles that temporarily cool the atmosphere", "Warming the atmosphere", "Having no effect"]'::jsonb,
    '1'::jsonb,
    'Volcanic ash and sulfur dioxide can temporarily block sunlight.',
    ARRAY['[', 'S', 'h', 'o', 'r', 't', '-', 't', 'e', 'r', 'm', ' ', 'c', 'o', 'o', 'l', 'i', 'n', 'g', '.', ',', 'T', 'e', 'm', 'p', 'o', 'r', 'a', 'r', 'y', ' ', 'e', 'f', 'f', 'e', 'c', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3de53238-8594-5829-ab2e-be8548daacaf',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Why are human activities the main driver of current climate change?',
    '["They are not", "Human emissions of greenhouse gases far exceed natural sources in quantity and rate", "Natural factors dominate", "Only solar activity matters"]'::jsonb,
    '1'::jsonb,
    'The rate and scale of human emissions are unprecedented.',
    ARRAY['[', 'A', 'n', 't', 'h', 'r', 'o', 'p', 'o', 'g', 'e', 'n', 'i', 'c', ' ', 'd', 'o', 'm', 'i', 'n', 'a', 'n', 'c', 'e', '.', ',', 'U', 'n', 'p', 'r', 'e', 'c', 'e', 'd', 'e', 'n', 't', 'e', 'd', ' ', 'r', 'a', 't', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6c3f47a3-5b16-59c7-b07d-c519cff20050',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'How does agriculture contribute to climate change?',
    '["It does not", "Livestock produce methane, rice paddies release methane, and fertilisers release nitrous oxide", "Only through deforestation", "Only through transport"]'::jsonb,
    '1'::jsonb,
    'Agricultural practices are significant sources of greenhouse gases.',
    ARRAY['[', 'M', 'e', 't', 'h', 'a', 'n', 'e', ' ', 'e', 'm', 'i', 's', 's', 'i', 'o', 'n', 's', '.', ',', 'N', 'i', 't', 'r', 'o', 'u', 's', ' ', 'o', 'x', 'i', 'd', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4a1d317c-ebc2-5396-bae0-2898afc2b157',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'What is the difference between natural and human-caused climate change?',
    '["There is no difference", "Natural changes are slow; human-caused changes are rapid and accelerating", "Natural is worse", "Human-caused is milder"]'::jsonb,
    '1'::jsonb,
    'Speed and scale distinguish anthropogenic from natural climate change.',
    ARRAY['[', 'R', 'a', 't', 'e', ' ', 'o', 'f', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ',', 'M', 'a', 'g', 'n', 'i', 't', 'u', 'd', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '38f8c1ac-5ca8-553d-9b08-2d533f881ed7',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'fill_in_blank',
    'Name one natural factor that influences Earth''s climate.',
    NULL,
    '"solar variations"'::jsonb,
    'Solar output variations, volcanic eruptions, orbital changes, and ocean currents.',
    ARRAY['[', 'N', 'a', 't', 'u', 'r', 'a', 'l', ' ', 'd', 'r', 'i', 'v', 'e', 'r', 's', '.', ',', 'B', 'a', 'c', 'k', 'g', 'r', 'o', 'u', 'n', 'd', ' ', 'v', 'a', 'r', 'i', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '100d112a-6a87-50b6-9347-ccd8b42fb53c',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Why is it important to understand both natural and human factors?',
    '["It is not important", "Understanding all factors helps attribute causes and design effective responses", "Only human factors matter", "Only natural factors matter"]'::jsonb,
    '1'::jsonb,
    'Attribution science requires understanding all climate drivers.',
    ARRAY['[', 'C', 'l', 'i', 'm', 'a', 't', 'e', ' ', 's', 'c', 'i', 'e', 'n', 'c', 'e', '.', ',', 'A', 't', 't', 'r', 'i', 'b', 'u', 't', 'i', 'o', 'n', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '40e73b18-9191-51a0-8df4-433ffe980f86',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'How do scientists distinguish human-caused warming from natural variability?',
    '["They cannot", "Computer models, isotopic analysis, and pattern recognition separate human from natural signals", "Only by guessing", "Only by waiting"]'::jsonb,
    '1'::jsonb,
    'Multiple lines of evidence attribute warming to human activities.',
    ARRAY['[', 'D', 'e', 't', 'e', 'c', 't', 'i', 'o', 'n', ' ', 'a', 'n', 'd', ' ', 'a', 't', 't', 'r', 'i', 'b', 'u', 't', 'i', 'o', 'n', '.', ',', 'S', 'c', 'i', 'e', 'n', 't', 'i', 'f', 'i', 'c', ' ', 'm', 'e', 't', 'h', 'o', 'd', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6fce88f6-fd0c-52dc-ac6b-f7f5933be266',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Why might someone argue that climate change is natural?',
    '["They are correct", "Natural factors do influence climate, but current warming exceeds natural variability - humans are the dominant cause", "They are always wrong", "They have evidence"]'::jsonb,
    '1'::jsonb,
    'Natural factors exist but cannot explain the observed warming trend.',
    ARRAY['[', 'A', 't', 't', 'r', 'i', 'b', 'u', 't', 'i', 'o', 'n', ' ', 's', 'c', 'i', 'e', 'n', 'c', 'e', '.', ',', 'E', 'v', 'i', 'd', 'e', 'n', 'c', 'e', '-', 'b', 'a', 's', 'e', 'd', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd9bd2e6c-f2cb-572e-b357-995f876eb07f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'How does urbanisation contribute to climate change?',
    '["It does not", "Urban areas have higher emissions from energy use, transport, and industry", "Only through population growth", "Only through deforestation"]'::jsonb,
    '1'::jsonb,
    'Cities are major sources of greenhouse gas emissions.',
    ARRAY['[', 'U', 'r', 'b', 'a', 'n', ' ', 'e', 'm', 'i', 's', 's', 'i', 'o', 'n', 's', '.', ',', 'E', 'n', 'e', 'r', 'g', 'y', ' ', 'c', 'o', 'n', 's', 'u', 'm', 'p', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '724aa2c0-5ca6-5dc1-9079-7cabe7f2a188',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Why is the rate of current climate change concerning?',
    '["It is not concerning", "Rapid change does not give ecosystems and societies time to adapt", "Slow change is worse", "Rate does not matter"]'::jsonb,
    '1'::jsonb,
    'Rapid warming outpaces adaptation capacity.',
    ARRAY['[', 'A', 'd', 'a', 'p', 't', 'a', 't', 'i', 'o', 'n', ' ', 'l', 'i', 'm', 'i', 't', 's', '.', ',', 'S', 'p', 'e', 'e', 'd', ' ', 'o', 'f', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5451ddac-c532-5f04-9d74-e2ce0b89f6ae',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'How can understanding climate factors help in mitigation?',
    '["It cannot", "Identifying the main causes allows targeted reduction strategies", "Only for scientists", "Only for government"]'::jsonb,
    '1'::jsonb,
    'Effective mitigation requires understanding the sources of emissions.',
    ARRAY['[', 'T', 'a', 'r', 'g', 'e', 't', 'e', 'd', ' ', 'a', 'c', 't', 'i', 'o', 'n', '.', ',', 'C', 'a', 'u', 's', 'e', '-', 's', 'p', 'e', 'c', 'i', 'f', 'i', 'c', ' ', 's', 'o', 'l', 'u', 't', 'i', 'o', 'n', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '951f32aa-5ab0-51f3-ba50-04f28effb5b6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'What role do oceans play in climate regulation?',
    '["No role", "Oceans absorb heat and CO2, moderating atmospheric temperature and composition", "Only for water", "Only for fish"]'::jsonb,
    '1'::jsonb,
    'Oceans are major climate regulators - absorbing heat and carbon.',
    ARRAY['[', 'H', 'e', 'a', 't', ' ', 'a', 'b', 's', 'o', 'r', 'p', 't', 'i', 'o', 'n', '.', ',', 'C', 'a', 'r', 'b', 'o', 'n', ' ', 's', 'i', 'n', 'k', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '90bcf9b1-9f48-5328-99d4-30adeb8e54f4',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Why do scientists use computer models to study climate?',
    '["For fun", "Models simulate complex climate systems, testing different scenarios and predicting future changes", "Models are always wrong", "Only observations matter"]'::jsonb,
    '1'::jsonb,
    'Climate models integrate multiple factors to project future climate.',
    ARRAY['[', 'P', 'r', 'e', 'd', 'i', 'c', 't', 'i', 'v', 'e', ' ', 't', 'o', 'o', 'l', 's', '.', ',', 'S', 'c', 'e', 'n', 'a', 'r', 'i', 'o', ' ', 'a', 'n', 'a', 'l', 'y', 's', 'i', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd63a04bb-56a0-5413-809d-3b35c62569c3',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'How does feedback in the climate system amplify warming?',
    '["Feedback does not exist", "Warming melts ice, reducing reflectivity, which causes more warming (positive feedback)", "Negative feedback only", "Feedback has no effect"]'::jsonb,
    '1'::jsonb,
    'Positive feedbacks amplify initial warming - ice-albedo feedback is a key example.',
    ARRAY['[', 'A', 'm', 'p', 'l', 'i', 'f', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ',', 'I', 'c', 'e', '-', 'a', 'l', 'b', 'e', 'd', 'o', ' ', 'f', 'e', 'e', 'd', 'b', 'a', 'c', 'k', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a59d833a-da8e-56b5-b893-c6fea5077626',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.1'), NULL, 'multiple_choice',
    'Why is international cooperation essential for addressing climate change?',
    '["It is not essential", "Climate change is global - no single country can solve it alone", "Only big countries matter", "Only small countries need help"]'::jsonb,
    '1'::jsonb,
    'Climate change requires coordinated global action.',
    ARRAY['[', 'G', 'l', 'o', 'b', 'a', 'l', ' ', 'c', 'o', 'm', 'm', 'o', 'n', 's', '.', ',', 'C', 'o', 'l', 'l', 'e', 'c', 't', 'i', 'v', 'e', ' ', 'a', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.5.4.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5cdfa55e-1819-5c8e-bff1-a85aef7a49ff',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Green economy means:',
    '["Economy based on agriculture", "Economic development that is environmentally sustainable and reduces carbon emissions", "Economy based on colour", "Only for green industries"]'::jsonb,
    '1'::jsonb,
    'Green economy balances economic growth with environmental sustainability.',
    ARRAY['[', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'd', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', '.', ',', 'L', 'o', 'w', ' ', 'c', 'a', 'r', 'b', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4528e4cf-27a5-532d-8ceb-92373a28d252',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Climate data includes:',
    '["Only temperature", "Temperature records, CO2 levels, sea level measurements, and ice cover data", "Only rainfall", "Only wind speed"]'::jsonb,
    '1'::jsonb,
    'Climate data covers multiple indicators of Earth''s climate system.',
    ARRAY['[', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 'm', 'e', 't', 'r', 'i', 'c', 's', '.', ',', 'L', 'o', 'n', 'g', '-', 't', 'e', 'r', 'm', ' ', 'r', 'e', 'c', 'o', 'r', 'd', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8c41a851-67fe-5008-bfc7-c8771b38c88e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Assessing climate data means:',
    '["Ignoring it", "Analysing data to identify trends, patterns, and causes of change", "Only collecting data", "Only presenting data"]'::jsonb,
    '1'::jsonb,
    'Assessment involves interpretation and evidence-based conclusions.',
    ARRAY['[', 'D', 'a', 't', 'a', ' ', 'a', 'n', 'a', 'l', 'y', 's', 'i', 's', '.', ',', 'T', 'r', 'e', 'n', 'd', ' ', 'i', 'd', 'e', 'n', 't', 'i', 'f', 'i', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e4a709c6-1383-5be5-a1b0-98950b75bf74',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Renewable energy is part of the green economy because:',
    '["It is expensive", "It provides energy without significant greenhouse gas emissions", "It is unreliable", "It is only for rich countries"]'::jsonb,
    '1'::jsonb,
    'Renewables are clean energy sources that support a green economy.',
    ARRAY['[', 'L', 'o', 'w', ' ', 'c', 'a', 'r', 'b', 'o', 'n', '.', ',', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'e', 'n', 'e', 'r', 'g', 'y', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd17c3d76-ceda-5e1d-8f09-9787a5fca181',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Green jobs are:',
    '["Jobs in forests", "Jobs that contribute to environmental sustainability", "Only for environmentalists", "Only government jobs"]'::jsonb,
    '1'::jsonb,
    'Green jobs are in renewable energy, conservation, and sustainable industries.',
    ARRAY['[', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'e', 'm', 'p', 'l', 'o', 'y', 'm', 'e', 'n', 't', '.', ',', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 's', 'e', 'c', 't', 'o', 'r', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ddfb3ce7-09c5-5e4b-b1fa-93fead2bb6cf',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Carbon footprint measures:',
    '["How heavy you are", "The total greenhouse gas emissions caused by an individual, organisation, or product", "How much carbon you eat", "Your shoe size"]'::jsonb,
    '1'::jsonb,
    'Carbon footprint quantifies emissions in CO2 equivalent.',
    ARRAY['[', 'E', 'm', 'i', 's', 's', 'i', 'o', 'n', ' ', 'm', 'e', 't', 'r', 'i', 'c', '.', ',', 'I', 'm', 'p', 'a', 'c', 't', ' ', 'a', 's', 's', 'e', 's', 's', 'm', 'e', 'n', 't', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3d1c4894-1782-5062-a12b-bcb37063fd26',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Why is assessing climate data important?',
    '["It is not important", "Data assessment reveals trends that guide policy and action on climate change", "Only for scientists", "Only for government"]'::jsonb,
    '1'::jsonb,
    'Evidence-based climate action requires data assessment.',
    ARRAY['[', 'D', 'e', 'c', 'i', 's', 'i', 'o', 'n', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', '.', ',', 'P', 'o', 'l', 'i', 'c', 'y', ' ', 'g', 'u', 'i', 'd', 'a', 'n', 'c', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fd37cd2e-2ec9-5705-a503-cf6222406c62',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'How does Ghana''s climate data show change?',
    '["No change", "Data shows rising temperatures, changing rainfall patterns, and more extreme weather", "Only cooling", "Only more rain"]'::jsonb,
    '1'::jsonb,
    'Ghana is experiencing observable climate changes.',
    ARRAY['[', 'T', 'e', 'm', 'p', 'e', 'r', 'a', 't', 'u', 'r', 'e', ' ', 'i', 'n', 'c', 'r', 'e', 'a', 's', 'e', '.', ',', 'R', 'a', 'i', 'n', 'f', 'a', 'l', 'l', ' ', 'v', 'a', 'r', 'i', 'a', 'b', 'i', 'l', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '99cb7d00-42f5-5131-acb5-a07d008f7355',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'What green economy opportunities exist in Ghana?',
    '["None", "Solar energy, sustainable agriculture, ecotourism, and waste recycling", "Only solar", "Only farming"]'::jsonb,
    '1'::jsonb,
    'Ghana has multiple green economy opportunities.',
    ARRAY['[', 'D', 'i', 'v', 'e', 'r', 's', 'e', ' ', 'o', 'p', 'p', 'o', 'r', 't', 'u', 'n', 'i', 't', 'i', 'e', 's', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 'p', 'o', 't', 'e', 'n', 't', 'i', 'a', 'l', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b2eda960-5b49-5681-b0f9-527ead450c06',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'fill_in_blank',
    'Name one way to reduce carbon footprint.',
    NULL,
    '"use public transport"'::jsonb,
    'Public transport, energy efficiency, renewable energy, reducing waste, and eating less meat.',
    ARRAY['[', 'I', 'n', 'd', 'i', 'v', 'i', 'd', 'u', 'a', 'l', ' ', 'a', 'c', 't', 'i', 'o', 'n', 's', '.', ',', 'M', 'u', 'l', 't', 'i', 'p', 'l', 'e', ' ', 's', 't', 'r', 'a', 't', 'e', 'g', 'i', 'e', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5d146285-7703-563f-aeed-6fb89b8625ec',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Why is the green economy important for Ghana''s development?',
    '["It is not important", "It creates jobs, reduces environmental damage, and builds resilience to climate change", "Only for rich countries", "Only for the environment"]'::jsonb,
    '1'::jsonb,
    'Green economy supports sustainable development goals.',
    ARRAY['[', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', '-', 'e', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'b', 'a', 'l', 'a', 'n', 'c', 'e', '.', ',', 'D', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', ' ', 'p', 'a', 't', 'h', 'w', 'a', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5e7da51d-771e-5dec-88cb-cc397e14cacc',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'How can businesses assess their environmental impact?',
    '["They cannot", "Through environmental audits, carbon footprinting, and life cycle assessments", "Only through profit", "Only through customer feedback"]'::jsonb,
    '1'::jsonb,
    'Multiple tools assess business environmental performance.',
    ARRAY['[', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ',', 'A', 's', 's', 'e', 's', 's', 'm', 'e', 'n', 't', ' ', 't', 'o', 'o', 'l', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6f4977aa-9f32-59ff-b08d-0b5bd7b6cd15',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Why is green finance important for climate action?',
    '["It is not important", "Green finance directs investment toward sustainable projects and away from harmful ones", "Only for banks", "Only for government"]'::jsonb,
    '1'::jsonb,
    'Financial flows drive the transition to a green economy.',
    ARRAY['[', 'I', 'n', 'v', 'e', 's', 't', 'm', 'e', 'n', 't', ' ', 'd', 'i', 'r', 'e', 'c', 't', 'i', 'o', 'n', '.', ',', 'C', 'a', 'p', 'i', 't', 'a', 'l', ' ', 'a', 'l', 'l', 'o', 'c', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0bbd8bee-9d24-577c-b1d3-87fd5b46a515',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'How does climate data help in planning for the future?',
    '["It does not", "Data trends inform infrastructure design, agricultural planning, and disaster preparedness", "Only for the past", "Only for the present"]'::jsonb,
    '1'::jsonb,
    'Climate projections guide long-term planning.',
    ARRAY['[', 'F', 'u', 't', 'u', 'r', 'e', ' ', 'p', 'l', 'a', 'n', 'n', 'i', 'n', 'g', '.', ',', 'R', 'i', 's', 'k', ' ', 'm', 'a', 'n', 'a', 'g', 'e', 'm', 'e', 'n', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ae4f0aa4-1624-5786-8973-43ea031af21b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'What is the relationship between green economy and poverty reduction?',
    '["No relationship", "Green economy creates sustainable livelihoods and reduces environmental risks that disproportionately affect the poor", "Only for the rich", "Green economy increases poverty"]'::jsonb,
    '1'::jsonb,
    'Green economy can reduce poverty through sustainable development.',
    ARRAY['[', 'I', 'n', 'c', 'l', 'u', 's', 'i', 'v', 'e', ' ', 'g', 'r', 'o', 'w', 't', 'h', '.', ',', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'j', 'u', 's', 't', 'i', 'c', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '01f31d32-c608-575c-ac9b-3a10df47c484',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'How can individuals contribute to a green economy?',
    '["They cannot", "Choose sustainable products, reduce energy use, support green businesses, and advocate for policy change", "Only businesses matter", "Only government matters"]'::jsonb,
    '1'::jsonb,
    'Consumer choices and advocacy drive green economy transition.',
    ARRAY['[', 'C', 'o', 'n', 's', 'u', 'm', 'e', 'r', ' ', 'p', 'o', 'w', 'e', 'r', '.', ',', 'B', 'e', 'h', 'a', 'v', 'i', 'o', 'u', 'r', ' ', 'c', 'h', 'a', 'n', 'g', 'e', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6f117189-2e2a-58fd-bf6c-46ef5cd02f01',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'Why is accurate climate data collection important?',
    '["It is not important", "Accurate data is the foundation for understanding climate change and designing effective responses", "Only for scientists", "Only for reports"]'::jsonb,
    '1'::jsonb,
    'Data quality determines the reliability of climate assessments.',
    ARRAY['[', 'E', 'v', 'i', 'd', 'e', 'n', 'c', 'e', ' ', 'q', 'u', 'a', 'l', 'i', 't', 'y', '.', ',', 'D', 'e', 'c', 'i', 's', 'i', 'o', 'n', ' ', 'f', 'o', 'u', 'n', 'd', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '85ee8a24-4a67-5571-acf8-25e84cf3adb5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'How can Ghana balance economic growth with environmental protection?',
    '["It cannot", "Through green economy strategies: sustainable industries, clean energy, and environmental regulations", "Only through stopping growth", "Only through ignoring the environment"]'::jsonb,
    '1'::jsonb,
    'Green growth strategies reconcile economic and environmental goals.',
    ARRAY['[', 'S', 'u', 's', 't', 'a', 'i', 'n', 'a', 'b', 'l', 'e', ' ', 'd', 'e', 'v', 'e', 'l', 'o', 'p', 'm', 'e', 'n', 't', '.', ',', 'P', 'o', 'l', 'i', 'c', 'y', ' ', 'i', 'n', 't', 'e', 'g', 'r', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd91aa7ae-eea2-5f96-ab7c-9290a179d8d5',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'What role does education play in building a green economy?',
    '["No role", "Education builds awareness, skills, and values for sustainable development", "Only for children", "Only for universities"]'::jsonb,
    '1'::jsonb,
    'Education is the foundation for green economy transition.',
    ARRAY['[', 'G', 'r', 'e', 'e', 'n', ' ', 's', 'k', 'i', 'l', 'l', 's', '.', ',', 'E', 'n', 'v', 'i', 'r', 'o', 'n', 'm', 'e', 'n', 't', 'a', 'l', ' ', 'l', 'i', 't', 'e', 'r', 'a', 'c', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1a48a00f-0829-5cbe-b93e-eb31b61f4103',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.4.2'), NULL, 'multiple_choice',
    'How can technology support climate data assessment?',
    '["It cannot", "Technology enables remote sensing, data analysis, modelling, and monitoring", "Only for communication", "Only for entertainment"]'::jsonb,
    '1'::jsonb,
    'Technology enhances climate data collection and analysis capabilities.',
    ARRAY['[', 'R', 'e', 'm', 'o', 't', 'e', ' ', 's', 'e', 'n', 's', 'i', 'n', 'g', '.', ',', 'D', 'a', 't', 'a', ' ', 'a', 'n', 'a', 'l', 'y', 't', 'i', 'c', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B9/JHS3.5.5.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6f2d9ae0-f617-5ed1-a77f-471bf24f128b',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Different plant parts have different uses. Roots are used for:',
    '["Only absorbing water", "Food storage (yam, cassava) and anchoring the plant", "Only decoration", "Only photosynthesis"]'::jsonb,
    '1'::jsonb,
    'Many roots store food and are important crops.',
    ARRAY['[', 'R', 'o', 'o', 't', ' ', 'v', 'e', 'g', 'e', 't', 'a', 'b', 'l', 'e', 's', '.', ',', 'F', 'o', 'o', 'd', ' ', 's', 't', 'o', 'r', 'a', 'g', 'e', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'db9544a1-cd9f-5984-8f21-ba9302c98764',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Stems are used for:',
    '["Only support", "Support, transport, and sometimes food storage (sugarcane, potato)", "Only decoration", "Only photosynthesis"]'::jsonb,
    '1'::jsonb,
    'Stems support plants, transport materials, and some store food.',
    ARRAY['[', 'S', 't', 'r', 'u', 'c', 't', 'u', 'r', 'a', 'l', ' ', 'r', 'o', 'l', 'e', '.', ',', 'T', 'r', 'a', 'n', 's', 'p', 'o', 'r', 't', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0f5a77b-ef1a-5ac2-bbb5-9de6a1bbe64e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Leaves are used for:',
    '["Only decoration", "Food (vegetables), medicine, and photosynthesis", "Only falling", "Only water loss"]'::jsonb,
    '1'::jsonb,
    'Leaves are important for food, medicine, and plant function.',
    ARRAY['[', 'L', 'e', 'a', 'f', 'y', ' ', 'v', 'e', 'g', 'e', 't', 'a', 'b', 'l', 'e', 's', '.', ',', 'M', 'e', 'd', 'i', 'c', 'i', 'n', 'a', 'l', ' ', 'p', 'l', 'a', 'n', 't', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f7e1b7cc-cc74-526a-8b5e-52555e146701',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Flowers are used for:',
    '["Only decoration", "Reproduction, food (broccoli), medicine, and decoration", "Only falling", "Only attracting insects"]'::jsonb,
    '1'::jsonb,
    'Flowers have reproductive and food/medicinal uses.',
    ARRAY['[', 'R', 'e', 'p', 'r', 'o', 'd', 'u', 'c', 't', 'i', 'v', 'e', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', '.', ',', 'E', 'd', 'i', 'b', 'l', 'e', ' ', 'f', 'l', 'o', 'w', 'e', 'r', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '63ab6433-cfd2-5142-aa02-a172fd01f896',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Fruits are used for:',
    '["Only seeds", "Food, juice, medicine, and seed dispersal", "Only decoration", "Only animal food"]'::jsonb,
    '1'::jsonb,
    'Fruits are major food sources for humans and animals.',
    ARRAY['[', 'F', 'r', 'u', 'i', 't', ' ', 'c', 'o', 'n', 's', 'u', 'm', 'p', 't', 'i', 'o', 'n', '.', ',', 'S', 'e', 'e', 'd', ' ', 'p', 'r', 'o', 't', 'e', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fd3be993-31b5-566f-8673-9c0991287aa9',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Seeds are used for:',
    '["Only planting", "Planting, food (beans, nuts), oil extraction, and animal feed", "Only decoration", "Only falling"]'::jsonb,
    '1'::jsonb,
    'Seeds are vital for food, agriculture, and oil production.',
    ARRAY['[', 'S', 'e', 'e', 'd', ' ', 'c', 'r', 'o', 'p', 's', '.', ',', 'O', 'i', 'l', ' ', 's', 'e', 'e', 'd', 's', '.', ']'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd6060ca1-f712-58a1-aa6d-2cffd7db3581',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'fill_in_blank',
    'Give an example of a root used as food.',
    NULL,
    '"yam"'::jsonb,
    'Yam, cassava, carrot, beetroot, and ginger are roots used as food.',
    ARRAY['[', 'R', 'o', 'o', 't', ' ', 'v', 'e', 'g', 'e', 't', 'a', 'b', 'l', 'e', 's', '.', ',', 'S', 't', 'a', 'p', 'l', 'e', ' ', 'f', 'o', 'o', 'd', 's', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1f823676-abe3-593a-aadc-af6ff3c79e69',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'How are leaves used in traditional medicine in Ghana?',
    '["They are not", "Many leaves are used in herbal remedies for treating various ailments", "Only for decoration", "Only for food"]'::jsonb,
    '1'::jsonb,
    'Traditional medicine extensively uses plant leaves.',
    ARRAY['[', 'H', 'e', 'r', 'b', 'a', 'l', ' ', 'm', 'e', 'd', 'i', 'c', 'i', 'n', 'e', '.', ',', 'L', 'o', 'c', 'a', 'l', ' ', 'k', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fce34ea2-4c10-5455-8278-c2b26804cfcf',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Why are some plant stems used for building?',
    '["They are not", "Woody stems (bamboo, timber) are strong and provide structural material", "Only for decoration", "Only for burning"]'::jsonb,
    '1'::jsonb,
    'Stems provide wood, bamboo, and other construction materials.',
    ARRAY['[', 'B', 'u', 'i', 'l', 'd', 'i', 'n', 'g', ' ', 'm', 'a', 't', 'e', 'r', 'i', 'a', 'l', '.', ',', 'S', 't', 'r', 'u', 'c', 't', 'u', 'r', 'a', 'l', ' ', 'u', 's', 'e', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6e606400-11d6-52b8-84aa-ca6b274014b6',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'fill_in_blank',
    'Name one plant whose flowers are eaten as food.',
    NULL,
    '"broccoli"'::jsonb,
    'Broccoli, cauliflower, artichoke, and hibiscus are edible flowers.',
    ARRAY['[', 'E', 'd', 'i', 'b', 'l', 'e', ' ', 'f', 'l', 'o', 'w', 'e', 'r', 's', '.', ',', 'N', 'u', 't', 'r', 'i', 't', 'i', 'o', 'u', 's', ' ', 'f', 'o', 'o', 'd', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2c00d189-e9f5-559c-b465-f371c519b829',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'How are seeds important for food security?',
    '["They are not", "Seeds are the starting point for crop production and food supply", "Only for planting", "Only for animals"]'::jsonb,
    '1'::jsonb,
    'Seeds are the foundation of agriculture and food production.',
    ARRAY['[', 'A', 'g', 'r', 'i', 'c', 'u', 'l', 't', 'u', 'r', 'a', 'l', ' ', 'f', 'o', 'u', 'n', 'd', 'a', 't', 'i', 'o', 'n', '.', ',', 'F', 'o', 'o', 'd', ' ', 's', 'e', 'c', 'u', 'r', 'i', 't', 'y', '.', ']'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e381e067-370f-5ad0-ac21-9007e9fa428f',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Why do some plants produce fleshy fruits?',
    '["For decoration", "Fleshy fruits attract animals that eat them and disperse seeds", "To store water", "To photosynthesise"]'::jsonb,
    '1'::jsonb,
    'Fleshy fruits are an adaptation for seed dispersal by animals.',
    ARRAY['[', 'S', 'e', 'e', 'd', ' ', 'd', 'i', 's', 'p', 'e', 'r', 's', 'a', 'l', '.', ',', 'A', 'n', 'i', 'm', 'a', 'l', ' ', 'a', 't', 't', 'r', 'a', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '910251e0-43b5-55a0-957d-bb84d3d8e093',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'How do different plant parts contribute to the ecosystem?',
    '["They do not", "Leaves produce oxygen, roots prevent erosion, flowers attract pollinators, fruits feed animals", "Only for humans", "Only for beauty"]'::jsonb,
    '1'::jsonb,
    'Each plant part plays an ecological role.',
    ARRAY['[', 'E', 'c', 'o', 's', 'y', 's', 't', 'e', 'm', ' ', 's', 'e', 'r', 'v', 'i', 'c', 'e', 's', '.', ',', 'E', 'c', 'o', 'l', 'o', 'g', 'i', 'c', 'a', 'l', ' ', 'f', 'u', 'n', 'c', 't', 'i', 'o', 'n', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '045dba16-28c2-54ea-8f97-0966fd742925',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Why is it important to use all parts of a plant?',
    '["It is not important", "Using multiple parts reduces waste and maximises the value from each plant", "Only roots matter", "Only leaves matter"]'::jsonb,
    '1'::jsonb,
    'Utilising all plant parts is efficient and sustainable.',
    ARRAY['[', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', ' ', 'e', 'f', 'f', 'i', 'c', 'i', 'e', 'n', 'c', 'y', '.', ',', 'W', 'a', 's', 't', 'e', ' ', 'r', 'e', 'd', 'u', 'c', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2127e412-e0ee-54a9-be51-d63c24987085',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'How can knowledge of plant uses benefit communities?',
    '["It cannot", "Understanding plant uses supports food security, medicine, building, and income generation", "Only for scientists", "Only for farmers"]'::jsonb,
    '1'::jsonb,
    'Traditional knowledge of plant uses has practical and economic value.',
    ARRAY['[', 'I', 'n', 'd', 'i', 'g', 'e', 'n', 'o', 'u', 's', ' ', 'k', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', '.', ',', 'L', 'i', 'v', 'e', 'l', 'i', 'h', 'o', 'o', 'd', ' ', 's', 'u', 'p', 'p', 'o', 'r', 't', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5bbd9fcf-27b5-5a1f-8a41-fd6fdf6d1a6e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Why are some plant parts more valuable than others?',
    '["They are not", "Value depends on nutritional content, medicinal properties, rarity, and market demand", "All parts are equal", "Only size matters"]'::jsonb,
    '1'::jsonb,
    'Different properties and uses determine value.',
    ARRAY['[', 'E', 'c', 'o', 'n', 'o', 'm', 'i', 'c', ' ', 'v', 'a', 'l', 'u', 'e', '.', ',', 'F', 'u', 'n', 'c', 't', 'i', 'o', 'n', 'a', 'l', ' ', 'p', 'r', 'o', 'p', 'e', 'r', 't', 'i', 'e', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '827dbbf7-506d-5833-ad8d-afc7817b4c03',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'How can plant part knowledge support sustainable farming?',
    '["It cannot", "Understanding crop uses helps farmers choose varieties and maximise land productivity", "Only for research", "Only for scientists"]'::jsonb,
    '1'::jsonb,
    'Knowledge of plant uses guides crop selection and farming practices.',
    ARRAY['[', 'C', 'r', 'o', 'p', ' ', 'p', 'l', 'a', 'n', 'n', 'i', 'n', 'g', '.', ',', 'L', 'a', 'n', 'd', ' ', 'u', 's', 'e', ' ', 'o', 'p', 't', 'i', 'm', 'i', 's', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ce7f905e-be46-5d37-bd90-c15d4bf6f2cb',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Why is it important to conserve plant biodiversity?',
    '["It is not important", "Different species have different uses - losing species means losing potential resources", "Only for beauty", "Only for animals"]'::jsonb,
    '1'::jsonb,
    'Biodiversity preserves options for food, medicine, and materials.',
    ARRAY['[', 'G', 'e', 'n', 'e', 't', 'i', 'c', ' ', 'r', 'e', 's', 'o', 'u', 'r', 'c', 'e', 's', '.', ',', 'F', 'u', 't', 'u', 'r', 'e', ' ', 'o', 'p', 't', 'i', 'o', 'n', 's', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fc4aed84-e667-5279-a9a0-af858220a86e',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'How do plants contribute to human health beyond food?',
    '["They do not", "Plants provide medicines, clean air, and mental health benefits from green spaces", "Only for food", "Only for decoration"]'::jsonb,
    '1'::jsonb,
    'Plants have multiple health benefits beyond nutrition.',
    ARRAY['[', 'M', 'e', 'd', 'i', 'c', 'i', 'n', 'a', 'l', ' ', 'p', 'l', 'a', 'n', 't', 's', '.', ',', 'A', 'i', 'r', ' ', 'q', 'u', 'a', 'l', 'i', 't', 'y', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6c9db4a6-0c61-5519-b48d-ecf3cb9bca29',
    (SELECT id FROM topics WHERE code = 'B9/JHS3.5.5.1'), NULL, 'multiple_choice',
    'Why should traditional knowledge of plant uses be preserved?',
    '["It should not", "Traditional knowledge contains valuable information about plant properties and uses that may be lost", "Only for museums", "Only for historians"]'::jsonb,
    '1'::jsonb,
    'Preserving traditional knowledge protects valuable botanical information.',
    ARRAY['[', 'C', 'u', 'l', 't', 'u', 'r', 'a', 'l', ' ', 'h', 'e', 'r', 'i', 't', 'a', 'g', 'e', '.', ',', 'K', 'n', 'o', 'w', 'l', 'e', 'd', 'g', 'e', ' ', 'p', 'r', 'e', 's', 'e', 'r', 'v', 'a', 't', 'i', 'o', 'n', '.', ']'],
    'bece_level', 'analysis', 'shared'
);

