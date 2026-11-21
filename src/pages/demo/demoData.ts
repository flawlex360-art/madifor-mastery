import type { Class, Learner } from '@/types/auth';
import type { Question } from '@/types/curriculum';

export const DEMO_TEACHER = {
  id: 'demo-teacher-id',
  full_name: 'Demo Teacher',
  email: 'demo@madiformastery.edu',
  role: 'teacher',
  created_at: '2026-09-01T08:00:00Z',
};

export const DEMO_CLASSES: Class[] = [
  {
    id: 'demo-class-1',
    teacher_id: DEMO_TEACHER.id,
    school_id: null,
    name: 'Basic 8 Science — A',
    class_level: 'B8',
    class_code: 'B8SCI-A',
    created_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'demo-class-2',
    teacher_id: DEMO_TEACHER.id,
    school_id: null,
    name: 'Basic 8 Science — B',
    class_level: 'B8',
    class_code: 'B8SCI-B',
    created_at: '2026-09-01T08:00:00Z',
  },
];

export interface DemoTopic {
  id: string;
  name: string;
  code: string;
  strand: string;
  sub_strand: string;
}

export const DEMO_TOPICS: DemoTopic[] = [
  { id: 't1', name: 'Properties & States of Matter', code: 'B8.1.1.1', strand: 'Diversity of Matter', sub_strand: 'Materials' },
  { id: 't2', name: 'Plant & Animal Cells', code: 'B8.1.2.1', strand: 'Diversity of Matter', sub_strand: 'Living Cells' },
  { id: 't3', name: 'Carbon & Water Cycles', code: 'B8.2.1.1', strand: 'Cycles', sub_strand: 'Earth Cycles' },
  { id: 't4', name: 'Force, Motion & Friction', code: 'B8.4.3.1', strand: 'Forces and Energy', sub_strand: 'Forces and Motion' },
  { id: 't5', name: 'Ecosystems & Food Chains', code: 'B8.3.2.1', strand: 'Systems', sub_strand: 'Ecosystems' },
];

export type DemoPerformanceTier = 'good' | 'avg' | 'at_risk';

export interface DemoLearnerRecord extends Learner {
  tier: DemoPerformanceTier;
}

export const DEMO_LEARNERS: DemoLearnerRecord[] = [
  // Class A
  { id: 'l1', school_id: null, display_name: 'Kwame Asante', email: 'kwame.asante@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-001', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l2', school_id: null, display_name: 'Ama Mensah', email: 'ama.mensah@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-002', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l3', school_id: null, display_name: 'Kofi Osei', email: 'kofi.osei@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-003', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l4', school_id: null, display_name: 'Abena Yeboah', email: 'abena.yeboah@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-004', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l5', school_id: null, display_name: 'Yaw Boateng', email: 'yaw.boateng@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-005', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l6', school_id: null, display_name: 'Akua Addo', email: 'akua.addo@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-006', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l7', school_id: null, display_name: 'Kwaku Manu', email: 'kwaku.manu@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-007', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l8', school_id: null, display_name: 'Yaa Asantewaa', email: 'yaa.asantewaa@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-008', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l9', school_id: null, display_name: 'Kwabena Darko', email: 'kwabena.darko@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-009', tier: 'avg', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l10', school_id: null, display_name: 'Afia Pokuaa', email: 'afia.pokuaa@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-010', tier: 'avg', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l11', school_id: null, display_name: 'Kwasi Appiah', email: 'kwasi.appiah@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-011', tier: 'avg', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l12', school_id: null, display_name: 'Akosua Serwaa', email: 'akosua.serwaa@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-012', tier: 'at_risk', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l13', school_id: null, display_name: 'Kwadwo Frimpong', email: 'kwadwo.frimpong@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-013', tier: 'at_risk', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l14', school_id: null, display_name: 'Adwoa Mansa', email: 'adwoa.mansa@demo.edu', class_id: 'demo-class-1', learner_code: 'B8A-014', tier: 'at_risk', created_at: '2026-09-01T09:00:00Z' },

  // Class B
  { id: 'l15', school_id: null, display_name: 'Esi Mensimah', email: 'esi.mensimah@demo.edu', class_id: 'demo-class-2', learner_code: 'B8B-001', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l16', school_id: null, display_name: 'Fiifi Dadzie', email: 'fiifi.dadzie@demo.edu', class_id: 'demo-class-2', learner_code: 'B8B-002', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l17', school_id: null, display_name: 'Nana Ama Owusu', email: 'nana.owusu@demo.edu', class_id: 'demo-class-2', learner_code: 'B8B-003', tier: 'avg', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l18', school_id: null, display_name: 'Kojo Baidoo', email: 'kojo.baidoo@demo.edu', class_id: 'demo-class-2', learner_code: 'B8B-004', tier: 'avg', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l19', school_id: null, display_name: 'Mawuli Agbeko', email: 'mawuli.agbeko@demo.edu', class_id: 'demo-class-2', learner_code: 'B8B-005', tier: 'at_risk', created_at: '2026-09-01T09:00:00Z' },
  { id: 'l20', school_id: null, display_name: 'Efua Tetteh', email: 'efua.tetteh@demo.edu', class_id: 'demo-class-2', learner_code: 'B8B-006', tier: 'good', created_at: '2026-09-01T09:00:00Z' },
];

// Deterministic hash so demo metrics stay consistent across renders
function hashSeed(input: string): number {
  let h = 2166136261;
  for (let i = 0; i < input.length; i++) {
    h ^= input.charCodeAt(i);
    h = Math.imul(h, 16777619);
  }
  return Math.abs(h);
}

function getScoreForCell(learner: DemoLearnerRecord, topicId: string): number {
  const seed = hashSeed(`${learner.id}:${topicId}`);
  if (learner.tier === 'good') return 80 + (seed % 21); // 80 - 100
  if (learner.tier === 'avg') return 45 + (seed % 34);  // 45 - 78
  return 18 + (seed % 21);                                // 18 - 38
}

export const getDemoHeatmapCells = (classId: string) => {
  const cells: {
    learner_id: string;
    topic_id: string;
    first_pass_pct: number;
    first_pass_mastered: boolean;
    retained_mastered: boolean;
    status: string;
  }[] = [];

  DEMO_LEARNERS.filter((l) => l.class_id === classId).forEach((l) => {
    DEMO_TOPICS.forEach((t, tIdx) => {
      const pct = getScoreForCell(l, t.id);
      const firstPassMastered = pct >= 80;
      const retainedMastered = firstPassMastered && ((hashSeed(l.id) + tIdx) % 3 !== 0);
      cells.push({
        learner_id: l.id,
        topic_id: t.id,
        first_pass_pct: pct,
        first_pass_mastered: firstPassMastered,
        retained_mastered: retainedMastered,
        status: retainedMastered
          ? 'retained_mastered'
          : firstPassMastered
            ? 'first_pass_mastered'
            : 'in_progress',
      });
    });
  });

  return cells;
};

export const getDemoLearnerSummary = (classId: string) => {
  const cells = getDemoHeatmapCells(classId);
  return DEMO_LEARNERS.filter((l) => l.class_id === classId).map((l) => {
    const learnerCells = cells.filter((c) => c.learner_id === l.id);
    const avg = Math.round(
      learnerCells.reduce((sum, c) => sum + c.first_pass_pct, 0) / Math.max(1, learnerCells.length)
    );
    const firstPassCount = learnerCells.filter((c) => c.first_pass_mastered).length;
    const retainedCount = learnerCells.filter((c) => c.retained_mastered).length;

    return {
      learner_id: l.id,
      display_name: l.display_name,
      learner_code: l.learner_code,
      overall_avg_pct: avg,
      topics_attempted: DEMO_TOPICS.length,
      topics_first_pass: firstPassCount,
      topics_retained: retainedCount,
    };
  });
};

export const getDemoMasteryOverview = (classId: string) => {
  const cells = getDemoHeatmapCells(classId);
  const classLearnersCount = DEMO_LEARNERS.filter((l) => l.class_id === classId).length;

  return DEMO_TOPICS.map((t) => {
    const topicCells = cells.filter((c) => c.topic_id === t.id);
    const avgPct =
      topicCells.length > 0
        ? Math.round(topicCells.reduce((sum, c) => sum + c.first_pass_pct, 0) / topicCells.length)
        : 0;
    return {
      class_id: classId,
      topic_id: t.id,
      topic_name: t.name,
      topic_code: t.code,
      avg_first_pass_pct: avgPct,
      first_pass_mastered_count: topicCells.filter((c) => c.first_pass_mastered).length,
      retained_mastered_count: topicCells.filter((c) => c.retained_mastered).length,
      total_learners: classLearnersCount,
    };
  });
};

export const getDemoVoluntaryPractice = (classId: string) => {
  return DEMO_LEARNERS.filter((l) => l.class_id === classId).map((l) => {
    const seed = hashSeed(l.id);
    return {
      learner_id: l.id,
      voluntary_practice_sessions: l.tier === 'good' ? 2 + (seed % 4) : l.tier === 'avg' ? 1 : 0,
      voluntary_practice_topics: l.tier === 'good' ? 1 + (seed % 3) : l.tier === 'avg' ? 1 : 0,
    };
  });
};

export const getDemoHistory = () => {
  const now = new Date();
  const past = new Date(now.getTime() - 86400000);

  return [
    { learner_id: 'l9', topic_id: 't1', first_pass_pct: 48, recorded_at: now.toISOString() },
    { learner_id: 'l9', topic_id: 't1', first_pass_pct: 68, recorded_at: past.toISOString() },
    { learner_id: 'l12', topic_id: 't2', first_pass_pct: 22, recorded_at: now.toISOString() },
    { learner_id: 'l12', topic_id: 't2', first_pass_pct: 42, recorded_at: past.toISOString() },
    { learner_id: 'l19', topic_id: 't4', first_pass_pct: 25, recorded_at: now.toISOString() },
    { learner_id: 'l19', topic_id: 't4', first_pass_pct: 45, recorded_at: past.toISOString() },
  ];
};

export const getDemoDrillDown = (learnerId: string) => {
  const l = DEMO_LEARNERS.find((x) => x.id === learnerId) || DEMO_LEARNERS[0];
  const cells = getDemoHeatmapCells(l.class_id).filter((c) => c.learner_id === l.id);

  return DEMO_TOPICS.map((t) => {
    const cell = cells.find((c) => c.topic_id === t.id);
    return {
      topic_id: t.id,
      topic_name: t.name,
      topic_code: t.code,
      first_pass_pct: cell?.first_pass_pct ?? 0,
      first_pass_mastered: cell?.first_pass_mastered ?? false,
      retained_mastered: cell?.retained_mastered ?? false,
      status: cell?.status ?? 'not_started',
    };
  });
};

// 25 deterministic BECE Integrated Science questions (5 per topic)
export const DEMO_QUESTIONS: Question[] = [
  // t1: Properties & States of Matter
  {
    id: 'dq-1',
    topic_id: 't1',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Which state of matter has a definite volume but takes the shape of its container?',
    options: ['Solid', 'Liquid', 'Gas', 'Plasma'],
    correct_answer: 1,
    explanation: 'Particles in a liquid can slide past one another (no fixed shape) while remaining close together (definite volume).',
    hints: ['Think about pouring 250 ml of water from a bottle into a bowl.'],
    difficulty: 'easy',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-2',
    topic_id: 't1',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'The process by which a solid changes directly into a gas without passing through the liquid state is called:',
    options: ['Evaporation', 'Condensation', 'Sublimation', 'Melting'],
    correct_answer: 2,
    explanation: 'Sublimation occurs when solid substances like camphor or naphthalene absorb heat and turn directly into vapour.',
    hints: ['Naphthalene (mothballs) disappears over time without wetting clothes.'],
    difficulty: 'core',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-3',
    topic_id: 't1',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Why are gases much easier to compress than solids?',
    options: [
      'Gas particles have no mass',
      'There are large spaces between gas particles',
      'Solid particles repel each other',
      'Gas particles do not move',
    ],
    correct_answer: 1,
    explanation: 'In gases, molecules are far apart with empty space between them, so pressure can push them closer together.',
    hints: ['Compare particle spacing in the three states of matter.'],
    difficulty: 'core',
    blooms_level: 'application',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-4',
    topic_id: 't1',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'A perfume sprayed at one corner of a room is smelled at the opposite corner mainly because of:',
    options: ['Osmosis', 'Transpiration', 'Diffusion', 'Filtration'],
    correct_answer: 2,
    explanation: 'Diffusion is the net movement of particles from a region of higher concentration to a region of lower concentration.',
    hints: ['Gases spread out naturally without needing a membrane.'],
    difficulty: 'easy',
    blooms_level: 'application',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-5',
    topic_id: 't1',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Which change of state releases heat energy to the surroundings?',
    options: ['Melting', 'Boiling', 'Evaporation', 'Condensation'],
    correct_answer: 3,
    explanation: 'During condensation, gas particles lose thermal energy and come closer together to form a liquid.',
    hints: ['Which change goes from a higher-energy state (gas) to a lower-energy state (liquid)?'],
    difficulty: 'bece_level',
    blooms_level: 'analysis',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },

  // t2: Plant & Animal Cells
  {
    id: 'dq-6',
    topic_id: 't2',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Which structure is found in a plant cell but absent in an animal cell?',
    options: ['Cell membrane', 'Nucleus', 'Cellulose cell wall', 'Cytoplasm'],
    correct_answer: 2,
    explanation: 'Plant cells possess a rigid cellulose cell wall (alongside chloroplasts and a large central vacuole), whereas animal cells do not.',
    hints: ['Plant stems stay upright without bones thanks to a rigid outer layer.'],
    difficulty: 'easy',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-7',
    topic_id: 't2',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'What is the primary role of the cell membrane?',
    options: [
      'Manufactures glucose during photosynthesis',
      'Controls the movement of substances in and out of the cell',
      'Stores genetic information on chromosomes',
      'Provides rigid structural support like cellulose',
    ],
    correct_answer: 1,
    explanation: 'The cell membrane is selectively permeable, regulating which nutrients enter and wastes leave the cell.',
    hints: ['Think of it as a security gate around the cytoplasm.'],
    difficulty: 'easy',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-8',
    topic_id: 't2',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Which organelle is responsible for releasing usable energy (ATP) during cellular respiration?',
    options: ['Ribosome', 'Chloroplast', 'Mitochondrion', 'Golgi body'],
    correct_answer: 2,
    explanation: 'Mitochondria carry out aerobic respiration to convert chemical energy in glucose into usable cellular energy.',
    hints: ['Often called the powerhouse of the cell.'],
    difficulty: 'core',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-9',
    topic_id: 't2',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Why do red blood cells lack a nucleus when mature?',
    options: [
      'To carry more haemoglobin and oxygen',
      'So they can divide rapidly in blood vessels',
      'To carry out photosynthesis',
      'To survive without any cell membrane',
    ],
    correct_answer: 0,
    explanation: 'Losing the nucleus gives human red blood cells more internal space for haemoglobin and a biconcave shape for oxygen transport.',
    hints: ['What is the main job of a red blood cell?'],
    difficulty: 'bece_level',
    blooms_level: 'application',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-10',
    topic_id: 't2',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'A cell viewed under a microscope has a large central vacuole and chloroplasts. The specimen is most likely from a:',
    options: ['Cheek swab', 'Onion root hair', 'Green hibiscus leaf', 'Human muscle fibre'],
    correct_answer: 2,
    explanation: 'Only green photosynthetic plant tissues (like leaves) contain both chloroplasts and a large central vacuole.',
    hints: ['Root cells grow underground in the dark and usually lack chloroplasts.'],
    difficulty: 'bece_level',
    blooms_level: 'analysis',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },

  // t3: Carbon & Water Cycles
  {
    id: 'dq-11',
    topic_id: 't3',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Which process removes carbon dioxide from the atmosphere and locks it into plant carbohydrates?',
    options: ['Respiration', 'Combustion', 'Photosynthesis', 'Decay'],
    correct_answer: 2,
    explanation: 'Plants use light energy to absorb carbon dioxide and water, producing glucose and oxygen via photosynthesis.',
    hints: ['Respiration and burning both release CO2 back into the air.'],
    difficulty: 'easy',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-12',
    topic_id: 't3',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'In the water cycle, cloud formation occurs directly as water vapour cools and undergoes:',
    options: ['Precipitation', 'Transpiration', 'Condensation', 'Infiltration'],
    correct_answer: 2,
    explanation: 'Warm water vapour rises, cools at higher altitudes, and condenses around dust particles into tiny liquid droplets forming clouds.',
    hints: ['Clouds are made of tiny liquid droplets or ice crystals, not gas.'],
    difficulty: 'core',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-13',
    topic_id: 't3',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Decomposers such as fungi and bacteria contribute to the carbon cycle by:',
    options: [
      'Turning carbon dioxide directly into fossil fuels in one day',
      'Releasing CO2 through respiration as they break down dead organisms',
      'Preventing nitrates from entering soil water',
      'Absorbing nitrogen gas to make chlorophyll',
    ],
    correct_answer: 1,
    explanation: 'Microorganisms respire while feeding on dead plant and animal matter, returning carbon dioxide to the atmosphere.',
    hints: ['Decomposers are living cells that carry out respiration.'],
    difficulty: 'core',
    blooms_level: 'application',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-14',
    topic_id: 't3',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Loss of water vapour to the atmosphere through plant stomata is known as:',
    options: ['Transpiration', 'Sublimation', 'Osmoregulation', 'Percolation'],
    correct_answer: 0,
    explanation: 'Transpiration pulls water up xylem vessels and releases water vapour through leaf stomata.',
    hints: ['This process helps cool leaves and draw mineral ions upward.'],
    difficulty: 'easy',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-15',
    topic_id: 't3',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Large-scale deforestation affects the carbon cycle by:',
    options: [
      'Lowering atmospheric carbon dioxide permanently',
      'Reducing photosynthesis while burning trees releases stored carbon',
      'Increasing condensation faster than evaporation',
      'Stopping all cellular respiration in animals',
    ],
    correct_answer: 1,
    explanation: 'Clearing forests removes carbon-absorbing trees and often releases carbon stored in wood when cleared biomass decays or burns.',
    hints: ['Fewer trees means less photosynthesis; clearing often adds combustion or decay.'],
    difficulty: 'bece_level',
    blooms_level: 'analysis',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },

  // t4: Force, Motion & Friction
  {
    id: 'dq-16',
    topic_id: 't4',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'If the net (resultant) force acting on an object is zero, the object:',
    options: [
      'Must be completely stationary',
      'Accelerates continuously',
      'Either stays at rest or moves at constant velocity',
      'Reverses direction immediately',
    ],
    correct_answer: 2,
    explanation: 'By Newton’s First Law, balanced forces produce zero acceleration: a stationary object remains still and a moving one keeps constant speed and direction.',
    hints: ['Zero net force means zero acceleration, not necessarily zero velocity.'],
    difficulty: 'bece_level',
    blooms_level: 'application',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-17',
    topic_id: 't4',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Which SI unit is used to measure force?',
    options: ['Joule (J)', 'Watt (W)', 'Newton (N)', 'Pascal (Pa)'],
    correct_answer: 2,
    explanation: 'Force is measured in Newtons (N), named after Sir Isaac Newton.',
    hints: ['Joule measures energy, Watt measures power, and Pascal measures pressure.'],
    difficulty: 'easy',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-18',
    topic_id: 't4',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Applying lubricating oil to bicycle chain gears primarily aims to:',
    options: [
      'Increase gravitational pull',
      'Reduce unwanted friction and wear',
      'Increase electrical resistance',
      'Make the metal gears heavier',
    ],
    correct_answer: 1,
    explanation: 'Lubricants form a thin film between moving metal parts, reducing friction, heat, and mechanical wear.',
    hints: ['Oil makes surfaces smoother as they slide past each other.'],
    difficulty: 'easy',
    blooms_level: 'application',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-19',
    topic_id: 't4',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'A force of 20 N pushes a 4 kg box across a smooth floor. What is its acceleration?',
    options: ['0.2 m/s²', '5 m/s²', '16 m/s²', '80 m/s²'],
    correct_answer: 1,
    explanation: 'Using F = m × a, acceleration a = F / m = 20 N / 4 kg = 5 m/s².',
    hints: ['Divide the net force by the mass.'],
    difficulty: 'core',
    blooms_level: 'application',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-20',
    topic_id: 't4',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Which situation demonstrates useful (helpful) friction?',
    options: [
      'A car engine overheating without oil',
      'Shoe soles gripping tiled steps while walking',
      'Door hinges squeaking when opened',
      'Bicycle tyres wearing thin over gravel',
    ],
    correct_answer: 1,
    explanation: 'Without grip friction between shoes and the ground, your foot would slip backward instead of pushing you forward.',
    hints: ['Look for a scenario where stopping friction causes sliding or danger.'],
    difficulty: 'core',
    blooms_level: 'analysis',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },

  // t5: Ecosystems & Food Chains
  {
    id: 'dq-21',
    topic_id: 't5',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'In the food chain Grass → Grasshopper → Toad → Hawk, which organism is the primary consumer?',
    options: ['Grass', 'Grasshopper', 'Toad', 'Hawk'],
    correct_answer: 1,
    explanation: 'Grass is the producer. The grasshopper eats the producer directly, making it the primary (first) consumer.',
    hints: ['Primary consumers are herbivores that feed directly on producers.'],
    difficulty: 'easy',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-22',
    topic_id: 't5',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Why are there usually fewer organisms at the top of a food chain than at the bottom?',
    options: [
      'Producers cannot grow fast enough',
      'Only about 10% of energy passes from one trophic level to the next',
      'Carnivores never reproduce in wild habitats',
      'Sunlight only reaches the top consumers',
    ],
    correct_answer: 1,
    explanation: 'At each trophic level, most energy is used for movement, respiration, and lost as heat, leaving less energy for top predators.',
    hints: ['Consider how energy transfers along feeding levels.'],
    difficulty: 'core',
    blooms_level: 'application',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-23',
    topic_id: 't5',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'Which abiotic factor most directly limits where submerged water plants can grow in a deep lake?',
    options: ['Light intensity', 'Herbivore population', 'Bacterial decay rate', 'Wind direction'],
    correct_answer: 0,
    explanation: 'Abiotic factors are non-living. Aquatic plants need sufficient sunlight penetrating the water for photosynthesis.',
    hints: ['Abiotic means non-living; plants need light to make food.'],
    difficulty: 'bece_level',
    blooms_level: 'analysis',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-24',
    topic_id: 't5',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'If all snakes in a farm ecosystem were killed, what would likely happen first to the rat population?',
    options: [
      'Rats would die immediately',
      'Rats would increase rapidly due to fewer predators',
      'Grass plants would multiply overnight',
      'Hawks would start eating maize seeds',
    ],
    correct_answer: 1,
    explanation: 'Removing a predator reduces mortality for its prey (rats), allowing their numbers to rise quickly before food runs short.',
    hints: ['Snakes prey on rats in farmland ecosystems.'],
    difficulty: 'core',
    blooms_level: 'application',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
  {
    id: 'dq-25',
    topic_id: 't5',
    owner_teacher_id: null,
    visibility: 'shared',
    question_type: 'multiple_choice',
    stem: 'The natural place where an organism lives and obtains food and shelter is called its:',
    options: ['Niche', 'Population', 'Habitat', 'Community'],
    correct_answer: 2,
    explanation: 'A habitat is the specific physical environment where an organism lives (e.g., mangrove swamp or pond).',
    hints: ['Think of a pond for a tadpole or bark of a tree for a lichen.'],
    difficulty: 'easy',
    blooms_level: 'recall',
    diagram_url: null,
    created_at: '2026-09-01T08:00:00Z',
    updated_at: '2026-09-01T08:00:00Z',
  },
];

export const getDemoAnalytics = () => {
  return DEMO_QUESTIONS.map((q) => {
    const seed = hashSeed(q.id);
    const topic = DEMO_TOPICS.find((t) => t.id === q.topic_id);
    const baseRate =
      q.difficulty === 'easy' ? 76 + (seed % 18) : q.difficulty === 'core' ? 54 + (seed % 24) : 34 + (seed % 26);
    const totalAttempts = 24 + (seed % 32);
    return {
      question_id: q.id,
      topic_id: q.topic_id,
      topic_name: topic?.name || '',
      stem: q.stem,
      question_type: q.question_type,
      difficulty: q.difficulty,
      blooms_level: q.blooms_level,
      total_attempts: totalAttempts,
      correct_count: Math.round((totalAttempts * baseRate) / 100),
      success_rate_pct: baseRate,
      avg_time_seconds: 16 + (seed % 28),
      avg_hints_used: Number(((seed % 14) / 10).toFixed(1)),
      difficulty_b: Number((((50 - baseRate) / 25)).toFixed(3)),
      discrimination_a: Number((0.75 + (seed % 50) / 100).toFixed(2)),
    };
  });
};

export const getDemoReviewQueue = () => {
  const now = Date.now();
  const dayMs = 86400000;

  return [
    {
      learner_id: 'l9',
      display_name: 'Kwabena Darko',
      question_id: 'dq-5',
      topic_id: 't1',
      topic_code: 'B8.1.1.1',
      topic_name: 'Properties & States of Matter',
      stage: 'review_1',
      due_at: new Date(now - 2 * dayMs).toISOString(),
      is_overdue: true,
    },
    {
      learner_id: 'l9',
      display_name: 'Kwabena Darko',
      question_id: 'dq-16',
      topic_id: 't4',
      topic_code: 'B8.4.3.1',
      topic_name: 'Force, Motion & Friction',
      stage: 'missed',
      due_at: new Date(now + dayMs).toISOString(),
      is_overdue: false,
    },
    {
      learner_id: 'l12',
      display_name: 'Akosua Serwaa',
      question_id: 'dq-9',
      topic_id: 't2',
      topic_code: 'B8.1.2.1',
      topic_name: 'Plant & Animal Cells',
      stage: 'review_1',
      due_at: new Date(now - 3 * dayMs).toISOString(),
      is_overdue: true,
    },
    {
      learner_id: 'l12',
      display_name: 'Akosua Serwaa',
      question_id: 'dq-15',
      topic_id: 't3',
      topic_code: 'B8.2.1.1',
      topic_name: 'Carbon & Water Cycles',
      stage: 'missed',
      due_at: new Date(now - dayMs).toISOString(),
      is_overdue: true,
    },
    {
      learner_id: 'l3',
      display_name: 'Kofi Osei',
      question_id: 'dq-23',
      topic_id: 't5',
      topic_code: 'B8.3.2.1',
      topic_name: 'Ecosystems & Food Chains',
      stage: 'review_3',
      due_at: new Date(now + 4 * dayMs).toISOString(),
      is_overdue: false,
    },
  ];
};

export const getDemoTrends = (learnerId: string) => {
  const learner = DEMO_LEARNERS.find((l) => l.id === learnerId) || DEMO_LEARNERS[0];
  const baseStart = learner.tier === 'good' ? 58 : learner.tier === 'avg' ? 40 : 28;
  const slope = learner.tier === 'good' ? 2.5 : learner.tier === 'avg' ? 1.6 : 0.4;
  const points = [];
  const baseDate = new Date('2026-10-01T10:00:00Z');

  for (let i = 0; i < 12; i++) {
    const d = new Date(baseDate.getTime() + i * 3 * 86400000);
    const wave = ((hashSeed(`${learner.id}:${i}`) % 7) - 3);
    const pct = Math.max(10, Math.min(98, Math.round(baseStart + i * slope + wave)));
    points.push({
      date: d.toISOString().split('T')[0],
      pct,
      status: pct >= 80 ? 'first_pass_mastered' : 'in_progress',
    });
  }
  return points;
};

export const getDemoMisconceptions = () => {
  return [
    {
      learner_id: 'l12',
      learner_name: 'Akosua Serwaa',
      question_id: 'dq-9',
      stem: 'Why do red blood cells lack a nucleus when mature?',
      topic_code: 'B8.1.2.1',
      topic_name: 'Plant & Animal Cells',
      count: 4,
    },
    {
      learner_id: 'l13',
      learner_name: 'Kwadwo Frimpong',
      question_id: 'dq-16',
      stem: 'If the net (resultant) force acting on an object is zero, the object:',
      topic_code: 'B8.4.3.1',
      topic_name: 'Force, Motion & Friction',
      count: 3,
    },
    {
      learner_id: 'l9',
      learner_name: 'Kwabena Darko',
      question_id: 'dq-5',
      stem: 'Which change of state releases heat energy to the surroundings?',
      topic_code: 'B8.1.1.1',
      topic_name: 'Properties & States of Matter',
      count: 3,
    },
    {
      learner_id: 'l14',
      learner_name: 'Adwoa Mansa',
      question_id: 'dq-16',
      stem: 'If the net (resultant) force acting on an object is zero, the object:',
      topic_code: 'B8.4.3.1',
      topic_name: 'Force, Motion & Friction',
      count: 4,
    },
  ];
};
