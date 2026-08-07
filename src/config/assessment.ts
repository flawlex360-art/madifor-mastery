// Flawlex Mastery — Assessment Configuration
// Central config for mastery thresholds, review intervals, and session parameters.
// After pilot testing, tune these values without code changes.

export const ASSESSMENT_CONFIG = {
  // First-pass mastery: learner must get this % correct on first attempt
  firstPassMasteryThreshold: 0.80, // 80% = 8/10

  // Number of questions per topic assessment
  questionsPerTopic: 10,

  // How many review questions to interleave into each session
  reviewInterleaveCount: { min: 2, max: 4 },

  // Spaced repetition intervals (Leitner system)
  // Each stage advances on a correct review answer.
  // A wrong answer at ANY stage resets to 'missed'.
  reviewIntervals: {
    missed_to_review1: 2,    // days
    review1_to_review2: 5,
    review2_to_review3: 14,
    review3_to_retained: null, // retained = removed from active queue
  },

  // Ordered review stages
  reviewStages: ['missed', 'review_1', 'review_2', 'review_3', 'retained'] as const,

  // Self-practice deliberately does NOT count toward mastery
  // (prevents gaming the retained-mastery metric)
  selfPracticeDoesNotCountForMastery: true,

  // BECE Readiness Score weighting
  beceWeights: {
    retained: 0.7,
    firstPass: 0.3,
  },

  // Decline detection: flag if score drops by this % between last 2 sessions
  declineThresholdPct: 10,

  // Overdue review alert: flag if due_at is this many days in the past
  overdueReviewDays: 3,
} as const;

// Type for review stages
export type ReviewStage = typeof ASSESSMENT_CONFIG.reviewStages[number];

// Type for attempt types
export type AttemptType = 'graded' | 'review' | 'self_practice';

// Type for mastery status
export type MasteryStatus = 'not_started' | 'in_progress' | 'first_pass_mastered' | 'retained_mastered';

// Type for question difficulty
export type QuestionDifficulty = 'easy' | 'core' | 'bece_level';

// Type for Bloom's taxonomy level
export type BloomsLevel = 'recall' | 'application' | 'analysis';

// Type for question types
export type QuestionType = 'multiple_choice' | 'fill_in_blank' | 'diagram_label' | 'matching' | 'short_structured';
