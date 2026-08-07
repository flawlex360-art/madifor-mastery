-- Flawlex Mastery — SBC Seed: B9/JHS3
-- NaCCA Common Core Programme (CCP) Science Curriculum, September 2020
-- 31 content standards

-- Strands (B9)
INSERT INTO strands (id, subject_id, name, code, class_level, sort_order) VALUES
    ('64fec12a-c2e6-546f-a8ef-ef834953f333', 'a0000000-0000-0000-0000-000000000001', 'Diversity of Matter', 'B9/JHS3.1', 'B9', 1),
    ('d71c7be3-313f-5bf8-9445-e7fac5f1e36e', 'a0000000-0000-0000-0000-000000000001', 'Cycles', 'B9/JHS3.2', 'B9', 2),
    ('049507da-b69e-5c19-994d-eea0be3dc0e6', 'a0000000-0000-0000-0000-000000000001', 'Systems', 'B9/JHS3.3', 'B9', 3),
    ('f355f387-b662-5922-9695-2214d28b8d30', 'a0000000-0000-0000-0000-000000000001', 'Forces and Energy', 'B9/JHS3.4', 'B9', 4),
    ('8bc26f52-d358-5e2d-b05c-7609b276a4c7', 'a0000000-0000-0000-0000-000000000001', 'Humans and the Environment', 'B9/JHS3.5', 'B9', 5)
ON CONFLICT (code) DO NOTHING;

-- Sub-strands (B9)
INSERT INTO sub_strands (id, strand_id, name, code, sort_order) VALUES
    ('bee59e1d-f597-511b-a855-b8c96c4fde51', '64fec12a-c2e6-546f-a8ef-ef834953f333', 'Materials', 'B9/JHS3.1.1', 1),
    ('7f888d0e-fc71-50ca-9983-efbd6f66c63d', '64fec12a-c2e6-546f-a8ef-ef834953f333', 'Living Cells', 'B9/JHS3.1.2', 2),
    ('a4a91204-d7eb-5e69-ae1b-3ded88257f5f', 'd71c7be3-313f-5bf8-9445-e7fac5f1e36e', 'Earth Science', 'B9/JHS3.2.1', 1),
    ('ba118e2b-5c00-581e-ba6f-93a8d9c516e1', 'd71c7be3-313f-5bf8-9445-e7fac5f1e36e', 'Life Cycle of Organisms', 'B9/JHS3.2.2', 2),
    ('d5eedbc0-c119-525f-b959-100a3cb5a3d6', 'd71c7be3-313f-5bf8-9445-e7fac5f1e36e', 'Crop Production', 'B9/JHS3.2.3', 3),
    ('ab2efb71-8228-5941-86b7-d7fb7e9f8923', 'd71c7be3-313f-5bf8-9445-e7fac5f1e36e', 'Animal Production', 'B9/JHS3.2.4', 4),
    ('42bc73dd-e9a6-542b-9907-ce0db4e5091b', '049507da-b69e-5c19-994d-eea0be3dc0e6', 'The Human Body Systems', 'B9/JHS3.3.1', 1),
    ('aa1edbbc-da45-57b1-868b-8beee1523bce', '049507da-b69e-5c19-994d-eea0be3dc0e6', 'The Solar System', 'B9/JHS3.3.2', 2),
    ('dc2d03ca-44ff-528f-8b0c-cd0ce3f300da', '049507da-b69e-5c19-994d-eea0be3dc0e6', 'Ecosystem', 'B9/JHS3.3.3', 3),
    ('95bfa540-7cfb-5168-af83-4885d365bb3a', '049507da-b69e-5c19-994d-eea0be3dc0e6', 'Farming Systems', 'B9/JHS3.3.4', 4),
    ('b8cc14cd-7b4a-54b5-97cb-76375b0891a2', 'f355f387-b662-5922-9695-2214d28b8d30', 'Energy', 'B9/JHS3.4.1', 1),
    ('40e9194e-b180-5231-ab1a-fddc0d377e3b', 'f355f387-b662-5922-9695-2214d28b8d30', 'Electricity and Electronics', 'B9/JHS3.4.2', 2),
    ('3b6a8bd3-2251-5ab0-8cbf-46976c46c90a', 'f355f387-b662-5922-9695-2214d28b8d30', 'Conversion and Conservation of Energy', 'B9/JHS3.4.3', 3),
    ('02d97eee-6031-5aa9-bc49-ea130de944cb', 'f355f387-b662-5922-9695-2214d28b8d30', 'Force and Motion', 'B9/JHS3.4.4', 4),
    ('263845b2-0825-564b-b53a-61585d8e2e61', 'f355f387-b662-5922-9695-2214d28b8d30', 'Agricultural Tools', 'B9/JHS3.4.5', 5),
    ('38e44373-7ddc-576a-bb1e-262146119427', '8bc26f52-d358-5e2d-b05c-7609b276a4c7', 'Waste Management', 'B9/JHS3.5.1', 1),
    ('d8fbc4ea-7022-53cc-9cd3-a7bf18a0d839', '8bc26f52-d358-5e2d-b05c-7609b276a4c7', 'Human Health', 'B9/JHS3.5.2', 2),
    ('9923ecbf-84f3-5808-a47c-4b2a9a36f89c', '8bc26f52-d358-5e2d-b05c-7609b276a4c7', 'Science and Industry', 'B9/JHS3.5.3', 3),
    ('f074f37a-f37b-596f-a144-3896843609c9', '8bc26f52-d358-5e2d-b05c-7609b276a4c7', 'Climate Change and Green Economy', 'B9/JHS3.5.4', 4),
    ('5cc8b143-f3ba-5309-b3d2-e36e771addfd', '8bc26f52-d358-5e2d-b05c-7609b276a4c7', 'Understanding the Environment', 'B9/JHS3.5.5', 5),
    ('e654f366-6d49-5969-86ce-66b29b8bcaa7', '8bc26f52-d358-5e2d-b05c-7609b276a4c7', 'Soil as a Component of the Environment', 'B9/JHS3.5.6', 6)
ON CONFLICT (code) DO NOTHING;

-- Topics / Content Standards (B9)
INSERT INTO topics (id, sub_strand_id, name, code, class_level, sort_order) VALUES
    ('07dd571c-8e43-5fbb-8878-e669f7eddc63', 'bee59e1d-f597-511b-a855-b8c96c4fde51', 'Materials: Binary Chemical Compounds', 'B9/JHS3.1.1.1', 'B9', 1),
    ('13840d52-5dc8-5b1c-bb67-46705ecee1e8', 'bee59e1d-f597-511b-a855-b8c96c4fde51', 'Materials: Chemical Bonding', 'B9/JHS3.1.1.2', 'B9', 2),
    ('28908106-318a-5b15-adc8-6bd139d2c120', '7f888d0e-fc71-50ca-9983-efbd6f66c63d', 'Living Cells: Specialised Cells', 'B9/JHS3.1.2.1', 'B9', 1),
    ('6f6f0c6f-c690-5207-a3b2-06584c8979e1', 'a4a91204-d7eb-5e69-ae1b-3ded88257f5f', 'Earth Science: The Nitrogen Cycle', 'B9/JHS3.2.1.1', 'B9', 1),
    ('7a0c20ef-ec40-5fab-b66b-14dfe872056c', 'ba118e2b-5c00-581e-ba6f-93a8d9c516e1', 'Life Cycle of the Grasshopper', 'B9/JHS3.2.2.1', 'B9', 1),
    ('18196f91-665a-50cc-b794-483173e9d599', 'd5eedbc0-c119-525f-b959-100a3cb5a3d6', 'Crop Production: Maturation Differences', 'B9/JHS3.2.3.1', 'B9', 1),
    ('59ef7538-446d-57e6-b088-031ef0968adb', 'd5eedbc0-c119-525f-b959-100a3cb5a3d6', 'Crop Production: Uses at Different Stages', 'B9/JHS3.2.3.2', 'B9', 2),
    ('4923d863-fe62-52ef-94de-4fbadcadc025', 'ab2efb71-8228-5941-86b7-d7fb7e9f8923', 'Animal Production: Feed Preparation', 'B9/JHS3.2.4.1', 'B9', 1),
    ('2cee3414-6914-598d-a8c5-d80010730ffa', 'ab2efb71-8228-5941-86b7-d7fb7e9f8923', 'Animal Production: Feed Selection', 'B9/JHS3.2.4.2', 'B9', 2),
    ('e799605b-376d-5d37-98eb-823fb716b2c5', '42bc73dd-e9a6-542b-9907-ce0db4e5091b', 'The Human Body: The Circulatory System', 'B9/JHS3.3.1.1', 'B9', 1),
    ('c6a1b7f9-87a1-5652-ae8a-114e9d0f6958', 'aa1edbbc-da45-57b1-868b-8beee1523bce', 'The Solar System: Non-Planetary Bodies', 'B9/JHS3.3.2.1', 'B9', 1),
    ('5f9597ec-cf84-5269-96d9-56f3c2e4996b', 'dc2d03ca-44ff-528f-8b0c-cd0ce3f300da', 'Ecosystem: Composition and Interdependence', 'B9/JHS3.3.3.1', 'B9', 1),
    ('08380573-a989-5ce5-b89e-d74bc2603d37', '95bfa540-7cfb-5168-af83-4885d365bb3a', 'Farming Systems: Plant and Animal Waste', 'B9/JHS3.3.4.1', 'B9', 1),
    ('769a2cfe-f309-5f83-9103-7c8ddaa6fc43', 'b8cc14cd-7b4a-54b5-97cb-76375b0891a2', 'Energy Conservation', 'B9/JHS3.4.1.1', 'B9', 1),
    ('309c629c-41e8-5c4b-8e57-d08350d4ace8', 'b8cc14cd-7b4a-54b5-97cb-76375b0891a2', 'Energy Consumption Calculations', 'B9/JHS3.4.1.2', 'B9', 2),
    ('1fc85c42-7846-5021-a493-dcd1d6073ef7', 'b8cc14cd-7b4a-54b5-97cb-76375b0891a2', 'Light: Refraction', 'B9/JHS3.4.1.3', 'B9', 3),
    ('68c35b63-5f65-51bb-81c4-726021fcb66c', '40e9194e-b180-5231-ab1a-fddc0d377e3b', 'Electricity: Energy Transformation in Circuits', 'B9/JHS3.4.2.1', 'B9', 1),
    ('2bc5e0a0-5463-5820-808f-7e483f6874b6', '40e9194e-b180-5231-ab1a-fddc0d377e3b', 'Electronics: Forward and Reverse Bias', 'B9/JHS3.4.2.2', 'B9', 2),
    ('39268aa3-f803-5d34-bf21-d4666167c82c', '3b6a8bd3-2251-5ab0-8cbf-46976c46c90a', 'Energy Conversion and Conservation', 'B9/JHS3.4.3.1', 'B9', 1),
    ('708aba96-0d20-58fc-bdd6-b1a488927a74', '02d97eee-6031-5aa9-bc49-ea130de944cb', 'Force and Motion: Pressure', 'B9/JHS3.4.4.1', 'B9', 1),
    ('bcf31844-9536-5fc3-9b52-07040645aff4', '02d97eee-6031-5aa9-bc49-ea130de944cb', 'Force and Motion: Newton''s Third Law', 'B9/JHS3.4.4.2', 'B9', 2),
    ('a6b6f110-7ee3-50e9-b869-7ea44e7d267f', '263845b2-0825-564b-b53a-61585d8e2e61', 'Agricultural Tools: Materials and Making', 'B9/JHS3.4.5.1', 'B9', 1),
    ('7e9a1278-4543-55e9-8f5b-8bb78393adac', '38e44373-7ddc-576a-bb1e-262146119427', 'Waste Management: Scientific Methods', 'B9/JHS3.5.1.1', 'B9', 1),
    ('2fa96252-3f2e-5a14-be14-ccc36c53a29a', '38e44373-7ddc-576a-bb1e-262146119427', 'Waste Management: Innovative Approaches', 'B9/JHS3.5.1.2', 'B9', 2),
    ('ab68069d-9a36-54d4-bb00-31de8b6e72a7', 'd8fbc4ea-7022-53cc-9cd3-a7bf18a0d839', 'Common Communicable Diseases', 'B9/JHS3.5.2.1', 'B9', 1),
    ('2790603f-66ce-5f3e-8db1-8a53be153902', 'd8fbc4ea-7022-53cc-9cd3-a7bf18a0d839', 'Health and Disease Concepts', 'B9/JHS3.5.2.2', 'B9', 2),
    ('ada67213-4c26-5697-a1d6-2c833d20c324', '9923ecbf-84f3-5808-a47c-4b2a9a36f89c', 'Science and Industry: Concepts and Principles', 'B9/JHS3.5.3.1', 'B9', 1),
    ('9a81d1df-6067-5f66-837a-1a34c23fd5bb', '9923ecbf-84f3-5808-a47c-4b2a9a36f89c', 'Science and Industry: Modern vs Indigenous', 'B9/JHS3.5.3.2', 'B9', 2),
    ('07e7eda3-8e3c-5b35-9b0c-64bd1f1ab967', 'f074f37a-f37b-596f-a144-3896843609c9', 'Climate Change: Natural and Human Factors', 'B9/JHS3.5.4.1', 'B9', 1),
    ('6fad7c99-8d26-5fd0-8e31-3cebe8ac60d4', 'f074f37a-f37b-596f-a144-3896843609c9', 'Climate Change: Green Economy Data', 'B9/JHS3.5.4.2', 'B9', 2),
    ('cbb26a24-3ca2-5310-901d-048f0dad71f1', '5cc8b143-f3ba-5309-b3d2-e36e771addfd', 'Understanding the Environment: Plant Parts', 'B9/JHS3.5.5.1', 'B9', 1)
ON CONFLICT (code) DO NOTHING;
