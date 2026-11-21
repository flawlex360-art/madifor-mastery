// Madifor Mastery — Curriculum Types

export interface Subject {
  id: string;
  name: string;
  code: string;
  class_levels: string[];
  created_at: string;
}

export interface Strand {
  id: string;
  subject_id: string;
  name: string;
  code: string;
  class_level: 'B7' | 'B8' | 'B9';
  sort_order: number;
}

export interface SubStrand {
  id: string;
  strand_id: string;
  name: string;
  code: string;
  sort_order: number;
}

export interface Topic {
  id: string;
  sub_strand_id: string;
  name: string;
  code: string;
  class_level: 'B7' | 'B8' | 'B9';
  sort_order: number;
  created_at: string;
}

export interface Question {
  id: string;
  topic_id: string;
  owner_teacher_id: string | null;
  question_type: QuestionType;
  stem: string;
  options: QuestionOptions | null;
  correct_answer: CorrectAnswer;
  explanation: string;
  hints: string[] | null;
  difficulty: QuestionDifficulty;
  blooms_level: BloomsLevel;
  diagram_url: string | null;
  visibility: 'shared' | 'private' | 'school';
  created_at: string;
  updated_at: string;
}

export type QuestionType = 'multiple_choice' | 'fill_in_blank' | 'diagram_label' | 'matching' | 'short_structured';
export type QuestionDifficulty = 'easy' | 'core' | 'bece_level';
export type BloomsLevel = 'recall' | 'application' | 'analysis';

export type QuestionOptions = string[] | { left: string; right: string }[];

// MCQ: index of correct option (0-based) or numeric string
// Fill-in-blank: string, number, or string[] of acceptable variations
// Matching: mapping of left→right indices
export type CorrectAnswer = number | string | string[] | Record<number, number>;

export interface CurriculumTree {
  subject: Subject;
  strands: (Strand & {
    sub_strands: (SubStrand & {
      topics: Topic[];
    })[];
  })[];
}
