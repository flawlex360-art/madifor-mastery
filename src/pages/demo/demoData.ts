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
