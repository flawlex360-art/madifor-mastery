// Flawlex Mastery — Auth Types

export interface Teacher {
  id: string;
  school_id: string | null;
  full_name: string;
  email: string;
  role: 'teacher' | 'school_admin';
  is_admin?: boolean;
  status?: 'active' | 'suspended';
  created_at: string;
}

export interface School {
  id: string;
  name: string;
  invite_code: string;
  created_at: string;
  updated_at: string;
}

export interface Class {
  id: string;
  teacher_id: string;
  school_id: string | null;
  name: string;
  class_level: 'B7' | 'B8' | 'B9';
  class_code: string;
  created_at: string;
}

export interface Learner {
  id: string;
  class_id: string;
  school_id: string | null;
  display_name: string;
  learner_code: string;
  email?: string;
  login_password?: string;
  created_at: string;
}

// Learner session (stored in localStorage)
export interface LearnerSession {
  learner_id: string;
  class_id: string;
  display_name: string;
  class_code: string;
  class_level: 'B7' | 'B8' | 'B9';
  email?: string;
}

// Practice context
export interface PracticeContext {
  practice_class_level: 'B7' | 'B8' | 'B9';
}
