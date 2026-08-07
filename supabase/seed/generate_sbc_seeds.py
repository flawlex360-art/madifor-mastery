#!/usr/bin/env python3
"""Generate SBC seed SQL files for B7, B8, B9."""
import os
import uuid

def make_uuid(prefix, suffix=''):
    """Generate a deterministic UUID from a prefix string."""
    base = f'{prefix}{suffix}'
    # Hash the base string to get a deterministic UUID
    return str(uuid.uuid5(uuid.NAMESPACE_DNS, base))

def escape_sql(text):
    """Escape single quotes for SQL strings."""
    return text.replace("'", "''")

strands = [
    ('1', 'Diversity of Matter'),
    ('2', 'Cycles'),
    ('3', 'Systems'),
    ('4', 'Forces and Energy'),
    ('5', 'Humans and the Environment'),
]

substrands = {
    '1.1': 'Materials', '1.2': 'Living Cells',
    '2.1': 'Earth Science', '2.2': 'Life Cycle of Organisms',
    '2.3': 'Crop Production', '2.4': 'Animal Production',
    '3.1': 'The Human Body Systems', '3.2': 'The Solar System',
    '3.3': 'Ecosystem', '3.4': 'Farming Systems',
    '4.1': 'Energy', '4.2': 'Electricity and Electronics',
    '4.3': 'Conversion and Conservation of Energy',
    '4.4': 'Force and Motion', '4.5': 'Agricultural Tools',
    '5.1': 'Waste Management', '5.2': 'Human Health',
    '5.3': 'Science and Industry', '5.4': 'Climate Change and Green Economy',
    '5.5': 'Understanding the Environment',
    '5.6': 'Soil as a Component of the Environment',
}

all_topics = {
    'B7/JHS1.1.1.1': 'Materials: Properties and Classification',
    'B7/JHS1.1.1.2': 'Materials: The Periodic Table',
    'B7/JHS1.1.2.1': 'Living Cells: Structure and Function',
    'B7/JHS1.2.1.1': 'Earth Science: The Water Cycle',
    'B7/JHS1.2.2.1': 'Life Cycle of the Housefly',
    'B7/JHS1.2.3.1': 'Crop Production: Plant Nutrients',
    'B7/JHS1.2.4.1': 'Animal Production: Domestic Animals',
    'B7/JHS1.2.4.2': 'Animal Production: Uses of Animals',
    'B7/JHS1.3.1.1': 'The Human Body: Food and Nutrition',
    'B7/JHS1.3.2.1': 'The Solar System: Inner Planets',
    'B7/JHS1.3.3.1': 'Ecosystem: Components and Interactions',
    'B7/JHS1.3.4.1': 'Farming Systems',
    'B7/JHS1.4.1.1': 'Forms of Energy',
    'B7/JHS1.4.1.2': 'Heat Transfer',
    'B7/JHS1.4.1.3': 'Light Travels in Straight Lines',
    'B7/JHS1.4.2.1': 'Electricity: Basic Concepts',
    'B7/JHS1.4.2.2': 'Electronics: Basic Components',
    'B7/JHS1.4.3.1': 'Energy Conservation and Conversion',
    'B7/JHS1.4.4.1': 'Force and Motion: Unbalanced Forces',
    'B7/JHS1.4.4.2': 'Simple Machines',
    'B7/JHS1.4.5.1': 'Agricultural Tools: Handling and Maintenance',
    'B7/JHS1.5.1.1': 'Waste Management',
    'B7/JHS1.5.2.1': 'Food Nutrients and Deficiency Diseases',
    'B7/JHS1.5.2.2': 'Viral Diseases',
    'B7/JHS1.5.3.1': 'Science and Industry: Careers',
    'B7/JHS1.5.4.1': 'Climate Change and Sustainable Energy',
    'B7/JHS1.5.5.1': 'Understanding the Environment: Plants',
    'B8/JHS2.1.1.1': 'Materials: Types of Mixtures',
    'B8/JHS2.1.1.2': 'Materials: Atomic Structure',
    'B8/JHS2.1.2.1': 'Living Cells: Prokaryotic and Eukaryotic',
    'B8/JHS2.2.1.1': 'Earth Science: The Carbon Cycle',
    'B8/JHS2.2.2.1': 'Life Cycle of the Anopheles Mosquito',
    'B8/JHS2.2.3.1': 'Crop Production: Seed Beds',
    'B8/JHS2.2.3.2': 'Crop Production: Growth Comparisons',
    'B8/JHS2.2.4.1': 'Animal Production: Types of Feed',
    'B8/JHS2.2.4.2': 'Animal Production: Water and Feed Importance',
    'B8/JHS2.3.1.1': 'The Human Body: Mammalian Teeth',
    'B8/JHS2.3.2.1': 'The Solar System: Outer Planets',
    'B8/JHS2.3.3.1': 'Ecosystem: Feeding Relationships',
    'B8/JHS2.3.4.1': 'Farming Systems: Crop-Animal-Land Combinations',
    'B8/JHS2.4.1.1': 'Energy Conversion',
    'B8/JHS2.4.1.2': 'Renewable and Non-Renewable Energy',
    'B8/JHS2.4.1.3': 'Heat and Temperature',
    'B8/JHS2.4.2.1': 'Electricity Transmission',
    'B8/JHS2.4.2.2': 'Capacitors: Charging and Discharging',
    'B8/JHS2.4.3.1': 'Energy Conversion and Conservation in Daily Life',
    'B8/JHS2.4.4.1': 'Magnets and Magnetic Force',
    'B8/JHS2.4.4.2': 'Complex Machines',
    'B8/JHS2.4.5.1': 'Agricultural Tools: Basic and Simple',
    'B8/JHS2.5.1.1': 'Sustainable Waste Management',
    'B8/JHS2.5.2.1': 'Communicable Diseases',
    'B8/JHS2.5.2.2': 'Bacterial Diseases',
    'B8/JHS2.5.4.1': 'Climate Change and Its Effects',
    'B8/JHS2.5.5.1': 'Physical Properties of Soils',
    'B8/JHS2.5.6.1': 'Types of Rocks and Soil Origins',
    'B9/JHS3.1.1.1': 'Materials: Binary Chemical Compounds',
    'B9/JHS3.1.1.2': 'Materials: Chemical Bonding',
    'B9/JHS3.1.2.1': 'Living Cells: Specialised Cells',
    'B9/JHS3.2.1.1': 'Earth Science: The Nitrogen Cycle',
    'B9/JHS3.2.2.1': 'Life Cycle of the Grasshopper',
    'B9/JHS3.2.3.1': 'Crop Production: Maturation Differences',
    'B9/JHS3.2.3.2': 'Crop Production: Uses at Different Stages',
    'B9/JHS3.2.4.1': 'Animal Production: Feed Preparation',
    'B9/JHS3.2.4.2': 'Animal Production: Feed Selection',
    'B9/JHS3.3.1.1': 'The Human Body: The Circulatory System',
    'B9/JHS3.3.2.1': 'The Solar System: Non-Planetary Bodies',
    'B9/JHS3.3.3.1': 'Ecosystem: Composition and Interdependence',
    'B9/JHS3.3.4.1': 'Farming Systems: Plant and Animal Waste',
    'B9/JHS3.4.1.1': 'Energy Conservation',
    'B9/JHS3.4.1.2': 'Energy Consumption Calculations',
    'B9/JHS3.4.1.3': 'Light: Refraction',
    'B9/JHS3.4.2.1': 'Electricity: Energy Transformation in Circuits',
    'B9/JHS3.4.2.2': 'Electronics: Forward and Reverse Bias',
    'B9/JHS3.4.3.1': 'Energy Conversion and Conservation',
    'B9/JHS3.4.4.1': 'Force and Motion: Pressure',
    'B9/JHS3.4.4.2': "Force and Motion: Newton's Third Law",
    'B9/JHS3.4.5.1': 'Agricultural Tools: Materials and Making',
    'B9/JHS3.5.1.1': 'Waste Management: Scientific Methods',
    'B9/JHS3.5.1.2': 'Waste Management: Innovative Approaches',
    'B9/JHS3.5.2.1': 'Common Communicable Diseases',
    'B9/JHS3.5.2.2': 'Health and Disease Concepts',
    'B9/JHS3.5.3.1': 'Science and Industry: Concepts and Principles',
    'B9/JHS3.5.3.2': 'Science and Industry: Modern vs Indigenous',
    'B9/JHS3.5.4.1': 'Climate Change: Natural and Human Factors',
    'B9/JHS3.5.4.2': 'Climate Change: Green Economy Data',
    'B9/JHS3.5.5.1': 'Understanding the Environment: Plant Parts',
}

out_dir = r'C:\Users\kpand\Music\flawlex mastery\flawlex-mastery\supabase\seed'

# Generate one file per level
for level_num, jhs_num, class_level in [(7, 'JHS1', 'B7'), (8, 'JHS2', 'B8'), (9, 'JHS3', 'B9')]:
    level_prefix = f'B{level_num}/{jhs_num}'
    level_topics = {k: v for k, v in all_topics.items() if k.startswith(level_prefix)}
    
    fname = os.path.join(out_dir, f'sbc_{class_level.lower()}_curriculum.sql')
    with open(fname, 'w', encoding='utf-8') as f:
        f.write(f'-- Flawlex Mastery — SBC Seed: {class_level}/{jhs_num}\n')
        f.write(f'-- NaCCA Common Core Programme (CCP) Science Curriculum, September 2020\n')
        f.write(f'-- {len(level_topics)} content standards\n\n')
        
        # Strands
        f.write(f'-- Strands ({class_level})\n')
        f.write('INSERT INTO strands (id, subject_id, name, code, class_level, sort_order) VALUES\n')
        strand_rows = []
        for s_num, s_name in strands:
            code = f'{level_prefix}.{s_num}'
            sid = f"'{make_uuid(f'strand-{level_prefix}-{s_num}')}'"
            strand_rows.append(f"    ({sid}, 'a0000000-0000-0000-0000-000000000001', '{s_name}', '{code}', '{class_level}', {s_num})")
        f.write(',\n'.join(strand_rows))
        f.write("\nON CONFLICT (code) DO NOTHING;\n\n")
        
        # Sub-strands
        f.write(f'-- Sub-strands ({class_level})\n')
        f.write('INSERT INTO sub_strands (id, strand_id, name, code, sort_order) VALUES\n')
        ss_rows = []
        for ss_key, ss_name in substrands.items():
            s_num = ss_key.split('.')[0]
            code = f'{level_prefix}.{ss_key}'
            ss_flat = ss_key.replace('.', '')
            sid = f"'{make_uuid(f'substrand-{level_prefix}-{ss_key}')}'"
            strand_id = f"'{make_uuid(f'strand-{level_prefix}-{s_num}')}'"
            ss_rows.append(f"    ({sid}, {strand_id}, '{ss_name}', '{code}', {int(ss_key.split('.')[1])})")
        f.write(',\n'.join(ss_rows))
        f.write("\nON CONFLICT (code) DO NOTHING;\n\n")
        
        # Topics (content standards)
        f.write(f'-- Topics / Content Standards ({class_level})\n')
        f.write('INSERT INTO topics (id, sub_strand_id, name, code, class_level, sort_order) VALUES\n')
        topic_rows = []
        sorted_topics = sorted(level_topics.items())
        for i, (code, name) in enumerate(sorted_topics):
            parts = code.split('/')
            rest = parts[1]
            jhs_parts = rest.split('.')
            s_num = jhs_parts[1]
            ss_num = jhs_parts[2]
            cs_num = jhs_parts[3]
            
            ss_key = f'{s_num}.{ss_num}'
            ss_flat = ss_key.replace('.', '')
            tid = f"'{make_uuid(f'topic-{code}')}'"
            ss_id = f"'{make_uuid(f'substrand-{level_prefix}-{ss_key}')}'"
            
            escaped_name = name.replace("'", "''")
            comma = ',' if i < len(sorted_topics) - 1 else ''
            topic_rows.append(f"    ({tid}, {ss_id}, '{escaped_name}', '{code}', '{class_level}', {cs_num}){comma}")
        f.write('\n'.join(topic_rows))
        f.write("\nON CONFLICT (code) DO NOTHING;\n")
    
    print(f'Generated: {fname} ({len(level_topics)} topics)')

# Generate B7 sample questions
qfname = os.path.join(out_dir, 'sbc_b7_sample_questions.sql')
with open(qfname, 'w', encoding='utf-8') as f:
    f.write('-- Flawlex Mastery — SBC B7 Sample Questions\n')
    f.write('-- 20 questions for B7/JHS1.4.4.1 (Force and Motion: Unbalanced Forces)\n\n')
    
    questions = [
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'multiple_choice',
            'stem': 'Which of the following is a contact force?',
            'options': '["Gravity","Magnetic force","Friction","Electric force"]',
            'answer': '2',
            'explanation': 'Friction is a contact force because it acts when two surfaces are in direct contact.',
            'hints_list': ['Contact forces require physical touch between objects.', 'Think about which force needs two surfaces rubbing together.'],
            'difficulty': 'easy',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'multiple_choice',
            'stem': 'The SI unit of force is the:',
            'options': '["Joule","Watt","Newton","Kilogram"]',
            'answer': '2',
            'explanation': 'The Newton (N) is the SI unit of force, named after Sir Isaac Newton.',
            'hints_list': ['Force is measured in Newtons (N).', 'Think about the scientist who gave us the laws of motion.'],
            'difficulty': 'core',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'multiple_choice',
            'stem': 'A boy pushes a wall with 20N but it does not move. What can you say about the forces?',
            'options': '["The push is greater than the weight","The push is balanced by reaction force","No forces act on it","It will eventually move"]',
            'answer': '1',
            'explanation': 'The wall does not move because the 20N push is balanced by an equal reaction force. Net force is zero.',
            'hints_list': ['Newtons Third Law: every action has an equal opposite reaction.', 'If the wall isnt moving, what does that say about total force?'],
            'difficulty': 'core',
            'blooms': 'application',
        },
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'multiple_choice',
            'stem': 'A 10 kg box is pushed with a net force of 50 N. What is its acceleration?',
            'options': '["5 m/s squared","50 m/s squared","500 m/s squared","0.5 m/s squared"]',
            'answer': '0',
            'explanation': 'Using F = ma: a = F/m = 50 N / 10 kg = 5 m/s squared.',
            'hints_list': ['Rearrange F = ma to find acceleration: a = F/m.', 'Divide the force by the mass.'],
            'difficulty': 'core',
            'blooms': 'application',
        },
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'fill_in_blank',
            'stem': 'A force of ___ is required to accelerate a 5 kg mass at 2 m/s squared.',
            'options': 'NULL',
            'answer': '"10"',
            'explanation': 'Using F = ma: F = 5 x 2 = 10 N.',
            'hints_list': ['Use the formula F = m x a.', 'Multiply the mass (5 kg) by the acceleration (2 m/s squared).'],
            'difficulty': 'core',
            'blooms': 'application',
        },
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'multiple_choice',
            'stem': 'Gravitational force acts between:',
            'options': '["Only objects on Earth","Any two objects with mass","Only metals","Only living things"]',
            'answer': '1',
            'explanation': 'Gravitational force exists between ANY two objects that have mass.',
            'hints_list': ['Gravity is a universal force.', 'Think about what causes the Moon to orbit the Earth.'],
            'difficulty': 'core',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'multiple_choice',
            'stem': 'Which of the following is an example of a non-contact force?',
            'options': '["Pushing a door","Pulling a rope","Gravity","Kicking a ball"]',
            'answer': '2',
            'explanation': 'Gravity is a non-contact force because it acts without physical contact.',
            'hints_list': ['Non-contact forces act at a distance.', 'Which force can you feel even without touching the source?'],
            'difficulty': 'easy',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'multiple_choice',
            'stem': 'A car moves at constant speed on a straight road. What about the forces on it?',
            'options': '["Driving force greater than air resistance","All forces balanced","No forces acting","Car will keep accelerating"]',
            'answer': '1',
            'explanation': 'Constant speed means zero acceleration, so net force must be zero. All forces are balanced.',
            'hints_list': ['Zero acceleration means zero net force.', 'If speed isnt changing, what does that say about total force?'],
            'difficulty': 'core',
            'blooms': 'application',
        },
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'multiple_choice',
            'stem': 'Newtons First Law of Motion is also known as the law of:',
            'options': '["Acceleration","Inertia","Action and Reaction","Gravity"]',
            'answer': '1',
            'explanation': 'Newtons First Law states an object stays at rest or in motion unless acted on by a net force. This is called inertia.',
            'hints_list': ['This law describes what happens when no net force acts on an object.', 'The word starts with I and means resistance to change in motion.'],
            'difficulty': 'easy',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.4.1',
            'type': 'multiple_choice',
            'stem': 'What happens to acceleration if force is doubled and mass stays the same?',
            'options': '["Stays the same","Doubled","Halved","Quadrupled"]',
            'answer': '1',
            'explanation': 'From F = ma, if F doubles and m is constant, a doubles. Acceleration is proportional to force.',
            'hints_list': ['Acceleration is directly proportional to force (a = F/m).', 'If you double the top of a fraction, what happens?'],
            'difficulty': 'core',
            'blooms': 'application',
        },
        {
            'topic': 'B7/JHS1.4.4.2',
            'type': 'multiple_choice',
            'stem': 'A lever is an example of:',
            'options': '["A complex machine","A simple machine","An electrical device","A chemical compound"]',
            'answer': '1',
            'explanation': 'A lever is one of the six classical simple machines. It multiplies force or changes its direction.',
            'hints_list': ['Simple machines make work easier.', 'A lever uses a fulcrum to multiply force.'],
            'difficulty': 'easy',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.4.2',
            'type': 'multiple_choice',
            'stem': 'In a Class 1 lever, the fulcrum is located:',
            'options': '["At one end","Between effort and load","At the other end","Above the lever"]',
            'answer': '1',
            'explanation': 'In a Class 1 lever (see-saw, crowbar), the fulcrum is between the effort and the load.',
            'hints_list': ['Think about a see-saw.', 'Where is the pivot point relative to the people on each end?'],
            'difficulty': 'core',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.1.1',
            'type': 'multiple_choice',
            'stem': 'Which of the following is NOT a form of energy?',
            'options': '["Heat","Light","Friction","Sound"]',
            'answer': '2',
            'explanation': 'Friction is a force, not a form of energy. Heat, light, sound, kinetic, and potential are forms of energy.',
            'hints_list': ['Energy can be converted from one form to another.', 'Is friction something you can store or convert?'],
            'difficulty': 'easy',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.1.1',
            'type': 'multiple_choice',
            'stem': 'Energy stored in food is an example of:',
            'options': '["Kinetic energy","Potential energy","Chemical energy","Nuclear energy"]',
            'answer': '2',
            'explanation': 'Food stores chemical energy in the bonds of its molecules.',
            'hints_list': ['Think about what kind of energy is stored in bonds.', 'Chemical energy is released during digestion.'],
            'difficulty': 'core',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.1.2',
            'type': 'multiple_choice',
            'stem': 'Heat transfer by direct contact between particles is called:',
            'options': '["Radiation","Convection","Conduction","Insulation"]',
            'answer': '2',
            'explanation': 'Conduction is heat transfer through direct contact between particles.',
            'hints_list': ['Conduction requires physical contact.', 'Touch a hot spoon - the heat travels through the metal by...'],
            'difficulty': 'easy',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.1.3',
            'type': 'multiple_choice',
            'stem': 'Light travels in:',
            'options': '["Curved lines","Straight lines","Circles","Zigzag patterns"]',
            'answer': '1',
            'explanation': 'Light travels in straight lines. This is why we see shadows.',
            'hints_list': ['Think about laser beams or sunbeams through a window.', 'Shadows exist because light cannot bend around objects.'],
            'difficulty': 'easy',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.4.2.1',
            'type': 'multiple_choice',
            'stem': 'The flow of electric charges through a conductor is called:',
            'options': '["Voltage","Current","Resistance","Capacitance"]',
            'answer': '1',
            'explanation': 'Electric current is the flow of electric charges (electrons) through a conductor. Measured in Amperes.',
            'hints_list': ['Current = flow of charges.', 'Think of water flowing through a pipe - electricity is similar.'],
            'difficulty': 'core',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.5.2.1',
            'type': 'multiple_choice',
            'stem': 'Which nutrient deficiency causes kwashiorkor?',
            'options': '["Vitamin C deficiency","Protein deficiency","Iron deficiency","Carbohydrate deficiency"]',
            'answer': '1',
            'explanation': 'Kwashiorkor is caused by protein deficiency. It affects children and causes belly swelling.',
            'hints_list': ['Kwashiorkor is a malnutrition disease.', 'Which macronutrient is essential for growth and repair?'],
            'difficulty': 'core',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.5.2.2',
            'type': 'multiple_choice',
            'stem': 'HIV/AIDS is an example of a:',
            'options': '["Bacterial disease","Fungal disease","Viral disease","Parasitic disease"]',
            'answer': '2',
            'explanation': 'HIV is caused by a virus. It attacks the immune system.',
            'hints_list': ['HIV stands for Human Immunodeficiency Virus.', 'Viruses are much smaller than bacteria.'],
            'difficulty': 'easy',
            'blooms': 'recall',
        },
        {
            'topic': 'B7/JHS1.2.1.1',
            'type': 'multiple_choice',
            'stem': 'The process by which water changes from liquid to gas is called:',
            'options': '["Condensation","Precipitation","Evaporation","Transpiration"]',
            'answer': '2',
            'explanation': 'Evaporation is when liquid water changes to water vapor due to heat energy.',
            'hints_list': ['This happens when you boil water.', 'Puddles disappear on hot days because of this process.'],
            'difficulty': 'easy',
            'blooms': 'recall',
        },
    ]
    
    for i, q in enumerate(questions):
        # Find topic UUID
        f.write(f'-- Q{i+1}: {q["type"]} — {q["difficulty"]} — {q["blooms"]}\n')
        f.write(f"INSERT INTO questions (topic_id, owner_teacher_id, question_type, stem, options, correct_answer, explanation, hints, difficulty, blooms_level, visibility)\n")
        f.write(f"VALUES (\n")
        f.write(f"    (SELECT id FROM topics WHERE code = '{q['topic']}'), NULL, '{q['type']}',\n")
        f.write(f"    '{escape_sql(q['stem'])}',\n")
        if q['options'] == 'NULL':
            f.write(f"    NULL,\n")
        else:
            f.write(f"    '{q['options']}'::jsonb,\n")
        f.write(f"    '{q['answer']}'::jsonb,\n")
        f.write(f"    '{escape_sql(q['explanation'])}',\n")
        f.write(f"    ARRAY[{', '.join(repr(escape_sql(h)) for h in q['hints_list'])}],\n")
        f.write(f"    '{q['difficulty']}', '{q['blooms']}', 'shared'\n")
        f.write(f");\n\n")

print(f'Generated: {qfname} (20 questions)')
