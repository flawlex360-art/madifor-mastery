-- Flawlex Mastery — SBC B8/JHS2 Questions
-- 28 topics x 20 questions = 560 questions total
-- Generated from NaCCA CCP Science Curriculum (September 2020)

-- ============================================================
-- B8/JHS2.1.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b3dd1b75-6f3f-5cd1-ad08-531a5c505252',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'A mixture where the components are evenly distributed is called:',
    '["Heterogeneous", "Homogeneous", "A compound", "An element"]'::jsonb,
    '1'::jsonb,
    'Homogeneous mixtures have uniform composition throughout.',
    ARRAY['Same throughout.', 'Solution example.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7112a5ba-4cd2-5637-884f-e51314430973',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'Salt dissolved in water is an example of a:',
    '["Heterogeneous mixture", "Homogeneous mixture (solution)", "Compound", "Element"]'::jsonb,
    '1'::jsonb,
    'Salt water is a homogeneous mixture — uniform throughout.',
    ARRAY['Cannot see salt particles.', 'Even distribution.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a6642c19-7780-5b11-aaa3-48b94b11b550',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'A mixture of sand and water is:',
    '["Homogeneous", "Heterogeneous", "A compound", "Pure substance"]'::jsonb,
    '1'::jsonb,
    'Sand and water is heterogeneous — you can see the sand particles.',
    ARRAY['Not uniform.', 'Different phases.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd21c3dbd-18f1-5cfd-88d1-e60648e4c484',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'The components of a mixture can be separated by:',
    '["Chemical reactions only", "Physical methods", "Nuclear reactions", "Cannot be separated"]'::jsonb,
    '1'::jsonb,
    'Mixtures can be separated by physical methods like filtration, distillation.',
    ARRAY['No chemical bonds broken.', 'Reversible process.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6071d421-56e4-5aa6-83ee-35b1a99356d6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'fill_in_blank',
    'A solution is a ___ mixture of a solute and solvent.',
    NULL,
    '"homogeneous"'::jsonb,
    'A solution is a homogeneous mixture.',
    ARRAY['Uniform composition.', 'Solute dissolved in solvent.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '59ab9485-cf64-5339-b470-2c51b27be0c3',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'fill_in_blank',
    'In a salt solution, salt is the ___ and water is the ___.',
    NULL,
    '"solute, solvent"'::jsonb,
    'The solute is dissolved; the solvent does the dissolving.',
    ARRAY['Solute = dissolved substance.', 'Solvent = dissolving medium.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '86ebe084-eb04-5bc0-a142-fdac8e4fd90e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'An alloy is a mixture of:',
    '["Non-metals only", "Two or more metals, or a metal and non-metal", "Two gases", "Two liquids"]'::jsonb,
    '1'::jsonb,
    'Alloys are solid mixtures of metals (e.g., bronze = copper + tin).',
    ARRAY['Steel, bronze, brass.', 'Improved properties.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c6dc19e5-791f-54a2-853a-3d7d7845e858',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'Why is steel stronger than pure iron?',
    '["Iron is weak", "Carbon atoms in steel disrupt iron crystal structure, making it harder", "Steel has more iron", "Steel is lighter"]'::jsonb,
    '1'::jsonb,
    'Carbon in steel prevents iron atoms from sliding easily, increasing hardness.',
    ARRAY['Alloy advantage.', 'Mixed structure.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cbaca92d-c31d-5de6-a537-8c150e765417',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'A suspension is a mixture where:',
    '["Particles dissolve completely", "Particles are suspended and eventually settle", "Components react chemically", "Only gases are mixed"]'::jsonb,
    '1'::jsonb,
    'Suspensions have large particles that settle out over time (e.g., muddy water).',
    ARRAY['Settles on standing.', 'Not a true solution.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c558b8d5-ffae-548d-b81f-23478310493a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'fill_in_blank',
    'Name one method to separate a mixture of oil and water.',
    NULL,
    '"decanting"'::jsonb,
    'Oil and water separate into layers and can be separated by decanting or using a separating funnel.',
    ARRAY['Different densities.', 'Immiscible liquids.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '59c38e26-7e46-5686-b071-9d8721e5911b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'Why is air considered a mixture?',
    '["It reacts chemically", "Its components (N2, O2, etc.) retain their individual properties", "It is a compound", "It cannot be separated"]'::jsonb,
    '1'::jsonb,
    'Air components keep their properties — oxygen supports combustion, nitrogen does not.',
    ARRAY['Not chemically combined.', 'Variable composition.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c87ac4ec-c8ea-5e86-80e7-900653ea594f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'Distillation separates mixtures based on differences in:',
    '["Color", "Boiling point", "Density only", "Solubility"]'::jsonb,
    '1'::jsonb,
    'Distillation separates liquids by heating to their different boiling points.',
    ARRAY['Different boiling points.', 'Condensation collected.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '70e7abfa-49f1-5127-92c6-11bf7b3ceebf',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'A student claims pure water is a mixture. Is this correct?',
    '["Yes, it contains hydrogen and oxygen", "No, pure water is a compound \u2014 H and O are chemically bonded", "Yes, all liquids are mixtures", "Depends on the temperature"]'::jsonb,
    '1'::jsonb,
    'Water (H2O) is a compound because H and O are chemically bonded in fixed ratio.',
    ARRAY['Chemical bonds.', 'Fixed composition.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aabd81cc-f27e-5f3f-8fef-d782efc09eb0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'Why is brass preferred over pure copper for making musical instruments?',
    '["It is cheaper", "Brass is harder and more corrosion resistant than pure copper", "Pure copper is too heavy", "Brass is softer"]'::jsonb,
    '1'::jsonb,
    'Brass (copper + zinc) is harder, more durable, and has better acoustic properties.',
    ARRAY['Alloy benefits.', 'Enhanced properties.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3ef12e53-b843-5a99-892f-83929750093a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'fill_in_blank',
    'A mixture contains ethanol and water. Suggest a method to separate them and explain why it works.',
    NULL,
    '"fractional distillation"'::jsonb,
    'Fractional distillation works because ethanol boils at 78°C and water at 100°C.',
    ARRAY['Different boiling points.', 'Close boiling points need fractional column.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '16f91946-2c9e-5381-b336-fbce3c2652ae',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'fill_in_blank',
    'Compare solutions, suspensions, and colloids in terms of particle size and behaviour.',
    NULL,
    '"particle size"'::jsonb,
    'Solutions: smallest (dissolve, do not settle). Colloids: medium (scatter light). Suspensions: largest (settle out).',
    ARRAY['Size determines behaviour.', 'Tyndall effect for colloids.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4d4899a9-4fb0-5d3f-90cf-7d3982c75c3a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'Why can''t filtration separate a salt solution?',
    '["Salt is too heavy", "Salt particles are too small \u2014 they dissolve at the molecular level", "Filtration only works on solids", "Salt reacts with the filter"]'::jsonb,
    '1'::jsonb,
    'Dissolved salt particles are at molecular scale, too small for filter paper.',
    ARRAY['True solution.', 'Molecular dispersion.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5350b82d-71ef-5d00-b401-a096882d10cc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'fill_in_blank',
    'An alloy has a lower melting point than its constituent metals. Give an example and explain.',
    NULL,
    '"solder"'::jsonb,
    'Solder (tin + lead) melts at a lower temperature than either metal alone — useful for electronics.',
    ARRAY['Eutectic mixture.', 'Practical application.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fb48519b-a096-573c-953a-c67c6ec976cc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'Why is stainless steel preferred over ordinary steel for making surgical instruments?',
    '["It is cheaper", "It resists corrosion and is easy to sterilise", "It is softer", "It is lighter"]'::jsonb,
    '1'::jsonb,
    'Stainless steel contains chromium, which forms a protective oxide layer.',
    ARRAY['Corrosion resistance.', 'Hygienic properties.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a268a729-a200-5df5-9a24-39789a4f5362',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.1'), NULL, 'multiple_choice',
    'A solution is saturated. What happens if more solute is added?',
    '["It dissolves faster", "The excess solute remains undissolved at the bottom", "The solution becomes supersaturated", "Nothing changes"]'::jsonb,
    '1'::jsonb,
    'A saturated solution cannot dissolve more solute at that temperature.',
    ARRAY['Maximum concentration.', 'Equilibrium reached.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.1.1.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0af214ba-2771-58c9-bc0f-a0b285b863fb',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'fill_in_blank',
    'An atom consists of a nucleus containing protons and ___.',
    NULL,
    '"neutrons"'::jsonb,
    'The nucleus contains protons (positive) and neutrons (neutral).',
    ARRAY['Central nucleus.', 'Positive and neutral.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7b977be9-8919-501d-bbcc-7343d44d062a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'fill_in_blank',
    'Electrons have a ___ charge.',
    NULL,
    '"negative"'::jsonb,
    'Electrons are negatively charged particles.',
    ARRAY['Orbit the nucleus.', 'Very small mass.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '65eb20c1-3fef-537e-a6cf-ae77d8ca49fa',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'The atomic number of an element equals the number of:',
    '["Neutrons", "Protons", "Electrons only", "Nucleons"]'::jsonb,
    '1'::jsonb,
    'Atomic number = number of protons in the nucleus.',
    ARRAY['Defines the element.', 'Unique per element.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c2f7295d-50cb-5fe1-b461-ba6995eced3a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'The mass number is the total number of:',
    '["Protons only", "Protons and neutrons", "Electrons and protons", "Neutrons only"]'::jsonb,
    '1'::jsonb,
    'Mass number = protons + neutrons.',
    ARRAY['Nucleon count.', 'Approximate atomic mass.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'af8db1e1-e5e2-5081-a59b-e6a7c5010855',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'Isotopes are atoms of the same element with different numbers of:',
    '["Protons", "Electrons", "Neutrons", "Atomic numbers"]'::jsonb,
    '2'::jsonb,
    'Isotopes have same protons but different neutrons.',
    ARRAY['Same element, different mass.', 'Chemically similar.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7e2e300c-fdde-58a4-977c-c6ed241dec45',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'The electron configuration of an atom shows:',
    '["How many protons it has", "The arrangement of electrons in energy levels (shells)", "Its mass number", "Its chemical symbol"]'::jsonb,
    '1'::jsonb,
    'Electron configuration shows electrons distributed in shells.',
    ARRAY['Energy levels.', '2, 8, 8, 18...'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b6a91804-ee1b-5283-b79f-8de5010f67b5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'Carbon-12 and Carbon-14 are isotopes. They have the same number of:',
    '["Neutrons", "Protons but different neutrons", "Electrons and neutrons", "Mass number"]'::jsonb,
    '1'::jsonb,
    'Both have 6 protons; C-12 has 6 neutrons, C-14 has 8.',
    ARRAY['Same atomic number.', 'Different mass number.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '80fc327e-0da1-558b-b018-de77bdbaf22b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'An atom of sodium (Na) has atomic number 11. Its electron configuration is:',
    '["2, 8, 1", "2, 8, 2", "2, 8", "2, 8, 8, 1"]'::jsonb,
    '0'::jsonb,
    '11 electrons: 2 in shell 1, 8 in shell 2, 1 in shell 3.',
    ARRAY['Fill shells: 2, 8, 18...', 'Remaining in outer shell.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc604936-8a9a-5f4a-8771-3c8bc6adaa50',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'The maximum number of electrons in the second shell is:',
    '["2", "8", "18", "32"]'::jsonb,
    '1'::jsonb,
    'The second shell holds a maximum of 8 electrons.',
    ARRAY['Shell capacity rule.', '2n squared.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '05c4a42b-3898-5a0b-ba84-61432048e7bc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'An atom with 13 protons has how many electrons if it is neutral?',
    '["12", "13", "14", "26"]'::jsonb,
    '1'::jsonb,
    'A neutral atom has equal protons and electrons: 13.',
    ARRAY['Neutral = balanced charges.', 'Protons = electrons.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '328f9fcb-4809-5297-a73e-a5eae58be49f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'What is the relative mass of an electron compared to a proton?',
    '["1", "0", "1/1836 (negligible)", "2"]'::jsonb,
    '2'::jsonb,
    'Electron mass is about 1/1836 of a proton — nearly zero.',
    ARRAY['Very light.', 'Neglected in mass number.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '22d17ef8-687d-506b-8d39-63a337e5b08e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'An atom of chlorine has mass number 35 and atomic number 17. How many neutrons does it have?',
    '["17", "18", "35", "52"]'::jsonb,
    '1'::jsonb,
    'Neutrons = mass number - atomic number = 35 - 17 = 18.',
    ARRAY['Simple subtraction.', 'N = A - Z.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dd366b4a-03c9-589b-b3c7-a4c29316fd73',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'Why do isotopes of the same element have the same chemical properties?',
    '["They have the same mass", "They have the same electron configuration", "They have the same neutrons", "They are identical"]'::jsonb,
    '1'::jsonb,
    'Chemical properties depend on electron configuration, which is the same for isotopes.',
    ARRAY['Electrons determine chemistry.', 'Same protons = same electrons.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a6fa6cba-fc69-5bff-bde6-4f73c77089e3',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'fill_in_blank',
    'Carbon-14 is used for dating ancient objects. Explain why it is radioactive.',
    NULL,
    '"unstable nucleus"'::jsonb,
    'C-14 has 8 neutrons (more than C-12), making its nucleus unstable — it decays over time.',
    ARRAY['Neutron excess.', 'Nuclear instability.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6c7ff5e4-de27-5fd1-8dd6-43a23123fd16',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'fill_in_blank',
    'A neutral atom has electron configuration 2, 8, 7. Identify the element and its group.',
    NULL,
    '"chlorine, group 7"'::jsonb,
    '17 electrons = chlorine. 7 valence electrons = Group 7.',
    ARRAY['Count total electrons.', 'Valence = group number.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e44f8607-d8be-5a21-bb05-b9748f4f7045',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'Why is the nucleus of an atom positively charged?',
    '["Because of electrons", "Because protons (positive) are in the nucleus and electrons (negative) are outside", "Because neutrons are positive", "Atoms are not charged"]'::jsonb,
    '1'::jsonb,
    'Protons in the nucleus carry positive charge; electrons are outside.',
    ARRAY['Charge separation.', 'Nuclear protons.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '61e31221-ed90-5b9e-8698-cd1fe1c2fbf2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'fill_in_blank',
    'Explain why the mass of an atom is concentrated in the nucleus.',
    NULL,
    '"protons and neutrons"'::jsonb,
    'Protons and neutrons have much greater mass than electrons, and they are in the nucleus.',
    ARRAY['Heavy particles concentrated.', 'Electrons very light.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0512a115-7134-525f-a865-71c2858fda47',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'fill_in_blank',
    'An atom of magnesium has 12 protons, 12 neutrons, and 12 electrons. Write its isotope notation.',
    NULL,
    '"Mg-24"'::jsonb,
    'Mass number = 12 + 12 = 24. Symbol: Mg-24 or 24Mg.',
    ARRAY['Mass number on top.', 'Atomic number on bottom.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f2a144b9-e9ff-547f-befe-d8101f0dd822',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'Why do atoms of noble gases have full outer shells?',
    '["They are special", "They have electron configurations that fill the outer shell completely (2 or 8)", "They have no electrons", "They always have 8 electrons"]'::jsonb,
    '1'::jsonb,
    'Noble gases naturally have filled outer shells, making them stable and unreactive.',
    ARRAY['Stable configuration.', 'Group 0/8.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dbea76a5-f1bf-5716-aebd-31b1b860dadc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.1.2'), NULL, 'multiple_choice',
    'A student says the mass number is always twice the atomic number. Is this always true?',
    '["Yes, always", "No \u2014 neutrons can vary, so mass number is not always twice atomic number", "Only for metals", "Only for gases"]'::jsonb,
    '1'::jsonb,
    'Neutrons vary (isotopes), so mass number is not always 2× atomic number.',
    ARRAY['Isotope example: C-12 vs C-14.', 'Not a fixed ratio.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.1.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '08c9f5f8-1f83-53f4-af68-5eee88c02edc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Prokaryotic cells lack a:',
    '["Cell membrane", "Nucleus", "Cytoplasm", "Ribosome"]'::jsonb,
    '1'::jsonb,
    'Prokaryotes (bacteria) have no membrane-bound nucleus.',
    ARRAY['DNA is free in cytoplasm.', 'Simpler structure.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'acd2043d-0c54-5917-9a45-e8350061ce08',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Eukaryotic cells have a:',
    '["No nucleus", "Membrane-bound nucleus", "Only DNA", "No organelles"]'::jsonb,
    '1'::jsonb,
    'Eukaryotes have a true nucleus enclosed in a membrane.',
    ARRAY['Plants, animals, fungi.', 'Complex structure.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3fe12f28-c418-56ff-8d80-c8e766055775',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Bacteria are examples of:',
    '["Eukaryotic cells", "Prokaryotic cells", "Plant cells", "Animal cells"]'::jsonb,
    '1'::jsonb,
    'Bacteria are prokaryotes — no nucleus.',
    ARRAY['Simple structure.', 'Single-celled.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ca51cbad-5a13-523d-8ba2-d47863a26d1f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Plant cells are:',
    '["Prokaryotic", "Eukaryotic", "Neither", "Both"]'::jsonb,
    '1'::jsonb,
    'Plant cells are eukaryotic — they have a nucleus and organelles.',
    ARRAY['Complex cells.', 'Membrane-bound organelles.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '214928e5-a4f7-57a3-a434-8db24b35917c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Ribosomes are found in:',
    '["Only eukaryotic cells", "Only prokaryotic cells", "Both prokaryotic and eukaryotic cells", "Neither"]'::jsonb,
    '2'::jsonb,
    'Ribosomes are present in all cells — they make proteins.',
    ARRAY['Universal organelle.', 'Protein synthesis.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f19c25e7-9e24-5f3b-a246-438ea7638649',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'A cell wall is found in:',
    '["All cells", "Plant cells and bacteria", "Only animal cells", "Only prokaryotes"]'::jsonb,
    '1'::jsonb,
    'Plant cells (cellulose) and bacteria (peptidoglycan) have cell walls.',
    ARRAY['Structural support.', 'Animal cells lack it.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd670db09-077b-5155-b580-f3db71cfb0da',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Prokaryotic DNA is:',
    '["Contained in a nucleus", "Circular and free in the cytoplasm", "Linear and in chromosomes", "In mitochondria"]'::jsonb,
    '1'::jsonb,
    'Prokaryotic DNA is a single circular chromosome in the nucleoid region.',
    ARRAY['No nuclear membrane.', 'Simple organisation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7ee27d4f-fb2e-5686-91e3-47af5ad9f298',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Which organelle is found in eukaryotes but NOT in prokaryotes?',
    '["Ribosome", "Cell membrane", "Mitochondrion", "DNA"]'::jsonb,
    '2'::jsonb,
    'Mitochondria are membrane-bound organelles found only in eukaryotes.',
    ARRAY['Membrane-bound.', 'Energy production.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7bdf0f4d-ff06-57a2-9fcd-9ae2465b6ed0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'A scientist observes a cell with a nucleus, mitochondria, and chloroplasts. This cell is:',
    '["Prokaryotic", "A plant cell", "An animal cell", "A bacterium"]'::jsonb,
    '1'::jsonb,
    'Chloroplasts are unique to plant cells (among eukaryotes).',
    ARRAY['Photosynthesis organelle.', 'Plant-specific.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ed5626ed-6f85-5eea-bd84-1f1a8bcf4e59',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Why are prokaryotic cells generally smaller than eukaryotic cells?',
    '["They have less DNA", "They are simpler with fewer organelles", "They are always younger", "They have more ribosomes"]'::jsonb,
    '1'::jsonb,
    'Simpler structure allows smaller size; eukaryotes need space for organelles.',
    ARRAY['Structural complexity.', 'Size difference.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5c6acc2b-5bd2-55c3-add9-b232c47d6d86',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Both prokaryotes and eukaryotes have:',
    '["Nucleus", "Mitochondria", "Cell membrane and ribosomes", "Endoplasmic reticulum"]'::jsonb,
    '2'::jsonb,
    'Cell membrane and ribosomes are universal to all cells.',
    ARRAY['Basic cell components.', 'Shared features.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '84b34c26-7740-5252-a6b5-3269a129ff9f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'A cell has no nucleus but has a cell wall. It is most likely:',
    '["An animal cell", "A plant cell", "A bacterium", "A red blood cell"]'::jsonb,
    '2'::jsonb,
    'No nucleus + cell wall = prokaryote (bacterium).',
    ARRAY['Prokaryotic features.', 'Simple cell.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9e5523c2-5a17-5fdc-bff5-c49b4358adff',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Why can antibiotics kill bacteria but not harm human cells?',
    '["Bacteria are smaller", "Bacteria have cell walls (targeted by antibiotics); human cells do not", "Bacteria have no DNA", "Human cells are immune"]'::jsonb,
    '1'::jsonb,
    'Antibiotics target bacterial cell walls or ribosomes, which differ from human cells.',
    ARRAY['Selective toxicity.', 'Target difference.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '954f0eed-5d13-53ab-81dc-2f335e843a96',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'fill_in_blank',
    'Explain why viruses are not classified as prokaryotic or eukaryotic.',
    NULL,
    '"not cells"'::jsonb,
    'Viruses are not cells — they lack cell structure, ribosomes, and cannot reproduce independently.',
    ARRAY['Not living cells.', 'Obligate parasites.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '31f4f964-aaea-50d4-955e-55f2da30dcfc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'fill_in_blank',
    'A cell has a nucleus, no cell wall, and many mitochondria. Identify it and explain.',
    NULL,
    '"animal cell"'::jsonb,
    'Animal cell: has nucleus (eukaryote), no cell wall (not plant), many mitochondria (active metabolism).',
    ARRAY['Eukaryotic features.', 'No chloroplasts.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '81d34101-6266-5adc-afcb-cf4df3039675',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'Why are bacteria important despite being simple organisms?',
    '["They are not important", "They decompose waste, fix nitrogen, and are used in food production and medicine", "They only cause disease", "They are too small to matter"]'::jsonb,
    '1'::jsonb,
    'Bacteria play vital roles in ecosystems, industry, and medicine.',
    ARRAY['Decomposition.', 'Nitrogen fixation.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cbca2d17-5947-51ed-b501-3b23cf562826',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'How does the size of a typical prokaryotic cell compare to a eukaryotic cell?',
    '["Same size", "Prokaryotes are 10-100 times smaller", "Prokaryotes are larger", "Size varies randomly"]'::jsonb,
    '1'::jsonb,
    'Prokaryotes: 0.1-5 micrometres. Eukaryotes: 10-100 micrometres.',
    ARRAY['Order of magnitude difference.', 'Scale comparison.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '667c9cf1-64bb-5aeb-b845-95efab43e85f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'fill_in_blank',
    'Why do antibiotics not work against viruses?',
    NULL,
    '"no cell wall"'::jsonb,
    'Viruses lack the structures (cell wall, ribosomes) that antibiotics target in bacteria.',
    ARRAY['Different biology.', 'Need antiviral drugs.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '67035008-f5f7-5bde-bf7c-b8c6926a33fc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'A student claims all single-celled organisms are prokaryotes. Is this correct?',
    '["Yes", "No \u2014 yeast is a single-celled eukaryote", "Only bacteria are single-celled", "Only in water"]'::jsonb,
    '1'::jsonb,
    'Yeasts and amoebas are single-celled eukaryotes with nuclei.',
    ARRAY['Not all single-celled are prokaryotic.', 'Eukaryotic protists.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a49cd026-e81c-5234-849d-dcf454fb95a9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.1.2.1'), NULL, 'multiple_choice',
    'What would happen if a bacterium gained a nuclear membrane?',
    '["Nothing", "It would become a eukaryote-like cell", "It would die", "It would become a virus"]'::jsonb,
    '1'::jsonb,
    'A nuclear membrane would make it structurally more like a eukaryote.',
    ARRAY['Hypothetical evolution.', 'Structural change.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.2.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3e2ae7af-4fc9-521c-baf5-62e3dbb96181',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'fill_in_blank',
    'The carbon cycle describes the movement of ___ through the Earth''s systems.',
    NULL,
    '"carbon"'::jsonb,
    'Carbon moves between the atmosphere, biosphere, hydrosphere, and lithosphere.',
    ARRAY['Essential element.', 'All living things.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9320ef25-c7b2-5d70-9b4b-19a05038d02d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'Plants remove CO2 from the atmosphere through:',
    '["Respiration", "Photosynthesis", "Decomposition", "Combustion"]'::jsonb,
    '1'::jsonb,
    'Photosynthesis absorbs CO2 and releases O2.',
    ARRAY['Carbon fixation.', 'Light energy used.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '49ef2dde-f675-5c0e-a7f6-a6cab4ae498a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'Animals release CO2 into the atmosphere through:',
    '["Photosynthesis", "Respiration", "Fermentation", "Combustion"]'::jsonb,
    '1'::jsonb,
    'Respiration releases CO2 as a waste product.',
    ARRAY['C6H12O6 + 6O2 → 6CO2 + 6H2O.', 'Cellular process.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '09815937-969d-5838-8ed7-08266596c768',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'Burning fossil fuels releases:',
    '["Oxygen", "Carbon dioxide", "Nitrogen", "Water"]'::jsonb,
    '1'::jsonb,
    'Combustion of fossil fuels releases CO2 into the atmosphere.',
    ARRAY['Carbon stored for millions of years.', 'Anthropogenic source.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f3286d29-3086-51f2-90cb-135a39c591e6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'fill_in_blank',
    'Carbon is stored in rocks and fossil fuels as a long-term ___ sink.',
    NULL,
    '"carbon"'::jsonb,
    'Rocks and fossil fuels are long-term carbon reservoirs.',
    ARRAY['Millions of years.', 'Geological storage.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '717e248e-d32e-55b8-87f5-dbe967686148',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'Decomposers release carbon by:',
    '["Photosynthesis", "Breaking down dead organic matter and releasing CO2", "Storing it in shells", "Freezing it"]'::jsonb,
    '1'::jsonb,
    'Decomposition releases carbon back to the atmosphere as CO2.',
    ARRAY['Recycling carbon.', 'Bacteria and fungi.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cd93b6fe-7e13-5913-b09d-83274517d46a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'The ocean acts as a carbon sink because:',
    '["It is deep", "CO2 dissolves in water and is used by marine organisms", "It produces CO2", "It has no carbon"]'::jsonb,
    '1'::jsonb,
    'Oceans absorb CO2 from the atmosphere; marine organisms use it for shells.',
    ARRAY['Dissolved CO2.', 'Calcium carbonate.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ac8e0225-46ce-510e-ab64-9424d9c042c0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'Deforestation increases atmospheric CO2 because:',
    '["Trees produce CO2", "Fewer trees means less CO2 absorbed by photosynthesis", "Trees burn slowly", "Deforestation creates oxygen"]'::jsonb,
    '1'::jsonb,
    'Removing trees reduces the Earth''s capacity to absorb CO2.',
    ARRAY['Carbon sink lost.', 'Net CO2 increase.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2cf03845-5ef3-54a2-b08d-5107c4180335',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'Fossil fuels are formed from:',
    '["Living organisms that died millions of years ago", "Volcanic eruptions", "Atmospheric CO2", "Ocean water"]'::jsonb,
    '1'::jsonb,
    'Fossil fuels form from ancient organisms buried and compressed over millions of years.',
    ARRAY['Carbon stored underground.', 'Coal, oil, gas.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '06aea035-fd01-5d6c-a907-10f71acc541b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'fill_in_blank',
    'How does the carbon cycle affect climate?',
    NULL,
    '"greenhouse gases"'::jsonb,
    'CO2 is a greenhouse gas; the carbon cycle controls atmospheric CO2 levels, affecting temperature.',
    ARRAY['Regulates climate.', 'Balance is crucial.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0fa5c210-b5b2-5260-bef8-42425dacb504',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'fill_in_blank',
    'Name one natural process that removes CO2 from the atmosphere.',
    NULL,
    '"photosynthesis"'::jsonb,
    'Photosynthesis, ocean absorption, and rock weathering remove CO2.',
    ARRAY['Carbon sinks.', 'Natural balance.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7057e5b9-2a55-5801-9a44-1fb9e32b762a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'Why is the carbon cycle described as a cycle?',
    '["It goes in circles", "Carbon is continuously recycled between different Earth systems", "It has no beginning", "It only happens in one direction"]'::jsonb,
    '1'::jsonb,
    'Carbon moves in a continuous loop between atmosphere, organisms, oceans, and rocks.',
    ARRAY['Continuous recycling.', 'No net change naturally.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2a6f6aef-90c1-5704-bce9-e835de25d288',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'Human activities have disrupted the carbon cycle by:',
    '["Planting trees", "Burning fossil fuels and deforestation, increasing atmospheric CO2", "Reducing CO2", "Cleaning the oceans"]'::jsonb,
    '1'::jsonb,
    'Humans release stored carbon faster than natural processes can absorb it.',
    ARRAY['Imbalance.', 'Climate change.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bd0c05ed-0e67-57a6-bde5-a86b9a4608f2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'fill_in_blank',
    'Why is the ocean an important carbon sink?',
    NULL,
    '"dissolves CO2"'::jsonb,
    'Oceans dissolve CO2 and marine organisms incorporate carbon into shells and skeletons.',
    ARRAY['Large surface area.', 'Biological pump.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc7ff8ec-6a09-56d4-ba63-7361ed60713c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'fill_in_blank',
    'Explain why planting trees helps combat climate change.',
    NULL,
    '"absorbs CO2"'::jsonb,
    'Trees absorb CO2 through photosynthesis, removing greenhouse gases from the atmosphere.',
    ARRAY['Carbon sequestration.', 'Natural solution.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b9d5381c-96ee-599f-818f-9e9f95f6f61c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'If all forests were destroyed, what would happen to the carbon cycle?',
    '["Nothing", "Atmospheric CO2 would increase dramatically, accelerating climate change", "CO2 would decrease", "The cycle would stop"]'::jsonb,
    '1'::jsonb,
    'Without forests to absorb CO2, atmospheric concentrations would rise rapidly.',
    ARRAY['Major carbon sink removed.', 'Climate catastrophe.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cd437eb1-1101-50ef-9f6f-2bc2f22f8aa8',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'Why are coral reefs important in the carbon cycle?',
    '["They produce CO2", "They incorporate carbon into calcium carbonate shells and skeletons", "They burn carbon", "They block carbon"]'::jsonb,
    '1'::jsonb,
    'Coral and shellfish use dissolved CO2 to build CaCO3 structures, storing carbon.',
    ARRAY['Biological carbon storage.', 'Ocean carbon cycle.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8e4de51c-2d1d-581d-8610-645b389d0e3c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'multiple_choice',
    'A volcano erupts, releasing CO2. How does this affect the carbon cycle?',
    '["It stops the cycle", "It adds carbon to the atmosphere, which is eventually absorbed by natural sinks", "It has no effect", "It removes CO2"]'::jsonb,
    '1'::jsonb,
    'Volcanic CO2 is part of the natural cycle; it is absorbed over time by oceans and plants.',
    ARRAY['Natural source.', 'Temporary increase.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '06398c8c-f859-5835-aac6-794d7499dc6a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'fill_in_blank',
    'How do limestone rocks store carbon?',
    NULL,
    '"calcium carbonate"'::jsonb,
    'Limestone is calcium carbonate (CaCO3), formed from the remains of marine organisms.',
    ARRAY['Geological carbon storage.', 'Millions of years.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '014f0e7c-390f-5457-8a13-bb74ad3931af',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.1.1'), NULL, 'fill_in_blank',
    'Why is the balance of the carbon cycle important for life on Earth?',
    NULL,
    '"climate stability"'::jsonb,
    'Balanced carbon levels maintain stable temperatures and climate patterns suitable for life.',
    ARRAY['Temperature regulation.', 'Ecosystem stability.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.2.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '33fe55f8-1266-5293-9e01-018f73ccbcc6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'The Anopheles mosquito transmits:',
    '["Dengue fever", "Malaria", "Zika virus", "All of the above"]'::jsonb,
    '1'::jsonb,
    'Anopheles mosquitoes transmit malaria parasites.',
    ARRAY['Plasmodium parasite.', 'Deadly disease.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e95a1cdd-2184-5fa4-aa43-661162cb5175',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'fill_in_blank',
    'The Anopheles mosquito undergoes ___ metamorphosis.',
    NULL,
    '"complete"'::jsonb,
    'It has four stages: egg, larva, pupa, adult.',
    ARRAY['Four distinct stages.', 'Aquatic stages.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd691badc-0de4-5ce1-b7d5-580634c65bf5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'Anopheles mosquito larvae live in:',
    '["Soil", "Stagnant water", "Trees", "Rivers"]'::jsonb,
    '1'::jsonb,
    'Larvae develop in still/stagnant water.',
    ARRAY['Breeding site.', 'Water surface.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1beb0f59-98fb-514d-9707-a84abcccfa03',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'The correct order of the Anopheles life cycle is:',
    '["Adult, pupa, larva, egg", "Egg, larva, pupa, adult", "Egg, pupa, larva, adult", "Larva, egg, adult, pupa"]'::jsonb,
    '1'::jsonb,
    'Egg → larva → pupa → adult.',
    ARRAY['Standard insect cycle.', 'Aquatic to terrestrial.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '69f0c3f0-ff05-5b54-a91e-78065ddf9707',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'fill_in_blank',
    'Only ___ Anopheles mosquitoes bite humans and transmit malaria.',
    NULL,
    '"female"'::jsonb,
    'Female Anopheles mosquitoes bite to get blood for egg production.',
    ARRAY['Males feed on nectar.', 'Blood for eggs.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95eff1e5-04ea-5909-9dd6-287592cb2e26',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'Anopheles larvae breathe through:',
    '["Gills", "A siphon tube at the water surface", "Lungs", "Their skin"]'::jsonb,
    '1'::jsonb,
    'Larvae have siphon tubes to breathe air at the water surface.',
    ARRAY['Parallel to water surface.', 'Identifying feature.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9fafb817-811b-501b-880c-b1173201efde',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'Why is draining stagnant water important for malaria prevention?',
    '["It looks better", "It removes mosquito breeding sites", "It saves water", "It grows crops"]'::jsonb,
    '1'::jsonb,
    'Removing standing water eliminates breeding habitats for Anopheles mosquitoes.',
    ARRAY['Source reduction.', 'Prevention strategy.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6d8454d9-a008-5b97-9b8b-4de25688ac7d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'How is the Anopheles mosquito different from the Culex mosquito?',
    '["No difference", "Anopheles rests parallel to surfaces; Culex rests at an angle. Anopheles transmits malaria.", "Anopheles is larger", "Culex transmits malaria"]'::jsonb,
    '1'::jsonb,
    'Key difference: resting posture and disease transmission.',
    ARRAY['Identification feature.', 'Species distinction.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c1ec2a83-20cb-5e35-88e9-2a8aac8dc75c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'Malaria parasites reproduce in:',
    '["The mosquito only", "Both the mosquito and human liver/blood cells", "Humans only", "Water"]'::jsonb,
    '1'::jsonb,
    'Plasmodium has a complex life cycle in both mosquito and human hosts.',
    ARRAY['Two-host cycle.', 'Sporozoites, merozoites.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '863f5e29-fe6b-5b45-94a3-9b5a7387e069',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'What is the most effective way to prevent malaria?',
    '["Drinking clean water", "Sleeping under insecticide-treated bed nets and eliminating breeding sites", "Taking antibiotics", "Avoiding sunlight"]'::jsonb,
    '1'::jsonb,
    'Bed nets and source reduction are the most effective malaria prevention methods.',
    ARRAY['Vector control.', 'WHO recommendations.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f09ca762-b315-5495-aca6-1cea41c64601',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'Anopheles larvae feed on:',
    '["Blood", "Microorganisms and organic matter in water", "Plants", "Other insects"]'::jsonb,
    '1'::jsonb,
    'Larvae filter-feed on microorganisms and organic particles in water.',
    ARRAY['Filter feeders.', 'Aquatic diet.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0b9bc74f-82cd-5f89-8e16-345be838f400',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'Why are Anopheles mosquitoes more active at night?',
    '["They fear light", "They have evolved to feed at night when hosts are sleeping", "They only mate at night", "They are blind"]'::jsonb,
    '1'::jsonb,
    'Nocturnal feeding maximises blood meals when hosts are stationary.',
    ARRAY['Evolutionary adaptation.', 'Night-biting.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fc8efb29-fab1-532e-9f36-e7e9f02f84cc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'fill_in_blank',
    'Name two methods to control mosquito larvae in water.',
    NULL,
    '"larvicides"'::jsonb,
    'Larvicides, biological control (fish that eat larvae), and removing standing water.',
    ARRAY['Chemical and biological.', 'Source reduction.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '59cf2991-63da-52c4-ab19-cd52beced8ba',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'fill_in_blank',
    'Why has malaria been difficult to eradicate in Ghana?',
    NULL,
    '"breeding sites"'::jsonb,
    'Abundant breeding sites, warm climate, and poverty limit eradication efforts.',
    ARRAY['Climate and environment.', 'Healthcare challenges.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7c574c6f-724b-5937-841c-c6012767aea4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'fill_in_blank',
    'Explain why treating only sick people is not enough to control malaria.',
    NULL,
    '"vector control"'::jsonb,
    'The mosquito vector must also be controlled — untreated mosquitoes continue spreading the parasite.',
    ARRAY['Both sides needed.', 'Integrated approach.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ebe1ffeb-cae8-59fc-9201-6ca26d85c27e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'How does climate change affect malaria transmission?',
    '["No effect", "Warmer temperatures expand mosquito habitats and shorten parasite development time", "It reduces malaria", "Only affects cold countries"]'::jsonb,
    '1'::jsonb,
    'Warmer temperatures allow mosquitoes to thrive in new areas and speed up parasite development.',
    ARRAY['Range expansion.', 'Faster transmission.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fb96befe-a426-54b8-9868-1d058101be74',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'Why do some people get malaria more often than others?',
    '["Bad luck", "Factors include immunity (previous exposure), genetics (sickle cell trait), and exposure to mosquitoes", "Diet", "Age only"]'::jsonb,
    '1'::jsonb,
    'Partial immunity develops with repeated exposure; sickle cell trait provides some protection.',
    ARRAY['Immune factors.', 'Genetic resistance.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '37aa2535-27bc-5ec4-a1fa-42be6a3cded3',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'fill_in_blank',
    'A community wants to reduce malaria without using chemicals. Suggest a strategy.',
    NULL,
    '"biological control"'::jsonb,
    'Introduce larvivorous fish in ponds, use bed nets, drain stagnant water, and educate the community.',
    ARRAY['Integrated approach.', 'Sustainable methods.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1044d8ae-eef0-5b20-b17c-61610729cf9d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'fill_in_blank',
    'Why is the Anopheles life cycle important to understand for malaria control?',
    NULL,
    '"target stages"'::jsonb,
    'Understanding each stage allows targeted interventions at the most vulnerable points.',
    ARRAY['Egg, larva, pupa, adult.', 'Different control methods.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '61cecce6-0461-5c49-b873-763a98fb34e4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.2.1'), NULL, 'multiple_choice',
    'How long does the Anopheles mosquito life cycle take from egg to adult?',
    '["1-2 days", "1-2 weeks", "1-2 months", "1 year"]'::jsonb,
    '1'::jsonb,
    'The complete cycle takes about 10-14 days under warm conditions.',
    ARRAY['Temperature dependent.', 'Faster in warm water.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.2.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '689b38f6-8b39-50cc-9f12-860ae76feab2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'A seed bed is:',
    '["A type of fertiliser", "A prepared area of soil where seeds are planted", "A storage place for seeds", "A type of irrigation"]'::jsonb,
    '1'::jsonb,
    'Seed beds are specially prepared soil for germinating seeds.',
    ARRAY['Nursery area.', 'Prepared ground.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dd4ad41a-a0e5-5f92-a192-96c1af02c5fd',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'The main purpose of a seed bed is to:',
    '["Store water", "Provide ideal conditions for seed germination and early growth", "Kill pests", "Produce fertiliser"]'::jsonb,
    '1'::jsonb,
    'Seed beds provide moisture, warmth, and loose soil for germination.',
    ARRAY['Germination support.', 'Early growth.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd439e249-fffc-5b41-a32b-e4990c6818b2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'fill_in_blank',
    'Seeds need water, warmth, and ___ to germinate.',
    NULL,
    '"oxygen"'::jsonb,
    'Seeds need water, warmth, and oxygen for germination.',
    ARRAY['Three requirements.', 'Air is essential.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '62b54ed5-6be4-5260-aa1d-620229f547f5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'A nursery bed is used to:',
    '["Grow mature plants", "Raise seedlings before transplanting", "Store harvested crops", "Compost waste"]'::jsonb,
    '1'::jsonb,
    'Nursery beds raise young seedlings until they are strong enough to transplant.',
    ARRAY['Protected growing area.', 'Before field planting.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c53ce51e-16e2-58f6-b32c-8108eabf34a1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'Soil in a seed bed should be:',
    '["Compacted and hard", "Loose, fine, and well-draining", "Waterlogged", "Full of rocks"]'::jsonb,
    '1'::jsonb,
    'Loose, fine soil allows roots to grow easily and drains well.',
    ARRAY['Good aeration.', 'Root penetration.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b295b703-976f-5d4f-8da7-71454b4884f5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'Why is watering a seed bed important?',
    '["To make soil heavy", "Seeds need moisture to soften the seed coat and start germination", "To drown pests", "To cool the soil"]'::jsonb,
    '1'::jsonb,
    'Water softens the seed coat and activates enzymes for germination.',
    ARRAY['Essential for germination.', 'Regular watering.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '85667e49-b0f6-5360-a352-5357e0af89a6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'A farmer prepares a seed bed by:',
    '["Just throwing seeds on the ground", "Clearing, tilling, levelling, and adding organic matter", "Flooding the area", "Covering with concrete"]'::jsonb,
    '1'::jsonb,
    'Proper preparation: clear weeds, till soil, level surface, add compost.',
    ARRAY['Soil preparation steps.', 'Good foundation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ec8988cf-00ee-53ec-97a7-58cfc7bc2e85',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'Why is shade important for some nursery beds?',
    '["To save water", "Young seedlings can be damaged by direct sunlight", "To keep soil cold", "To prevent rain damage"]'::jsonb,
    '1'::jsonb,
    'Young seedlings are tender and can wilt or burn in direct sunlight.',
    ARRAY['Protect young plants.', 'Partial shade.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7f482662-3f3e-56d6-96f8-0cc639b29e2b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'Transplanting seedlings from a nursery bed allows:',
    '["Faster harvesting", "Better control of early growth and field space is used efficiently", "Seeds to grow bigger", "Roots to develop fully"]'::jsonb,
    '1'::jsonb,
    'Nursery allows early care; transplanting uses field space efficiently.',
    ARRAY['Space management.', 'Protected early growth.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f242163e-1d0c-55d5-8b4b-8213eecae6da',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'Why should seedlings be transplanted in the evening?',
    '["It is cooler", "Reduced transplant shock \u2014 cooler temperatures and less sun stress", "More moisture at night", "Pests are sleeping"]'::jsonb,
    '1'::jsonb,
    'Evening transplanting reduces heat stress and water loss.',
    ARRAY['Less wilting.', 'Better survival.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '090dc541-2108-5e22-8994-5a278e6f7cb2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'fill_in_blank',
    'Name one type of seed bed used in Ghana.',
    NULL,
    '"raised bed"'::jsonb,
    'Raised beds, flat beds, and container nurseries are common in Ghana.',
    ARRAY['Soil type matters.', 'Drainage important.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'def1e300-b7ce-5022-900d-06067e277e32',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'What is the advantage of using raised seed beds?',
    '["They look better", "Better drainage and soil warming, reducing waterlogging and root rot", "They need less water", "They produce bigger seeds"]'::jsonb,
    '1'::jsonb,
    'Raised beds improve drainage and soil temperature.',
    ARRAY['Prevents waterlogging.', 'Warmer soil.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '33a90cf2-c647-5ba5-bf59-2a24ec89ad2f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'fill_in_blank',
    'A farmer''s seedlings are dying. What could be the cause?',
    NULL,
    '"overwatering"'::jsonb,
    'Possible causes: overwatering, poor drainage, disease, too much sun, or poor soil.',
    ARRAY['Check moisture levels.', 'Multiple possibilities.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '85657702-0078-5bc7-9263-9461d28f64f1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'fill_in_blank',
    'Why is it better to start some crops (like tomatoes) in a nursery rather than direct seeding?',
    NULL,
    '"controlled environment"'::jsonb,
    'Nurseries provide controlled conditions, protect from pests, and allow earlier planting.',
    ARRAY['Protected start.', 'Higher success rate.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9a77e8c7-b7c1-5b36-890a-65a9a69b9240',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'Compare direct seeding and transplanting. When would you use each?',
    '["Always transplant", "Always direct seed", "Direct seed for hardy crops; transplant for delicate ones that need protection", "They are the same"]'::jsonb,
    '2'::jsonb,
    'Hardy crops (maize, beans) can be direct seeded; delicate crops (tomato, pepper) benefit from transplanting.',
    ARRAY['Crop-specific approach.', 'Labour vs benefit.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '642ae1b5-3a80-5b27-ae36-9e9f4dcfa5c1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'fill_in_blank',
    'How does mulching a seed bed help seedlings?',
    NULL,
    '"moisture retention"'::jsonb,
    'Mulch retains soil moisture, suppresses weeds, and regulates soil temperature.',
    ARRAY['Multiple benefits.', 'Organic cover.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0c58c80c-44d7-51d1-9d1f-7994ba4ee19c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'Why might a farmer use a container nursery instead of a field nursery?',
    '["It is cheaper", "Containers allow easy transplanting with minimal root disturbance", "Containers need no water", "It looks better"]'::jsonb,
    '1'::jsonb,
    'Container seedlings retain their root ball, reducing transplant shock.',
    ARRAY['Root protection.', 'Higher survival rate.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e46caea2-4271-5a5e-ba1d-d1287b573145',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'fill_in_blank',
    'Explain why seed bed preparation affects crop yield.',
    NULL,
    '"soil quality"'::jsonb,
    'Well-prepared beds have loose, fertile soil that promotes strong root growth and nutrient uptake.',
    ARRAY['Foundation for growth.', 'Root development.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6f7f531a-16d3-53a0-93ae-159241601662',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'fill_in_blank',
    'A farmer in Ghana plants seeds directly into hard, compacted soil. What problems might occur?',
    NULL,
    '"poor germination"'::jsonb,
    'Seeds may not germinate, roots cannot penetrate, water pools on surface.',
    ARRAY['Soil structure matters.', 'Tilling needed.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b89a7013-3078-5df6-9378-3c4fddf2f7f9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.1'), NULL, 'multiple_choice',
    'Why is spacing important when transplanting seedlings?',
    '["It is not important", "Proper spacing ensures each plant gets enough light, water, and nutrients", "To make the field look neat", "To use less water"]'::jsonb,
    '1'::jsonb,
    'Crowded plants compete for resources, reducing yield.',
    ARRAY['Competition reduction.', 'Optimal growth.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.2.3.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '63678384-f3ec-50e7-a36b-a0d160584df6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Different crops have different:',
    '["Colors only", "Growth rates, maturation periods, and nutrient needs", "Sizes only", "Shapes only"]'::jsonb,
    '1'::jsonb,
    'Crop growth varies by species, variety, and conditions.',
    ARRAY['Diverse requirements.', 'Planning important.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3a07a734-759e-5cf7-8fe5-6589e00ea0ba',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'A crop that matures quickly is useful because:',
    '["It tastes better", "It provides food sooner and allows multiple harvests per year", "It needs less water", "It grows taller"]'::jsonb,
    '1'::jsonb,
    'Quick-maturing crops allow more harvest cycles.',
    ARRAY['Food security.', 'Multiple cropping.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a541b73e-0b72-5c98-abb5-7f859a7af716',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Tall crops like maize can be intercropped with short crops like groundnut because:',
    '["They look nice together", "They use different levels of light and space", "They need the same nutrients", "They are both cereals"]'::jsonb,
    '1'::jsonb,
    'Intercropping uses vertical space — tall crops shade short crops differently.',
    ARRAY['Complementary growth.', 'Space efficiency.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b7e120ff-66ef-51b6-9ffe-ec2a118b36ff',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'The time from planting to harvesting is called the:',
    '["Growing season", "Maturation period", "Germination time", "Harvest date"]'::jsonb,
    '1'::jsonb,
    'Maturation period is the time from planting to harvest readiness.',
    ARRAY['Crop planning basis.', 'Varies by crop.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '32227579-3e68-512a-8b62-40fb5098511e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Crops grown in the rainy season in Ghana include maize and:',
    '["Rice and millet", "Only wheat", "Only vegetables", "Only fruits"]'::jsonb,
    '0'::jsonb,
    'Rainy season crops (major season): maize, rice, millet, sorghum, groundnut.',
    ARRAY['Water-dependent.', 'April-July planting.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '21e9fb02-91f0-56be-a67c-cf45d3ebd9e9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Growth comparison studies help farmers:',
    '["Choose what looks best", "Select crops suited to their conditions and plan planting schedules", "Grow only one crop", "Waste time"]'::jsonb,
    '1'::jsonb,
    'Comparing crops helps farmers choose the best varieties and planting times.',
    ARRAY['Evidence-based farming.', 'Better yields.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dd0fb3fd-189f-5d7a-9999-5c74171caa12',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Why do some crops grow better in certain soils?',
    '["Random chance", "Different crops have different nutrient and pH requirements", "All soils are the same", "Only water matters"]'::jsonb,
    '1'::jsonb,
    'Soil pH, nutrients, and texture affect which crops thrive.',
    ARRAY['Soil-crop matching.', 'pH important.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2afffa69-acef-51c6-b411-0a5e6b6d0d0e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'A farmer compares maize yields on two plots: one with fertiliser, one without. What should they observe?',
    '["No difference", "The fertilised plot should yield more", "The unfertilised plot yields more", "Results are random"]'::jsonb,
    '1'::jsonb,
    'Fertiliser adds nutrients, typically increasing yield.',
    ARRAY['Controlled comparison.', 'Nutrient effect.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b379c941-9cb0-5dde-9aa0-e1af1121994e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Why is record-keeping important in crop production?',
    '["It is not important", "It allows comparison of yields, costs, and methods over time", "To impress neighbours", "Government requires it"]'::jsonb,
    '1'::jsonb,
    'Records help farmers track what works and make informed decisions.',
    ARRAY['Data-driven farming.', 'Continuous improvement.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bb37b7fc-7bae-564d-84c9-edddc126e14d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Two crops are planted at the same time but one matures in 60 days and the other in 120 days. The faster crop is:',
    '["Better quality always", "Ready for harvest sooner, allowing replanting", "Less nutritious", "More expensive"]'::jsonb,
    '1'::jsonb,
    'Shorter maturation allows earlier harvest and replanting.',
    ARRAY['Time efficiency.', 'Multiple harvests.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '54bf5674-25ee-5db1-aa1b-539c66620bcc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'fill_in_blank',
    'Name one factor that affects crop growth rates.',
    NULL,
    '"water"'::jsonb,
    'Water, temperature, sunlight, soil nutrients, and seed variety all affect growth.',
    ARRAY['Multiple factors.', 'Environmental and genetic.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '66d78ce9-372b-5147-8dba-f37bdf69fa8d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Why might a farmer choose a slow-maturing crop variety over a fast one?',
    '["No reason", "Slow varieties may have higher yield, better quality, or drought resistance", "It is always better to be fast", "Government policy"]'::jsonb,
    '1'::jsonb,
    'Slow varieties may offer better traits: disease resistance, higher final yield, quality.',
    ARRAY['Trade-off analysis.', 'Context-dependent.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1c546f95-1f45-5f9a-94fa-92285f8fb41b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'fill_in_blank',
    'A farmer wants to maximise land use. How can growth comparison data help?',
    NULL,
    '"intercropping"'::jsonb,
    'By knowing maturation times, farmers can plan intercropping or relay cropping for continuous production.',
    ARRAY['Land efficiency.', 'Seasonal planning.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ee04aaf5-1474-5c14-8c98-0bbefc9223d0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Compare the growth requirements of maize and rice.',
    '["They are identical", "Maize needs well-drained soil; rice can tolerate waterlogged conditions", "Rice needs no water", "Maize grows in water"]'::jsonb,
    '1'::jsonb,
    'Maize prefers well-drained upland soil; rice thrives in flooded lowland conditions.',
    ARRAY['Different adaptations.', 'Soil moisture needs.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3978fc97-78aa-589e-96d1-945d2cc95508',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'fill_in_blank',
    'How does temperature affect crop growth?',
    NULL,
    '"enzyme activity"'::jsonb,
    'Temperature affects enzyme activity, photosynthesis rate, and germination speed.',
    ARRAY['Optimal range for each crop.', 'Too hot or cold is harmful.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '27d9387d-2ace-5377-bf00-16032d1b66f9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'multiple_choice',
    'Why do Ghanaian farmers plant different crops in the major and minor rainy seasons?',
    '["Tradition only", "Different crops suit different rainfall amounts and temperatures", "The same crops grow in both seasons", "Government policy"]'::jsonb,
    '1'::jsonb,
    'Major season (heavier rain) suits water-loving crops; minor season suits drought-tolerant ones.',
    ARRAY['Seasonal adaptation.', 'Rainfall matching.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f05b2967-5828-5bc8-b8e5-92ab42b70935',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'fill_in_blank',
    'A farmer observes that their maize is shorter than their neighbour''s. List two possible reasons.',
    NULL,
    '"soil nutrients"'::jsonb,
    'Possible: poor soil nutrients, insufficient water, different variety, pest damage, late planting.',
    ARRAY['Multiple factors.', 'Diagnosis needed.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0ca46b3d-acff-5d94-a288-ae7fb37a74a2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'fill_in_blank',
    'Why is it important to compare crop varieties before large-scale planting?',
    NULL,
    '"performance"'::jsonb,
    'Comparing varieties reveals which performs best in local conditions — yield, disease resistance, taste.',
    ARRAY['Field trials.', 'Evidence-based choice.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ba46a740-bd8e-5254-8661-07c50fa604b0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'fill_in_blank',
    'How can growth comparison experiments be made fair?',
    NULL,
    '"controlled variables"'::jsonb,
    'Keep all factors constant except the one being tested (e.g., same soil, water, light — only variety differs).',
    ARRAY['Scientific method.', 'Control variables.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6f639333-7ae9-5803-ba46-5b6e12dfed2b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.3.2'), NULL, 'fill_in_blank',
    'A farmer plants the same crop at different spacings. What might they discover?',
    NULL,
    '"optimal spacing"'::jsonb,
    'They can find the spacing that gives the highest yield per area — too close means competition, too far wastes space.',
    ARRAY['Density experiment.', 'Yield optimisation.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.2.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '610ea677-efa1-5fe7-9bd4-78a58449ce5a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Animal feeds that come from plants are called:',
    '["Concentrates", "Roughages", "Supplements", "Additives"]'::jsonb,
    '1'::jsonb,
    'Roughages are plant-based feeds high in fibre (grass, hay, straw).',
    ARRAY['High fibre.', 'Bulk feeds.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '669b45a7-92fe-542d-a153-be14ecd00cf4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Concentrates are feeds that are:',
    '["High in fibre", "High in energy and protein but low in fibre", "Made of water", "Only for poultry"]'::jsonb,
    '1'::jsonb,
    'Concentrates are nutrient-dense feeds like grains and oilseed cakes.',
    ARRAY['Maize, soybean meal.', 'Energy-rich.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bbe02c0f-db99-556b-ac08-f6199e976add',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'An example of a concentrate feed is:',
    '["Hay", "Maize grain", "Fresh grass", "Straw"]'::jsonb,
    '1'::jsonb,
    'Maize grain is a concentrate — high energy, low fibre.',
    ARRAY['Energy source.', 'Grain feeds.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5133e590-6a2d-51e8-91df-919079ced122',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Hay is dried:',
    '["Grain", "Grass", "Meat", "Fish"]'::jsonb,
    '1'::jsonb,
    'Hay is grass that has been cut and dried for storage.',
    ARRAY['Preserved roughage.', 'Winter feed.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3175759d-89a8-5de9-9292-dd5bcf956338',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Livestock need feed for:',
    '["Only energy", "Energy, growth, maintenance, and production (milk, eggs)", "Only growth", "Only reproduction"]'::jsonb,
    '1'::jsonb,
    'Feed provides energy and nutrients for all body functions and production.',
    ARRAY['Multiple purposes.', 'Balanced nutrition.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c8f16ffe-3572-55c5-b916-7cc6faf7f57d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Silage is:',
    '["Dried grass", "Fermented (preserved) green fodder", "Grain feed", "A type of mineral"]'::jsonb,
    '1'::jsonb,
    'Silage is green fodder preserved by fermentation in an airtight container.',
    ARRAY['Preserved moist feed.', 'Anaerobic fermentation.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2475f324-a31e-5b07-97c4-6c1b400a4536',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Why do ruminants need more roughage than concentrates?',
    '["They do not", "Their digestive system is designed to process fibre using bacteria in the rumen", "Concentrates are toxic to them", "They prefer roughage"]'::jsonb,
    '1'::jsonb,
    'Ruminants have bacteria that break down cellulose in roughage.',
    ARRAY['Adapted digestion.', 'Rumen bacteria.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c8b08a04-0627-5d9d-b2b1-b78e58784f40',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Poultry need feeds high in:',
    '["Fibre", "Protein and energy", "Only water", "Only vitamins"]'::jsonb,
    '1'::jsonb,
    'Poultry need high protein (for feathers and eggs) and energy.',
    ARRAY['Grain-based feeds.', 'Soybean meal added.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f27aebde-d0cc-567d-a6dc-0eb2bfad8ed2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Why are mineral supplements added to animal feed?',
    '["To make feed taste better", "Animals need minerals for bone growth, enzyme function, and health", "To increase fibre", "To add colour"]'::jsonb,
    '1'::jsonb,
    'Minerals like calcium, phosphorus, and salt are essential for animal health.',
    ARRAY['Bone health.', 'Metabolic functions.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '29c4bb2f-190d-5d5a-b900-9729433cc820',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'A balanced livestock ration provides:',
    '["Only carbohydrates", "All required nutrients in the correct proportions", "Only protein", "Only vitamins"]'::jsonb,
    '1'::jsonb,
    'A balanced ration meets all nutritional needs: energy, protein, vitamins, minerals.',
    ARRAY['Complete nutrition.', 'Species-specific.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '29865dc8-879a-5dbb-9d59-459f49052636',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'fill_in_blank',
    'Name one locally available concentrate feed in Ghana.',
    NULL,
    '"maize"'::jsonb,
    'Maize, rice bran, palm kernel cake, and soybean meal are locally available concentrates.',
    ARRAY['Common in Ghana.', 'Affordable options.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4d03c17f-0601-57ae-b1e9-33cae0619999',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Why is water important in livestock feeding?',
    '["It is not important", "Water is essential for digestion, temperature regulation, and nutrient transport", "Only for drinking", "Animals get enough from food"]'::jsonb,
    '1'::jsonb,
    'Water is needed for every body function — digestion, circulation, temperature control.',
    ARRAY['Critical nutrient.', 'Always available.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd221bae6-4151-58c2-bde8-8830f8190288',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'fill_in_blank',
    'A farmer feeds their cattle only grass. What deficiency might occur?',
    NULL,
    '"protein"'::jsonb,
    'Grass alone may be low in protein and minerals, especially in the dry season.',
    ARRAY['Nutrient gaps.', 'Supplements needed.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '92324cae-4fb1-539c-818f-7d6ad444212a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'fill_in_blank',
    'Why is feed quality important for milk production in dairy cattle?',
    NULL,
    '"nutrient conversion"'::jsonb,
    'Nutrients from feed are converted to milk — poor feed means poor milk yield and quality.',
    ARRAY['Input = output.', 'Direct relationship.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '316f3a40-e01a-5027-a70f-eed69d2afd50',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Compare the feeding requirements of poultry and cattle.',
    '["They are the same", "Poultry need high-energy grain feeds; cattle can digest roughage and need more fibre", "Cattle need more protein", "Poultry need no water"]'::jsonb,
    '1'::jsonb,
    'Different digestive systems require different feed types.',
    ARRAY['Monogastric vs ruminant.', 'Species-specific needs.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '43a72735-8611-517a-bec7-13ace58ab628',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'How can a farmer reduce feed costs?',
    '["Buy expensive feeds", "Use locally available by-products (rice bran, palm kernel cake) and grow fodder crops", "Feed animals less", "Give only water"]'::jsonb,
    '1'::jsonb,
    'Local by-products are cheaper than commercial feeds.',
    ARRAY['Cost reduction.', 'Local resources.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5a5675dc-dcbd-5381-b527-8f996edd24dc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Why is overfeeding concentrates to cattle dangerous?',
    '["It is not dangerous", "It can cause acidosis (excess acid in the rumen), which can be fatal", "It makes them too fat", "It improves health"]'::jsonb,
    '1'::jsonb,
    'Excess concentrates produce too much acid in the rumen, disrupting digestion.',
    ARRAY['Rumen acidosis.', 'Health risk.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8e65ba21-7d79-5f42-a1fb-1935a9b344a4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'fill_in_blank',
    'Suggest a feeding plan for a small-scale poultry farmer in Ghana.',
    NULL,
    '"balanced ration"'::jsonb,
    'Use a starter ration (high protein) for chicks, grower ration for juveniles, and layer ration for egg-laying hens.',
    ARRAY['Stage-specific feeds.', 'Local ingredients.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6e9f92b2-c498-5460-9c0f-cbc6552f48ae',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'Why do livestock need more feed during the dry season in Ghana?',
    '["They do not", "Natural pasture quality declines, so animals need supplementary feeding", "Rain makes them hungry", "Cold weather increases appetite"]'::jsonb,
    '1'::jsonb,
    'Dry season grass has less nutrition, requiring supplements.',
    ARRAY['Pasture quality decline.', 'Supplementary feeding.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5452fd77-8ad5-553f-997f-fd75ba8cf08f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.1'), NULL, 'multiple_choice',
    'What is the role of vitamins in animal nutrition?',
    '["For energy only", "Vitamins regulate body processes, support immunity, and prevent deficiency diseases", "For growth only", "They are not important"]'::jsonb,
    '1'::jsonb,
    'Vitamins are needed in small amounts for metabolic regulation and health.',
    ARRAY['Essential micronutrients.', 'Prevent diseases.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.2.4.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '80c9e9a9-4b45-53c9-b037-b4665b216d0e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Water makes up approximately what percentage of an animal''s body weight?',
    '["10%", "30%", "60%", "90%"]'::jsonb,
    '2'::jsonb,
    'Water is about 60% of body weight in most animals.',
    ARRAY['Major component.', 'Essential for life.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b3aa4ced-a985-509b-a977-180296a07936',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Animals get water from drinking and from:',
    '["Air", "Moisture in feed", "Sunlight", "Soil"]'::jsonb,
    '1'::jsonb,
    'Feed contains water — fresh grass is about 70-80% water.',
    ARRAY['Multiple sources.', 'Feed moisture.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6fb1314c-30ed-5e8c-92f6-a2db8b21f2a1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Water is needed in animals for all of the following EXCEPT:',
    '["Digestion", "Temperature regulation", "Photosynthesis", "Nutrient transport"]'::jsonb,
    '2'::jsonb,
    'Animals do not photosynthesise — that is a plant function.',
    ARRAY['All others are correct.', 'Animal-specific functions.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '26af9097-a058-5968-bef6-f0cf0c289fc0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'A sign of dehydration in livestock is:',
    '["Shiny coat", "Sunken eyes and dry skin", "Increased appetite", "More energy"]'::jsonb,
    '1'::jsonb,
    'Dehydration causes sunken eyes, dry mucous membranes, and lethargy.',
    ARRAY['Warning sign.', 'Immediate water needed.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '81ddb368-6301-57b4-9756-52b265fb2dbb',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Laying hens need plenty of water because:',
    '["They are bigger", "Eggs contain a lot of water (about 75%)", "They sweat a lot", "They need to swim"]'::jsonb,
    '1'::jsonb,
    'Eggs are mostly water — hens need constant water supply for egg production.',
    ARRAY['Egg composition.', 'Production demand.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '64b79f65-d1cf-534d-b9ad-fa8072d9f09c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Clean water for livestock is important because:',
    '["Dirty water is fine", "Contaminated water can spread diseases like cholera and parasites", "Animals prefer dirty water", "Water quality does not matter"]'::jsonb,
    '1'::jsonb,
    'Dirty water can transmit bacteria, parasites, and toxins.',
    ARRAY['Health hazard.', 'Clean source needed.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c617b369-6bb8-59d0-aef1-74d974a771b6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'How much water does a dairy cow need per day approximately?',
    '["5 litres", "10 litres", "40-80 litres", "200 litres"]'::jsonb,
    '2'::jsonb,
    'A dairy cow producing milk needs 40-80 litres of water daily.',
    ARRAY['High demand.', 'Milk is mostly water.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'afd0ef37-0414-50b9-9a4a-a6bb33f785f2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Why do animals drink more water in hot weather?',
    '["They are bored", "They lose more water through sweating and panting to cool down", "Food is drier in hot weather", "They do not"]'::jsonb,
    '1'::jsonb,
    'Animals lose water through cooling mechanisms and need to replace it.',
    ARRAY['Thermoregulation.', 'Increased demand.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0780b406-14c7-5bd5-be8b-9694a6491465',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'A farmer notices their chickens are eating less. What should they check first?',
    '["The colour of the feed", "The water supply \u2014 dehydration reduces appetite", "The size of the coop", "The breed of chicken"]'::jsonb,
    '1'::jsonb,
    'Lack of water is the first thing to check — dehydration reduces feed intake.',
    ARRAY['Water first.', 'Quick diagnosis.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '43c3f3a4-6b68-5df8-bca5-8244498a04f5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Water quality for livestock should be tested for:',
    '["Colour only", "Bacteria, nitrates, pH, and dissolved minerals", "Temperature only", "Taste only"]'::jsonb,
    '1'::jsonb,
    'Water quality testing ensures it is safe and suitable for animals.',
    ARRAY['Multiple parameters.', 'Health and productivity.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd5e4d288-7bdb-59e8-93da-9666aa12d02d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Why should water containers be cleaned regularly?',
    '["For appearance", "Algae and bacteria grow in dirty containers, contaminating the water", "Animals prefer clean containers", "To save water"]'::jsonb,
    '1'::jsonb,
    'Dirty containers breed pathogens that can make animals sick.',
    ARRAY['Biofilm buildup.', 'Regular cleaning needed.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '22b2a753-2c93-5870-9f6f-208f946b65e1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'fill_in_blank',
    'Name one sign that livestock are not getting enough water.',
    NULL,
    '"reduced feed intake"'::jsonb,
    'Reduced feed intake, sunken eyes, dry skin, and reduced milk/egg production.',
    ARRAY['Multiple symptoms.', 'Early detection.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b8b9af77-c07e-5471-9ecc-ffee4e40244f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Why is the timing of water provision important for poultry?',
    '["It is not important", "Chickens drink most water in the morning and during hot periods; consistent access is critical", "Only at night", "Only before feeding"]'::jsonb,
    '1'::jsonb,
    'Poultry need water throughout the day, especially during heat stress.',
    ARRAY['Demand patterns.', 'Always available.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e7a5bcfd-5ea4-50fc-a8b7-2d022f0c3d2e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'fill_in_blank',
    'A farmer''s cattle are producing less milk than expected. Water supply is inconsistent. Explain the connection.',
    NULL,
    '"milk is mostly water"'::jsonb,
    'Milk is 87% water — insufficient water directly reduces milk production.',
    ARRAY['Direct relationship.', 'Water = milk production.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '290bd731-079c-5802-8f73-a3f5fa5ba5b8',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'fill_in_blank',
    'How does water quality affect animal productivity?',
    NULL,
    '"health"'::jsonb,
    'Poor water quality reduces intake, causes disease, and lowers growth, milk, and egg production.',
    ARRAY['Multiple impacts.', 'Quality matters.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '77751a00-98a0-5f67-add2-8094c2ad9ed4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Why do young animals need more water per kg of body weight than adults?',
    '["They drink less", "They have higher metabolic rates and growth demands", "They are smaller", "They do not need more"]'::jsonb,
    '1'::jsonb,
    'Higher metabolic rates in young animals mean proportionally greater water needs.',
    ARRAY['Growth demands.', 'Metabolic rate.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fa7ccb92-3286-5e7a-9f6b-533a4dcb1e6c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Compare the water needs of cattle and poultry per kg of body weight.',
    '["They are the same", "Cattle need less per kg because they get more from feed; poultry need more per kg", "Poultry need less", "Water needs are random"]'::jsonb,
    '1'::jsonb,
    'Poultry have higher water requirements per kg due to higher metabolic rate and no sweating.',
    ARRAY['Species differences.', 'Metabolic factors.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a28ffc73-2b08-5e02-ae11-b536816dba56',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'fill_in_blank',
    'A farmer collects rainwater for livestock. What precautions should they take?',
    NULL,
    '"clean storage"'::jsonb,
    'Use clean containers, prevent contamination, and treat if necessary before use.',
    ARRAY['Rainwater harvesting.', 'Quality control.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '22dae83d-4a0b-5457-bb71-2ed78baa019a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'multiple_choice',
    'Why is it important to provide water near feeding areas?',
    '["For convenience only", "Animals eat more when water is readily available, improving feed conversion", "To save land", "Animals prefer it"]'::jsonb,
    '1'::jsonb,
    'Easy access to water encourages feed intake and improves productivity.',
    ARRAY['Practical design.', 'Better intake.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0617898c-6058-5863-8774-5b6f45be4a1c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.2.4.2'), NULL, 'fill_in_blank',
    'Suggest two ways a small-scale farmer in Ghana can ensure clean water for their livestock.',
    NULL,
    '"boiling"'::jsonb,
    'Boiling or treating water, cleaning containers daily, and using protected water sources.',
    ARRAY['Simple methods.', 'Affordable solutions.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.3.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6a71baf7-a134-5600-83c7-ca35f2d4c981',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'fill_in_blank',
    'Humans have ___ types of teeth.',
    NULL,
    '"four"'::jsonb,
    'Four types: incisors, canines, premolars, molars.',
    ARRAY['Different functions.', 'Each type specialized.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ad6c2ebe-97e3-562a-8e56-8852be1f276d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'Incisors are used for:',
    '["Grinding food", "Biting and cutting food", "Tearing food", "Crushing food"]'::jsonb,
    '1'::jsonb,
    'Incisors are sharp, flat teeth at the front for biting.',
    ARRAY['Chisel-shaped.', 'Front teeth.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '04ebfb31-717c-5c56-b6f5-645dc8a24e0a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'Canines are used for:',
    '["Grinding", "Cutting", "Tearing and piercing food", "Holding food"]'::jsonb,
    '2'::jsonb,
    'Canines are pointed teeth used for tearing.',
    ARRAY['Sharp and pointed.', 'Next to incisors.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '374f52c3-80d6-5382-bc2b-6764c5448d28',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'Molars are used for:',
    '["Biting", "Tearing", "Grinding and crushing food", "Cutting"]'::jsonb,
    '2'::jsonb,
    'Molars have broad, flat surfaces for grinding.',
    ARRAY['Back teeth.', 'Strong chewing surfaces.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dccbee7b-49a2-566a-b6d4-f70d7071bc91',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'fill_in_blank',
    'An adult human has ___ teeth in total.',
    NULL,
    '"32"'::jsonb,
    'Adults have 32 teeth: 8 incisors, 4 canines, 8 premolars, 12 molars (including 4 wisdom teeth).',
    ARRAY['Permanent teeth.', 'Full set.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'df99774c-1b4a-5573-b63a-0139214e3346',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'fill_in_blank',
    'Children have ___ primary (milk) teeth.',
    NULL,
    '"20"'::jsonb,
    'Children have 20 milk teeth that are replaced by permanent teeth.',
    ARRAY['Temporary teeth.', 'Start falling at age 6.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b1373f91-78a6-5a94-b8b8-a27e27a06eac',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'Herbivores have more ___ teeth for grinding plant material.',
    'null'::jsonb,
    '"\"molar\""'::jsonb,
    'Herbivores have large, flat molars for grinding tough plant material.',
    ARRAY['Grinding surfaces.', 'Plant diet adaptation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '043d03eb-dd53-5592-8c38-43b32bad054f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'fill_in_blank',
    'Carnivores have large ___ for tearing meat.',
    NULL,
    '"canines"'::jsonb,
    'Carnivores have prominent canines for piercing and tearing flesh.',
    ARRAY['Sharp, pointed.', 'Predator adaptation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4b46e57c-df43-5692-8b5c-b207bf5eab0d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'A horse is a herbivore. Its teeth would have:',
    '["Large canines", "Many molars with flat grinding surfaces", "Sharp incisors only", "No molars"]'::jsonb,
    '1'::jsonb,
    'Horse teeth are adapted for grinding grass — large, flat molars.',
    ARRAY['Herbivore adaptation.', 'Continuous grinding.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '59674221-9b64-503d-a185-bd0dce4e6dd9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'A lion is a carnivore. Its teeth would have:',
    '["Flat molars only", "Large canines and sharp carnassials for cutting meat", "Small incisors", "No canines"]'::jsonb,
    '1'::jsonb,
    'Lions have large canines and sharp carnassial teeth for a meat diet.',
    ARRAY['Carnivore adaptation.', 'Tearing and cutting.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '97f2fc26-e3a3-57ad-9c19-4902c6de210b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'Humans are omnivores. How does our dental formula reflect this?',
    '["We have only molars", "We have a mix of incisors, canines, and molars for eating both plants and meat", "We have no canines", "We have only incisors"]'::jsonb,
    '1'::jsonb,
    'Human teeth reflect an omnivorous diet — different types for different foods.',
    ARRAY['Mixed diet adaptation.', 'Versatile teeth.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8d47a876-8f07-5a12-ae70-24c140df7e16',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'Tooth decay is caused by:',
    '["Too much water", "Bacteria producing acids that dissolve tooth enamel", "Brushing too hard", "Eating vegetables"]'::jsonb,
    '1'::jsonb,
    'Bacteria in the mouth feed on sugars and produce acids that erode enamel.',
    ARRAY['Dental caries.', 'Sugar and bacteria.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'edaf88e8-0b89-59bf-bfcd-8204715eb7b7',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'Why do herbivores have flat teeth while carnivores have sharp teeth?',
    '["Random difference", "Teeth shape reflects diet \u2014 flat for grinding plants, sharp for tearing meat", "Size difference only", "Age difference"]'::jsonb,
    '1'::jsonb,
    'Dental adaptations match the animal''s diet and feeding strategy.',
    ARRAY['Form follows function.', 'Evolutionary adaptation.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7cbd4555-64bb-5f6a-964d-115cb17552f8',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'fill_in_blank',
    'An animal has teeth on one side of its jaw only (like a rodent). How does this affect its diet?',
    NULL,
    '"gnawing"'::jsonb,
    'Rodents have continuously growing incisors for gnawing — they must gnaw to keep teeth worn down.',
    ARRAY['Open-rooted teeth.', 'Constant growth.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'deda9346-5fc9-5b25-b524-80fcdba2dbc3',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'fill_in_blank',
    'Why is it important to brush teeth twice daily?',
    NULL,
    '"plaque removal"'::jsonb,
    'Brushing removes plaque (bacteria film) that produces acids causing tooth decay.',
    ARRAY['Preventive care.', 'Dental hygiene.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0af1dc79-c058-51ee-bc4e-3c1532aad48f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'A cow chews its food multiple times (chewing the cud). How does its dentition support this?',
    '["Cows have no upper front teeth", "Cows have a dental pad instead of upper incisors and strong molars for grinding", "Cows have sharp canines", "Cows have the same teeth as humans"]'::jsonb,
    '1'::jsonb,
    'Cows have a dental pad and powerful molars for grinding fibrous plant material repeatedly.',
    ARRAY['Ruminant adaptation.', 'Cud chewing.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0945b35e-8893-5c24-b84b-465b7d4e5114',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'fill_in_blank',
    'Explain why dental formula (counting teeth) is useful for classifying animals.',
    NULL,
    '"diet classification"'::jsonb,
    'Dental formula reveals diet type (herbivore, carnivore, omnivore) and helps identify species.',
    ARRAY['Diagnostic tool.', 'Taxonomic value.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '84af48c2-261b-5aad-884d-a920267b4024',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'Why do wisdom teeth often need to be removed in humans?',
    '["They are useless", "Modern jaws are smaller, so wisdom teeth may not have room and become impacted", "They grow too fast", "They are always decayed"]'::jsonb,
    '1'::jsonb,
    'Modern human diets (softer food) led to smaller jaws — wisdom teeth may not fit.',
    ARRAY['Evolutionary mismatch.', 'Space issues.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2770cc04-6d59-56a0-a341-6c2e37405989',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'multiple_choice',
    'How does a shark''s tooth structure differ from a mammal''s?',
    '["No difference", "Sharks have rows of replaceable teeth; mammals have two sets (baby and adult)", "Sharks have no teeth", "Mammals replace teeth continuously"]'::jsonb,
    '1'::jsonb,
    'Sharks continuously replace lost teeth throughout their lives.',
    ARRAY['Polyphyodont.', 'Always growing new teeth.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f4cf6750-fe6b-5c84-b2ce-ba30c63e8a73',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.1.1'), NULL, 'fill_in_blank',
    'Name two ways to prevent tooth decay besides brushing.',
    NULL,
    '"fluoride"'::jsonb,
    'Fluoride treatment, reducing sugar intake, regular dental check-ups, and flossing.',
    ARRAY['Multiple strategies.', 'Prevention is key.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.3.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '60997fe9-f9bb-5802-ab88-d13c04fe942a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'The four outer planets are:',
    '["Mercury, Venus, Earth, Mars", "Jupiter, Saturn, Uranus, Neptune", "Pluto, Mars, Jupiter, Saturn", "Venus, Earth, Uranus, Neptune"]'::jsonb,
    '1'::jsonb,
    'Jupiter, Saturn, Uranus, Neptune — the gas and ice giants.',
    ARRAY['Beyond the asteroid belt.', 'Much larger than inner planets.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6e7338cf-2ed9-5572-ae70-16ac3c8708bb',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'The largest planet in our solar system is:',
    '["Saturn", "Neptune", "Jupiter", "Uranus"]'::jsonb,
    '2'::jsonb,
    'Jupiter is the largest planet — more than 1,300 Earths could fit inside.',
    ARRAY['Gas giant.', 'Massive atmosphere.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9639a715-0ad6-5ffc-b055-48dfdf28e8d4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Saturn is famous for its:',
    '["Red spot", "Rings", "Moons", "Blue colour"]'::jsonb,
    '1'::jsonb,
    'Saturn''s prominent ring system is made of ice and rock particles.',
    ARRAY['Visible with telescope.', 'Ice and rock.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '74c5a87b-7967-51f9-8f1f-15b7303b4b40',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'The outer planets are also called:',
    '["Terrestrial planets", "Gas giants (and ice giants)", "Dwarf planets", "Asteroids"]'::jsonb,
    '1'::jsonb,
    'Jupiter and Saturn are gas giants; Uranus and Neptune are ice giants.',
    ARRAY['Composed mainly of gas/ice.', 'Much larger than Earth.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '46589d42-fdd5-56d3-add3-7994a2f01b33',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'The planet farthest from the sun is:',
    '["Uranus", "Neptune", "Saturn", "Pluto"]'::jsonb,
    '1'::jsonb,
    'Neptune is the farthest planet from the sun.',
    ARRAY['Orbits take 165 Earth years.', 'Very cold.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c4de708f-7b72-50e1-9ec1-6903425fb4ec',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Jupiter''s Great Red Spot is a:',
    '["Red mountain", "Giant storm that has lasted for centuries", "Red ocean", "Crater"]'::jsonb,
    '1'::jsonb,
    'The Great Red Spot is an anticyclonic storm larger than Earth.',
    ARRAY['Centuries old.', 'Massive hurricane.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6b9eebf2-3893-5ecb-bc42-c8c8600afb9e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Uranus is unique because it:',
    '["Has no moons", "Rotates on its side (extreme axial tilt of 98 degrees)", "Is the smallest planet", "Has rings"]'::jsonb,
    '1'::jsonb,
    'Uranus rotates nearly on its side, possibly due to an ancient collision.',
    ARRAY['Extreme tilt.', 'Rolling motion.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '890deef8-5678-58f9-8dc8-db4a9ffa011e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Why are the outer planets much larger than the inner planets?',
    '["They formed first", "They accumulated more gas and ice due to their distance from the sun", "They have more moons", "They are older"]'::jsonb,
    '1'::jsonb,
    'Beyond the frost line, ices and gases condensed, allowing planets to grow massive.',
    ARRAY['Frost line concept.', 'Gas accumulation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2e8c982a-5b09-5b23-bbee-b67112026565',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'How many moons does Jupiter have?',
    '["1", "12", "95", "0"]'::jsonb,
    '2'::jsonb,
    'Jupiter has 95 known moons, including the four large Galilean moons.',
    ARRAY['Many satellites.', 'Io, Europa, Ganymede, Callisto.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '725f4955-3fb3-5be1-8a8b-988d4a56200f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Neptune appears blue because:',
    '["It is made of water", "Methane in its atmosphere absorbs red light and reflects blue", "It reflects Earth''s oceans", "It is very hot"]'::jsonb,
    '1'::jsonb,
    'Methane in Neptune''s atmosphere absorbs red wavelengths, giving it a blue colour.',
    ARRAY['Atmospheric composition.', 'Light absorption.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e705b16e-c20b-594d-a023-3f6fe717956f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Why can the outer planets not support life as we know it?',
    '["They are too far away", "They have no solid surfaces, extreme pressures, and very low temperatures", "They have no water", "They have too many moons"]'::jsonb,
    '1'::jsonb,
    'Gas giants have no solid surface, crushing pressure, and extreme cold.',
    ARRAY['Harsh conditions.', 'No solid ground.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9cc52ee0-e20c-5b76-b68b-64e5765378fa',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Saturn''s rings are made of:',
    '["Gas", "Ice and rock particles of various sizes", "Solid rock", "Metal"]'::jsonb,
    '1'::jsonb,
    'Saturn''s rings are billions of ice and rock particles orbiting the planet.',
    ARRAY['Particle sizes vary.', 'Visible from Earth.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4b9315f9-ef4f-58a4-b875-c4b9d2b3b5dc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Which outer planet has the strongest magnetic field?',
    '["Saturn", "Neptune", "Jupiter", "Uranus"]'::jsonb,
    '2'::jsonb,
    'Jupiter has the strongest magnetic field of any planet.',
    ARRAY['20,000 times Earth''s.', 'Protective magnetosphere.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '60c81fcb-476c-5b4a-859d-852591d7c3f3',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Why was Pluto reclassified as a dwarf planet?',
    '["It is too small", "It has not cleared its orbital neighbourhood of other objects", "It has no moons", "It is too far away"]'::jsonb,
    '1'::jsonb,
    'Pluto shares its orbital space with other Kuiper Belt objects.',
    ARRAY['IAU 2006 definition.', 'Orbital dominance.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cc52330b-daeb-5df4-98a6-105537d300f6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'fill_in_blank',
    'Could humans ever live on an outer planet? Explain.',
    NULL,
    '"no"'::jsonb,
    'No — gas giants have no solid surface; ice giants have extreme cold and pressure.',
    ARRAY['No landing surface.', 'Extreme conditions.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0315e6b7-814e-5c7f-a73d-49f4522b62ed',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'fill_in_blank',
    'Why do the outer planets have many moons while inner planets have few?',
    NULL,
    '"gravity"'::jsonb,
    'Outer planets'' stronger gravity captured more objects as moons during formation.',
    ARRAY['Gravitational capture.', 'Size advantage.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9abc27f7-e109-52c1-abd1-86ea18ccc99b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'fill_in_blank',
    'A spacecraft visiting Jupiter would face what challenges?',
    NULL,
    '"radiation"'::jsonb,
    'Intense radiation from Jupiter''s magnetosphere and extreme atmospheric pressure.',
    ARRAY['Juno mission challenges.', 'Radiation belts.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '512a2b5a-2795-5885-be2e-12299c6b0260',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Why is Europa (Jupiter''s moon) of interest to scientists?',
    '["It has rings", "It may have a liquid ocean under its icy surface, possibly supporting life", "It is the largest moon", "It has volcanoes"]'::jsonb,
    '1'::jsonb,
    'Europa''s subsurface ocean could harbour microbial life.',
    ARRAY['Astrobiology target.', 'Ice shell.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dae939e3-a291-51bc-bb58-35dda778d049',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'multiple_choice',
    'Compare the composition of Jupiter (gas giant) and Neptune (ice giant).',
    '["They are identical", "Jupiter is mostly hydrogen and helium; Neptune has more water, ammonia, and methane ices", "Neptune is larger", "Jupiter is made of rock"]'::jsonb,
    '1'::jsonb,
    'Jupiter = gas (H, He). Neptune = ice (water, ammonia, methane) with gas atmosphere.',
    ARRAY['Different compositions.', 'Formation differences.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd338bbec-7609-537f-9833-eb266da1369b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.2.1'), NULL, 'fill_in_blank',
    'How do scientists know what the outer planets are made of?',
    NULL,
    '"spectroscopy"'::jsonb,
    'Spectroscopy analyses light reflected by planets, revealing atmospheric composition.',
    ARRAY['Remote sensing.', 'Light analysis.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.3.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6d818fd7-6a3c-5eb3-8d2f-618e708a9554',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'A food chain shows:',
    '["How animals move", "The transfer of energy from one organism to another", "How animals reproduce", "The water cycle"]'::jsonb,
    '1'::jsonb,
    'Food chains show energy flow through feeding relationships.',
    ARRAY['Producer → consumer chain.', 'Energy transfer.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3df64590-7925-5c1f-a045-88997fb4c4fe',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'The first organism in a food chain is always a:',
    '["Herbivore", "Carnivore", "Producer (green plant)", "Decomposer"]'::jsonb,
    '1'::jsonb,
    'Producers (plants) are always first — they capture energy from the sun.',
    ARRAY['Photosynthesis.', 'Energy base.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2943f316-56e4-5b06-a2ef-9ee5920aea76',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'A herbivore is also called a:',
    '["Primary consumer", "Secondary consumer", "Tertiary consumer", "Producer"]'::jsonb,
    '0'::jsonb,
    'Herbivores are primary consumers — they eat producers.',
    ARRAY['First consumer level.', 'Plant eaters.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ebd4bb07-e4bb-5f3d-8085-14e92cfebb01',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'A carnivore that eats herbivores is a:',
    '["Producer", "Primary consumer", "Secondary consumer", "Decomposer"]'::jsonb,
    '2'::jsonb,
    'Secondary consumers eat primary consumers (herbivores).',
    ARRAY['Second trophic level.', 'Meat eaters.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '75728d4e-f4cb-54fd-a153-a60cc71766e9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'An organism that eats both plants and animals is called:',
    '["Herbivore", "Carnivore", "Omnivore", "Decomposer"]'::jsonb,
    '2'::jsonb,
    'Omnivores eat both plants and animals.',
    ARRAY['Humans, pigs, bears.', 'Flexible diet.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd722cf3c-806a-55d2-bd64-4e1cbb18f371',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'A food web is:',
    '["A single food chain", "A network of interconnected food chains", "A type of ecosystem", "A feeding schedule"]'::jsonb,
    '0'::jsonb,
    'Food webs show multiple feeding relationships in an ecosystem.',
    ARRAY['More realistic.', 'Complex interactions.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd4b7bbbf-b1c6-5581-bdb4-16882223cb7b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'In the food chain: grass → zebra → lion, the zebra is a:',
    '["Producer", "Primary consumer", "Secondary consumer", "Decomposer"]'::jsonb,
    '1'::jsonb,
    'Zebra eats grass (producer), making it a primary consumer.',
    ARRAY['Herbivore.', 'First consumer.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9d6dda10-db22-50bb-93ca-6b487c70fd9a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'fill_in_blank',
    'Approximately ___% of energy is transferred from one trophic level to the next.',
    NULL,
    '"10"'::jsonb,
    'About 10% of energy transfers between trophic levels; 90% is lost as heat.',
    ARRAY['Energy pyramid.', 'Very inefficient.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a7515332-10a0-5eab-9b05-c10c52183816',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'Why are there fewer top predators than herbivores in an ecosystem?',
    '["Predators are lazy", "Less energy is available at higher trophic levels, supporting fewer organisms", "Herbivores eat more", "Predators are smaller"]'::jsonb,
    '1'::jsonb,
    'Energy decreases up the food chain — fewer organisms can be supported.',
    ARRAY['Energy limitation.', 'Pyramid of numbers.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e0b8faaa-97f8-5623-97c2-c83a2c044404',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'If all producers in an ecosystem died, what would happen?',
    '["Nothing", "All consumers would eventually die from lack of energy", "Only herbivores would die", "The ecosystem would adapt"]'::jsonb,
    '1'::jsonb,
    'Without producers, there is no energy source — the entire food chain collapses.',
    ARRAY['Energy foundation.', 'Cascading effect.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0800006b-71ff-5828-81b7-5581844a1b6c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'Dotted arrows in food webs represent:',
    '["Water flow", "Energy flow direction (from eaten to eater)", "Migration patterns", "Reproduction"]'::jsonb,
    '1'::jsonb,
    'Arrows in food webs show the direction of energy transfer.',
    ARRAY['From food to consumer.', 'Not predator direction.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '97c2d585-8553-5a0b-9e71-ac6b27f8013b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'Why is it important to study feeding relationships?',
    '["For fun", "To understand ecosystem balance, predict effects of species loss, and manage wildlife", "To count animals", "To name species"]'::jsonb,
    '1'::jsonb,
    'Understanding food webs helps predict and manage ecosystem changes.',
    ARRAY['Conservation tool.', 'Management basis.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '23c35fa3-8b69-53fa-959a-5e9a7247ef20',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'A farmer removes all snakes from their farm. What might happen to the rodent population?',
    '["Nothing", "Rodent population would increase without predator control", "Rodents would decrease", "Snakes would return"]'::jsonb,
    '1'::jsonb,
    'Without snakes (predators), rodent populations would explode.',
    ARRAY['Predator removal effect.', 'Population imbalance.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '41f9a131-1d61-54a7-86ae-1f1660da56cc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'fill_in_blank',
    'Why do deep-sea ecosystems rely on organisms other than plants for energy?',
    NULL,
    '"no sunlight"'::jsonb,
    'Deep sea has no sunlight, so producers use chemosynthesis instead of photosynthesis.',
    ARRAY['Hydrothermal vents.', 'Chemical energy.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '67522fa9-c531-5ab6-bbba-739a054e0254',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'fill_in_blank',
    'An owl eats mice that eat grain. Draw this food chain and identify each trophic level.',
    NULL,
    '"grain-mouse-owl"'::jsonb,
    'Grain (producer) → Mouse (primary consumer) → Owl (secondary consumer).',
    ARRAY['Three levels.', 'Energy flow direction.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c086d886-263b-5362-8583-d4271609685e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'Why are decomposers sometimes placed at the side of food webs rather than in the chain?',
    '["They are not important", "Decomposers feed on dead organisms at all trophic levels, not just one", "They are too small", "They only eat plants"]'::jsonb,
    '1'::jsonb,
    'Decomposers recycle nutrients from all levels, so they connect to everything.',
    ARRAY['Omnivorous recyclers.', 'Side placement.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '289251b7-560a-5837-8b4a-3db7b7884f2d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'fill_in_blank',
    'If a pesticide kills insects in a food web, how might this affect birds and fish?',
    NULL,
    '"food shortage"'::jsonb,
    'Birds and fish that eat insects would face food shortage, potentially declining in population.',
    ARRAY['Cascade effect.', 'Trophic cascade.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9a38ee65-a513-5d3f-a7e5-706e745c1b8e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'fill_in_blank',
    'Why is the sun the ultimate source of energy for most food chains?',
    NULL,
    '"photosynthesis"'::jsonb,
    'Plants capture solar energy through photosynthesis, which is then passed through the food chain.',
    ARRAY['Energy origin.', 'Foundation of food webs.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '54926790-1d50-59a7-9292-4bb3fabb6b4d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'multiple_choice',
    'A pyramid of energy shows that:',
    '["Energy increases at higher levels", "Energy decreases at higher trophic levels due to heat loss", "Energy is constant", "Energy disappears"]'::jsonb,
    '1'::jsonb,
    'Energy pyramids always narrow upward — less energy at each higher level.',
    ARRAY['10% rule.', 'Thermodynamic loss.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7b9dd3fd-a91b-5824-b920-228752ff14c5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.3.1'), NULL, 'fill_in_blank',
    'Explain why overfishing can collapse an ocean ecosystem.',
    NULL,
    '"trophic cascade"'::jsonb,
    'Removing too many fish disrupts food webs — predators lose prey, prey populations may explode or collapse.',
    ARRAY['Ecosystem balance.', 'Cascade effects.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.3.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8827c8f5-d35e-58ca-a87d-ae4a0049ad68',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'Mixed farming combines:',
    '["Only crops", "Crops and livestock on the same farm", "Only fish farming", "Only tree farming"]'::jsonb,
    '1'::jsonb,
    'Mixed farming integrates crop and animal production.',
    ARRAY['Diversified income.', 'Nutrient cycling.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e552eb0b-fe24-514b-bec7-44a058ed1434',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'Agroforestry combines:',
    '["Animals only", "Trees with crops or livestock", "Fish and crops", "Only trees"]'::jsonb,
    '1'::jsonb,
    'Agroforestry integrates trees with agricultural production.',
    ARRAY['Trees + crops/animals.', 'Multiple benefits.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3814c6e5-4125-5edc-ba6f-8815f0639101',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'Crop rotation is growing:',
    '["The same crop repeatedly", "Different crops in sequence on the same land", "Only vegetables", "Only grains"]'::jsonb,
    '1'::jsonb,
    'Crop rotation is a planned sequence of different crops.',
    ARRAY['Soil health.', 'Pest management.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2c6c5988-0096-5e3a-8436-4c9965ef1640',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'Intercropping is growing:',
    '["One crop at a time", "Two or more crops simultaneously in the same field", "Only in rows", "Only in greenhouses"]'::jsonb,
    '1'::jsonb,
    'Intercropping grows multiple crops together.',
    ARRAY['Space efficiency.', 'Complementary growth.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '61c4d917-5f42-582b-ac17-ce3595721c81',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'A silvopastoral system combines:',
    '["Fish and trees", "Trees, pasture, and livestock", "Crops and fish", "Only crops"]'::jsonb,
    '1'::jsonb,
    'Silvopastoral = trees + grass + grazing animals.',
    ARRAY['Agroforestry type.', 'Shade and fodder.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0a243a6e-702b-5acb-af0d-ed3c336448bb',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'The advantage of integrating crops and animals is:',
    '["More work", "Nutrient cycling \u2014 animal manure fertilises crops, crop residues feed animals", "Less production", "Higher costs"]'::jsonb,
    '1'::jsonb,
    'Animals provide manure; crops provide feed — mutual benefit.',
    ARRAY['Closed loop.', 'Sustainable system.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '41e30557-849d-59cf-8d5f-d7a99c05bb40',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'Why is crop rotation better for soil than monoculture?',
    '["It is not better", "Different crops use and return different nutrients, maintaining soil balance", "It produces less", "It requires more water"]'::jsonb,
    '1'::jsonb,
    'Rotation prevents nutrient depletion and breaks pest cycles.',
    ARRAY['Nutrient balance.', 'Pest interruption.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c86eb459-b710-560f-82b2-c9cbd73e7aff',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'In Ghana, a common rotation is maize followed by cowpea because:',
    '["They taste similar", "Cowpea (legume) fixes nitrogen, benefiting the next maize crop", "Maize fixes nitrogen", "They need the same nutrients"]'::jsonb,
    '1'::jsonb,
    'Legumes add nitrogen to the soil, reducing fertiliser needs for the next crop.',
    ARRAY['Nitrogen fixation.', 'Soil improvement.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e017dd96-fb53-5431-886e-915ca24a4ed4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'Why do small-scale farmers in Ghana prefer mixed farming?',
    '["Government policy", "It reduces risk \u2014 if one enterprise fails, others provide income", "It is easier", "It needs less land"]'::jsonb,
    '1'::jsonb,
    'Risk diversification — crop failure can be offset by livestock income.',
    ARRAY['Risk management.', 'Food security.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ffad808b-9220-553e-b7fa-afaeab0891fb',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'An agroforestry system with nitrogen-fixing trees benefits crops by:',
    '["Shading them completely", "Adding nitrogen to the soil and reducing the need for chemical fertiliser", "Killing pests", "Producing fruit only"]'::jsonb,
    '1'::jsonb,
    'Nitrogen-fixing trees enrich the soil, benefiting companion crops.',
    ARRAY['Natural fertiliser.', 'Sustainable practice.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'da451663-e1bb-5cf4-9e3c-84f63ca2d31e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'fill_in_blank',
    'Name one challenge of integrated farming systems.',
    NULL,
    '"management complexity"'::jsonb,
    'More complex management, higher labour needs, and potential competition between crops and animals.',
    ARRAY['Skill requirements.', 'Labour intensive.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '56f74370-0e51-5631-9733-cbcc77c35194',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'Why is land-use planning important in integrated farming?',
    '["It is not important", "Proper layout prevents conflicts between crops and animals and maximises productivity", "To make the farm look nice", "Government requires it"]'::jsonb,
    '1'::jsonb,
    'Good planning separates incompatible activities and optimises resource use.',
    ARRAY['Spatial arrangement.', 'Efficiency.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '553814fe-8ffc-5bb1-af20-87af0b2aa459',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'fill_in_blank',
    'A farmer practises monoculture of maize for 5 years. Yields are declining. Explain why and suggest a solution.',
    NULL,
    '"soil depletion"'::jsonb,
    'Continuous maize depletes specific nutrients and allows maize-specific pests to build up. Solution: rotate with legumes.',
    ARRAY['Nutrient depletion.', 'Rotation benefit.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4faad1b8-611b-5883-8a36-a489a31271bd',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'fill_in_blank',
    'How does integrating fish ponds with crop farming benefit both enterprises?',
    NULL,
    '"nutrient recycling"'::jsonb,
    'Fish pond water (rich in nutrients) irrigates crops; crop waste feeds fish.',
    ARRAY['Mutual benefit.', 'Closed system.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f631b331-0b53-5f3e-9f03-1c3f281f2a26',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'Why might intercropping reduce pest damage compared to monoculture?',
    '["Pests get confused", "Diverse crops attract diverse predators and reduce pest habitat", "Monoculture has more pests", "Inter cropping kills pests"]'::jsonb,
    '1'::jsonb,
    'Crop diversity disrupts pest life cycles and supports natural predators.',
    ARRAY['Ecological pest control.', 'Diversity effect.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '744ac728-e4fa-50bf-ab36-f628897792a0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'multiple_choice',
    'Compare the productivity of monoculture vs integrated farming per hectare.',
    '["Monoculture is always higher", "Integrated can be higher because multiple products are harvested from the same land", "They are the same", "Depends only on weather"]'::jsonb,
    '1'::jsonb,
    'Integrated systems can produce more total output (crops + animal products) per hectare.',
    ARRAY['Land equivalent ratio.', 'Total productivity.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '05335716-94aa-5048-8586-6fc08f81822f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'fill_in_blank',
    'How does animal manure improve soil in integrated farming?',
    NULL,
    '"organic matter"'::jsonb,
    'Manure adds organic matter, improves soil structure, and provides nutrients (N, P, K).',
    ARRAY['Natural fertiliser.', 'Soil health improvement.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5aae137d-3ae6-50b3-8e8b-48b31c63f2dd',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'fill_in_blank',
    'Why is relay cropping (planting a new crop before the previous one is harvested) useful in Ghana?',
    NULL,
    '"continuous production"'::jsonb,
    'It maximises land use and ensures continuous food production throughout the year.',
    ARRAY['Time efficiency.', 'Food security.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '922e1edf-a562-52f7-83e7-cf8b4ecad438',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'fill_in_blank',
    'A farmer wants to start integrated farming. What factors should they consider?',
    NULL,
    '"market demand"'::jsonb,
    'Market demand, available land, water supply, labour, local conditions, and available resources.',
    ARRAY['Planning factors.', 'Context-dependent.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9696b2c5-8cae-536d-b827-f30dae28e5c6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.3.4.1'), NULL, 'fill_in_blank',
    'How can government policies support integrated farming in Ghana?',
    NULL,
    '"extension services"'::jsonb,
    'Provide extension services, subsidise inputs, improve market access, and fund research.',
    ARRAY['Policy support.', 'Agricultural development.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.4.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f9587371-2a4d-58c3-8e13-83c37e5ae4ae',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'fill_in_blank',
    'Energy conversion is the process of changing energy from one ___ to another.',
    NULL,
    '"form"'::jsonb,
    'Energy can be converted between different forms.',
    ARRAY['Fundamental concept.', 'Always conserved.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fdf543c4-97ea-5923-96a4-679d69bf4092',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'A light bulb converts electrical energy to:',
    '["Only heat", "Light and heat", "Only light", "Chemical energy"]'::jsonb,
    '1'::jsonb,
    'Light bulbs convert electrical energy to light and waste heat.',
    ARRAY['Not 100% efficient.', 'Some heat produced.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a178773a-b7ff-5dae-92b4-720a02c7ac07',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'A solar panel converts light energy to:',
    '["Heat only", "Electrical energy", "Chemical energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Photovoltaic cells convert light directly to electricity.',
    ARRAY['Photovoltaic effect.', 'Renewable conversion.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '70032466-3a66-5cc1-9586-08ca94874f77',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'fill_in_blank',
    'Photosynthesis converts light energy to ___ energy.',
    NULL,
    '"chemical"'::jsonb,
    'Plants convert light energy to chemical energy stored in glucose.',
    ARRAY['Energy storage.', 'Solar conversion.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '92e866d0-f643-5978-b726-b592a2da84ab',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'A car engine converts chemical energy in fuel to:',
    '["Only heat", "Kinetic energy and heat", "Electrical energy", "Light energy"]'::jsonb,
    '1'::jsonb,
    'Car engines convert fuel to motion and waste heat.',
    ARRAY['Internal combustion.', 'Not 100% efficient.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f24ecfe1-24a6-563a-ba49-322393f052cb',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'A generator converts mechanical energy to:',
    '["Heat energy", "Electrical energy", "Chemical energy", "Light energy"]'::jsonb,
    '1'::jsonb,
    'Generators convert rotation (mechanical) to electricity.',
    ARRAY['Electromagnetic induction.', 'Spinning coils.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '00ff1370-c4f3-59ab-96c3-aaaf8c141299',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'When you eat food, chemical energy is converted to:',
    '["Only heat", "Kinetic energy (movement) and heat", "Light energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Body converts food energy to movement and body heat.',
    ARRAY['Metabolism.', 'ATP production.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b7bbcbcf-ac55-5da6-9a03-900eb6b8e8a7',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'In a hydroelectric dam, the energy conversion is:',
    '["Chemical to electrical", "Potential \u2192 kinetic \u2192 electrical", "Nuclear to electrical", "Heat to electrical"]'::jsonb,
    '1'::jsonb,
    'Water (potential) falls (kinetic) turns turbines (electrical).',
    ARRAY['Three-step conversion.', 'Renewable energy.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2069332d-5058-55c8-89d0-d253fb78a8cd',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'An electric motor converts:',
    '["Electrical to mechanical", "Mechanical to electrical", "Chemical to heat", "Light to electrical"]'::jsonb,
    '0'::jsonb,
    'Electric motors convert electrical energy to mechanical rotation.',
    ARRAY['Opposite of generator.', 'Powers machines.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9a3f54df-6397-5224-b347-246c2a111103',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'Why is no energy conversion 100% efficient?',
    '["We are not trying", "Some energy is always converted to waste heat", "Machines are bad", "Energy disappears"]'::jsonb,
    '1'::jsonb,
    'Thermodynamics: some energy always becomes low-grade heat.',
    ARRAY['Second law.', 'Entropy.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aea31f0a-0f82-56a4-85b3-14096990defa',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'A battery converts chemical energy to:',
    '["Heat only", "Electrical energy", "Nuclear energy", "Light only"]'::jsonb,
    '1'::jsonb,
    'Batteries convert stored chemical energy to electrical energy.',
    ARRAY['Electrochemical reaction.', 'Portable power.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '21f92a73-5854-5248-83d6-dcb5dba6a889',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'Wind turbines convert kinetic energy of wind to:',
    '["Heat energy", "Electrical energy", "Chemical energy", "Nuclear energy"]'::jsonb,
    '1'::jsonb,
    'Wind turns blades, generating electricity.',
    ARRAY['Renewable source.', 'Kinetic to electrical.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fa10e0dc-8cc4-579d-a116-71daacad823e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'fill_in_blank',
    'Explain the energy conversions in a coal-fired power station.',
    NULL,
    '"chemical to electrical"'::jsonb,
    'Coal (chemical) → heat (steam) → mechanical (turbine) → electrical (generator).',
    ARRAY['Four-step chain.', 'Fossil fuel conversion.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e5572cdf-b582-5693-9da6-c9059d933f7a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'Why are LEDs more efficient than incandescent bulbs?',
    '["They are brighter", "LEDs convert more electrical energy to light, less to waste heat", "They are cheaper", "They last shorter"]'::jsonb,
    '1'::jsonb,
    'LEDs waste less energy as heat — higher efficiency.',
    ARRAY['Less waste heat.', 'Energy saving.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cd6cf740-ee1d-5eba-9316-e22b45f21c5a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'fill_in_blank',
    'A student rubs their hands together and they warm up. What energy conversion occurred?',
    NULL,
    '"kinetic to heat"'::jsonb,
    'Kinetic energy (moving hands) → heat energy (through friction).',
    ARRAY['Friction conversion.', 'Simple example.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7079a32d-b634-5824-8fbf-20ed363d46e7',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'fill_in_blank',
    'Why is energy conversion important for renewable energy?',
    NULL,
    '"sustainability"'::jsonb,
    'Renewable energy converts natural flows (sunlight, wind, water) to usable electricity without depleting resources.',
    ARRAY['Sustainable conversion.', 'No fuel needed.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8c7b7242-6f87-513a-b3b7-93cfd66582d5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'In a nuclear power station, what is the energy conversion chain?',
    '["Chemical to electrical", "Nuclear \u2192 heat \u2192 mechanical \u2192 electrical", "Light to electrical", "Kinetic to electrical"]'::jsonb,
    '1'::jsonb,
    'Nuclear fission produces heat → steam → turbine rotation → electricity.',
    ARRAY['Nuclear fission.', 'Uranium fuel.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '366b1191-99dd-536a-aec3-3701b5bf66b5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'Why does a bouncing ball eventually stop?',
    '["It loses energy", "Kinetic energy converts to heat and sound through impacts, eventually stopping", "Gravity stops it", "Air resistance only"]'::jsonb,
    '1'::jsonb,
    'Energy is dissipated as heat and sound with each bounce.',
    ARRAY['Energy dissipation.', 'Not destroyed.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '918c1b9b-a567-5633-93cc-36728993eafe',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'Compare the efficiency of a petrol car engine (25%) vs an electric motor (90%).',
    '["Petrol is more efficient", "Electric motors waste far less energy as heat", "They are equal", "Efficiency does not matter"]'::jsonb,
    '1'::jsonb,
    'Electric motors convert 90% of energy to motion; petrol engines only 25% (rest is heat).',
    ARRAY['Efficiency comparison.', 'Electric advantage.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '07abc7ef-9a98-5c1f-950b-9135347b4d07',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.1'), NULL, 'multiple_choice',
    'A torch battery converts chemical energy to electrical energy. Where does the remaining energy go?',
    '["Nowhere", "Some is lost as heat in the internal resistance of the battery", "It is stored", "It becomes light"]'::jsonb,
    '1'::jsonb,
    'Internal resistance generates heat — not all chemical energy becomes useful electricity.',
    ARRAY['Energy loss mechanism.', 'Battery efficiency.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.4.1.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c22f04e3-a3cc-56b1-ab1f-a93a86920b93',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Renewable energy sources can be:',
    '["Used only once", "Replenished naturally in a short time", "Used up permanently", "Only used in summer"]'::jsonb,
    '1'::jsonb,
    'Renewable sources are naturally replenished — sun, wind, water.',
    ARRAY['Sustainable.', 'Never run out.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fbaf54f6-bc9a-52dc-a4a4-ca536df7c320',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Non-renewable energy sources include:',
    '["Solar and wind", "Fossil fuels (coal, oil, natural gas)", "Hydroelectric", "Geothermal"]'::jsonb,
    '1'::jsonb,
    'Fossil fuels are non-renewable — they take millions of years to form.',
    ARRAY['Finite resources.', 'Will run out.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ffac153b-72f7-5567-9dd1-c3f98f292ef9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Solar energy is renewable because:',
    '["It is cheap", "The sun continuously provides energy", "It produces no pollution", "It works at night"]'::jsonb,
    '1'::jsonb,
    'The sun will provide energy for billions of years.',
    ARRAY['Abundant.', 'Always available.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '245db559-00c9-5004-8057-79b9a0c9e86f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'fill_in_blank',
    'Coal is a ___ energy source.',
    NULL,
    '"non-renewable"'::jsonb,
    'Coal is non-renewable — formed over millions of years from dead plants.',
    ARRAY['Fossil fuel.', 'Finite supply.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd1c2d353-7d76-5ac3-9b5c-db678f7c3a7c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Wind energy is:',
    '["Non-renewable", "Renewable and clean", "Only available in winter", "Harmful to the environment"]'::jsonb,
    '1'::jsonb,
    'Wind is renewable, clean, and available everywhere.',
    ARRAY['No emissions.', 'Kinetic energy source.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a5ef4b76-1d25-5718-a7c4-24eb78ac443b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Which is NOT a renewable energy source?',
    '["Solar", "Wind", "Natural gas", "Hydroelectric"]'::jsonb,
    '2'::jsonb,
    'Natural gas is a fossil fuel — non-renewable.',
    ARRAY['Fossil fuel.', 'Methane-based.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ef94f4e0-03b7-5fb1-9bf0-cb9e116b9fba',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Advantages of renewable energy include:',
    '["Always available everywhere", "No fuel costs, low emissions, sustainable supply", "No infrastructure needed", "Always cheaper"]'::jsonb,
    '1'::jsonb,
    'Renewables have no fuel costs and produce little pollution.',
    ARRAY['Long-term benefits.', 'Environmental advantage.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd6d32f2e-1d31-5996-b04c-f585fc262508',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Disadvantages of renewable energy include:',
    '["They cause pollution", "Some are intermittent (solar, wind) and require storage", "They are not sustainable", "They are too expensive always"]'::jsonb,
    '1'::jsonb,
    'Solar and wind depend on weather; energy storage is a challenge.',
    ARRAY['Intermittency issue.', 'Storage needed.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '00d52a7a-7b69-5729-8f51-354aabc752b0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Biomass energy is renewable because:',
    '["It comes from fossils", "Plants can be regrown relatively quickly", "It is very powerful", "It produces no CO2"]'::jsonb,
    '1'::jsonb,
    'Biomass (wood, crop waste) is renewable as plants can be replanted.',
    ARRAY['Carbon neutral potential.', 'Regrowth cycle.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f70e3c39-5330-5608-9e97-9bbc786c6787',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Geothermal energy comes from:',
    '["The sun", "Heat from the Earth''s interior", "Wind", "Water"]'::jsonb,
    '1'::jsonb,
    'Geothermal energy uses heat from deep underground.',
    ARRAY['Earth''s internal heat.', 'Hot springs, volcanoes.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c326a859-a859-5f3a-953a-6af143f31c9a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Why are fossil fuels considered non-renewable?',
    '["They pollute", "They form over millions of years, much slower than we use them", "They are expensive", "They are underground"]'::jsonb,
    '1'::jsonb,
    'Formation takes millions of years; consumption is nearly instantaneous.',
    ARRAY['Timescale mismatch.', 'Finite stock.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '010f4da0-310b-5cd5-bde0-71412f18367e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'fill_in_blank',
    'Name one advantage of solar energy for Ghana.',
    NULL,
    '"abundant sunshine"'::jsonb,
    'Ghana has abundant sunshine year-round, making solar energy highly suitable.',
    ARRAY['Geographic advantage.', 'Tropical location.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4331ec9d-945b-5add-ab23-25886525adfe',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Why might a country choose to use a mix of renewable and non-renewable energy?',
    '["Only for cost", "Different sources suit different needs; renewables for sustainability, non-renewables for reliability", "Because renewables are unreliable", "Government policy only"]'::jsonb,
    '1'::jsonb,
    'Energy mix ensures reliability while transitioning to renewables.',
    ARRAY['Transition strategy.', 'Balanced approach.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c2d93f7d-bdaa-543d-9e31-48664f6d59b4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'fill_in_blank',
    'How does using renewable energy help reduce climate change?',
    NULL,
    '"lower emissions"'::jsonb,
    'Renewables produce little to no greenhouse gas emissions during operation.',
    ARRAY['No combustion.', 'Climate benefit.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '60ca9b03-309f-5ab2-a56c-44f9a279565e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'fill_in_blank',
    'A rural village in Ghana has no electricity grid. What renewable solution would you suggest?',
    NULL,
    '"solar panels"'::jsonb,
    'Solar panels with battery storage can provide off-grid electricity.',
    ARRAY['Solar home systems.', 'Independent power.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '726adbbe-ed73-52b3-9b76-522731b6751b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Why is hydroelectric power considered both renewable and potentially harmful?',
    '["It is not renewable", "Water is renewable, but dams can flood habitats and displace communities", "It produces pollution", "It is too expensive"]'::jsonb,
    '1'::jsonb,
    'The water cycle renews the resource, but dams have environmental and social costs.',
    ARRAY['Renewable source, environmental cost.', 'Trade-offs.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b88d7814-2a7c-57d0-9621-d9fe23d6348d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'fill_in_blank',
    'If Ghana runs out of oil, what energy alternatives are available?',
    NULL,
    '"solar, wind, hydro"'::jsonb,
    'Ghana has solar, wind, hydroelectric, and biomass resources as alternatives.',
    ARRAY['Resource assessment.', 'Energy independence.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '50c0b25a-9865-542f-a5a7-bbf60dae61da',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Why do some people oppose wind farms?',
    '["Wind is unreliable", "Noise, visual impact, and bird mortality are concerns", "Wind farms are too efficient", "They produce too much electricity"]'::jsonb,
    '1'::jsonb,
    'Concerns include noise, aesthetics, and wildlife impact.',
    ARRAY['Environmental concerns.', 'Local opposition.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2a069fc4-26ef-5661-85c7-403e032de6f7',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'fill_in_blank',
    'Explain why energy conservation is as important as switching to renewables.',
    NULL,
    '"reducing demand"'::jsonb,
    'Conserving energy reduces total demand, making it easier to meet needs with renewables.',
    ARRAY['Demand reduction.', 'Complementary strategies.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '36dd754f-5fc3-5ed8-971e-641f2a04b7bb',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.2'), NULL, 'multiple_choice',
    'Which renewable energy source is most suitable for Ghana''s northern regions?',
    '["Tidal energy", "Solar energy (high solar radiation)", "Geothermal", "Wave energy"]'::jsonb,
    '1'::jsonb,
    'Northern Ghana receives intense sunshine year-round — ideal for solar.',
    ARRAY['Geographic advantage.', 'Climate suitability.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.4.1.3
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '21faf829-828b-5e6a-af00-3a8f3b3d08ea',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Temperature is a measure of:',
    '["Total energy", "The average kinetic energy of particles", "The amount of heat", "The speed of an object"]'::jsonb,
    '1'::jsonb,
    'Temperature measures average kinetic energy of particles.',
    ARRAY['Hotter = faster particles.', 'Average, not total.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '37666077-4bbf-5838-ad38-075ce110f636',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Heat is:',
    '["Temperature", "Energy transferred from a hotter to a cooler body", "The same as temperature", "Only in solids"]'::jsonb,
    '1'::jsonb,
    'Heat is energy in transit due to temperature difference.',
    ARRAY['Transfer of energy.', 'Hot to cold.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '803daee5-9021-57b6-9426-20426312ab22',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'The SI unit of temperature is:',
    '["Celsius", "Fahrenheit", "Kelvin", "Joule"]'::jsonb,
    '2'::jsonb,
    'The SI unit is Kelvin (K). Celsius is commonly used.',
    ARRAY['Absolute scale.', '0K = absolute zero.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bd85c105-aac8-5092-8a02-d71ec0f3ac1e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'The SI unit of heat energy is the:',
    '["Celsius", "Calorie", "Joule", "Watt"]'::jsonb,
    '2'::jsonb,
    'Heat is measured in Joules (J).',
    ARRAY['Energy unit.', 'Named after James Joule.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b2ada45d-5c27-541f-a378-d6b6453f879e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'fill_in_blank',
    'A large body of water at 30°C has ___ heat energy than a cup of water at 30°C.',
    NULL,
    '"more"'::jsonb,
    'More water = more total heat energy at the same temperature.',
    ARRAY['Mass matters.', 'Total vs average.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '70dd8e70-00f2-544b-96e8-40fc6e0885ec',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Absolute zero (0 K) is:',
    '["The freezing point of water", "The lowest possible temperature where particles stop moving", "The boiling point of water", "Room temperature"]'::jsonb,
    '1'::jsonb,
    'At absolute zero, particle motion theoretically stops.',
    ARRAY['-273.15°C.', 'Theoretical limit.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b783a62f-e33f-5c4d-9584-48e9f0d3e2e5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Why does a cup of tea cool down when left on a table?',
    '["Tea loses energy", "Heat transfers from the hot tea to the cooler surroundings", "The table heats up", "Evaporation only"]'::jsonb,
    '1'::jsonb,
    'Heat flows from hot (tea) to cold (surroundings) until equilibrium.',
    ARRAY['Temperature gradient.', 'Heat transfer.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c423556a-b84a-52e0-80d8-358c4ddd688d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Why does a metal pot handle get hot when the pot is heated?',
    '["Metal creates heat", "Heat is conducted along the metal from the hot part to the handle", "The handle was already hot", "Radiation only"]'::jsonb,
    '1'::jsonb,
    'Metals conduct heat well — energy transfers along the pot to the handle.',
    ARRAY['Conduction.', 'Good conductor.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9e5c18e1-3c5a-5485-9472-0d4e564f2c78',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Water boils at 100°C. This is the same as:',
    '["100 K", "273 K", "373 K", "0 K"]'::jsonb,
    '2'::jsonb,
    '100°C = 373 K (add 273 to Celsius to get Kelvin).',
    ARRAY['Temperature conversion.', 'K = °C + 273.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a1bac962-d59c-5415-baf0-d7f94d0f4658',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Why do we feel cold when we get out of a swimming pool?',
    '["Water is cold", "Evaporation of water from our skin absorbs heat from our body", "Wind is cold", "Our body produces less heat"]'::jsonb,
    '1'::jsonb,
    'Evaporation is endothermic — it absorbs heat from the skin.',
    ARRAY['Cooling effect.', 'Phase change.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4ccb55d7-6f1a-5b72-95e2-6f8a0648aa44',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'A thermometer works because:',
    '["It measures colour", "Liquid expands when heated and contracts when cooled", "It measures weight", "It creates heat"]'::jsonb,
    '1'::jsonb,
    'Thermometric liquids (mercury, alcohol) expand/contract with temperature.',
    ARRAY['Thermal expansion.', 'Calibrated scale.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3a7e0e33-6c86-5d8e-b723-c2d60f9f19d1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Why does a pressure cooker cook food faster?',
    '["It is bigger", "Higher pressure raises the boiling point of water, so food cooks at a higher temperature", "It uses less water", "It is sealed"]'::jsonb,
    '1'::jsonb,
    'Increased pressure raises water''s boiling point above 100°C.',
    ARRAY['Higher temperature.', 'Faster cooking.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '85bdf3d2-4efd-58cb-93e0-facd2eaca31b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'If two objects are at the same temperature, does heat flow between them?',
    '["Yes, always", "No \u2014 heat only flows when there is a temperature difference", "Only from larger to smaller", "Only through metals"]'::jsonb,
    '1'::jsonb,
    'No temperature difference = no heat flow. Thermal equilibrium.',
    ARRAY['Equilibrium state.', 'No net transfer.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '96c1383f-3c9b-5e57-9767-f83c0136089d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'fill_in_blank',
    'Why is temperature different from heat?',
    NULL,
    '"average vs total"'::jsonb,
    'Temperature is average kinetic energy; heat is total energy transferred. A lake at 30°C has more heat than a cup at 30°C.',
    ARRAY['Scale vs quantity.', 'Different concepts.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bbeecec8-a0a7-514b-9f95-b428b1452a69',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'fill_in_blank',
    'Why does sand get hotter than water in the sun, even though they receive the same energy?',
    NULL,
    '"specific heat capacity"'::jsonb,
    'Water has a higher specific heat capacity — it needs more energy to raise its temperature.',
    ARRAY['Water heats slowly.', 'Energy storage.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '97668511-da89-5216-b451-f1bbcdc72bb5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'fill_in_blank',
    'Explain why coastal areas have milder climates than inland areas.',
    NULL,
    '"specific heat"'::jsonb,
    'Water''s high specific heat capacity moderates temperature — it heats and cools slowly, buffering coastal climates.',
    ARRAY['Maritime vs continental.', 'Temperature moderation.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '84310470-718d-592f-a926-dd778f3d589b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'A student says "heat rises." Is this accurate?',
    '["Yes, always", "More accurately, hot fluid rises because it is less dense than cold fluid", "No, heat falls", "Only in gases"]'::jsonb,
    '1'::jsonb,
    'Hot fluid rises due to lower density — convection current.',
    ARRAY['Density difference.', 'Convection principle.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0bd71da1-573c-5ebe-809d-6cd2480523ae',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Why do black surfaces get hotter than white surfaces in sunlight?',
    '["Black is heavier", "Black absorbs more radiation; white reflects more", "Black conducts better", "White produces cold"]'::jsonb,
    '1'::jsonb,
    'Colour affects absorption — black absorbs most wavelengths; white reflects them.',
    ARRAY['Absorption vs reflection.', 'Thermal properties.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e66d5f7c-3e67-577d-a879-a718229cba8d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'What happens to the volume of a gas when its temperature increases at constant pressure?',
    '["It decreases", "It increases (Charles''s Law)", "It stays the same", "It becomes liquid"]'::jsonb,
    '1'::jsonb,
    'Heated gas expands — particles move faster and push further apart.',
    ARRAY['Charles''s Law.', 'Gas expansion.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3eeebd3f-ace5-5113-a0ae-0d0cb7697b3f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.1.3'), NULL, 'multiple_choice',
    'Why is it important to use the correct scale (Celsius vs Kelvin) in scientific calculations?',
    '["It is not important", "Kelvin is absolute \u2014 calculations involving gas laws and thermodynamics require Kelvin", "Celsius is always better", "They are interchangeable"]'::jsonb,
    '1'::jsonb,
    'Kelvin starts at absolute zero; gas laws require absolute temperature.',
    ARRAY['Scientific standard.', 'Zero point matters.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.4.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '24e0e25f-5681-528e-8c96-c91799ad00d2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Electricity is transmitted over long distances at:',
    '["Low voltage, high current", "High voltage, low current", "Low voltage, low current", "Medium voltage"]'::jsonb,
    '1'::jsonb,
    'High voltage reduces current, which reduces energy loss in transmission.',
    ARRAY['P = IV formula.', 'Efficient transmission.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fa7442bc-7f7c-5287-b6e4-6b42e7be58dd',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'A transformer is used to:',
    '["Generate electricity", "Increase or decrease AC voltage", "Store electricity", "Convert DC to AC"]'::jsonb,
    '1'::jsonb,
    'Transformers change AC voltage levels.',
    ARRAY['Step-up or step-down.', 'Electromagnetic induction.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3acc7b6e-e5dd-59fe-9260-370997b8b078',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'fill_in_blank',
    'A step-up transformer ___ the voltage.',
    NULL,
    '"increases"'::jsonb,
    'Step-up transformers increase voltage for transmission.',
    ARRAY['Power stations use them.', 'Reduce transmission losses.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '25a60044-d7ed-546e-acb3-35a293242b3a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Electricity is generated at a:',
    '["Substation", "Power station", "Transformer", "House"]'::jsonb,
    '1'::jsonb,
    'Power stations generate electricity from various energy sources.',
    ARRAY['Coal, gas, nuclear, hydro.', 'Large-scale generation.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf75167f-6581-511c-8826-a89eaba1d740',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'High-voltage transmission lines are called:',
    '["Local lines", "Power lines or National Grid", "Telephone lines", "Internet cables"]'::jsonb,
    '1'::jsonb,
    'High-voltage lines form the National Grid for long-distance transmission.',
    ARRAY['Infrastructure.', 'Network of wires.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8f08f137-50fe-5712-b4f9-65ba800d9e11',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Why is electricity stepped down before entering homes?',
    '["It is not stepped down", "Homes need low voltage (240V) for safety, not the thousands of volts used in transmission", "To save energy", "To make it stronger"]'::jsonb,
    '1'::jsonb,
    'High voltage is dangerous — transformers step it down to safe levels.',
    ARRAY['Safety reason.', 'Domestic voltage.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '35184c10-a4e8-5cb5-b5dc-37e86ff13541',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Energy loss in transmission lines is mainly due to:',
    '["Voltage", "Resistance of the wires causing heat loss", "Transformers", "Switches"]'::jsonb,
    '1'::jsonb,
    'Wire resistance converts some electrical energy to heat (P = I squared R).',
    ARRAY['Joule heating.', 'Minimised by high voltage.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b285de47-6d50-5725-b960-5b2697fea22c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Why does transmitting at high voltage reduce energy loss?',
    '["Voltage does not affect loss", "High voltage means lower current for the same power, and loss depends on current squared", "High voltage has no resistance", "Transformers are perfect"]'::jsonb,
    '1'::jsonb,
    'P = IV. For same power, higher V means lower I. Loss = I squared R, so lower I = less loss.',
    ARRAY['Efficiency principle.', 'Power equation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd1452df4-0da3-5ffc-8a22-7fafc28bb2bc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'A step-down transformer at a substation reduces voltage from 11,000V to 240V. The turns ratio is approximately:',
    '["1:1", "46:1", "11,000:240", "240:11,000"]'::jsonb,
    '1'::jsonb,
    'Ratio = 11,000/240 ≈ 46:1 (step-down).',
    ARRAY['Voltage ratio formula.', 'Vs/Vp = Ns/Np.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ad48495e-cc95-5b05-81e2-83876bc4cf35',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Why is AC (alternating current) used for transmission rather than DC?',
    '["DC is better", "AC can be easily transformed to different voltages; DC cannot", "AC is safer", "DC is too expensive"]'::jsonb,
    '1'::jsonb,
    'Transformers only work with AC, allowing easy voltage changes.',
    ARRAY['AC advantage.', 'Tesla vs Edison.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c4a7bdce-04ce-52ed-ac3e-f29806b4922e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'fill_in_blank',
    'Name one component between the power station and your home.',
    NULL,
    '"transformer"'::jsonb,
    'Transformers, transmission lines, substations, and distribution lines.',
    ARRAY['Multiple stages.', 'Grid infrastructure.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cb02a27a-fb2a-5e80-b66b-0d9b1658dc6f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Why are transmission lines hung high above the ground?',
    '["For decoration", "For safety \u2014 high voltage is dangerous; height prevents accidental contact", "To save wire", "To avoid rain"]'::jsonb,
    '1'::jsonb,
    'High voltage lines must be elevated to prevent electrocution.',
    ARRAY['Safety clearance.', 'Public protection.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd0b88509-6ef6-564e-a6ee-f31a77f767e9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'If transmission voltage is doubled, what happens to the current for the same power?',
    '["Doubles", "Halves", "Stays the same", "Quadruples"]'::jsonb,
    '1'::jsonb,
    'P = IV. If V doubles and P is constant, I halves.',
    ARRAY['Power equation.', 'Current reduction.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e38b8e37-326b-56c5-b466-3181cd14d13d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Why do rural areas sometimes have lower voltage than urban areas?',
    '["Rural areas use less power", "Longer transmission distances cause more voltage drop due to resistance", "Rural areas have no transformers", "Urban areas generate electricity"]'::jsonb,
    '1'::jsonb,
    'Longer wires have more resistance, causing greater voltage drop.',
    ARRAY['Distance factor.', 'Voltage drop.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5e76987d-8549-562f-9117-da8c0aa87488',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'fill_in_blank',
    'Explain why superconducting transmission lines would be ideal.',
    NULL,
    '"zero resistance"'::jsonb,
    'Superconductors have zero resistance, so no energy is lost as heat during transmission.',
    ARRAY['Perfect efficiency.', 'Currently expensive.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9675a25b-7b5f-571b-beac-f496aafbcd43',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'fill_in_blank',
    'A country loses 20% of its electricity during transmission. How can this be reduced?',
    NULL,
    '"higher voltage"'::jsonb,
    'Increase transmission voltage to reduce current and therefore heat losses.',
    ARRAY['Efficiency improvement.', 'Technical solution.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0d8175e3-5e1e-5d7d-982b-1d4d409232f6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Why is the National Grid interconnected rather than having isolated power stations?',
    '["For decoration", "Interconnection allows load balancing \u2014 if one station fails, others compensate", "To make it longer", "Government policy"]'::jsonb,
    '1'::jsonb,
    'Grid interconnection provides reliability and efficient load distribution.',
    ARRAY['Redundancy.', 'Reliability.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fee78ba5-9a3c-5b02-a526-ac684776393b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'fill_in_blank',
    'A power station generates 100 MW. If 10% is lost in transmission, how much arrives at homes?',
    NULL,
    '"90 MW"'::jsonb,
    '100 - 10% = 90 MW arrives.',
    ARRAY['Simple calculation.', 'Transmission efficiency.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0910c405-e03d-5345-aa79-73db9b0e9c20',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'Why are aluminium wires used for transmission instead of copper (which conducts better)?',
    '["Copper is too good", "Aluminium is lighter and cheaper, even though it has higher resistance", "Aluminium conducts better", "Copper is too heavy for long spans"]'::jsonb,
    '1'::jsonb,
    'Aluminium is lighter and cheaper — the trade-off in resistance is acceptable for long-distance lines.',
    ARRAY['Cost-benefit analysis.', 'Weight advantage.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '83c5b2fb-faa8-5f87-b1fd-8d4b4fd11149',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.1'), NULL, 'multiple_choice',
    'What is the purpose of the earthing wire in domestic electricity supply?',
    '["To carry current", "Safety \u2014 provides a path for fault current to flow to ground, preventing electrocution", "To reduce bills", "To increase voltage"]'::jsonb,
    '1'::jsonb,
    'The earth wire protects users by directing fault current safely to ground.',
    ARRAY['Safety mechanism.', 'Prevents shocks.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.4.2.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a9756249-9fe1-549c-b9c2-445e77bd556a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'A capacitor stores:',
    '["Current", "Electric charge", "Resistance", "Magnetic fields"]'::jsonb,
    '1'::jsonb,
    'Capacitors store electric charge on their plates.',
    ARRAY['Two plates + dielectric.', 'Charge storage.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c16f04c4-4d4f-57b1-9bdb-c680cb0626b5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'fill_in_blank',
    'A capacitor consists of two ___ separated by an insulator (dielectric).',
    NULL,
    '"conducting plates"'::jsonb,
    'Two conductors with an insulator between them.',
    ARRAY['Metal plates.', 'Dielectric material.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '59c8a96b-7adc-52d3-8712-df08f5f84c7d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'The unit of capacitance is the:',
    '["Ohm", "Ampere", "Farad", "Volt"]'::jsonb,
    '2'::jsonb,
    'Capacitance is measured in Farads (F).',
    ARRAY['Named after Michael Faraday.', 'Usually microfarads.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8f52b3bd-630c-5c87-a45d-c30716d5fcf4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'When a capacitor is connected to a battery, it:',
    '["Discharges immediately", "Charges up \u2014 current flows until the capacitor voltage equals the battery voltage", "Nothing happens", "The battery charges"]'::jsonb,
    '1'::jsonb,
    'Current flows until capacitor is fully charged.',
    ARRAY['Charge accumulation.', 'Voltage equalises.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3403fcba-3988-5422-9140-758d41225476',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'A charged capacitor can:',
    '["Only store charge", "Discharge through a circuit, releasing stored energy", "Generate electricity forever", "Block all current"]'::jsonb,
    '1'::jsonb,
    'A charged capacitor releases energy when connected to a circuit.',
    ARRAY['Temporary storage.', 'Energy release.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0ff4dae8-f7cd-5c59-8d82-edaa7a17961e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'Capacitors are used in circuits to:',
    '["Only store charge", "Smooth voltage fluctuations, filter signals, and store energy", "Generate AC current", "Measure resistance"]'::jsonb,
    '1'::jsonb,
    'Capacitors have many applications: smoothing, filtering, timing, energy storage.',
    ARRAY['Versatile component.', 'Multiple uses.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c32c8c3e-6fa7-5c43-94fe-1a51ff506baa',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'During charging, current:',
    '["Stays constant", "Starts high and decreases as the capacitor charges", "Starts low and increases", "Is zero"]'::jsonb,
    '1'::jsonb,
    'Current is maximum when uncharged and decreases as charge builds up.',
    ARRAY['Exponential decay.', 'Opposing voltage builds.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6ea439ca-272f-50de-b31d-f244bc4a7039',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'During discharging through a resistor, current:',
    '["Stays constant", "Decreases exponentially as charge is used up", "Increases", "Is zero"]'::jsonb,
    '1'::jsonb,
    'Discharge current decreases exponentially as stored charge depletes.',
    ARRAY['Exponential decay.', 'RC time constant.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '20c4b19f-2edb-5b5e-afe3-ff75dcb75a9e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'The time constant of an RC circuit depends on:',
    '["Voltage only", "Resistance and capacitance (tau = R \u00d7 C)", "Current only", "Temperature"]'::jsonb,
    '1'::jsonb,
    'Time constant = R × C. It determines how fast charging/discharging occurs.',
    ARRAY['Tau formula.', 'Characteristic time.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '45fe1370-dd18-5572-bfa0-33ab96331365',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'A capacitor with a large capacitance stores:',
    '["Less charge", "More charge at the same voltage", "No charge", "The same charge"]'::jsonb,
    '1'::jsonb,
    'C = Q/V. Higher C means more Q at the same V.',
    ARRAY['Capacitance formula.', 'Charge proportional to C.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '62bad59e-83ba-5184-96db-3916f960cc24',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'Why are capacitors used in camera flashes?',
    '["To make light brighter", "They charge slowly from the battery and discharge quickly, providing a burst of energy", "To save battery", "To reduce weight"]'::jsonb,
    '1'::jsonb,
    'Capacitors accumulate charge slowly and release it rapidly for the flash.',
    ARRAY['Energy accumulation.', 'Quick release.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ca2f8125-3eaf-5b2f-97cf-ce1ca789a87c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'What happens if a capacitor is connected to a DC source for a long time?',
    '["It charges and stays charged", "It charges fully and then no more current flows", "It explodes", "It discharges"]'::jsonb,
    '1'::jsonb,
    'Once fully charged, no more current flows in a DC circuit.',
    ARRAY['Steady state.', 'Blocks DC after charging.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c16e870a-3dff-5c22-8b29-d6656478e9a1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'Why do capacitors block DC but allow AC to pass?',
    '["They do not", "DC charges the capacitor and stops; AC continuously charges and discharges it, allowing current to flow", "AC is stronger", "DC is weaker"]'::jsonb,
    '1'::jsonb,
    'AC alternates, so the capacitor never fully charges — current keeps flowing.',
    ARRAY['AC behaviour.', 'Charging/discharging cycle.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cce395df-9f25-5158-a73d-1ec8d43dcb94',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'A capacitor is charged to 12V. If the battery is removed and it is connected to a resistor, the initial current is:',
    '["Zero", "Maximum, then decreases", "Constant", "Infinite"]'::jsonb,
    '1'::jsonb,
    'Full voltage across resistor = maximum initial current; decreases as capacitor discharges.',
    ARRAY['Ohm''s law at t=0.', 'Exponential decay.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7962dbaf-7471-56ed-a3ff-2109a39920ba',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'Why are electrolytic capacitors polarity-sensitive?',
    '["They are not", "Connecting them backwards can cause them to fail or explode due to chemical reaction", "For decoration", "To save space"]'::jsonb,
    '1'::jsonb,
    'Electrolytic capacitors have a chemical dielectric that reacts to reverse polarity.',
    ARRAY['Polarity warning.', 'Chemical construction.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0ba3c1a8-d7bf-5ffd-9913-2747fb11249b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'How does increasing the area of capacitor plates affect capacitance?',
    '["Decreases it", "Increases it \u2014 more area means more charge can be stored", "No effect", "Doubles the resistance"]'::jsonb,
    '1'::jsonb,
    'Larger plate area = more charge storage capacity = higher capacitance.',
    ARRAY['C proportional to area.', 'Plate design.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7b89a27d-6d2d-5606-94de-1bbc89451928',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'fill_in_blank',
    'Explain why capacitors are used in power supply smoothing.',
    NULL,
    '"voltage smoothing"'::jsonb,
    'Capacitors fill in voltage dips by releasing stored charge when the AC voltage drops.',
    ARRAY['Smooth DC output.', 'Filter function.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf255ea3-a360-5854-af75-b92f48442d4d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'What is the energy stored in a capacitor?',
    '["E = CV", "E = 0.5 \u00d7 C \u00d7 V squared", "E = IR", "E = Pt"]'::jsonb,
    '1'::jsonb,
    'Energy = 0.5 × capacitance × voltage squared.',
    ARRAY['Energy formula.', 'Proportional to V squared.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '252a4ee9-8aac-523b-b891-419e019d4c9e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'A 100μF capacitor is charged to 10V. How much charge does it store?',
    '["1000 C", "0.001 C", "10 C", "0.1 C"]'::jsonb,
    '1'::jsonb,
    'Q = CV = 100×10^-6 × 10 = 0.001 C.',
    ARRAY['Charge formula.', 'Coulombs.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '824fc1ec-e36f-587b-acba-c8cab2fdf28c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.2.2'), NULL, 'multiple_choice',
    'Why are capacitors used in touchscreens?',
    '["To store data", "The screen detects changes in capacitance when a finger touches it", "To generate light", "To produce sound"]'::jsonb,
    '1'::jsonb,
    'Touchscreens use capacitance changes to detect touch position.',
    ARRAY['Capacitive sensing.', 'Touch detection.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.4.3.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '408a3965-7fdb-537a-8d07-13a1adceda5f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'In daily life, energy conversion happens in:',
    '["Only machines", "Everything \u2014 cooking, transport, lighting, and our bodies", "Only during the day", "Only outdoors"]'::jsonb,
    '1'::jsonb,
    'Energy conversion is everywhere in daily life.',
    ARRAY['Ubiquitous process.', 'Fundamental.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a0953e2c-610b-55e1-8991-26db0d25c8d3',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'A stove converts chemical energy (gas) to:',
    '["Electrical energy", "Heat energy for cooking", "Light energy only", "Kinetic energy"]'::jsonb,
    '1'::jsonb,
    'Gas stoves convert chemical energy to heat.',
    ARRAY['Combustion process.', 'Cooking application.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '52d8c77a-a636-5ead-9f32-e7d6f66c7efe',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Turning on a light switch converts:',
    '["Heat to light", "Electrical energy to light energy", "Chemical to electrical", "Mechanical to electrical"]'::jsonb,
    '1'::jsonb,
    'Lighting converts electricity to light (and some heat).',
    ARRAY['Instant conversion.', 'Visible energy.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0f525e4b-e67d-535c-954f-9272f199dce0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Riding a bicycle converts:',
    '["Chemical to kinetic", "Electrical to heat", "Nuclear to light", "Sound to kinetic"]'::jsonb,
    '0'::jsonb,
    'Muscles convert chemical energy (from food) to kinetic energy (pedalling).',
    ARRAY['Human power.', 'Body as engine.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8dd8316d-4c47-5e30-bcf7-d725fb4ee9a9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'A refrigerator converts electrical energy to:',
    '["Only heat", "Heat transfer (moves heat from inside to outside)", "Cold energy", "Light"]'::jsonb,
    '1'::jsonb,
    'Refrigerators use electricity to transfer heat from inside to outside.',
    ARRAY['Heat pump principle.', 'Not creating cold.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b67a5d6c-5483-535d-854f-00b946654d45',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Energy conservation means:',
    '["Using less energy only", "Energy cannot be created or destroyed, only transformed", "Saving electricity only", "Turning off lights"]'::jsonb,
    '1'::jsonb,
    'Conservation of energy is a fundamental law of physics.',
    ARRAY['First law of thermodynamics.', 'Always true.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '538ab4c8-4a99-5034-a72c-2a7de8f11db2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Why should we switch off appliances when not in use?',
    '["To save money only", "To reduce energy waste \u2014 even standby mode uses electricity", "It is a rule", "To make appliances last longer"]'::jsonb,
    '1'::jsonb,
    'Standby power (phantom load) wastes electricity unnecessarily.',
    ARRAY['Energy saving.', 'Environmental benefit.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '974b19e3-b162-5785-9fc2-43febf7f434e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Using LED bulbs instead of incandescent bulbs saves energy because:',
    '["LEDs are bigger", "LEDs convert more electricity to light and less to waste heat", "LEDs are dimmer", "LEDs use more electricity"]'::jsonb,
    '1'::jsonb,
    'LEDs are 80% efficient vs 5% for incandescent — less waste heat.',
    ARRAY['Efficiency comparison.', 'Energy saving.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7f3a1c7b-f093-5152-8fa9-d14fb45c5c42',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Insulating a house reduces energy consumption by:',
    '["Generating heat", "Reducing heat loss, so less energy is needed for heating", "Making the house bigger", "Blocking sunlight"]'::jsonb,
    '1'::jsonb,
    'Insulation reduces the rate of heat transfer, keeping the house warm.',
    ARRAY['Thermal insulation.', 'Less heating needed.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c51a6922-1e10-532a-890d-1109a335e476',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'A solar water heater converts:',
    '["Electrical to heat", "Light energy from the sun to heat energy", "Chemical to heat", "Nuclear to heat"]'::jsonb,
    '1'::jsonb,
    'Solar heaters absorb sunlight and convert it to heat for water.',
    ARRAY['Direct solar conversion.', 'Renewable heating.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '99f46f9b-59fb-5566-ac29-b36263565f37',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Walking up stairs converts chemical energy to:',
    '["Only heat", "Kinetic energy (movement) and potential energy (height)", "Electrical energy", "Sound energy"]'::jsonb,
    '1'::jsonb,
    'Muscles convert food energy to movement and height gain.',
    ARRAY['Multiple conversions.', 'Body mechanics.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '92da0515-eb74-5ee0-b516-56b1d2671e49',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Why is energy efficiency important for a country''s development?',
    '["It is not important", "Efficient energy use reduces costs, pollution, and dependence on imports", "Only for rich countries", "Only for the environment"]'::jsonb,
    '1'::jsonb,
    'Energy efficiency drives economic and environmental sustainability.',
    ARRAY['Cost savings.', 'Reduced imports.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3806c364-4110-5853-af98-d00def705049',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'fill_in_blank',
    'Name one way to improve energy efficiency in the home.',
    NULL,
    '"insulation"'::jsonb,
    'Insulation, LED bulbs, efficient appliances, and switching off unused devices.',
    ARRAY['Multiple options.', 'Simple changes.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4f8ae8c5-a9e3-5ff8-b5e3-c90f05eb37a0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'A country''s electricity demand is growing. Should they build more power stations only?',
    '["Yes, that is the only option", "No \u2014 also invest in energy efficiency to reduce demand growth", "No \u2014 only use solar", "Yes, but only renewable"]'::jsonb,
    '1'::jsonb,
    'Reducing demand through efficiency is cheaper and cleaner than building more stations.',
    ARRAY['Demand-side management.', 'Sustainable approach.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '637d626d-3a2b-51cb-af04-2834f2c5213b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'fill_in_blank',
    'How does public transport reduce energy consumption per person?',
    NULL,
    '"shared energy"'::jsonb,
    'Shared transport uses less energy per person than individual cars.',
    ARRAY['Energy per passenger.', 'Efficiency gain.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6243f503-419a-545b-a4e0-ccc4728eb1ab',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'fill_in_blank',
    'Why is cooking with a pressure cooker more energy-efficient?',
    NULL,
    '"less time"'::jsonb,
    'Higher pressure raises boiling point, cooking food faster and using less fuel.',
    ARRAY['Time and fuel saving.', 'Thermodynamic advantage.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f17d8d52-6311-5784-a709-e41e73f79669',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Compare the energy efficiency of an electric car vs a petrol car.',
    '["Petrol is more efficient", "Electric is more efficient \u2014 90% vs 25% \u2014 because less energy is wasted as heat", "They are equal", "Depends on the brand"]'::jsonb,
    '1'::jsonb,
    'Electric motors are 90% efficient; petrol engines waste 75% as heat.',
    ARRAY['Conversion efficiency.', 'Environmental impact.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4b5f1026-8144-5695-9916-be32bd1184c4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'multiple_choice',
    'Why do developing countries like Ghana need to invest in energy efficiency?',
    '["They do not", "Efficiency reduces costs, supports economic growth, and reduces environmental impact", "Only for climate change", "Only wealthy countries can afford it"]'::jsonb,
    '1'::jsonb,
    'Energy efficiency is cost-effective and supports sustainable development.',
    ARRAY['Economic benefit.', 'Development enabler.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f5e4b47b-5dd7-5629-b25f-bf4ead4f57ac',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'fill_in_blank',
    'A factory uses 1000 kWh per month. If they improve efficiency by 20%, how much do they save?',
    NULL,
    '"200 kWh"'::jsonb,
    '20% of 1000 = 200 kWh saved per month.',
    ARRAY['Simple calculation.', 'Direct savings.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1e7ec611-3ae8-526d-8209-64c870b40047',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.3.1'), NULL, 'fill_in_blank',
    'Why is "energy conservation" important even though energy cannot be destroyed?',
    NULL,
    '"quality"'::jsonb,
    'Conserving energy means using less high-quality energy, reducing waste and environmental impact.',
    ARRAY['Energy quality matters.', 'Entropy increases.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.4.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc178ad0-2dd6-5141-b8c0-8bddfa4e18dc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'fill_in_blank',
    'A magnet has two poles: north and ___.',
    NULL,
    '"south"'::jsonb,
    'Every magnet has a north and south pole.',
    ARRAY['Opposite poles attract.', 'Like poles repel.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '97cd1edc-6990-5bfe-81fe-39755a0d118a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'Like poles:',
    '["Attract", "Repel", "Have no effect", "Cancel each other"]'::jsonb,
    '1'::jsonb,
    'Like poles (N-N or S-S) repel each other.',
    ARRAY['Magnetic repulsion.', 'Fundamental rule.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'cd0c8fa4-fa3f-58ff-9e7c-8822d0dbc535',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'Opposite poles:',
    '["Repel", "Attract", "Have no effect", "Are identical"]'::jsonb,
    '1'::jsonb,
    'Opposite poles (N-S) attract each other.',
    ARRAY['Magnetic attraction.', 'Fundamental rule.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0d093a0e-b566-5667-8599-d70616085ef8',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'fill_in_blank',
    'Magnetic field lines go from the ___ pole to the ___ pole outside the magnet.',
    NULL,
    '"north, south"'::jsonb,
    'Field lines exit from north and enter south.',
    ARRAY['Convention direction.', 'Closed loops.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8807b858-68d6-54dd-8faf-d657d1252f41',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'A magnet attracts:',
    '["All materials", "Only ferromagnetic materials (iron, nickel, cobalt)", "Only metals", "Everything"]'::jsonb,
    '1'::jsonb,
    'Magnets attract iron, nickel, cobalt, and their alloys.',
    ARRAY['Ferromagnetic materials.', 'Not all metals.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '81b81ad1-d656-5082-907f-67dd4b3cb2d0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'The region around a magnet where magnetic forces act is called the:',
    '["Electric field", "Magnetic field", "Gravitational field", "Force field"]'::jsonb,
    '1'::jsonb,
    'The magnetic field is the area of magnetic influence.',
    ARRAY['Invisible field.', 'Detected by compass.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3ad87edd-7ac4-5e94-944d-76f2f58d5f65',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'An electromagnet is made by:',
    '["Heating a magnet", "Passing electric current through a coil of wire around an iron core", "Cooling a magnet", "Breaking a magnet"]'::jsonb,
    '1'::jsonb,
    'Current in a coil creates a magnetic field; iron core strengthens it.',
    ARRAY['Temporary magnet.', 'Switchable.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3ba5b64f-3c07-5590-b96b-a46561ad840d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'The strength of an electromagnet can be increased by:',
    '["Using less current", "Adding more turns of wire or increasing the current", "Removing the iron core", "Using thinner wire"]'::jsonb,
    '1'::jsonb,
    'More turns and/or more current = stronger magnetic field.',
    ARRAY['Design factors.', 'Variable strength.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0d79f783-1a90-50dd-ae73-62d384bbd643',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'A compass needle points north because:',
    '["It is heavy", "The Earth has a magnetic field with a magnetic north pole", "The sun pulls it", "Wind pushes it"]'::jsonb,
    '1'::jsonb,
    'The compass aligns with Earth''s magnetic field.',
    ARRAY['Geomagnetism.', 'Navigation tool.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ff92299d-0150-5d68-914d-161310a230c3',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'Why does a magnet lose its magnetism when heated?',
    '["It melts", "Heat makes the magnetic domains random, cancelling the net magnetic field", "It becomes heavier", "It changes colour"]'::jsonb,
    '1'::jsonb,
    'Heat disrupts the alignment of magnetic domains.',
    ARRAY['Domain theory.', 'Curie temperature.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '241da7ef-bcab-5cc4-b5bb-cc96dc19d345',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'Magnetic domains are:',
    '["Large magnets", "Regions within a material where atomic magnets are aligned in the same direction", "Magnetic field lines", "Electron orbits"]'::jsonb,
    '1'::jsonb,
    'Domains are aligned regions; unmagnetised materials have random domains.',
    ARRAY['Domain alignment.', 'Magnetism theory.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a50af49b-8dcf-552c-9118-34712595b3e6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'fill_in_blank',
    'Name one use of electromagnets.',
    NULL,
    '"crane"'::jsonb,
    'Electromagnets are used in cranes, speakers, motors, MRI machines, and doorbells.',
    ARRAY['Versatile applications.', 'Switchable magnets.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f93fbd3d-c18e-5cdd-b057-5e9a7f890f39',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'Why can''t you separate the poles of a magnet?',
    '["You can", "Breaking a magnet creates two complete magnets, each with N and S poles", "Poles are at the ends", "Poles are imaginary"]'::jsonb,
    '1'::jsonb,
    'Every piece of a magnet has both poles — monopoles do not exist.',
    ARRAY['Magnetic monopole theory.', 'Always paired.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '599d9a87-41fb-5aea-a95b-d9f0c84c9367',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'fill_in_blank',
    'How does a magnetic compass work?',
    NULL,
    '"alignment"'::jsonb,
    'The magnetised needle aligns with Earth''s magnetic field, pointing to magnetic north.',
    ARRAY['Field alignment.', 'Navigation principle.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b80f4177-9174-59db-aa5f-9e5e531a78dc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'Why are electromagnets used in scrapyard cranes?',
    '["They are cheap", "They can be switched on to lift and off to release metal objects", "They are permanent", "They are lightweight"]'::jsonb,
    '1'::jsonb,
    'Switching capability allows controlled lifting and releasing of scrap metal.',
    ARRAY['Temporary magnetism.', 'Industrial use.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '460086be-a94f-5959-b788-941957e99972',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'fill_in_blank',
    'Explain why a magnet does not attract a wooden door.',
    NULL,
    '"non-magnetic"'::jsonb,
    'Wood is not ferromagnetic — its atoms do not have aligned magnetic domains.',
    ARRAY['Material property.', 'Non-ferromagnetic.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6f0b9c11-c0f6-529b-8271-95e566efbd62',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'If you cut a bar magnet in half, you get:',
    '["One N pole and one S pole", "Two smaller magnets, each with N and S poles", "Two N poles", "Two S poles"]'::jsonb,
    '1'::jsonb,
    'Each piece becomes a complete magnet with both poles.',
    ARRAY['No monopoles.', 'Magnetic conservation.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'db884ad9-f6f4-52cd-b0d8-09f7cd0c0b29',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'Why is iron used as the core of an electromagnet?',
    '["It is cheap", "Iron is easily magnetised and greatly strengthens the magnetic field", "It conducts electricity", "It is lightweight"]'::jsonb,
    '1'::jsonb,
    'Iron''s ferromagnetic properties concentrate and amplify the magnetic field.',
    ARRAY['Core material.', 'Flux concentration.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ef0b2673-1114-5005-8ae3-15b32447d28f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'A student wraps more wire coils around a nail and connects a battery. What happens?',
    '["Nothing", "The nail becomes a stronger electromagnet with more coils", "The nail becomes weaker", "The battery drains instantly"]'::jsonb,
    '1'::jsonb,
    'More coils = stronger magnetic field = stronger electromagnet.',
    ARRAY['Design principle.', 'Ampere''s law.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '29adfed9-3004-528a-86bd-6d6e4a83b234',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.1'), NULL, 'multiple_choice',
    'Why do magnets stick to a fridge door?',
    '["The fridge is cold", "The fridge door is made of steel (iron alloy), which is ferromagnetic", "The fridge has electricity", "The door is sticky"]'::jsonb,
    '1'::jsonb,
    'Steel contains iron, which is attracted to magnets.',
    ARRAY['Material property.', 'Ferromagnetic.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.4.4.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dab32a56-3578-56a8-9f64-51f28bfb8534',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A complex machine is made of two or more:',
    '["Engines", "Simple machines working together", "Motors", "Batteries"]'::jsonb,
    '1'::jsonb,
    'Complex machines combine simple machines.',
    ARRAY['Lever + wheel, gear + axle.', 'Combined mechanisms.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4357a6ee-ef4a-5236-8dc9-ce4aaf0aab01',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A bicycle is a complex machine that includes:',
    '["Only wheels", "Wheels, axles, levers (brakes), and gears", "Only levers", "Only pulleys"]'::jsonb,
    '1'::jsonb,
    'Bicycles combine multiple simple machine types.',
    ARRAY['Wheel and axle, lever, gear.', 'Multiple mechanisms.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1941d697-184c-5128-854c-ebd9aa9538fe',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A gear train is an example of a:',
    '["Simple machine", "Complex machine", "Electrical device", "Chemical system"]'::jsonb,
    '1'::jsonb,
    'Gear trains combine multiple wheel-and-axle mechanisms.',
    ARRAY['Multiple gears working together.', 'Force/speed trade-off.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9f4b8c36-e6d2-5564-83f2-2d28a652c0b7',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A crane uses:',
    '["Only a lever", "Pulleys, levers, and gears together", "Only gears", "Only pulleys"]'::jsonb,
    '1'::jsonb,
    'Cranes combine pulleys, levers, and hydraulic systems.',
    ARRAY['Lifting heavy loads.', 'Multiple mechanisms.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '79bfa583-8414-5d62-989f-b3c0bf941a16',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'The advantage of a complex machine over a simple machine is:',
    '["It is lighter", "It can perform more complex tasks with greater mechanical advantage", "It uses less energy", "It is smaller"]'::jsonb,
    '1'::jsonb,
    'Complex machines multiply force and perform tasks simple machines cannot.',
    ARRAY['Greater capability.', 'Task versatility.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '24066201-1d4d-5816-9fd0-b2f4ad3f1fd6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A car is a complex machine that uses:',
    '["Only wheels", "Wheels, gears, levers, and pulleys working together", "Only an engine", "Only brakes"]'::jsonb,
    '1'::jsonb,
    'Cars integrate multiple simple machine types in their systems.',
    ARRAY['Transmission, steering, braking.', 'Integrated systems.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dc0bf6c1-bcd3-5cc8-80d4-bbf911c47589',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'In a gear system, a large gear driving a small gear:',
    '["Reduces speed", "Increases speed but reduces force", "Does nothing", "Increases force only"]'::jsonb,
    '1'::jsonb,
    'Large to small gear = speed increase, force decrease.',
    ARRAY['Gear ratio trade-off.', 'Speed vs torque.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5742eb1f-4a7f-567f-9e11-c343f8f7a5ca',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A pulley system with 4 supporting ropes has a mechanical advantage of:',
    '["1", "2", "3", "4"]'::jsonb,
    '3'::jsonb,
    'MA equals the number of supporting rope sections.',
    ARRAY['Multiple pulleys.', 'Force multiplication.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e97c363b-843c-5e9d-8263-1747a1a56e64',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'Why do complex machines still obey the law of conservation of energy?',
    '["They do not", "No machine creates energy \u2014 work output cannot exceed work input", "They create force", "They eliminate friction"]'::jsonb,
    '1'::jsonb,
    'Complex machines cannot violate energy conservation — they trade force for distance.',
    ARRAY['Fundamental limit.', 'No perpetual motion.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4bdc4317-60cf-5fbc-b619-eace123dab64',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A hand drill is a complex machine combining:',
    '["Only gears", "Wheel and axle with a gear mechanism", "Only a lever", "Only pulleys"]'::jsonb,
    '1'::jsonb,
    'Hand drills use wheel and axle (handle) with gears for rotation.',
    ARRAY['Rotational force conversion.', 'Drilling mechanism.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e05d9cc1-4ee4-5870-a4a6-e0ec8bd2059c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'Why are gears used in a bicycle?',
    '["For decoration", "To change the speed and force applied to the wheels for different conditions", "To make it heavier", "To stop the bike"]'::jsonb,
    '1'::jsonb,
    'Gears allow the rider to trade speed for force (hills) or force for speed (flat).',
    ARRAY['Adaptive mechanism.', 'Riding efficiency.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5cd325c8-3448-5976-99b7-99e9ec00dd27',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A fishing rod is a complex machine that uses:',
    '["Only a lever", "A lever (the rod) and a wheel and axle (the reel)", "Only gears", "Only pulleys"]'::jsonb,
    '1'::jsonb,
    'The rod is a lever; the reel is a wheel and axle.',
    ARRAY['Combined simple machines.', 'Casting and reeling.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '00a7ebcb-2578-5e93-9f16-9ec404c28d04',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'Why is a wheelbarrow more effective than carrying a load by hand?',
    '["It is not", "The wheel reduces friction and the lever principle reduces the lifting effort", "It is faster only", "It holds more only"]'::jsonb,
    '1'::jsonb,
    'Wheel (reduces friction) + lever (reduces lifting force) = easier transport.',
    ARRAY['Mechanical advantage.', 'Ergonomic benefit.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8a79f8d3-bfee-5445-b762-95d89897781e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A machine has an efficiency of 80%. If 1000J of work is put in, how much useful work is done?',
    '["1000J", "800J", "200J", "80J"]'::jsonb,
    '1'::jsonb,
    'Useful work = efficiency × input = 0.8 × 1000 = 800J.',
    ARRAY['Efficiency formula.', '200J lost as heat.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4bd5687e-5f2e-57a4-8090-67c4b0daf2e6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'Why can''t any machine be 100% efficient?',
    '["Some can be", "Friction and other losses always convert some energy to waste heat", "Poor design only", "Manufacturing defects only"]'::jsonb,
    '1'::jsonb,
    'Friction, air resistance, and deformation always waste some energy.',
    ARRAY['Second law of thermodynamics.', 'Fundamental limit.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c1b8a2db-a0fa-5f83-aff2-926ac4d03496',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'fill_in_blank',
    'Explain how a compound gear system can multiply force significantly.',
    NULL,
    '"gear ratios"'::jsonb,
    'Multiple gear stages multiply the gear ratio, so small force in = large force out (with reduced speed).',
    ARRAY['Cumulative ratios.', 'Compound advantage.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2bf1cfcd-4740-590f-85f2-a31634fcc73d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'Why do construction machines like excavators use hydraulics instead of just levers?',
    '["Levers are too simple", "Hydraulic systems can multiply force enormously and operate remotely", "Hydraulics are cheaper", "Levers cannot dig"]'::jsonb,
    '1'::jsonb,
    'Hydraulics use Pascal''s principle to multiply force and allow remote operation.',
    ARRAY['Fluid mechanics.', 'Force multiplication.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3e3faaef-b217-5c28-927b-0a060f439d7c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'A student claims a machine can multiply work (energy). Is this correct?',
    '["Yes", "No \u2014 machines multiply force or speed, but work output \u2264 work input", "Only electric machines", "Only simple machines"]'::jsonb,
    '1'::jsonb,
    'Work = force × distance. A machine trades one for the other, not creates energy.',
    ARRAY['Energy conservation.', 'Fundamental principle.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0bc88864-c364-5428-8153-69d2878d8614',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'fill_in_blank',
    'How does a sewing machine combine simple machines?',
    NULL,
    '"wheel, lever, gear"'::jsonb,
    'The hand wheel (wheel and axle), needle mechanism (lever), and gears all work together.',
    ARRAY['Integrated mechanisms.', 'Fabric feeding.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fca7515a-c0af-51ce-9a07-ed3e161cda29',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.4.2'), NULL, 'multiple_choice',
    'Why are complex machines important for industrialisation?',
    '["They are not", "They multiply human capability, enabling mass production and construction", "For entertainment", "For decoration"]'::jsonb,
    '1'::jsonb,
    'Complex machines amplify human effort, enabling large-scale production.',
    ARRAY['Industrial revolution.', 'Productivity increase.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.4.5.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '38e3c86c-b84e-5971-a669-4facef303386',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'A cutlass is classified as a:',
    '["Complex machine", "Simple machine (lever/wedge)", "Electrical tool", "Chemical tool"]'::jsonb,
    '1'::jsonb,
    'A cutlass combines lever (handle) and wedge (blade) principles.',
    ARRAY['Simple machine.', 'Cutting tool.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6255195c-fe67-5ed8-b988-287eec7dfe9c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'A hoe uses the principle of a:',
    '["Pulley", "Lever and wedge", "Wheel and axle", "Gear"]'::jsonb,
    '1'::jsonb,
    'A hoe has a lever (handle) and wedge (blade) for digging.',
    ARRAY['Force multiplication.', 'Soil preparation.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4f46d701-a67b-5edc-bd06-e839b2ee5750',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'Hand tools are preferred for small farms because:',
    '["They are faster", "They are affordable, available, and suitable for small areas", "They require fuel", "They are more powerful"]'::jsonb,
    '1'::jsonb,
    'Hand tools are low-cost and appropriate for small-scale farming.',
    ARRAY['Accessibility.', 'Cost-effective.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b55365e5-4636-5caf-a45f-66ccf12acd0f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'A watering can uses the principle of:',
    '["A lever", "Gravity and controlled flow", "A pulley", "A gear"]'::jsonb,
    '1'::jsonb,
    'Watering cans use gravity to pour water through a spout with a rose.',
    ARRAY['Simple design.', 'Controlled watering.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2b24b3bd-fd85-54a7-af69-36fbf9374287',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'Why should agricultural tools be properly maintained?',
    '["It is not important", "Proper maintenance extends tool life, improves efficiency, and ensures safety", "To make them shiny", "To increase their weight"]'::jsonb,
    '1'::jsonb,
    'Maintenance prevents rust, keeps edges sharp, and ensures safety.',
    ARRAY['Longevity.', 'Safety and efficiency.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e949b575-d409-5be4-b001-592ea8bf6f17',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'A sprayer is used for:',
    '["Digging", "Applying pesticides or herbicides to crops", "Watering large areas", "Harvesting"]'::jsonb,
    '1'::jsonb,
    'Sprayers apply liquid chemicals in a fine mist.',
    ARRAY['Chemical application.', 'Even coverage.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '09965241-6080-523a-8e37-bbd900bb70e4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'Why is a sharp cutlass more effective than a blunt one?',
    '["It is lighter", "A sharp blade has a thinner edge, concentrating force on a smaller area for easier cutting", "It is longer", "It looks better"]'::jsonb,
    '1'::jsonb,
    'Sharp edge = smaller area = higher pressure = easier cutting.',
    ARRAY['Pressure principle.', 'P = F/A.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd1dcd87d-0228-53c6-80dd-76434a6ddd1e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'A wheelbarrow makes transporting loads easier because:',
    '["It is modern", "The wheel reduces friction and the handles act as a lever", "It is electric", "It is lighter"]'::jsonb,
    '1'::jsonb,
    'Wheel (less friction) + lever (less lifting effort) = easier transport.',
    ARRAY['Simple machine combination.', 'Force reduction.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '42783c3b-db02-5ba2-aa88-05821db34237',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'Why should a farmer wear gloves when using tools?',
    '["For fashion", "To prevent blisters, cuts, and splinters", "To grip worse", "Hands do not need protection"]'::jsonb,
    '1'::jsonb,
    'Gloves protect hands from injuries during tool use.',
    ARRAY['Safety equipment.', 'Hand protection.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'faedf460-573c-5681-bfe7-6a5b717d84eb',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'fill_in_blank',
    'Name one tool used for weeding in Ghanaian farming.',
    NULL,
    '"hoe"'::jsonb,
    'Hoes, cutlasses, and hand weeders are common weeding tools.',
    ARRAY['Field maintenance.', 'Weed control.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '331a371c-c6f2-5c93-b0fe-7607de66bb0d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'Why are some tool handles made of wood and others of metal?',
    '["No reason", "Wood absorbs vibration and insulates; metal is stronger for heavy-duty tools", "Wood is always better", "Metal is always better"]'::jsonb,
    '1'::jsonb,
    'Material choice depends on the tool''s function — comfort vs strength.',
    ARRAY['Ergonomic design.', 'Functional choice.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9ff28464-1617-57b1-b3ec-df25c9f7f85e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'How does the length of a tool handle affect its effectiveness?',
    '["No effect", "Longer handles provide more leverage (moment), reducing the force needed", "Longer handles are always worse", "Shorter handles are better"]'::jsonb,
    '1'::jsonb,
    'Moment = force × distance. Longer handles increase the moment arm.',
    ARRAY['Lever principle.', 'Ergonomic advantage.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5320a754-ae60-5f5e-9a2e-666b6b43bfa6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'Why is it important to clean tools after use with chemicals?',
    '["For appearance", "Chemical residue can corrode tools and contaminate the next crop", "To make them lighter", "It is not important"]'::jsonb,
    '1'::jsonb,
    'Chemical residue damages tools and can harm future crops.',
    ARRAY['Corrosion prevention.', 'Cross-contamination.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dce49e09-bcec-502c-bd31-09444c7cdd87',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'A farmer needs to dig planting holes quickly. Which tool is most efficient?',
    '["A watering can", "A dibber or hoe", "A rake", "A sprayer"]'::jsonb,
    '1'::jsonb,
    'A dibber makes holes quickly; a hoe can dig and prepare soil.',
    ARRAY['Task-specific tool.', 'Efficiency.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '45d1ae6c-7fc3-5eb7-beae-b3b23140d793',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'fill_in_blank',
    'Explain how a cutlass demonstrates two simple machine principles.',
    NULL,
    '"lever and wedge"'::jsonb,
    'The handle acts as a lever (force multiplication) and the blade as a wedge (concentrating force for cutting).',
    ARRAY['Dual principles.', 'Simple machine combination.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '82cfb22b-02ac-5242-85d9-f9bfd413b576',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'Why might a farmer choose a manual sprayer over a motorised one?',
    '["Manual is always better", "Manual sprayers are cheaper, lighter, and suitable for small farms", "Motorised sprayers are not available", "Manual sprayers spray more"]'::jsonb,
    '1'::jsonb,
    'Cost, size, and farm scale determine the best choice.',
    ARRAY['Context-dependent.', 'Economic factors.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '34b8efa2-f618-592b-b6ae-1751650e655c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'fill_in_blank',
    'How does proper tool storage extend tool life?',
    NULL,
    '"prevents damage"'::jsonb,
    'Dry storage prevents rust; organised storage prevents damage; protection from weather extends life.',
    ARRAY['Maintenance practice.', 'Storage conditions.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c3ca4cfa-4022-5b74-9a5b-7878141a0931',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'Why are ergonomic tool designs important for farmers?',
    '["For appearance", "Ergonomic designs reduce fatigue, prevent injuries, and increase productivity", "They cost more", "They are not important"]'::jsonb,
    '1'::jsonb,
    'Good ergonomics reduce strain and allow longer working hours.',
    ARRAY['Health and productivity.', 'Comfort matters.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e5b46033-f417-55c6-a027-aa6dd2fed865',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'multiple_choice',
    'A community shares farming tools. What problems might arise?',
    '["No problems", "Maintenance responsibility is unclear, tools may not be returned, and scheduling conflicts", "Tools break faster", "Government issues"]'::jsonb,
    '1'::jsonb,
    'Shared tools need clear agreements on maintenance, use, and return.',
    ARRAY['Resource management.', 'Community cooperation.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f1f34d48-bec8-57a2-8546-c1efd1ae679c',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.4.5.1'), NULL, 'fill_in_blank',
    'Suggest two improvements to traditional farming tools used in Ghana.',
    NULL,
    '"ergonomic handles"'::jsonb,
    'Better ergonomic handles, lighter materials, and improved blade materials for longer-lasting edges.',
    ARRAY['Design improvements.', 'Practical upgrades.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.5.1.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5fc5c15b-f96b-55f9-b1a2-0195c784f781',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Sustainable waste management means:',
    '["Burning all waste", "Managing waste in a way that minimises environmental impact and conserves resources", "Dumping waste far away", "Ignoring waste"]'::jsonb,
    '1'::jsonb,
    'Sustainability means meeting current needs without harming future generations.',
    ARRAY['Long-term approach.', 'Environmental protection.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2dbd88ab-a098-5013-bf78-ad090764dc52',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'The waste hierarchy prioritises:',
    '["Landfill first", "Reduce, Reuse, Recycle, then dispose", "Burn everything", "Dump everything"]'::jsonb,
    '1'::jsonb,
    'The 3 Rs (Reduce, Reuse, Recycle) come before disposal.',
    ARRAY['Prevention first.', 'Waste hierarchy.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b506a13d-6cb5-5dd1-a39b-99a44ed65d41',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Composting converts organic waste into:',
    '["Plastic", "Nutrient-rich soil amendment", "Toxic waste", "Building material"]'::jsonb,
    '1'::jsonb,
    'Composting decomposes organic matter into valuable fertiliser.',
    ARRAY['Natural process.', 'Soil improvement.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c1bd0763-0ba3-5049-97a3-f1f206bd802a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Recycling converts waste materials into:',
    '["Energy only", "New products, reducing the need for raw materials", "Nothing useful", "Toxic chemicals"]'::jsonb,
    '1'::jsonb,
    'Recycling reprocesses materials into new products.',
    ARRAY['Resource conservation.', 'Waste reduction.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f641f898-a042-5cc2-901a-1bc3759a23a4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'The least preferred option in waste management is:',
    '["Reduce", "Reuse", "Landfill disposal", "Recycle"]'::jsonb,
    '2'::jsonb,
    'Landfill is the last resort — reduce, reuse, recycle are preferred.',
    ARRAY['Waste hierarchy.', 'Environmental impact.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3cb46725-fa09-5d5c-b5d1-f2fc27bd0431',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Biodegradable waste can be managed by:',
    '["Landfill only", "Composting and anaerobic digestion", "Recycling", "Exporting"]'::jsonb,
    '1'::jsonb,
    'Organic waste can be composted or converted to biogas.',
    ARRAY['Natural decomposition.', 'Resource recovery.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '60b8ac8f-bc48-5859-9eb2-47be9bf11aa7',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Why is waste segregation important?',
    '["It is not important", "Different waste types need different treatment methods; mixing makes recycling difficult", "To make waste heavier", "To look tidy"]'::jsonb,
    '1'::jsonb,
    'Segregation at source enables efficient recycling and treatment.',
    ARRAY['Processing efficiency.', 'Material recovery.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd559fe0d-0bfd-518f-ac2f-7463b05326df',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Anaerobic digestion converts organic waste to:',
    '["Compost only", "Biogas (methane) and fertiliser", "Plastic", "Metal"]'::jsonb,
    '1'::jsonb,
    'Anaerobic digestion produces biogas for energy and digestate for fertiliser.',
    ARRAY['Energy recovery.', 'Dual benefit.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '77a87864-5adf-5276-a828-8294586c3bcb',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Why is open burning of waste harmful?',
    '["It is not harmful", "It releases toxic gases, particulate matter, and greenhouse gases", "It reduces waste volume safely", "It produces energy"]'::jsonb,
    '1'::jsonb,
    'Open burning releases dioxins, furans, and other pollutants.',
    ARRAY['Air pollution.', 'Health hazard.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f5acd420-a4a1-5a2e-8fa5-010e64c85c6b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'fill_in_blank',
    'Name one way to reduce household waste.',
    NULL,
    '"buy less"'::jsonb,
    'Buying less, using reusable containers, and avoiding single-use plastics.',
    ARRAY['Source reduction.', 'Most effective R.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bc93417f-b795-5247-a59a-905e342276a1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Extended Producer Responsibility (EPR) means:',
    '["Consumers manage waste", "Producers are responsible for the end-of-life management of their products", "Government manages all waste", "Nobody is responsible"]'::jsonb,
    '1'::jsonb,
    'EPR makes manufacturers responsible for recycling/disposal of their products.',
    ARRAY['Policy approach.', 'Producer accountability.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '419cfe9a-c263-502e-9454-64241133c540',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Why is plastic waste a major problem in Ghana?',
    '["It is not a problem", "Plastic does not decompose, blocks drains, and causes flooding", "Plastic is useful", "Ghana has no plastic"]'::jsonb,
    '1'::jsonb,
    'Non-biodegradable plastic blocks drainage systems and pollutes the environment.',
    ARRAY['Infrastructure blockage.', 'Environmental persistence.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '97e9f7c2-5759-559c-b799-3bfdf6a02eac',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'fill_in_blank',
    'How can communities in Ghana manage waste sustainably?',
    NULL,
    '"community composting"'::jsonb,
    'Community composting, recycling cooperatives, waste separation at source, and education.',
    ARRAY['Community-based solutions.', 'Local action.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6e484c65-447b-55d1-bf2b-c864bd32915f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'fill_in_blank',
    'Why is it better to prevent waste than to manage it?',
    NULL,
    '"source reduction"'::jsonb,
    'Prevention avoids the environmental and economic costs of waste management entirely.',
    ARRAY['Most sustainable approach.', 'Upstream solution.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1d758955-6f85-5781-a010-975e2809e3fe',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'A factory produces hazardous waste. What should they do?',
    '["Dump it in the river", "Treat it to neutralise the hazard before disposal, following regulations", "Burn it openly", "Ignore it"]'::jsonb,
    '1'::jsonb,
    'Hazardous waste requires special treatment to prevent environmental contamination.',
    ARRAY['Regulated disposal.', 'Safety protocols.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e64a7a39-2351-5c12-a6d7-4e7e6f02d6db',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'fill_in_blank',
    'How does proper waste management contribute to public health?',
    NULL,
    '"disease prevention"'::jsonb,
    'Proper waste management reduces disease vectors (rats, flies), prevents water contamination, and reduces air pollution.',
    ARRAY['Health protection.', 'Disease prevention.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'be1c6246-8ee4-58e4-8685-14e7441193ee',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Why are landfills engineered rather than just holes in the ground?',
    '["They are not engineered", "Engineered landfills have liners, leachate collection, and gas capture to prevent pollution", "To look professional", "To save money"]'::jsonb,
    '1'::jsonb,
    'Engineering prevents groundwater contamination and captures harmful gases.',
    ARRAY['Environmental protection.', 'Technical design.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'de336587-4210-5a58-b4e2-2125dcd76f0d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'fill_in_blank',
    'Explain the concept of a circular economy in waste management.',
    NULL,
    '"reuse and recycle"'::jsonb,
    'A circular economy designs products for reuse and recycling, minimising waste and keeping materials in use.',
    ARRAY['Closed-loop system.', 'Sustainable model.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ab0cd17f-c736-5a37-b0ea-cb217b476be7',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'multiple_choice',
    'Why should e-waste (electronic waste) be handled separately?',
    '["It should not be", "E-waste contains toxic heavy metals (lead, mercury) that can contaminate soil and water", "E-waste is harmless", "It is too small to matter"]'::jsonb,
    '1'::jsonb,
    'E-waste requires specialised recycling to recover valuable materials and prevent pollution.',
    ARRAY['Hazardous materials.', 'Special recycling.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '80f41431-f1dc-53c6-9fcb-62c72d5d1177',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.1.1'), NULL, 'fill_in_blank',
    'How can schools contribute to sustainable waste management?',
    NULL,
    '"education"'::jsonb,
    'Schools can educate students, implement recycling programmes, compost food waste, and reduce paper use.',
    ARRAY['Educational role.', 'Practical action.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.5.2.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0b4037e2-a182-5f9a-aa74-bd38a81c0095',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'A communicable disease is one that:',
    '["Cannot spread", "Can spread from one person to another", "Only affects animals", "Is genetic"]'::jsonb,
    '1'::jsonb,
    'Communicable diseases are transmitted between people.',
    ARRAY['Infectious diseases.', 'Transmission possible.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '25cae439-b3ad-579a-843f-c8bf77f7f5af',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Malaria is transmitted by:',
    '["Contaminated water", "Mosquito bites", "Touching an infected person", "Breathing polluted air"]'::jsonb,
    '1'::jsonb,
    'Anopheles mosquitoes transmit the Plasmodium parasite.',
    ARRAY['Vector-borne disease.', 'Preventable.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95e02ac5-6bbf-5636-9df2-f43eb8b7f9dc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Cholera is transmitted through:',
    '["Mosquito bites", "Contaminated water and food", "Touching", "Air"]'::jsonb,
    '1'::jsonb,
    'Cholera spreads through faecal contamination of water and food.',
    ARRAY['Waterborne disease.', 'Sanitation related.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aca81a21-22bf-5482-aa82-b186aff8914d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Tuberculosis (TB) spreads through:',
    '["Water", "Air (droplets from coughing/sneezing)", "Mosquitoes", "Food"]'::jsonb,
    '1'::jsonb,
    'TB spreads through respiratory droplets in the air.',
    ARRAY['Airborne disease.', 'Respiratory transmission.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '7ad95e2e-fb83-5939-98b4-0516b2937d61',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Washing hands with soap prevents disease by:',
    '["Killing all germs instantly", "Removing pathogens before they enter the body", "Making hands smell nice", "Drying the skin"]'::jsonb,
    '1'::jsonb,
    'Handwashing removes germs before they can cause infection.',
    ARRAY['Prevention method.', 'Simple and effective.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '96a039d1-564a-5913-8c72-325fc1bcef25',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'A vector is:',
    '["A medicine", "An organism that transmits a disease-causing agent", "A type of bacteria", "A symptom"]'::jsonb,
    '1'::jsonb,
    'Vectors are organisms (like mosquitoes) that carry and transmit pathogens.',
    ARRAY['Disease carriers.', 'Control target.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0b24b486-df55-5530-b843-8cd0ab82cc5d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'How does cholera spread in communities?',
    '["Through air", "Through faecal contamination of water sources, especially during floods", "Through mosquito bites", "Through touching"]'::jsonb,
    '1'::jsonb,
    'Cholera spreads when faeces contaminate drinking water.',
    ARRAY['Water contamination.', 'Poor sanitation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'aa9fd9b3-66e4-5c34-91f2-e9dffda526a1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Why is vaccination important for preventing communicable diseases?',
    '["It cures diseases", "It builds immunity before exposure, preventing infection and spread", "It makes people stronger", "It is not important"]'::jsonb,
    '1'::jsonb,
    'Vaccines stimulate the immune system to recognise and fight specific pathogens.',
    ARRAY['Prevention strategy.', 'Herd immunity.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3a605220-6c42-5900-beaf-27d535474952',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'HIV/AIDS is transmitted through:',
    '["Casual contact", "Blood, unprotected sex, and mother to child", "Water", "Air"]'::jsonb,
    '1'::jsonb,
    'HIV spreads through specific body fluid contact.',
    ARRAY['Not casual contact.', 'Preventable transmission.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f252bc97-4609-5c91-842c-f3e86594bb89',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Why is clean water important for preventing communicable diseases?',
    '["It is not important", "Clean water prevents waterborne diseases like cholera and typhoid", "Only for drinking", "For cooking only"]'::jsonb,
    '1'::jsonb,
    'Contaminated water is a major disease transmission route.',
    ARRAY['Water sanitation.', 'Health foundation.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f8c03937-43ac-5942-83f1-06aa72287605',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'An epidemic is:',
    '["A disease that affects one person", "A disease outbreak affecting many people in a community at the same time", "A chronic disease", "A genetic disorder"]'::jsonb,
    '1'::jsonb,
    'Epidemics are widespread outbreaks in a community or region.',
    ARRAY['Outbreak definition.', 'Public health concern.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '701a4623-abbc-5b02-8937-df972185248b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'fill_in_blank',
    'Name two ways to prevent the spread of respiratory diseases.',
    NULL,
    '"handwashing"'::jsonb,
    'Handwashing, covering coughs, wearing masks, and vaccination.',
    ARRAY['Hygiene measures.', 'Personal protection.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '925e7972-4afd-50ee-8190-3eca1e8b0f08',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Why is early treatment important for communicable diseases?',
    '["It is not important", "Early treatment reduces severity, prevents complications, and reduces spread to others", "Only for comfort", "Only for serious cases"]'::jsonb,
    '1'::jsonb,
    'Early intervention improves outcomes and reduces transmission.',
    ARRAY['Treatment timing.', 'Public health benefit.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6081163f-e910-5c67-843c-40d04c49d96b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'fill_in_blank',
    'How does poverty contribute to the spread of communicable diseases?',
    NULL,
    '"limited resources"'::jsonb,
    'Poverty limits access to clean water, sanitation, healthcare, and nutrition, increasing disease vulnerability.',
    ARRAY['Social determinant.', 'Health inequality.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'a5c8315e-aff1-5bb5-96f3-7467f1df6667',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Why is contact tracing important during a disease outbreak?',
    '["It is not important", "It identifies exposed people who may be infected, allowing early treatment and quarantine", "For fun", "Government requirement"]'::jsonb,
    '1'::jsonb,
    'Contact tracing breaks transmission chains by finding and treating infected contacts.',
    ARRAY['Epidemiological tool.', 'Outbreak control.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3c21d3cb-d3ca-5229-ba8e-197095ed357e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'fill_in_blank',
    'Explain why some communicable diseases are seasonal.',
    NULL,
    '"environmental factors"'::jsonb,
    'Temperature, humidity, and vector activity vary by season, affecting disease transmission rates.',
    ARRAY['Seasonal patterns.', 'Environmental drivers.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6aa4b08c-b150-5a92-bd69-8a583639b38f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Why is community education important for disease prevention?',
    '["It is not important", "Educated communities adopt hygiene practices, seek early treatment, and support vaccination campaigns", "Only for doctors", "Only for children"]'::jsonb,
    '1'::jsonb,
    'Education empowers communities to prevent and respond to disease.',
    ARRAY['Behaviour change.', 'Community empowerment.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '645de1a7-fd11-5b7e-85b2-e54ce4a2be62',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'fill_in_blank',
    'How can governments control communicable diseases?',
    NULL,
    '"public health measures"'::jsonb,
    'Vaccination programmes, clean water supply, sanitation, surveillance, and rapid response teams.',
    ARRAY['Policy tools.', 'Public health infrastructure.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dade37af-a0bc-513d-a153-86c9e6882ee1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Why are some diseases more contagious than others?',
    '["Random chance", "Different pathogens have different transmission mechanisms and rates of infectivity", "All diseases spread equally", "Size of pathogen only"]'::jsonb,
    '1'::jsonb,
    'Contagiousness depends on how easily the pathogen spreads and how few particles cause infection.',
    ARRAY['R0 value.', 'Transmission efficiency.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ad4156b2-3a83-54a5-9912-48f72708d00e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.1'), NULL, 'multiple_choice',
    'Why is antibiotic resistance a growing concern for communicable diseases?',
    '["It is not a concern", "Overuse of antibiotics creates resistant bacteria that are harder to treat", "Antibiotics are too expensive", "Only doctors care"]'::jsonb,
    '1'::jsonb,
    'Antimicrobial resistance makes infections harder to treat, increasing disease burden.',
    ARRAY['Public health threat.', 'Global concern.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.5.2.2
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'de22ba20-926c-5b49-8341-ec8ff03b46f1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Bacteria are:',
    '["Viruses", "Single-celled microorganisms", "Fungi", "Parasites"]'::jsonb,
    '1'::jsonb,
    'Bacteria are single-celled organisms with no nucleus (prokaryotes).',
    ARRAY['Microscopic.', 'Diverse shapes.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '47cec9a3-c9a2-517f-a35e-97b32454de6d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Tuberculosis (TB) is caused by:',
    '["A virus", "A bacterium", "A fungus", "A parasite"]'::jsonb,
    '1'::jsonb,
    'TB is caused by Mycobacterium tuberculosis.',
    ARRAY['Bacterial infection.', 'Lung disease.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '74991fab-e136-5e08-88a8-8ab9fcbaf76a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Cholera is caused by:',
    '["A virus", "Vibrio cholerae bacterium", "A fungus", "Dirty water only"]'::jsonb,
    '1'::jsonb,
    'Cholera is caused by Vibrio cholerae bacteria in contaminated water.',
    ARRAY['Waterborne bacterium.', 'Acute diarrhoea.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b048a957-a0e5-5318-865d-cc1e95651024',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Antibiotics are effective against:',
    '["Viruses", "Bacteria", "Both viruses and bacteria", "Neither"]'::jsonb,
    '1'::jsonb,
    'Antibiotics kill or inhibit bacteria, not viruses.',
    ARRAY['Bacterial treatment.', 'Not for viruses.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ba603b47-6ed9-584d-885e-86231a81ea71',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Typhoid fever is caused by:',
    '["A virus", "Salmonella typhi bacterium", "A fungus", "A protozoan"]'::jsonb,
    '1'::jsonb,
    'Typhoid is caused by Salmonella typhi in contaminated food/water.',
    ARRAY['Enteric fever.', 'Food/waterborne.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '8cd76e25-b0f5-52a2-a57e-61baccc510d7',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Bacteria reproduce by:',
    '["Sexual reproduction", "Binary fission (splitting into two)", "Spore formation", "Budding"]'::jsonb,
    '1'::jsonb,
    'Binary fission: one cell divides into two identical cells.',
    ARRAY['Asexual reproduction.', 'Rapid multiplication.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '208638f1-377b-5613-b479-618c844c88fa',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Food poisoning can be caused by:',
    '["Only viruses", "Bacteria like Salmonella and E. coli growing in food", "Only chemicals", "Only parasites"]'::jsonb,
    '1'::jsonb,
    'Bacterial toxins in food cause food poisoning.',
    ARRAY['Food safety.', 'Temperature control.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '161b3f68-81bd-56e1-8729-6546d0854894',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Why must antibiotics be taken for the full prescribed course?',
    '["To save money", "Stopping early may allow resistant bacteria to survive and multiply", "Because doctors say so", "It does not matter"]'::jsonb,
    '1'::jsonb,
    'Incomplete courses kill weak bacteria but allow resistant ones to survive.',
    ARRAY['Resistance prevention.', 'Full course essential.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '87848bc8-1d92-5e7e-83fa-76519b47c6c6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'How does tuberculosis spread?',
    '["Through water", "Through air (coughing/sneezing droplets)", "Through food", "Through mosquitoes"]'::jsonb,
    '1'::jsonb,
    'TB spreads through respiratory droplets from infected persons.',
    ARRAY['Airborne transmission.', 'Close contact.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ffd246f1-f3bf-5414-8b82-07704de7f4e2',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Why is pasteurisation of milk important?',
    '["To make it taste better", "To kill harmful bacteria like Salmonella and E. coli", "To add vitamins", "To change the colour"]'::jsonb,
    '1'::jsonb,
    'Pasteurisation heats milk to kill pathogenic bacteria.',
    ARRAY['Food safety.', 'Heat treatment.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '91bd0a5f-7211-56b5-91ce-be4eb9c20720',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'fill_in_blank',
    'Name one bacterial disease that affects the digestive system.',
    NULL,
    '"cholera"'::jsonb,
    'Cholera, typhoid, and food poisoning are bacterial diseases of the digestive system.',
    ARRAY['Gastrointestinal diseases.', 'Food/waterborne.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dfb1b326-0cfa-5a17-8ee2-24fc9fc836e4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Why are bacteria both helpful and harmful?',
    '["They are only harmful", "Some cause disease, but others decompose waste, fix nitrogen, and aid digestion", "They are only helpful", "They are not alive"]'::jsonb,
    '1'::jsonb,
    'Bacteria have dual roles — pathogens and beneficial organisms.',
    ARRAY['Ecological roles.', 'Not all harmful.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3588cc54-0577-56ca-bdcf-8b923e7da7a6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'fill_in_blank',
    'A patient has a viral infection. Why won''t antibiotics help?',
    NULL,
    '"viral structure"'::jsonb,
    'Antibiotics target bacterial structures (cell walls, ribosomes) that viruses lack.',
    ARRAY['Structural difference.', 'Wrong target.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ef4a2b4b-07eb-527c-ba49-4d44e3d8338b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'fill_in_blank',
    'Why is clean water critical for preventing bacterial diseases?',
    NULL,
    '"waterborne bacteria"'::jsonb,
    'Many bacterial diseases (cholera, typhoid) spread through contaminated water.',
    ARRAY['Transmission route.', 'Sanitation essential.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '74dcbbf7-5f05-57c3-b509-45f5ac4abe44',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'How do bacteria become resistant to antibiotics?',
    '["They do not", "Random mutations allow some bacteria to survive antibiotics; these multiply, creating resistant populations", "Doctors make them resistant", "Patients make them resistant"]'::jsonb,
    '1'::jsonb,
    'Natural selection: survivors with resistance genes reproduce.',
    ARRAY['Evolution in action.', 'Natural selection.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '95d3470a-049c-500b-9da7-91f29e258a31',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Why is handwashing effective against bacterial diseases?',
    '["It kills bacteria", "Soap and friction physically remove bacteria from hands before they enter the body", "It dries hands", "It makes hands slippery"]'::jsonb,
    '1'::jsonb,
    'Handwashing removes bacteria rather than killing them — mechanical removal.',
    ARRAY['Prevention method.', 'Simple and effective.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e652cfae-d51d-517c-85eb-ac0fcae0617b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'multiple_choice',
    'Compare the treatment of bacterial vs viral infections.',
    '["Same treatment", "Bacterial: antibiotics. Viral: antivirals or supportive care (rest, fluids)", "Viral: antibiotics", "Bacterial: antivirals"]'::jsonb,
    '1'::jsonb,
    'Different pathogens require different treatments — antibiotics only work on bacteria.',
    ARRAY['Treatment specificity.', 'Drug selection.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dbbf6c0b-b6dd-529b-8efc-68a654319b1e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'fill_in_blank',
    'Why is food hygiene important in preventing bacterial diseases?',
    NULL,
    '"bacterial growth"'::jsonb,
    'Bacteria multiply rapidly in warm, moist conditions — proper food handling prevents contamination and growth.',
    ARRAY['Food safety.', 'Temperature control.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5416f9b0-f5b2-5108-9c7c-965ad20a7f1d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'fill_in_blank',
    'A community has an outbreak of cholera. What immediate actions should be taken?',
    NULL,
    '"water treatment"'::jsonb,
    'Provide clean water, treat the sick with oral rehydration/antibiotics, and improve sanitation.',
    ARRAY['Emergency response.', 'Public health measures.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4925e4a9-d95e-52b1-bd0d-950769c65516',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.2.2'), NULL, 'fill_in_blank',
    'How can farmers prevent bacterial contamination of food products?',
    NULL,
    '"hygiene"'::jsonb,
    'Good hygiene during harvesting, proper storage, clean water for washing, and temperature control.',
    ARRAY['Farm to fork.', 'Food safety chain.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.5.4.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f939c9aa-6193-56c7-954f-07fcc0e0eb72',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'Climate change refers to:',
    '["Daily weather changes", "Long-term shifts in global temperatures and weather patterns", "Seasonal changes only", "Local temperature changes"]'::jsonb,
    '1'::jsonb,
    'Climate change is a long-term alteration of global climate patterns.',
    ARRAY['Decades-scale change.', 'Global phenomenon.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3fa89ae6-67dd-5726-87e5-576e9d884588',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'The main cause of current climate change is:',
    '["Solar activity", "Human activities releasing greenhouse gases", "Volcanic eruptions", "Natural cycles only"]'::jsonb,
    '1'::jsonb,
    'Burning fossil fuels and deforestation release CO2, trapping heat.',
    ARRAY['Anthropogenic cause.', 'Greenhouse effect.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '380cb176-b2a2-5f22-be77-77127ba9567d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'The greenhouse effect is:',
    '["Always harmful", "A natural process where gases trap heat in the atmosphere, made worse by human emissions", "Only in greenhouses", "A new phenomenon"]'::jsonb,
    '1'::jsonb,
    'Natural greenhouse effect is essential; human activities have intensified it.',
    ARRAY['Enhanced greenhouse effect.', 'Global warming.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ac4c8f2f-b05b-5417-a19d-cdf9c6e59a3f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'Global warming refers to:',
    '["Local heating", "The increase in Earth''s average temperature due to greenhouse gases", "Summer heat", "Urban heat islands"]'::jsonb,
    '1'::jsonb,
    'Global warming is the rise in average global temperatures.',
    ARRAY['Temperature increase.', 'Climate change driver.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5866487c-9783-55c0-8650-563fc0b3b023',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'Which gas contributes most to the greenhouse effect from human activities?',
    '["Oxygen", "Carbon dioxide", "Nitrogen", "Hydrogen"]'::jsonb,
    '1'::jsonb,
    'CO2 from fossil fuel burning is the primary greenhouse gas.',
    ARRAY['Fossil fuel emissions.', 'Deforestation.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '242a6262-58f3-57e3-810b-c6f0294fb8e9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'Melting of polar ice caps causes:',
    '["Nothing significant", "Rising sea levels, threatening coastal communities", "More ice", "Cooler temperatures"]'::jsonb,
    '1'::jsonb,
    'Melting ice adds water to oceans, raising sea levels.',
    ARRAY['Sea level rise.', 'Coastal flooding.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '35b4b498-bf89-5c47-9ce9-f60ebbc60fea',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'How does deforestation contribute to climate change?',
    '["It does not", "Trees absorb CO2; removing them increases atmospheric CO2", "It reduces rainfall only", "It creates jobs"]'::jsonb,
    '1'::jsonb,
    'Forests are carbon sinks — deforestation releases stored carbon and reduces absorption.',
    ARRAY['Carbon sink loss.', 'Double impact.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2c7530ae-4aab-5622-b602-69c3dca28d0e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'Extreme weather events (droughts, floods, storms) are becoming more frequent due to:',
    '["Random chance", "Climate change increasing atmospheric energy and altering weather patterns", "Better reporting", "Population growth"]'::jsonb,
    '1'::jsonb,
    'Higher temperatures mean more energy in the atmosphere, intensifying weather events.',
    ARRAY['Atmospheric energy.', 'Pattern changes.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'dfdf57f3-0939-52bc-a857-c91ba24d64b4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'How does climate change affect agriculture in Ghana?',
    '["No effect", "Changing rainfall patterns cause droughts and floods, reducing crop yields", "Only affects large farms", "Only affects northern Ghana"]'::jsonb,
    '1'::jsonb,
    'Unpredictable rainfall and extreme heat stress crops and livestock.',
    ARRAY['Food security threat.', 'Agricultural impact.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e36a3340-5378-5c16-a689-6405e56d6914',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'Rising sea levels threaten coastal communities by:',
    '["Creating beaches", "Causing flooding, erosion, and saltwater intrusion into freshwater", "Lowering temperatures", "Creating new land"]'::jsonb,
    '1'::jsonb,
    'Higher seas flood low-lying areas and contaminate freshwater sources.',
    ARRAY['Coastal vulnerability.', 'Habitat loss.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '849cfc47-b3da-5c50-aa10-ffdcc5d2edf4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'fill_in_blank',
    'Name one effect of climate change on human health.',
    NULL,
    '"heat stress"'::jsonb,
    'Heat stress, waterborne diseases, malnutrition, and spread of vector-borne diseases.',
    ARRAY['Multiple health impacts.', 'Vulnerable populations.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'e1036463-cebb-58d6-882c-c23b437379e1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'Why are developing countries like Ghana more vulnerable to climate change?',
    '["They are not vulnerable", "Limited resources for adaptation, reliance on rain-fed agriculture, and less infrastructure", "They cause more climate change", "They have better technology"]'::jsonb,
    '1'::jsonb,
    'Economic and infrastructure limitations increase vulnerability.',
    ARRAY['Adaptive capacity.', 'Development challenges.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd1c8f3b8-1ee3-589f-a806-96e6f0db95b3',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'fill_in_blank',
    'How can Ghana reduce its greenhouse gas emissions?',
    NULL,
    '"renewable energy"'::jsonb,
    'Switch to renewable energy, reduce deforestation, improve farming practices, and promote energy efficiency.',
    ARRAY['Mitigation strategies.', 'National action.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6b4aa91c-df6d-5fcb-a25a-0f7f877cd7f0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'Why is the Paris Agreement important for climate change?',
    '["It is not important", "It commits countries to limit global warming to 1.5-2\u00b0C above pre-industrial levels", "It bans fossil fuels", "It is only for rich countries"]'::jsonb,
    '1'::jsonb,
    'The Paris Agreement sets global targets for emission reductions.',
    ARRAY['International commitment.', 'Climate action framework.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5a3015e9-3b4b-5a82-93a0-358e45f0e0b0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'What is the difference between climate change mitigation and adaptation?',
    '["They are the same", "Mitigation reduces emissions; adaptation adjusts to climate change impacts", "Mitigation is for rich countries", "Adaptation is for poor countries"]'::jsonb,
    '1'::jsonb,
    'Mitigation addresses causes; adaptation addresses effects.',
    ARRAY['Two complementary strategies.', 'Both needed.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '6e4444ce-9c4e-5f73-8b26-bae021ca0696',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'fill_in_blank',
    'How does climate change affect water resources in Ghana?',
    NULL,
    '"water stress"'::jsonb,
    'Changing rainfall patterns affect water availability, causing droughts in some areas and floods in others.',
    ARRAY['Water security.', 'Regional variations.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '271f775c-af77-555a-92e8-65223f708062',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'fill_in_blank',
    'Why is tree planting an effective climate change strategy?',
    NULL,
    '"carbon sequestration"'::jsonb,
    'Trees absorb CO2 through photosynthesis, storing carbon in wood and releasing oxygen.',
    ARRAY['Natural carbon capture.', 'Multiple benefits.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '180d45cb-1fe2-5095-a1b5-0ba23b917179',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'fill_in_blank',
    'Explain why climate change is described as a "threat multiplier."',
    NULL,
    '"amplifies risks"'::jsonb,
    'Climate change worsens existing problems: poverty, food insecurity, disease, and conflict.',
    ARRAY['Cascading impacts.', 'Vulnerability amplifier.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5b8e610c-0c67-5575-8f47-864ac8797e32',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'What can individuals do to reduce their carbon footprint?',
    '["Nothing significant", "Use public transport, save energy, reduce waste, eat less meat, and plant trees", "Only government can act", "Move to another country"]'::jsonb,
    '1'::jsonb,
    'Individual actions collectively make a significant impact.',
    ARRAY['Personal responsibility.', 'Cumulative effect.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5d679c97-eeb4-573b-96d8-f1a6b4927416',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.4.1'), NULL, 'multiple_choice',
    'Why is climate education important for young people in Ghana?',
    '["It is not important", "Young people will face the impacts and can drive change through informed decisions", "Only for scientists", "Only for politicians"]'::jsonb,
    '1'::jsonb,
    'Climate literacy empowers youth to advocate and act for sustainability.',
    ARRAY['Future generation.', 'Leadership role.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.5.5.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '12631d84-ce46-5ead-97d0-78975cc692d9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'The three main components of soil are:',
    '["Rocks, water, air", "Minerals, organic matter, and water/air", "Sand, clay, and rocks", "Gravel, sand, and silt"]'::jsonb,
    '1'::jsonb,
    'Soil minerals, organic matter (humus), and water/air in pores.',
    ARRAY['Soil composition.', 'Foundation for plants.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bf5a104f-90b7-5bf0-becc-96cd957704cc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Soil texture refers to:',
    '["The colour of soil", "The relative proportions of sand, silt, and clay particles", "The amount of water in soil", "The temperature of soil"]'::jsonb,
    '1'::jsonb,
    'Texture is determined by particle size proportions.',
    ARRAY['Sandy, clayey, loamy.', 'Affects plant growth.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '3c607570-6170-5a58-9c96-239d3273874e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Sandy soil has:',
    '["Small particles and holds water well", "Large particles and drains quickly", "No air spaces", "Only clay particles"]'::jsonb,
    '1'::jsonb,
    'Sand particles are large, creating big air spaces — water drains fast.',
    ARRAY['Well-drained.', 'Poor water retention.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'd755d350-38fa-52c3-9783-bb11a30e536d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Clay soil has:',
    '["Large particles", "Very small particles that pack tightly, holding water", "No nutrients", "Only sand"]'::jsonb,
    '1'::jsonb,
    'Clay particles are tiny and pack closely, retaining water but draining poorly.',
    ARRAY['Water retention.', 'Can become waterlogged.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '96d9c6c1-5ecd-5808-b957-5ab32e0de42d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Loamy soil is a mixture of:',
    '["Only sand", "Sand, silt, and clay in balanced proportions", "Only clay", "Only rocks"]'::jsonb,
    '1'::jsonb,
    'Loam is ideal — balanced mixture of sand, silt, and clay.',
    ARRAY['Best for farming.', 'Good drainage and retention.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'ed94f0ca-5c99-54a5-9b2e-0d94f02d0290',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Soil permeability refers to:',
    '["Soil colour", "How easily water passes through the soil", "Soil temperature", "Soil weight"]'::jsonb,
    '1'::jsonb,
    'Permeability is the rate at which water moves through soil.',
    ARRAY['Drainage property.', 'Affects plant roots.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1d4dc5fe-6eed-5b60-8a9a-77310262703a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Why is loamy soil best for most crops?',
    '["It is the cheapest", "It retains moisture but also drains well, and is rich in nutrients", "It has no sand", "It is always wet"]'::jsonb,
    '1'::jsonb,
    'Loam balances drainage and water retention with good nutrient content.',
    ARRAY['Ideal texture.', 'Plant-friendly.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '619a7070-0c79-5ad5-917a-4bedaea11ccc',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Soil pH affects:',
    '["Soil colour", "The availability of nutrients to plants", "Soil weight only", "Nothing"]'::jsonb,
    '1'::jsonb,
    'pH determines which nutrients are available — too acidic or alkaline locks out nutrients.',
    ARRAY['Nutrient availability.', 'pH 6-7 is optimal.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '0e6056c2-49c3-5526-8a7e-2c9dedb895f9',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Organic matter (humus) in soil helps by:',
    '["Making soil heavy", "Improving soil structure, water retention, and nutrient supply", "Killing bacteria", "Making soil red"]'::jsonb,
    '1'::jsonb,
    'Humus improves soil structure and provides nutrients as it decomposes.',
    ARRAY['Soil health.', 'Microbial food.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '401bf9b4-5b35-563f-ad89-22ab45ebf630',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'A farmer adds compost to sandy soil. What effect does this have?',
    '["No effect", "Compost improves water retention and nutrient content of sandy soil", "Makes it sandier", "Makes it too wet"]'::jsonb,
    '1'::jsonb,
    'Organic matter fills large pores in sand, improving water and nutrient retention.',
    ARRAY['Soil amendment.', 'Practical improvement.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1a06f824-3714-5058-8eae-c7b34ba30665',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'fill_in_blank',
    'Name one method to test soil texture.',
    NULL,
    '"feel test"'::jsonb,
    'Feel test (rub soil between fingers), jar test (settle in water), or ribbon test.',
    ARRAY['Simple methods.', 'Field assessment.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '66def2cb-bdcd-51d6-a844-2808f80e6363',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Why does clay soil become hard when dry?',
    '["It has no water", "Clay particles shrink and stick together when water evaporates", "It is made of rock", "It has no air"]'::jsonb,
    '1'::jsonb,
    'Clay contracts and cracks when dry, becoming very hard.',
    ARRAY['Shrink-swell property.', 'Water dependent.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '54055458-51ab-588d-8fe7-fc1a44226796',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'How does soil structure differ from soil texture?',
    '["They are the same", "Texture is particle size; structure is how particles clump together into aggregates", "Structure is colour", "Texture is depth"]'::jsonb,
    '1'::jsonb,
    'Texture = particle size. Structure = arrangement into aggregates (crumbs).',
    ARRAY['Different properties.', 'Both affect plants.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '5725569a-1724-521d-b9c8-5e462b830d38',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'fill_in_blank',
    'Why do farmers in Ghana add organic matter to their soil?',
    NULL,
    '"soil health"'::jsonb,
    'Organic matter improves soil structure, water retention, nutrient supply, and microbial activity.',
    ARRAY['Multiple benefits.', 'Sustainable practice.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'de9bef5d-0918-5587-ad99-ccc54b3b4de5',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'fill_in_blank',
    'A farmer has very clayey soil. What problems might they face?',
    NULL,
    '"waterlogging"'::jsonb,
    'Poor drainage, waterlogging, hard when dry, difficult to till, and root rot.',
    ARRAY['Drainage issues.', 'Management needed.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '955de8ab-0e22-5b62-b4db-59ee8279f81f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Why is topsoil darker than subsoil?',
    '["Different minerals", "Topsoil contains more organic matter (humus), which is dark", "It is wetter", "It has more sand"]'::jsonb,
    '1'::jsonb,
    'Organic matter gives topsoil its dark colour.',
    ARRAY['Humus content.', 'Fertile layer.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '868fc5d2-521b-58d0-92a2-d4865514ede7',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'How does over-tilling affect soil structure?',
    '["Improves it", "Breaks down soil aggregates, reducing structure and increasing erosion risk", "Makes it wetter", "Adds nutrients"]'::jsonb,
    '1'::jsonb,
    'Excessive tilling destroys soil structure and exposes it to erosion.',
    ARRAY['Soil degradation.', 'Sustainable tillage.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '9e09ed91-60c6-5b41-8e95-5679f624aeb0',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'fill_in_blank',
    'Why is soil conservation important for farming?',
    NULL,
    '"prevent erosion"'::jsonb,
    'Soil conservation prevents erosion, maintains fertility, and ensures long-term productivity.',
    ARRAY['Sustainable agriculture.', 'Soil protection.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '560b91a1-99a9-5973-82f2-1053b00bdec4',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'multiple_choice',
    'Compare sandy and clayey soil for farming.',
    '["Sandy is always better", "Sandy drains fast but dries out; clay holds water but drains poorly; loam is ideal", "Clay is always better", "They are identical"]'::jsonb,
    '1'::jsonb,
    'Each has trade-offs — loam combines the best properties of both.',
    ARRAY['Texture comparison.', 'Crop matching.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'bba12ee3-d5ed-5b48-a19e-cdb19ccdf426',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.5.1'), NULL, 'fill_in_blank',
    'How can a farmer improve sandy soil for crop production?',
    NULL,
    '"add organic matter"'::jsonb,
    'Add compost, manure, or other organic matter to improve water and nutrient retention.',
    ARRAY['Soil amendment.', 'Practical solution.'],
    'bece_level', 'analysis', 'shared'
);

-- ============================================================
-- B8/JHS2.5.6.1
-- ============================================================

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '184dc658-cf3a-58b3-a551-f6f925c79436',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'The three main types of rocks are:',
    '["Hard, soft, and medium", "Igneous, sedimentary, and metamorphic", "Big, small, and medium", "Red, blue, and green"]'::jsonb,
    '1'::jsonb,
    'Three rock types based on formation process.',
    ARRAY['Classification system.', 'Formation processes.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '980a74fb-3ca8-5212-8ede-50a14493115e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Igneous rocks form from:',
    '["Layers of sediment", "Cooling and solidification of molten rock (magma or lava)", "Heat and pressure on existing rocks", "Decomposed plants"]'::jsonb,
    '1'::jsonb,
    'Igneous rocks form when magma/lava cools and solidifies.',
    ARRAY['Cooling process.', 'Crystallisation.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '27a8bca8-965a-510c-8b8f-fcd336b5c91a',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Sedimentary rocks form from:',
    '["Cooling lava", "Layers of sediment compressed over time", "Melting of other rocks", "Volcanic eruptions"]'::jsonb,
    '1'::jsonb,
    'Sedimentary rocks form from deposited and compacted sediments.',
    ARRAY['Layering process.', 'Fossils found.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '79effecd-b4a8-5070-8269-21c2473ca59b',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Metamorphic rocks form from:',
    '["Cooling magma", "Existing rocks changed by heat and pressure", "Loose sediments", "Volcanic ash"]'::jsonb,
    '1'::jsonb,
    'Metamorphic rocks are transformed from existing rocks by heat/pressure.',
    ARRAY['Transformation process.', 'Deep underground.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '85bb3d63-a2fe-57db-9b7f-593d07870a41',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Granite is an example of an:',
    '["Sedimentary rock", "Igneous rock", "Metamorphic rock", "Organic rock"]'::jsonb,
    '1'::jsonb,
    'Granite is an intrusive igneous rock — cooled slowly underground.',
    ARRAY['Coarse crystals.', 'Common building stone.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '916c1288-08a0-545a-9059-62f1865ec14f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Limestone is an example of a:',
    '["Igneous rock", "Sedimentary rock", "Metamorphic rock", "Metallic rock"]'::jsonb,
    '1'::jsonb,
    'Limestone is sedimentary — formed from marine organism remains.',
    ARRAY['Calcium carbonate.', 'Fossils common.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '2b3ff484-4f3b-5b6a-ae2a-8ec54a274202',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Marble is an example of a:',
    '["Igneous rock", "Sedimentary rock", "Metamorphic rock", "Synthetic rock"]'::jsonb,
    '2'::jsonb,
    'Marble is metamorphosed limestone.',
    ARRAY['Heat and pressure.', 'Calcium carbonate.'],
    'easy', 'recall', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'b5e51b17-dd2e-5075-b4a4-02719775ab78',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'The rock cycle shows:',
    '["Rocks never change", "Rocks can be transformed from one type to another over time", "Only igneous rocks exist", "Rocks are destroyed"]'::jsonb,
    '1'::jsonb,
    'The rock cycle is a continuous process of formation and transformation.',
    ARRAY['Continuous process.', 'Energy driven.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '32f78c3b-940d-59d0-aa1c-248d224d1635',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Fossils are most commonly found in:',
    '["Igneous rocks", "Sedimentary rocks", "Metamorphic rocks", "All rocks equally"]'::jsonb,
    '1'::jsonb,
    'Sedimentary rocks preserve fossils in their layered structure.',
    ARRAY['Preservation conditions.', 'Layering protects.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4fcfbc75-8686-5d86-9269-ae13c54008e6',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Soil is formed from:',
    '["Only organic matter", "Weathering of rocks combined with decomposed organic matter", "Manufactured materials", "Water only"]'::jsonb,
    '1'::jsonb,
    'Soil formation involves rock weathering and organic matter accumulation.',
    ARRAY['Soil formation process.', 'Long timescale.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fe989416-ff45-5174-b0de-ccb46ef37b1f',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Basalt is an igneous rock that forms from:',
    '["Slow cooling underground", "Rapid cooling of lava at the surface", "Compression of sand", "Heat and pressure"]'::jsonb,
    '1'::jsonb,
    'Basalt is extrusive igneous — cools quickly at the surface.',
    ARRAY['Fine crystals.', 'Volcanic origin.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'f7d48733-67c5-54f6-84ce-cde25a756cb3',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Sandstone is a sedimentary rock made of:',
    '["Compressed clay", "Cemented sand grains", "Molten rock", "Metamorphosed granite"]'::jsonb,
    '1'::jsonb,
    'Sandstone forms when sand grains are compacted and cemented together.',
    ARRAY['Sedimentary process.', 'Grain structure.'],
    'core', 'application', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'fe85b89d-6b59-53b4-95f4-848a10314b89',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'fill_in_blank',
    'Why is the rock cycle important for soil formation?',
    NULL,
    '"continuous process"'::jsonb,
    'The rock cycle continuously creates new rock that weathers into soil over time.',
    ARRAY['Soil source.', 'Geological process.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '1bb0678d-64a7-5824-8a4c-5a074e104db1',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'A rock has interlocking crystals and no layers. What type is it most likely?',
    '["Sedimentary", "Igneous", "Metamorphic", "Synthetic"]'::jsonb,
    '1'::jsonb,
    'Interlocking crystals and no layers suggest igneous origin (crystallisation from melt).',
    ARRAY['Texture clue.', 'Formation indicator.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '849482b2-6989-5ee4-8b9c-232e62f86300',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'fill_in_blank',
    'Why do different regions of Ghana have different soil types?',
    NULL,
    '"parent rock"'::jsonb,
    'Soil type depends on the parent rock, climate, and organic matter in each region.',
    ARRAY['Geological diversity.', 'Local conditions.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '317805d5-dc94-5ab5-93cc-4af376f98afd',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'fill_in_blank',
    'Explain how limestone can become marble.',
    NULL,
    '"heat and pressure"'::jsonb,
    'Limestone deep underground is subjected to heat and pressure, recrystallising into marble.',
    ARRAY['Metamorphic process.', 'Temperature and pressure.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '367b86c9-a8bd-533c-b92b-d30188a5772d',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Why is granite commonly used for building?',
    '["It is soft", "It is hard, durable, and resistant to weathering", "It is cheap", "It is colourful"]'::jsonb,
    '1'::jsonb,
    'Granite''s interlocking crystals make it very strong and weather-resistant.',
    ARRAY['Building material.', 'Durability.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '4e1716b9-64d8-5d89-bc7d-1263aadd9144',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'fill_in_blank',
    'How does weathering contribute to soil formation?',
    NULL,
    '"rock breakdown"'::jsonb,
    'Physical and chemical weathering breaks rock into smaller particles, which combine with organic matter to form soil.',
    ARRAY['Soil genesis.', 'Slow process.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    '12495874-c665-5f7f-992b-63e4deadb837',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'fill_in_blank',
    'A farmer discovers fossils in their field. What does this tell them about the rock beneath?',
    NULL,
    '"sedimentary"'::jsonb,
    'Fossils indicate sedimentary rock — formed in layers with preserved organisms.',
    ARRAY['Geological indicator.', 'History clue.'],
    'bece_level', 'analysis', 'shared'
);

INSERT INTO questions (id, topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)
VALUES (
    'c5526fd5-ad79-5b4b-8f17-2a6812c2126e',
    (SELECT id FROM topics WHERE code = 'B8/JHS2.5.6.1'), NULL, 'multiple_choice',
    'Why is soil depth important for farming?',
    '["It is not important", "Deeper soil provides more space for roots and more water/nutrient storage", "Only surface soil matters", "Soil depth is always the same"]'::jsonb,
    '1'::jsonb,
    'Deeper soil supports deeper root growth and better water availability.',
    ARRAY['Root zone.', 'Crop productivity.'],
    'bece_level', 'analysis', 'shared'
);

