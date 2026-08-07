-- Flawlex Mastery — SBC Seed: B7/JHS1
-- NaCCA Common Core Programme (CCP) Science Curriculum, September 2020
-- 27 content standards

-- Strands (B7)
INSERT INTO strands (id, subject_id, name, code, class_level, sort_order) VALUES
    ('78467126-bfa5-5e68-b900-89287e24a32e', 'a0000000-0000-0000-0000-000000000001', 'Diversity of Matter', 'B7/JHS1.1', 'B7', 1),
    ('fc32d025-29e5-5ecc-8d09-152d942272ee', 'a0000000-0000-0000-0000-000000000001', 'Cycles', 'B7/JHS1.2', 'B7', 2),
    ('c53a3a08-8e39-5976-a831-62c111728787', 'a0000000-0000-0000-0000-000000000001', 'Systems', 'B7/JHS1.3', 'B7', 3),
    ('d85a00eb-9cba-5f23-b070-fbb670e67cf8', 'a0000000-0000-0000-0000-000000000001', 'Forces and Energy', 'B7/JHS1.4', 'B7', 4),
    ('adaca584-acd3-5c4c-85d2-f1e24ac64226', 'a0000000-0000-0000-0000-000000000001', 'Humans and the Environment', 'B7/JHS1.5', 'B7', 5)
ON CONFLICT (code) DO NOTHING;

-- Sub-strands (B7)
INSERT INTO sub_strands (id, strand_id, name, code, sort_order) VALUES
    ('d4414cfc-34e0-5350-a5c0-4d63440bfbf4', '78467126-bfa5-5e68-b900-89287e24a32e', 'Materials', 'B7/JHS1.1.1', 1),
    ('81e28607-4bdb-509e-b433-b390617ee570', '78467126-bfa5-5e68-b900-89287e24a32e', 'Living Cells', 'B7/JHS1.1.2', 2),
    ('1fa4ae91-6861-5ce7-9b8b-e1f315d7fd54', 'fc32d025-29e5-5ecc-8d09-152d942272ee', 'Earth Science', 'B7/JHS1.2.1', 1),
    ('ea670389-13b3-5b98-99d4-c4e8523d1b63', 'fc32d025-29e5-5ecc-8d09-152d942272ee', 'Life Cycle of Organisms', 'B7/JHS1.2.2', 2),
    ('2fe8c697-049f-56d3-b630-f3e32f736cc3', 'fc32d025-29e5-5ecc-8d09-152d942272ee', 'Crop Production', 'B7/JHS1.2.3', 3),
    ('27823466-0dec-51a3-a124-d0e1d21aa00b', 'fc32d025-29e5-5ecc-8d09-152d942272ee', 'Animal Production', 'B7/JHS1.2.4', 4),
    ('9c428204-2a2f-58b6-8f55-10531f17e876', 'c53a3a08-8e39-5976-a831-62c111728787', 'The Human Body Systems', 'B7/JHS1.3.1', 1),
    ('a0897616-9670-51df-9e14-39241cfa294e', 'c53a3a08-8e39-5976-a831-62c111728787', 'The Solar System', 'B7/JHS1.3.2', 2),
    ('a13e1fbc-47fc-511e-b5e7-b046be470be1', 'c53a3a08-8e39-5976-a831-62c111728787', 'Ecosystem', 'B7/JHS1.3.3', 3),
    ('9db2e238-5891-50f1-9089-ef3098058f0f', 'c53a3a08-8e39-5976-a831-62c111728787', 'Farming Systems', 'B7/JHS1.3.4', 4),
    ('28f871dc-ccae-5816-8881-10eb36220ad3', 'd85a00eb-9cba-5f23-b070-fbb670e67cf8', 'Energy', 'B7/JHS1.4.1', 1),
    ('f76ba797-dfad-540c-a9a4-45c4cccc9e8c', 'd85a00eb-9cba-5f23-b070-fbb670e67cf8', 'Electricity and Electronics', 'B7/JHS1.4.2', 2),
    ('b764aebe-ec21-5e53-a118-d02af2715d54', 'd85a00eb-9cba-5f23-b070-fbb670e67cf8', 'Conversion and Conservation of Energy', 'B7/JHS1.4.3', 3),
    ('0266c135-743f-536b-a465-7feace47b69e', 'd85a00eb-9cba-5f23-b070-fbb670e67cf8', 'Force and Motion', 'B7/JHS1.4.4', 4),
    ('c1b8f314-e2af-55d7-a9b0-e668668fbcc0', 'd85a00eb-9cba-5f23-b070-fbb670e67cf8', 'Agricultural Tools', 'B7/JHS1.4.5', 5),
    ('2e9a109f-3b75-5f1a-b555-2ca728093fc4', 'adaca584-acd3-5c4c-85d2-f1e24ac64226', 'Waste Management', 'B7/JHS1.5.1', 1),
    ('c5f724c4-4179-57ec-9c25-c905f7b7e64d', 'adaca584-acd3-5c4c-85d2-f1e24ac64226', 'Human Health', 'B7/JHS1.5.2', 2),
    ('25e180aa-a942-5e13-b24b-ef774fa9dc74', 'adaca584-acd3-5c4c-85d2-f1e24ac64226', 'Science and Industry', 'B7/JHS1.5.3', 3),
    ('3c2b04b5-2dc5-5855-87cb-6149012e2c8a', 'adaca584-acd3-5c4c-85d2-f1e24ac64226', 'Climate Change and Green Economy', 'B7/JHS1.5.4', 4),
    ('594da89b-b2da-5eef-87ed-5da185bd50ce', 'adaca584-acd3-5c4c-85d2-f1e24ac64226', 'Understanding the Environment', 'B7/JHS1.5.5', 5),
    ('cc2905f0-b82f-5171-a471-2c05bc590f89', 'adaca584-acd3-5c4c-85d2-f1e24ac64226', 'Soil as a Component of the Environment', 'B7/JHS1.5.6', 6)
ON CONFLICT (code) DO NOTHING;

-- Topics / Content Standards (B7)
INSERT INTO topics (id, sub_strand_id, name, code, class_level, sort_order) VALUES
    ('40ff1749-9c4f-5cc2-84b9-d569aff7e8d5', 'd4414cfc-34e0-5350-a5c0-4d63440bfbf4', 'Materials: Properties and Classification', 'B7/JHS1.1.1.1', 'B7', 1),
    ('f1eff29f-f670-5cb9-9af8-22bc8ed7becc', 'd4414cfc-34e0-5350-a5c0-4d63440bfbf4', 'Materials: The Periodic Table', 'B7/JHS1.1.1.2', 'B7', 2),
    ('b730a9b1-360a-5aed-93f4-f66c71f43674', '81e28607-4bdb-509e-b433-b390617ee570', 'Living Cells: Structure and Function', 'B7/JHS1.1.2.1', 'B7', 1),
    ('5dd4720c-f605-5217-a090-fe00ef48f21d', '1fa4ae91-6861-5ce7-9b8b-e1f315d7fd54', 'Earth Science: The Water Cycle', 'B7/JHS1.2.1.1', 'B7', 1),
    ('303ef913-cf8e-5b67-b708-09c96cc465bc', 'ea670389-13b3-5b98-99d4-c4e8523d1b63', 'Life Cycle of the Housefly', 'B7/JHS1.2.2.1', 'B7', 1),
    ('e55c6f3a-ee0c-56c7-b404-d878dd526abd', '2fe8c697-049f-56d3-b630-f3e32f736cc3', 'Crop Production: Plant Nutrients', 'B7/JHS1.2.3.1', 'B7', 1),
    ('2f2ac06a-8788-539a-bedb-4ecb1a350311', '27823466-0dec-51a3-a124-d0e1d21aa00b', 'Animal Production: Domestic Animals', 'B7/JHS1.2.4.1', 'B7', 1),
    ('884b3779-9084-5506-b6d9-dae0793fc2b5', '27823466-0dec-51a3-a124-d0e1d21aa00b', 'Animal Production: Uses of Animals', 'B7/JHS1.2.4.2', 'B7', 2),
    ('6810175a-fa1e-5619-ad5d-8526c0a52c09', '9c428204-2a2f-58b6-8f55-10531f17e876', 'The Human Body: Food and Nutrition', 'B7/JHS1.3.1.1', 'B7', 1),
    ('3b9107cd-4c3d-5f89-9aea-a1588643672d', 'a0897616-9670-51df-9e14-39241cfa294e', 'The Solar System: Inner Planets', 'B7/JHS1.3.2.1', 'B7', 1),
    ('0d39fd6a-34c3-5853-b502-654771b3a837', 'a13e1fbc-47fc-511e-b5e7-b046be470be1', 'Ecosystem: Components and Interactions', 'B7/JHS1.3.3.1', 'B7', 1),
    ('a62e9a5b-9389-5bb5-87be-544237bb96bd', '9db2e238-5891-50f1-9089-ef3098058f0f', 'Farming Systems', 'B7/JHS1.3.4.1', 'B7', 1),
    ('40b05570-6dc1-503e-92cd-20cbafdc8b58', '28f871dc-ccae-5816-8881-10eb36220ad3', 'Forms of Energy', 'B7/JHS1.4.1.1', 'B7', 1),
    ('ea81436e-1d75-51c7-92dd-d04f0916dc4c', '28f871dc-ccae-5816-8881-10eb36220ad3', 'Heat Transfer', 'B7/JHS1.4.1.2', 'B7', 2),
    ('88df9641-b02c-5750-99df-882985b4bd45', '28f871dc-ccae-5816-8881-10eb36220ad3', 'Light Travels in Straight Lines', 'B7/JHS1.4.1.3', 'B7', 3),
    ('fcb0f01e-869f-502c-833e-a7925fa354a6', 'f76ba797-dfad-540c-a9a4-45c4cccc9e8c', 'Electricity: Basic Concepts', 'B7/JHS1.4.2.1', 'B7', 1),
    ('74df4256-d139-5dff-964c-22d1e1be1acb', 'f76ba797-dfad-540c-a9a4-45c4cccc9e8c', 'Electronics: Basic Components', 'B7/JHS1.4.2.2', 'B7', 2),
    ('fc8bcc28-bae6-55ab-9ec3-1bdcadf1ddb9', 'b764aebe-ec21-5e53-a118-d02af2715d54', 'Energy Conservation and Conversion', 'B7/JHS1.4.3.1', 'B7', 1),
    ('dfae573a-0cb6-5c89-a5eb-93b9708fe2a0', '0266c135-743f-536b-a465-7feace47b69e', 'Force and Motion: Unbalanced Forces', 'B7/JHS1.4.4.1', 'B7', 1),
    ('342e5cb4-aaef-5a8f-a177-b1d79233d620', '0266c135-743f-536b-a465-7feace47b69e', 'Simple Machines', 'B7/JHS1.4.4.2', 'B7', 2),
    ('7adea081-da47-516a-b16d-08a7d7de1ae6', 'c1b8f314-e2af-55d7-a9b0-e668668fbcc0', 'Agricultural Tools: Handling and Maintenance', 'B7/JHS1.4.5.1', 'B7', 1),
    ('81f5b540-7366-537a-9e0b-437ac67f6e29', '2e9a109f-3b75-5f1a-b555-2ca728093fc4', 'Waste Management', 'B7/JHS1.5.1.1', 'B7', 1),
    ('e50b0678-ee0b-54ae-b2c7-2bf66205398a', 'c5f724c4-4179-57ec-9c25-c905f7b7e64d', 'Food Nutrients and Deficiency Diseases', 'B7/JHS1.5.2.1', 'B7', 1),
    ('34a7e27d-402f-562c-81bb-c4effddf6f79', 'c5f724c4-4179-57ec-9c25-c905f7b7e64d', 'Viral Diseases', 'B7/JHS1.5.2.2', 'B7', 2),
    ('5141eaee-18a2-5299-abe9-3776d964c73d', '25e180aa-a942-5e13-b24b-ef774fa9dc74', 'Science and Industry: Careers', 'B7/JHS1.5.3.1', 'B7', 1),
    ('e3402159-e055-577c-bfcd-afc0b33daff9', '3c2b04b5-2dc5-5855-87cb-6149012e2c8a', 'Climate Change and Sustainable Energy', 'B7/JHS1.5.4.1', 'B7', 1),
    ('289c66f1-a26b-51ce-90db-fca5f1aadca7', '594da89b-b2da-5eef-87ed-5da185bd50ce', 'Understanding the Environment: Plants', 'B7/JHS1.5.5.1', 'B7', 1)
ON CONFLICT (code) DO NOTHING;
