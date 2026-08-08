// Mock Data for Demo Experience

export const DEMO_TEACHER = {
  id: 'demo-teacher-id',
  full_name: 'Demo Teacher',
  email: 'demo@madifor.com',
  role: 'teacher',
  created_at: new Date().toISOString(),
};

export const DEMO_CLASSES = [
  {
    id: 'demo-class-1',
    teacher_id: DEMO_TEACHER.id,
    name: 'Basic 8 Science - A',
    class_level: 'B8',
    class_code: 'B8SCI-A',
    created_at: new Date().toISOString(),
  },
  {
    id: 'demo-class-2',
    teacher_id: DEMO_TEACHER.id,
    name: 'Basic 8 Science - B',
    class_level: 'B8',
    class_code: 'B8SCI-B',
    created_at: new Date().toISOString(),
  }
];

export const DEMO_TOPICS = [
  { id: 't1', name: 'Properties of Matter', code: 'SCI-B8-1' },
  { id: 't2', name: 'Living Cells', code: 'SCI-B8-2' },
  { id: 't3', name: 'Force and Motion', code: 'SCI-B8-3' },
  { id: 't4', name: 'Ecosystems', code: 'SCI-B8-4' },
  { id: 't5', name: 'Chemical Reactions', code: 'SCI-B8-5' },
];

export const DEMO_LEARNERS = [
  // Good Learners (Higher percentage)
  { id: 'l1', display_name: 'Kwame Asante', email: 'kwame@demo.com', class_id: 'demo-class-1', learner_code: 'L001', login_password: 'password123', type: 'good' },
  { id: 'l2', display_name: 'Ama Mensah', email: 'ama@demo.com', class_id: 'demo-class-1', learner_code: 'L002', login_password: 'password123', type: 'good' },
  { id: 'l3', display_name: 'Kofi Osei', email: 'kofi@demo.com', class_id: 'demo-class-1', learner_code: 'L003', login_password: 'password123', type: 'good' },
  { id: 'l4', display_name: 'Abena Yeboah', email: 'abena@demo.com', class_id: 'demo-class-1', learner_code: 'L004', login_password: 'password123', type: 'good' },
  { id: 'l5', display_name: 'Yaw Boateng', email: 'yaw@demo.com', class_id: 'demo-class-1', learner_code: 'L005', login_password: 'password123', type: 'good' },
  { id: 'l6', display_name: 'Akua Addo', email: 'akua@demo.com', class_id: 'demo-class-1', learner_code: 'L006', login_password: 'password123', type: 'good' },
  { id: 'l7', display_name: 'Kwaku Manu', email: 'kwaku@demo.com', class_id: 'demo-class-1', learner_code: 'L007', login_password: 'password123', type: 'good' },
  { id: 'l8', display_name: 'Yaa Asantewaa', email: 'yaa@demo.com', class_id: 'demo-class-1', learner_code: 'L008', login_password: 'password123', type: 'good' },
  
  // Average Learners
  { id: 'l9', display_name: 'Kwabena Darko', email: 'kwabena@demo.com', class_id: 'demo-class-1', learner_code: 'L009', login_password: 'password123', type: 'avg' },
  { id: 'l10', display_name: 'Afia Pokuaa', email: 'afia@demo.com', class_id: 'demo-class-1', learner_code: 'L010', login_password: 'password123', type: 'avg' },
  { id: 'l11', display_name: 'Kwasi Appiah', email: 'kwasi@demo.com', class_id: 'demo-class-1', learner_code: 'L011', login_password: 'password123', type: 'avg' },
  
  // At-Risk Learners
  { id: 'l12', display_name: 'Akosua Serwaa', email: 'akosua@demo.com', class_id: 'demo-class-1', learner_code: 'L012', login_password: 'password123', type: 'bad' },
  { id: 'l13', display_name: 'Kwadwo Frimpong', email: 'kwadwo@demo.com', class_id: 'demo-class-1', learner_code: 'L013', login_password: 'password123', type: 'bad' },
  { id: 'l14', display_name: 'Adwoa Mansa', email: 'adwoa@demo.com', class_id: 'demo-class-1', learner_code: 'L014', login_password: 'password123', type: 'bad' },
];

export const getDemoLearnerSummary = (classId: string) => {
  return DEMO_LEARNERS.filter(l => l.class_id === classId).map(l => {
    let avg = 0;
    if (l.type === 'good') avg = Math.floor(Math.random() * 20) + 80; // 80-100
    if (l.type === 'avg') avg = Math.floor(Math.random() * 20) + 50;  // 50-70
    if (l.type === 'bad') avg = Math.floor(Math.random() * 15) + 20;  // 20-35

    return {
      learner_id: l.id,
      display_name: l.display_name,
      learner_code: l.learner_code,
      overall_avg_pct: avg,
      topics_attempted: 5,
      topics_first_pass: l.type === 'good' ? 4 : l.type === 'avg' ? 2 : 0,
      topics_retained: l.type === 'good' ? 4 : l.type === 'avg' ? 1 : 0,
    };
  });
};

export const getDemoMasteryOverview = (classId: string) => {
  return DEMO_TOPICS.map(t => ({
    class_id: classId,
    topic_id: t.id,
    topic_name: t.name,
    topic_code: t.code,
    avg_first_pass_pct: 65,
    avg_retained_pct: 70,
  }));
};

export const getDemoVoluntaryPractice = (classId: string) => {
  return DEMO_LEARNERS.filter(l => l.class_id === classId).map(l => ({
    learner_id: l.id,
    voluntary_practice_sessions: l.type === 'good' ? Math.floor(Math.random() * 5) + 2 : l.type === 'avg' ? 1 : 0,
    voluntary_practice_topics: l.type === 'good' ? Math.floor(Math.random() * 3) + 1 : 0,
  }));
};

export const getDemoHeatmapCells = (classId: string) => {
  const cells: any[] = [];
  DEMO_LEARNERS.filter(l => l.class_id === classId).forEach(l => {
    DEMO_TOPICS.forEach(t => {
      let first_pass_pct = 0;
      if (l.type === 'good') first_pass_pct = Math.floor(Math.random() * 20) + 80;
      if (l.type === 'avg') first_pass_pct = Math.floor(Math.random() * 30) + 40;
      if (l.type === 'bad') first_pass_pct = Math.floor(Math.random() * 20) + 15;

      cells.push({
        learner_id: l.id,
        topic_id: t.id,
        first_pass_pct,
        first_pass_mastered: first_pass_pct >= 70,
        retained_mastered: first_pass_pct >= 70,
        status: first_pass_pct >= 70 ? 'retained' : first_pass_pct >= 40 ? 'needs_review' : 'at_risk'
      });
    });
  });
  return cells;
};

// Return a few declining history records for AlertPanel to pick up
export const getDemoHistory = () => {
  const now = new Date();
  const past = new Date(now.getTime() - 86400000); // 1 day ago
  
  return [
    // Declining for l9 (Kwabena - avg) on t1 (Matter)
    { learner_id: 'l9', topic_id: 't1', first_pass_pct: 45, recorded_at: now.toISOString() },
    { learner_id: 'l9', topic_id: 't1', first_pass_pct: 65, recorded_at: past.toISOString() },
    
    // Declining for l12 (Akosua - bad) on t2 (Cells)
    { learner_id: 'l12', topic_id: 't2', first_pass_pct: 20, recorded_at: now.toISOString() },
    { learner_id: 'l12', topic_id: 't2', first_pass_pct: 40, recorded_at: past.toISOString() }
  ];
};

export const getDemoDrillDown = (learnerId: string) => {
  const l = DEMO_LEARNERS.find(x => x.id === learnerId);
  const type = l?.type || 'avg';
  
  return DEMO_TOPICS.map(t => {
    let first_pass_pct = 0;
    if (type === 'good') first_pass_pct = Math.floor(Math.random() * 20) + 80;
    if (type === 'avg') first_pass_pct = Math.floor(Math.random() * 30) + 40;
    if (type === 'bad') first_pass_pct = Math.floor(Math.random() * 20) + 15;

    return {
      topic_id: t.id,
      topic_name: t.name,
      first_pass_pct,
      retained_pct: first_pass_pct + 5 > 100 ? 100 : first_pass_pct + 5,
      attempts_count: type === 'good' ? 1 : 2,
      last_attempt_at: new Date().toISOString()
    };
  });
};

// --- CURRICULUM MOCK DATA ---
export const DEMO_SUBTOPICS = [
  { id: 'st1', topic_id: 't1', name: 'States of Matter', code: 'SCI-B8-1.1' },
  { id: 'st2', topic_id: 't1', name: 'Changes in State', code: 'SCI-B8-1.2' },
  { id: 'st3', topic_id: 't2', name: 'Plant vs Animal Cells', code: 'SCI-B8-2.1' },
];

export const DEMO_LEARNING_OBJECTIVES = [
  { id: 'lo1', subtopic_id: 'st1', description: 'Identify the three states of matter.', code: 'LO-1.1.1' },
  { id: 'lo2', subtopic_id: 'st1', description: 'Describe particle arrangement in solids.', code: 'LO-1.1.2' },
  { id: 'lo3', subtopic_id: 'st2', description: 'Explain melting and freezing.', code: 'LO-1.2.1' },
];

// --- QUESTIONS MOCK DATA ---
export const DEMO_QUESTIONS = [
  {
    id: 'q1',
    topic_id: 't1',
    subtopic_id: 'st1',
    type: 'multiple_choice',
    difficulty: 'easy',
    text: 'What is the state of matter that has a definite volume but no definite shape?',
    options: { a: 'Solid', b: 'Liquid', c: 'Gas', d: 'Plasma' },
    correct_answer: 'b',
    status: 'published',
    created_at: new Date().toISOString()
  },
  {
    id: 'q2',
    topic_id: 't2',
    type: 'open_ended',
    difficulty: 'medium',
    text: 'Explain the primary function of the cell membrane in an animal cell.',
    sample_answer: 'The cell membrane controls what enters and exits the cell, acting as a selectively permeable barrier.',
    status: 'published',
    created_at: new Date().toISOString()
  },
  {
    id: 'q3',
    topic_id: 't3',
    type: 'multiple_choice',
    difficulty: 'hard',
    text: 'If the net force on an object is zero, what can be said about its motion?',
    options: { a: 'It must be at rest', b: 'It is accelerating', c: 'It is moving with constant velocity or is at rest', d: 'It is decelerating' },
    correct_answer: 'c',
    status: 'draft',
    created_at: new Date().toISOString()
  }
];

// --- ANALYTICS MOCK DATA ---
export const getDemoAnalytics = () => {
  return DEMO_QUESTIONS.map(q => ({
    question_id: q.id,
    question_text: q.text,
    topic_name: DEMO_TOPICS.find(t => t.id === q.topic_id)?.name || '',
    difficulty: q.difficulty,
    type: q.type,
    attempts: Math.floor(Math.random() * 50) + 20,
    success_rate: Math.floor(Math.random() * 40) + 40,
    avg_time_seconds: Math.floor(Math.random() * 60) + 10,
    common_wrong_answer: q.type === 'multiple_choice' ? 'a' : null
  }));
};

// --- REVIEW QUEUE MOCK DATA ---
export const getDemoReviewQueue = () => {
  const now = new Date();
  return [
    {
      id: 'rq1',
      learner_id: 'l1',
      learner_name: 'Kwame Asante',
      question_id: 'q2',
      question_text: 'Explain the primary function of the cell membrane in an animal cell.',
      student_answer: 'It protects the cell and lets things in and out.',
      ai_score: 80,
      ai_feedback: 'Good answer, though it could use more scientific terminology like "selectively permeable".',
      status: 'pending',
      submitted_at: now.toISOString()
    },
    {
      id: 'rq2',
      learner_id: 'l12',
      learner_name: 'Akosua Serwaa',
      question_id: 'q2',
      question_text: 'Explain the primary function of the cell membrane in an animal cell.',
      student_answer: 'It is the brain of the cell.',
      ai_score: 0,
      ai_feedback: 'Incorrect. The nucleus acts as the "brain". The membrane is the outer boundary.',
      status: 'pending',
      submitted_at: new Date(now.getTime() - 3600000).toISOString()
    }
  ];
};

// --- TRENDS MOCK DATA ---
export const getDemoTrends = () => {
  const dates = [];
  let currentPct = 40;
  for (let i = 30; i >= 0; i--) {
    const d = new Date();
    d.setDate(d.getDate() - i);
    dates.push({
      date: d.toISOString().split('T')[0],
      avg_mastery: currentPct
    });
    // Upward trend with slight randomness
    currentPct += (Math.random() * 3) - 0.5;
    if (currentPct > 100) currentPct = 100;
  }
  return dates;
};

// --- MISCONCEPTIONS MOCK DATA ---
export const getDemoMisconceptions = () => {
  return [
    {
      id: 'm1',
      topic_name: 'Force and Motion',
      misconception: 'Heavier objects always fall faster than lighter objects in a vacuum.',
      occurrences: 8,
      affected_learners: ['Kwabena Darko', 'Akosua Serwaa', 'Afia Pokuaa'],
      ai_remediation: 'Demonstrate Galileo\'s leaning tower experiment concept using a feather and a hammer dropped on the moon (video). Explain how air resistance is the differentiating factor on Earth, not mass.'
    },
    {
      id: 'm2',
      topic_name: 'Properties of Matter',
      misconception: 'Particles in a solid are completely stationary.',
      occurrences: 5,
      affected_learners: ['Kwadwo Frimpong', 'Adwoa Mansa'],
      ai_remediation: 'Use a vibrating phone on a table as an analogy. The phone stays in place (fixed shape/volume) but its parts are vibrating rapidly.'
    }
  ];
};
