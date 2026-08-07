// Flawlex Mastery — Assessment Types

import type { ReviewStage, AttemptType, MasteryStatus } from '@/config/assessment';

export interface Attempt {
  id: string;
  learner_id: string;
  question_id: string;
  topic_id: string;
  is_correct: boolean;
  learner_answer: unknown;
  time_taken_seconds: number | null;
  hints_used: number;
  attempt_type: AttemptType;
  session_id: string | null;
  session_question_index: number | null;
  created_at: string;
}

export interface ReviewEntry {
  id: string;
  learner_id: string;
  question_id: string;
  topic_id: string;
  stage: ReviewStage;
  due_at: string;
  added_at: string;
  last_reviewed_at: string | null;
}

export interface TopicMastery {
  id: string;
  learner_id: string;
  topic_id: string;
  first_pass_correct: number;
  first_pass_total: number;
  first_pass_pct: number;
  first_pass_mastered: boolean;
  retained_mastered: boolean;
  retained_at: string | null;
  status: MasteryStatus;
  last_updated: string;
}

export interface SelfPracticeSession {
  id: string;
  learner_id: string;
  topic_id: string;
  questions_attempted: number;
  questions_correct: number;
  started_at: string;
  ended_at: string | null;
}

// Session queue item: a question with session metadata
export interface SessionQuestion {
  question_id: string;
  topic_id: string;
  is_review: boolean;
  session_question_index: number;
}

// Assessment session state
export interface AssessmentSession {
  session_id: string;
  learner_id: string;
  topic_id: string;
  questions: SessionQuestion[];
  current_index: number;
  answers: Map<string, { answer: unknown; is_correct: boolean; time_taken: number; hints_used: number }>;
  started_at: Date;
  attempt_type: AttemptType;
}
