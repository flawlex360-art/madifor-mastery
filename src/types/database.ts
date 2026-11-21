// Madifor Mastery — Database Types matching Supabase PostgreSQL Schema

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
        Insert: {
          id?: string;
          name: string;
          invite_code?: string;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          name?: string;
          invite_code?: string;
          updated_at?: string;
        };
        Relationships: [];
      };
      teachers: {
        Row: {
          id: string;
          school_id: string | null;
          full_name: string;
          email: string;
          role: 'teacher' | 'school_admin';
          is_admin: boolean;
          status: 'active' | 'suspended';
          school_name: string | null;
          created_at: string;
        };
        Insert: {
          id: string;
          school_id?: string | null;
          full_name: string;
          email: string;
          role?: 'teacher' | 'school_admin';
          is_admin?: boolean;
          status?: 'active' | 'suspended';
          school_name?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          school_id?: string | null;
          full_name?: string;
          email?: string;
          role?: 'teacher' | 'school_admin';
          is_admin?: boolean;
          status?: 'active' | 'suspended';
          school_name?: string | null;
        };
        Relationships: [];
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
        Insert: {
          id?: string;
          teacher_id: string;
          school_id?: string | null;
          name: string;
          class_level: 'B7' | 'B8' | 'B9';
          class_code?: string;
          created_at?: string;
        };
        Update: {
          id?: string;
          teacher_id?: string;
          school_id?: string | null;
          name?: string;
          class_level?: 'B7' | 'B8' | 'B9';
        };
        Relationships: [];
      };
      learners: {
        Row: {
          id: string;
          class_id: string;
          school_id: string | null;
          display_name: string;
          learner_code: string;
          email: string | null;
          created_at: string;
        };
        Insert: {
          id: string;
          class_id: string;
          school_id?: string | null;
          display_name: string;
          learner_code: string;
          email?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          class_id?: string;
          school_id?: string | null;
          display_name?: string;
          learner_code?: string;
          email?: string | null;
        };
        Relationships: [];
      };
      subjects: {
        Row: {
          id: string;
          name: string;
          code: string;
          class_levels: string[];
          created_at: string;
        };
        Insert: {
          id?: string;
          name: string;
          code: string;
          class_levels?: string[];
          created_at?: string;
        };
        Update: {
          name?: string;
          code?: string;
          class_levels?: string[];
        };
        Relationships: [];
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
        Insert: {
          id?: string;
          subject_id: string;
          name: string;
          code: string;
          class_level: 'B7' | 'B8' | 'B9';
          sort_order?: number;
        };
        Update: {
          subject_id?: string;
          name?: string;
          code?: string;
          class_level?: 'B7' | 'B8' | 'B9';
          sort_order?: number;
        };
        Relationships: [];
      };
      sub_strands: {
        Row: {
          id: string;
          strand_id: string;
          name: string;
          code: string;
          sort_order: number;
        };
        Insert: {
          id?: string;
          strand_id: string;
          name: string;
          code: string;
          sort_order?: number;
        };
        Update: {
          strand_id?: string;
          name?: string;
          code?: string;
          sort_order?: number;
        };
        Relationships: [];
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
        Insert: {
          id?: string;
          sub_strand_id: string;
          name: string;
          code: string;
          class_level: 'B7' | 'B8' | 'B9';
          sort_order?: number;
          created_at?: string;
        };
        Update: {
          sub_strand_id?: string;
          name?: string;
          code?: string;
          class_level?: 'B7' | 'B8' | 'B9';
          sort_order?: number;
        };
        Relationships: [];
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
        Insert: {
          id?: string;
          topic_id: string;
          owner_teacher_id?: string | null;
          question_type: 'multiple_choice' | 'fill_in_blank' | 'diagram_label' | 'matching' | 'short_structured';
          stem: string;
          options?: unknown;
          correct_answer: unknown;
          explanation: string;
          hints?: string[] | null;
          difficulty?: 'easy' | 'core' | 'bece_level';
          blooms_level?: 'recall' | 'application' | 'analysis';
          diagram_url?: string | null;
          visibility?: 'shared' | 'private' | 'school';
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          topic_id?: string;
          owner_teacher_id?: string | null;
          question_type?: 'multiple_choice' | 'fill_in_blank' | 'diagram_label' | 'matching' | 'short_structured';
          stem?: string;
          options?: unknown;
          correct_answer?: unknown;
          explanation?: string;
          hints?: string[] | null;
          difficulty?: 'easy' | 'core' | 'bece_level';
          blooms_level?: 'recall' | 'application' | 'analysis';
          diagram_url?: string | null;
          visibility?: 'shared' | 'private' | 'school';
          updated_at?: string;
        };
        Relationships: [];
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
        Insert: {
          id?: string;
          learner_id: string;
          question_id: string;
          topic_id: string;
          is_correct: boolean;
          learner_answer?: unknown;
          time_taken_seconds?: number | null;
          hints_used?: number;
          attempt_type: 'graded' | 'review' | 'self_practice';
          session_id?: string | null;
          session_question_index?: number | null;
          created_at?: string;
        };
        Update: {
          is_correct?: boolean;
          learner_answer?: unknown;
          time_taken_seconds?: number | null;
          hints_used?: number;
        };
        Relationships: [];
      };
      review_queue: {
        Row: {
          id: string;
          learner_id: string;
          question_id: string;
          topic_id: string;
          stage: 'missed' | 'review_1' | 'review_2' | 'review_3' | 'retained';
          due_at: string | null;
          added_at: string;
          last_reviewed_at: string | null;
        };
        Insert: {
          id?: string;
          learner_id: string;
          question_id: string;
          topic_id: string;
          stage?: 'missed' | 'review_1' | 'review_2' | 'review_3' | 'retained';
          due_at?: string | null;
          added_at?: string;
          last_reviewed_at?: string | null;
        };
        Update: {
          stage?: 'missed' | 'review_1' | 'review_2' | 'review_3' | 'retained';
          due_at?: string | null;
          last_reviewed_at?: string | null;
        };
        Relationships: [];
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
        Insert: {
          id?: string;
          learner_id: string;
          topic_id: string;
          first_pass_correct?: number;
          first_pass_total?: number;
          first_pass_pct?: number;
          first_pass_mastered?: boolean;
          retained_mastered?: boolean;
          retained_at?: string | null;
          status?: 'not_started' | 'in_progress' | 'first_pass_mastered' | 'retained_mastered';
          last_updated?: string;
        };
        Update: {
          first_pass_correct?: number;
          first_pass_total?: number;
          first_pass_pct?: number;
          first_pass_mastered?: boolean;
          retained_mastered?: boolean;
          retained_at?: string | null;
          status?: 'not_started' | 'in_progress' | 'first_pass_mastered' | 'retained_mastered';
          last_updated?: string;
        };
        Relationships: [];
      };
      mastery_history: {
        Row: {
          id: string;
          learner_id: string;
          topic_id: string;
          first_pass_pct: number;
          status: string;
          recorded_at: string;
        };
        Insert: {
          id?: string;
          learner_id: string;
          topic_id: string;
          first_pass_pct: number;
          status: string;
          recorded_at?: string;
        };
        Update: {
          first_pass_pct?: number;
          status?: string;
        };
        Relationships: [];
      };
      class_subjects: {
        Row: {
          id: string;
          class_id: string;
          subject_id: string;
          enrolled_at: string;
        };
        Insert: {
          id?: string;
          class_id: string;
          subject_id: string;
          enrolled_at?: string;
        };
        Update: {
          class_id?: string;
          subject_id?: string;
        };
        Relationships: [];
      };
      self_practice_sessions: {
        Row: {
          id: string;
          learner_id: string;
          topic_id: string;
          practice_class_level: 'B7' | 'B8' | 'B9' | null;
          questions_attempted: number;
          questions_correct: number;
          started_at: string;
          ended_at: string | null;
        };
        Insert: {
          id?: string;
          learner_id: string;
          topic_id: string;
          practice_class_level?: 'B7' | 'B8' | 'B9' | null;
          questions_attempted?: number;
          questions_correct?: number;
          started_at?: string;
          ended_at?: string | null;
        };
        Update: {
          questions_attempted?: number;
          questions_correct?: number;
          ended_at?: string | null;
        };
        Relationships: [];
      };
      learner_abilities: {
        Row: {
          id: string;
          learner_id: string;
          subject_id: string;
          theta: number;
          total_answered: number;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          learner_id: string;
          subject_id: string;
          theta?: number;
          total_answered?: number;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          theta?: number;
          total_answered?: number;
          updated_at?: string;
        };
        Relationships: [];
      };
      question_parameters: {
        Row: {
          question_id: string;
          difficulty: number;
          discrimination: number;
          guessing: number;
          total_attempts: number;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          question_id: string;
          difficulty?: number;
          discrimination?: number;
          guessing?: number;
          total_attempts?: number;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          difficulty?: number;
          discrimination?: number;
          guessing?: number;
          total_attempts?: number;
          updated_at?: string;
        };
        Relationships: [];
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
          avg_first_pass_pct: number | null;
          first_pass_mastered_count: number;
          retained_mastered_count: number;
          total_learners: number;
        };
        Relationships: [];
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
          overall_avg_pct: number | null;
          self_practice_sessions_week: number;
        };
        Relationships: [];
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
          success_rate_pct: number | null;
          avg_time_seconds: number | null;
          avg_hints_used: number | null;
        };
        Relationships: [];
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
          p_session_id?: string | null;
          p_session_question_index?: number | null;
        };
        Returns: undefined;
      };
      get_due_reviews: {
        Args: { p_learner_id: string; p_limit?: number };
        Returns: {
          question_id: string;
          topic_id: string;
          stage: string;
          due_at: string | null;
        }[];
      };
      calculate_bece_readiness: {
        Args: { p_learner_id: string; p_subject_id: string };
        Returns: number;
      };
      get_learner_homepage_data: {
        Args: { p_learner_id: string; p_class_level: string };
        Returns: unknown;
      };
      get_adaptive_question: {
        Args: { p_learner_id: string; p_topic_id: string; p_exclude_ids?: string[] };
        Returns: Database['public']['Tables']['questions']['Row'][];
      };
      create_learner_account: {
        Args: { p_class_id: string; p_display_name: string; p_email: string; p_password: string };
        Returns: string;
      };
      update_learner_credentials: {
        Args: {
          p_learner_id: string;
          p_display_name?: string | null;
          p_email?: string | null;
          p_password?: string | null;
        };
        Returns: undefined;
      };
      delete_learner_account: {
        Args: { p_learner_id: string };
        Returns: undefined;
      };
      suspend_teacher_account: {
        Args: { p_teacher_id: string; p_status: 'active' | 'suspended' };
        Returns: undefined;
      };
      delete_teacher_account: {
        Args: { p_teacher_id: string };
        Returns: undefined;
      };
      refresh_dashboard_views: {
        Args: Record<string, never>;
        Returns: undefined;
      };
    };
    Enums: Record<string, never>;
    CompositeTypes: Record<string, never>;
  };
}
