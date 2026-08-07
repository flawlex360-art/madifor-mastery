// Flawlex Mastery — Database Types
// Auto-generated from Supabase schema. Regenerate with: npm run supabase:types
// This is a manually written placeholder matching the SQL schema exactly.

export interface Database {
  public: {
    Tables: {
      schools: {
        Row: {
          id: string;
          name: string;
          invite_code: string;
          created_at: string;
          updated_at: string;
        };
        Insert: Omit<Database['public']['Tables']['schools']['Row'], 'id' | 'invite_code' | 'created_at' | 'updated_at'>;
        Update: Partial<Database['public']['Tables']['schools']['Insert']>;
      };
      teachers: {
        Row: {
          id: string;
          school_id: string | null;
          full_name: string;
          email: string;
          role: 'teacher' | 'school_admin';
          created_at: string;
        };
        Insert: Omit<Database['public']['Tables']['teachers']['Row'], 'created_at'>;
        Update: Partial<Database['public']['Tables']['teachers']['Insert']>;
      };
      classes: {
        Row: {
          id: string;
          teacher_id: string;
          school_id: string | null;
          name: string;
          class_level: 'B7' | 'B8' | 'B9';
          class_code: string;
          created_at: string;
        };
        Insert: Omit<Database['public']['Tables']['classes']['Row'], 'id' | 'class_code' | 'created_at'>;
        Update: Partial<Database['public']['Tables']['classes']['Insert']>;
      };
      learners: {
        Row: {
          id: string;
          class_id: string;
          school_id: string | null;
          display_name: string;
          learner_code: string;
          created_at: string;
        };
        Insert: Omit<Database['public']['Tables']['learners']['Row'], 'id' | 'created_at'>;
        Update: Partial<Database['public']['Tables']['learners']['Insert']>;
      };
      subjects: {
        Row: {
          id: string;
          name: string;
          code: string;
          class_levels: string[];
          created_at: string;
        };
        Insert: Omit<Database['public']['Tables']['subjects']['Row'], 'id' | 'created_at'>;
        Update: Partial<Database['public']['Tables']['subjects']['Insert']>;
      };
      strands: {
        Row: {
          id: string;
          subject_id: string;
          name: string;
          code: string;
          class_level: 'B7' | 'B8' | 'B9';
          sort_order: number;
        };
        Insert: Omit<Database['public']['Tables']['strands']['Row'], 'id'>;
        Update: Partial<Database['public']['Tables']['strands']['Insert']>;
      };
      sub_strands: {
        Row: {
          id: string;
          strand_id: string;
          name: string;
          code: string;
          sort_order: number;
        };
        Insert: Omit<Database['public']['Tables']['sub_strands']['Row'], 'id'>;
        Update: Partial<Database['public']['Tables']['sub_strands']['Insert']>;
      };
      topics: {
        Row: {
          id: string;
          sub_strand_id: string;
          name: string;
          code: string;
          class_level: 'B7' | 'B8' | 'B9';
          sort_order: number;
          created_at: string;
        };
        Insert: Omit<Database['public']['Tables']['topics']['Row'], 'id' | 'created_at'>;
        Update: Partial<Database['public']['Tables']['topics']['Insert']>;
      };
      questions: {
        Row: {
          id: string;
          topic_id: string;
          owner_teacher_id: string | null;
          question_type: 'multiple_choice' | 'fill_in_blank' | 'diagram_label' | 'matching' | 'short_structured';
          stem: string;
          options: unknown;
          correct_answer: unknown;
          explanation: string;
          hints: string[] | null;
          difficulty: 'easy' | 'core' | 'bece_level';
          blooms_level: 'recall' | 'application' | 'analysis';
          diagram_url: string | null;
          visibility: 'shared' | 'private' | 'school';
          created_at: string;
          updated_at: string;
        };
        Insert: Omit<Database['public']['Tables']['questions']['Row'], 'id' | 'created_at' | 'updated_at'>;
        Update: Partial<Database['public']['Tables']['questions']['Insert']>;
      };
      attempts: {
        Row: {
          id: string;
          learner_id: string;
          question_id: string;
          topic_id: string;
          is_correct: boolean;
          learner_answer: unknown;
          time_taken_seconds: number | null;
          hints_used: number;
          attempt_type: 'graded' | 'review' | 'self_practice';
          session_id: string | null;
          session_question_index: number | null;
          created_at: string;
        };
        Insert: Omit<Database['public']['Tables']['attempts']['Row'], 'id' | 'created_at'>;
        Update: Partial<Database['public']['Tables']['attempts']['Insert']>;
      };
      review_queue: {
        Row: {
          id: string;
          learner_id: string;
          question_id: string;
          topic_id: string;
          stage: 'missed' | 'review_1' | 'review_2' | 'review_3' | 'retained';
          due_at: string;
          added_at: string;
          last_reviewed_at: string | null;
        };
        Insert: Omit<Database['public']['Tables']['review_queue']['Row'], 'id' | 'added_at'>;
        Update: Partial<Database['public']['Tables']['review_queue']['Insert']>;
      };
      topic_mastery: {
        Row: {
          id: string;
          learner_id: string;
          topic_id: string;
          first_pass_correct: number;
          first_pass_total: number;
          first_pass_pct: number;
          first_pass_mastered: boolean;
          retained_mastered: boolean;
          retained_at: string | null;
          status: 'not_started' | 'in_progress' | 'first_pass_mastered' | 'retained_mastered';
          last_updated: string;
        };
        Insert: Omit<Database['public']['Tables']['topic_mastery']['Row'], 'id' | 'last_updated'>;
        Update: Partial<Database['public']['Tables']['topic_mastery']['Insert']>;
      };
      class_subjects: {
        Row: {
          id: string;
          class_id: string;
          subject_id: string;
          enrolled_at: string;
        };
        Insert: Omit<Database['public']['Tables']['class_subjects']['Row'], 'id' | 'enrolled_at'>;
        Update: Partial<Database['public']['Tables']['class_subjects']['Insert']>;
      };
      self_practice_sessions: {
        Row: {
          id: string;
          learner_id: string;
          topic_id: string;
          questions_attempted: number;
          questions_correct: number;
          started_at: string;
          ended_at: string | null;
        };
        Insert: Omit<Database['public']['Tables']['self_practice_sessions']['Row'], 'id' | 'started_at'>;
        Update: Partial<Database['public']['Tables']['self_practice_sessions']['Insert']>;
      };
    };
    Views: {
      mv_class_mastery: {
        Row: {
          class_id: string;
          teacher_id: string;
          school_id: string | null;
          topic_id: string;
          topic_name: string;
          topic_code: string;
          class_level: string;
          learners_attempted: number;
          avg_first_pass_pct: number;
          first_pass_mastered_count: number;
          retained_mastered_count: number;
          total_learners: number;
        };
      };
      mv_learner_summary: {
        Row: {
          learner_id: string;
          display_name: string;
          learner_code: string;
          class_id: string;
          teacher_id: string;
          school_id: string | null;
          class_name: string;
          topics_retained: number;
          topics_first_pass: number;
          topics_in_progress: number;
          topics_attempted: number;
          overall_avg_pct: number;
          self_practice_sessions_week: number;
        };
      };
      mv_question_analytics: {
        Row: {
          question_id: string;
          topic_id: string;
          stem: string;
          question_type: string;
          difficulty: string;
          blooms_level: string;
          total_attempts: number;
          correct_count: number;
          success_rate_pct: number;
          avg_time_seconds: number;
          avg_hints_used: number;
        };
      };
    };
    Functions: {
      submit_attempt: {
        Args: {
          p_learner_id: string;
          p_question_id: string;
          p_topic_id: string;
          p_is_correct: boolean;
          p_learner_answer: unknown;
          p_time_taken: number;
          p_hints_used: number;
          p_attempt_type: 'graded' | 'review' | 'self_practice';
          p_session_id?: string;
          p_session_question_index?: number;
        };
        Returns: void;
      };
      get_due_reviews: {
        Args: {
          p_learner_id: string;
          p_limit?: number;
        };
        Returns: {
          question_id: string;
          topic_id: string;
          stage: string;
          due_at: string;
        }[];
      };
      calculate_bece_readiness: {
        Args: {
          p_learner_id: string;
          p_subject_id: string;
        };
        Returns: number;
      };
      refresh_dashboard_views: {
        Args: Record<string, never>;
        Returns: void;
      };
    };
  };
}
