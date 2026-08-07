-- Flawlex Mastery — SBC Seed: B8/JHS2
-- NaCCA Common Core Programme (CCP) Science Curriculum, September 2020
-- 28 content standards

-- Strands (B8)
INSERT INTO strands (id, subject_id, name, code, class_level, sort_order) VALUES
    ('98b1eab0-b60d-51b6-9197-e9a687eca230', 'a0000000-0000-0000-0000-000000000001', 'Diversity of Matter', 'B8/JHS2.1', 'B8', 1),
    ('235ea16b-8604-53b7-a796-29f4400415ab', 'a0000000-0000-0000-0000-000000000001', 'Cycles', 'B8/JHS2.2', 'B8', 2),
    ('6aa462c2-ee32-5a70-af10-5ea89f02ac67', 'a0000000-0000-0000-0000-000000000001', 'Systems', 'B8/JHS2.3', 'B8', 3),
    ('9f12cb81-63ef-5c06-96c3-003ff583e57e', 'a0000000-0000-0000-0000-000000000001', 'Forces and Energy', 'B8/JHS2.4', 'B8', 4),
    ('b21bdd69-7504-5203-aec0-a5d5c2922559', 'a0000000-0000-0000-0000-000000000001', 'Humans and the Environment', 'B8/JHS2.5', 'B8', 5)
ON CONFLICT (code) DO NOTHING;

-- Sub-strands (B8)
INSERT INTO sub_strands (id, strand_id, name, code, sort_order) VALUES
    ('1330e13f-bb38-52c6-90f2-95f206c43118', '98b1eab0-b60d-51b6-9197-e9a687eca230', 'Materials', 'B8/JHS2.1.1', 1),
    ('27ca1dd6-e762-5277-9e62-68504e02a114', '98b1eab0-b60d-51b6-9197-e9a687eca230', 'Living Cells', 'B8/JHS2.1.2', 2),
    ('becd191f-cee2-5cab-b10c-a0390b6e191e', '235ea16b-8604-53b7-a796-29f4400415ab', 'Earth Science', 'B8/JHS2.2.1', 1),
    ('0948267a-983a-58de-bd2d-c8ec161c9cea', '235ea16b-8604-53b7-a796-29f4400415ab', 'Life Cycle of Organisms', 'B8/JHS2.2.2', 2),
    ('c91c8e15-1d03-52b1-9798-e4f038b35c58', '235ea16b-8604-53b7-a796-29f4400415ab', 'Crop Production', 'B8/JHS2.2.3', 3),
    ('1f756fb8-dfe2-50d5-ae72-e7c3f3f4b03e', '235ea16b-8604-53b7-a796-29f4400415ab', 'Animal Production', 'B8/JHS2.2.4', 4),
    ('01626d5e-751a-5d1e-9b1e-60683c9b9ebd', '6aa462c2-ee32-5a70-af10-5ea89f02ac67', 'The Human Body Systems', 'B8/JHS2.3.1', 1),
    ('3fc47965-3fb4-52f2-81b6-3e537696c71e', '6aa462c2-ee32-5a70-af10-5ea89f02ac67', 'The Solar System', 'B8/JHS2.3.2', 2),
    ('21d258d8-0241-52d9-be0a-c0a68fe38873', '6aa462c2-ee32-5a70-af10-5ea89f02ac67', 'Ecosystem', 'B8/JHS2.3.3', 3),
    ('7bc6f5a5-1c1b-5c38-9682-08ce98268097', '6aa462c2-ee32-5a70-af10-5ea89f02ac67', 'Farming Systems', 'B8/JHS2.3.4', 4),
    ('a6d1a014-bae5-5b47-ad43-adac08fdf8cc', '9f12cb81-63ef-5c06-96c3-003ff583e57e', 'Energy', 'B8/JHS2.4.1', 1),
    ('4e13c917-1321-54b9-a9ac-537415cff5a3', '9f12cb81-63ef-5c06-96c3-003ff583e57e', 'Electricity and Electronics', 'B8/JHS2.4.2', 2),
    ('6419f026-82f3-53c6-a093-124f6e2c93c3', '9f12cb81-63ef-5c06-96c3-003ff583e57e', 'Conversion and Conservation of Energy', 'B8/JHS2.4.3', 3),
    ('6ccd2f2a-cf5b-57c3-8335-720762529dfc', '9f12cb81-63ef-5c06-96c3-003ff583e57e', 'Force and Motion', 'B8/JHS2.4.4', 4),
    ('31c49f00-16cc-5327-92a7-c6d07f1e380a', '9f12cb81-63ef-5c06-96c3-003ff583e57e', 'Agricultural Tools', 'B8/JHS2.4.5', 5),
    ('5a525bfd-579d-530f-afdc-0392d2f33c88', 'b21bdd69-7504-5203-aec0-a5d5c2922559', 'Waste Management', 'B8/JHS2.5.1', 1),
    ('77e163e8-254e-58d8-adb9-66a92517a84e', 'b21bdd69-7504-5203-aec0-a5d5c2922559', 'Human Health', 'B8/JHS2.5.2', 2),
    ('cb7dfc05-e1ab-573b-998c-98379c76f75c', 'b21bdd69-7504-5203-aec0-a5d5c2922559', 'Science and Industry', 'B8/JHS2.5.3', 3),
    ('65d03f05-d3c0-5ccc-b070-4331ee6c35e2', 'b21bdd69-7504-5203-aec0-a5d5c2922559', 'Climate Change and Green Economy', 'B8/JHS2.5.4', 4),
    ('34f1f71d-de73-5665-b095-98af7602634c', 'b21bdd69-7504-5203-aec0-a5d5c2922559', 'Understanding the Environment', 'B8/JHS2.5.5', 5),
    ('767db91d-6a7f-5cfc-80d2-83b04bb08c24', 'b21bdd69-7504-5203-aec0-a5d5c2922559', 'Soil as a Component of the Environment', 'B8/JHS2.5.6', 6)
ON CONFLICT (code) DO NOTHING;

-- Topics / Content Standards (B8)
INSERT INTO topics (id, sub_strand_id, name, code, class_level, sort_order) VALUES
    ('c46bfb11-3387-57bc-a4ab-fd392de71123', '1330e13f-bb38-52c6-90f2-95f206c43118', 'Materials: Types of Mixtures', 'B8/JHS2.1.1.1', 'B8', 1),
    ('a305249d-b1cb-5e8a-9356-b87be960182d', '1330e13f-bb38-52c6-90f2-95f206c43118', 'Materials: Atomic Structure', 'B8/JHS2.1.1.2', 'B8', 2),
    ('dbe802d6-a255-5214-95be-f3b99a447659', '27ca1dd6-e762-5277-9e62-68504e02a114', 'Living Cells: Prokaryotic and Eukaryotic', 'B8/JHS2.1.2.1', 'B8', 1),
    ('4b3d37f4-7912-5417-8b1c-ee3347aeb96e', 'becd191f-cee2-5cab-b10c-a0390b6e191e', 'Earth Science: The Carbon Cycle', 'B8/JHS2.2.1.1', 'B8', 1),
    ('e3e3b189-1cd7-5a4e-9164-192bd5b15aa8', '0948267a-983a-58de-bd2d-c8ec161c9cea', 'Life Cycle of the Anopheles Mosquito', 'B8/JHS2.2.2.1', 'B8', 1),
    ('568469ee-f5bf-5482-b369-b97f98d1cccb', 'c91c8e15-1d03-52b1-9798-e4f038b35c58', 'Crop Production: Seed Beds', 'B8/JHS2.2.3.1', 'B8', 1),
    ('fa41ca07-dc11-5330-860b-7937c171170f', 'c91c8e15-1d03-52b1-9798-e4f038b35c58', 'Crop Production: Growth Comparisons', 'B8/JHS2.2.3.2', 'B8', 2),
    ('1cc798b7-d7f4-5d75-ae17-c830c929adac', '1f756fb8-dfe2-50d5-ae72-e7c3f3f4b03e', 'Animal Production: Types of Feed', 'B8/JHS2.2.4.1', 'B8', 1),
    ('a2a1d7aa-5a09-5945-b179-3d9a04b15714', '1f756fb8-dfe2-50d5-ae72-e7c3f3f4b03e', 'Animal Production: Water and Feed Importance', 'B8/JHS2.2.4.2', 'B8', 2),
    ('7e07f370-7700-5505-96a9-8a88a98b6ad3', '01626d5e-751a-5d1e-9b1e-60683c9b9ebd', 'The Human Body: Mammalian Teeth', 'B8/JHS2.3.1.1', 'B8', 1),
    ('170c856d-9275-5446-ba59-ca1fa73d854c', '3fc47965-3fb4-52f2-81b6-3e537696c71e', 'The Solar System: Outer Planets', 'B8/JHS2.3.2.1', 'B8', 1),
    ('3281e29b-fefb-509c-85b9-409c0a823078', '21d258d8-0241-52d9-be0a-c0a68fe38873', 'Ecosystem: Feeding Relationships', 'B8/JHS2.3.3.1', 'B8', 1),
    ('0bda027e-c473-59c3-9eeb-0cb960ac3670', '7bc6f5a5-1c1b-5c38-9682-08ce98268097', 'Farming Systems: Crop-Animal-Land Combinations', 'B8/JHS2.3.4.1', 'B8', 1),
    ('5d3b81fe-3b50-5e4c-a6bc-18c08f0ad504', 'a6d1a014-bae5-5b47-ad43-adac08fdf8cc', 'Energy Conversion', 'B8/JHS2.4.1.1', 'B8', 1),
    ('81bffe32-fbfc-58c4-83c7-cb19f4a4923b', 'a6d1a014-bae5-5b47-ad43-adac08fdf8cc', 'Renewable and Non-Renewable Energy', 'B8/JHS2.4.1.2', 'B8', 2),
    ('017e247a-96b4-5dc8-9ff3-524233924a6d', 'a6d1a014-bae5-5b47-ad43-adac08fdf8cc', 'Heat and Temperature', 'B8/JHS2.4.1.3', 'B8', 3),
    ('c971edca-0e67-52c2-b43b-c324550d30ca', '4e13c917-1321-54b9-a9ac-537415cff5a3', 'Electricity Transmission', 'B8/JHS2.4.2.1', 'B8', 1),
    ('a4c00da5-b4bf-5ef5-bde8-da2dee55e765', '4e13c917-1321-54b9-a9ac-537415cff5a3', 'Capacitors: Charging and Discharging', 'B8/JHS2.4.2.2', 'B8', 2),
    ('309bf39d-b723-54ef-844c-586b03e853e3', '6419f026-82f3-53c6-a093-124f6e2c93c3', 'Energy Conversion and Conservation in Daily Life', 'B8/JHS2.4.3.1', 'B8', 1),
    ('f13769b8-390a-51ae-9dad-aa5674e1a45f', '6ccd2f2a-cf5b-57c3-8335-720762529dfc', 'Magnets and Magnetic Force', 'B8/JHS2.4.4.1', 'B8', 1),
    ('86b430dd-1c75-506f-9c9f-a00d0400fbb3', '6ccd2f2a-cf5b-57c3-8335-720762529dfc', 'Complex Machines', 'B8/JHS2.4.4.2', 'B8', 2),
    ('87dcddb6-b801-5537-8f5d-6f1a9143ed05', '31c49f00-16cc-5327-92a7-c6d07f1e380a', 'Agricultural Tools: Basic and Simple', 'B8/JHS2.4.5.1', 'B8', 1),
    ('01e2f4d6-82e5-5f06-89a9-a58bf659e197', '5a525bfd-579d-530f-afdc-0392d2f33c88', 'Sustainable Waste Management', 'B8/JHS2.5.1.1', 'B8', 1),
    ('70d041ef-45fa-5b96-ad65-56c302c67e02', '77e163e8-254e-58d8-adb9-66a92517a84e', 'Communicable Diseases', 'B8/JHS2.5.2.1', 'B8', 1),
    ('995a1d2b-6584-5e41-952b-0bca1346f9fb', '77e163e8-254e-58d8-adb9-66a92517a84e', 'Bacterial Diseases', 'B8/JHS2.5.2.2', 'B8', 2),
    ('4eb5fac4-51c2-505a-8a40-985f799c9173', '65d03f05-d3c0-5ccc-b070-4331ee6c35e2', 'Climate Change and Its Effects', 'B8/JHS2.5.4.1', 'B8', 1),
    ('723ab230-2766-500e-ab6b-86c5241de338', '34f1f71d-de73-5665-b095-98af7602634c', 'Physical Properties of Soils', 'B8/JHS2.5.5.1', 'B8', 1),
    ('6d9dba7b-ad6d-5773-8e5d-90959fe2848c', '767db91d-6a7f-5cfc-80d2-83b04bb08c24', 'Types of Rocks and Soil Origins', 'B8/JHS2.5.6.1', 'B8', 1)
ON CONFLICT (code) DO NOTHING;
