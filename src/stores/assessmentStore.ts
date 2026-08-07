import { create } from 'zustand';
import type { Question } from '@/types/curriculum';
import { submitAttempt, getQuestionsForAssessment, getReviewQuestions } from '@/api/assessment';
import { createVoluntaryPracticeSession, endVoluntaryPracticeSession, getTopicClassLevel } from '@/api/voluntaryPractice';
import { ASSESSMENT_CONFIG } from '@/config/assessment';
import { generateUUID } from '@/lib/utils';
import {
  savePendingAttempt,
  cacheQuestions,
  getCachedQuestionsByTopic,
  saveAssessmentState,
  clearAssessmentState,
  generateOfflineId,
  isOnline,
  type CachedQuestion,
} from '@/lib/offline';

interface AnswerRecord {
  answer: number | string;
  is_correct: boolean;
  time_taken: number;
  hints_used: number;
}

export interface AssessmentQuestion extends Question {
  is_review: boolean;
  review_topic_id?: string;
  review_stage?: string;
}

interface AssessmentState {
  // Session
  sessionId: string | null;
  learnerId: string | null;
  topicId: string | null;
  questions: AssessmentQuestion[];
  currentIndex: number;
  answers: Map<string, AnswerRecord>;
  status: 'idle' | 'loading' | 'in_progress' | 'feedback' | 'complete';
  startedAt: Date | null;
  questionStartTime: number;

  // Practice mode
  practiceMode: boolean;
  practiceSessionId: string | null;

  // Current question state
  selectedAnswer: number | string | null;
  isSubmitted: boolean;
  isCorrect: boolean | null;
  hintsRevealed: number;

  // Offline tracking
  pendingAttemptCount: number;

  // Actions
  prefetchTopic: (topicId: string) => Promise<void>;
  startAssessment: (learnerId: string, topicId: string, practiceMode?: boolean) => Promise<void>;
  selectAnswer: (answer: number | string) => void;
  submitAnswer: () => Promise<void>;
  revealHint: () => void;
  nextQuestion: () => void;
  reset: () => void;

  // Computed
  score: () => { correct: number; total: number; pct: number };
  isGradedQuestion: () => boolean;
}

export const useAssessmentStore = create<AssessmentState>((set, get) => ({
  sessionId: null,
  learnerId: null,
  topicId: null,
  questions: [],
  currentIndex: 0,
  answers: new Map(),
  status: 'idle',
  startedAt: null,
  questionStartTime: Date.now(),
  practiceMode: false,
  practiceSessionId: null,
  selectedAnswer: null,
  isSubmitted: false,
  isCorrect: null,
  hintsRevealed: 0,
  pendingAttemptCount: 0,

  prefetchTopic: async (topicId: string) => {
    // Check if we already have questions cached
    const cached = await getCachedQuestionsByTopic(topicId);
    if (cached.length >= ASSESSMENT_CONFIG.questionsPerTopic) return;
    
    // Fetch and cache in the background
    if (isOnline()) {
      try {
        const q = await getQuestionsForAssessment(topicId, ASSESSMENT_CONFIG.questionsPerTopic);
        if (q.length > 0) {
          await cacheQuestions(q as CachedQuestion[]);
        }
      } catch (e) {
        console.warn('Prefetch failed:', e);
      }
    }
  },

  startAssessment: async (learnerId: string, topicId: string, practiceMode = false) => {
    set({ status: 'loading', learnerId, topicId, practiceMode });
    try {
      const sessionId = generateUUID();

      // In practice mode, create a self-practice session
      let practiceSessionId: string | null = null;
      if (practiceMode && isOnline()) {
        const classLevel = await getTopicClassLevel(topicId);
        practiceSessionId = await createVoluntaryPracticeSession({
          learner_id: learnerId,
          topic_id: topicId,
          practice_class_level: classLevel || 'B7',
        });
      }

      // Fetch topic questions (Stale-While-Revalidate pattern)
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      let topicQuestions: any[] = await getCachedQuestionsByTopic(topicId);
      
      // If cache is empty or incomplete, fetch from network immediately
      if (topicQuestions.length === 0 && isOnline()) {
        topicQuestions = await getQuestionsForAssessment(
          topicId,
          ASSESSMENT_CONFIG.questionsPerTopic
        );
        if (topicQuestions.length > 0) {
          await cacheQuestions(topicQuestions as CachedQuestion[]);
        }
      } else if (isOnline()) {
        // If we used cache, kick off a silent revalidation in the background
        getQuestionsForAssessment(topicId, ASSESSMENT_CONFIG.questionsPerTopic)
          .then((q) => {
             if (q.length > 0) cacheQuestions(q as CachedQuestion[]);
          })
          .catch(() => {}); // ignore network errors for silent background fetch
      }

      // Only fetch review questions in non-practice mode and online
      let reviewQuestions: Record<string, unknown>[] = [];
      if (!practiceMode && isOnline()) {
        reviewQuestions = await getReviewQuestions(
          learnerId,
          ASSESSMENT_CONFIG.reviewInterleaveCount.max
        );
      }

      // Combine and shuffle
      const allQuestions: AssessmentQuestion[] = [
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        ...topicQuestions.map((q: any) => ({ ...q, is_review: false })),
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        ...reviewQuestions.map((q: any) => ({
          ...q,
          is_review: true,
          topic_id: q.review_topic_id,
        })),
      ];

      if (allQuestions.length === 0) {
        set({ status: 'idle' });
        return;
      }

      // Shuffle
      for (let i = allQuestions.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [allQuestions[i], allQuestions[j]] = [allQuestions[j], allQuestions[i]];
      }

      set({
        sessionId,
        practiceSessionId,
        questions: allQuestions,
        currentIndex: 0,
        answers: new Map(),
        status: 'in_progress',
        startedAt: new Date(),
        questionStartTime: Date.now(),
        selectedAnswer: null,
        isSubmitted: false,
        isCorrect: null,
        hintsRevealed: 0,
      });
    } catch (err) {
      set({ status: 'idle' });
      throw err;
    }
  },

  selectAnswer: (answer) => {
    if (get().isSubmitted) return;
    set({ selectedAnswer: answer });
  },

  submitAnswer: async () => {
    const state = get();
    if (state.selectedAnswer === null || state.isSubmitted) return;

    // M-1: Set isSubmitted immediately to prevent double-submit
    set({ isSubmitted: true });

    const question = state.questions[state.currentIndex];
    const correctAnswer = question.correct_answer;
    const timeTaken = Math.round((Date.now() - state.questionStartTime) / 1000);

    // C-3 + H-1: Normalize answer comparison
    // MCQ: compare as numbers (JSONB may deserialize as string or number)
    // Fill-in-blank: case-insensitive, trimmed comparison
    let isCorrect: boolean;
    if (question.question_type === 'multiple_choice') {
      isCorrect = Number(state.selectedAnswer) === Number(correctAnswer);
    } else if (question.question_type === 'fill_in_blank') {
      const normalize = (str: string) => str.toLowerCase().trim().replace(/\s+/g, ' ');
      const selected = normalize(String(state.selectedAnswer));
      const correctStr = String(correctAnswer);
      
      // Allow multiple acceptable answers separated by comma or pipe
      const acceptableAnswers = correctStr.split(/[,|]/).map(normalize);
      
      const selectedNum = parseFloat(selected);
      
      if (!isNaN(selectedNum)) {
        // If they typed a number, check if it matches any of the acceptable answers numerically
        isCorrect = acceptableAnswers.some(ans => {
          const correctNum = parseFloat(ans);
          return !isNaN(correctNum) && Math.abs(selectedNum - correctNum) < 0.01;
        });
      } else {
        // Otherwise, exact string match against any acceptable answer
        isCorrect = acceptableAnswers.includes(selected);
      }
    } else {
      isCorrect = state.selectedAnswer === correctAnswer;
    }

    const record: AnswerRecord = {
      answer: state.selectedAnswer,
      is_correct: isCorrect,
      time_taken: timeTaken,
      hints_used: state.hintsRevealed,
    };

    const newAnswers = new Map(state.answers);
    newAnswers.set(question.id, record);

    // Determine attempt type: self_practice for practice mode, graded/review otherwise
    const attemptType = state.practiceMode
      ? 'self_practice'
      : (question.is_review ? 'review' : 'graded');

    const attemptData = {
      learner_id: state.learnerId!,
      question_id: question.id,
      topic_id: question.is_review ? question.review_topic_id! : question.topic_id,
      is_correct: isCorrect,
      learner_answer: state.selectedAnswer,
      time_taken: timeTaken,
      hints_used: state.hintsRevealed,
      attempt_type: attemptType,
      session_id: state.sessionId!,
      session_question_index: state.currentIndex,
    };

    // OPTIMISTIC UI UPDATE: set state immediately
    set({
      answers: newAnswers,
      isSubmitted: true,
      isCorrect,
      status: 'feedback',
    });

    if (isOnline()) {
      // Fire and forget
      submitAttempt(attemptData).catch(async () => {
        // If submit fails, queue for later
        await savePendingAttempt({
          ...attemptData,
          id: generateOfflineId(),
          created_at: new Date().toISOString(),
        });
        set((s) => ({ pendingAttemptCount: s.pendingAttemptCount + 1 }));
      });
    } else {
      // Offline — save to IndexedDB queue
      savePendingAttempt({
        ...attemptData,
        id: generateOfflineId(),
        created_at: new Date().toISOString(),
      }).then(() => {
        set((s) => ({ pendingAttemptCount: s.pendingAttemptCount + 1 }));
      });
    }

    // Save assessment state for refresh recovery
    await saveAssessmentState({
      id: `${state.learnerId}:${state.topicId}`,
      session_id: state.sessionId!,
      learner_id: state.learnerId!,
      topic_id: state.topicId!,
      questions: state.questions as unknown as Record<string, unknown>[],
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      answers: Array.from(newAnswers.entries()) as any,
      current_index: state.currentIndex,
      practice_mode: state.practiceMode,
      saved_at: new Date().toISOString(),
    });

  },

  revealHint: () => {
    const state = get();
    const question = state.questions[state.currentIndex];
    const maxHints = question.hints?.length ?? 0;
    if (state.hintsRevealed < maxHints) {
      set({ hintsRevealed: state.hintsRevealed + 1 });
    }
  },

  nextQuestion: async () => {
    const state = get();
    const nextIdx = state.currentIndex + 1;
    if (nextIdx >= state.questions.length) {
      // Session complete — if practice mode, end the practice session
      if (state.practiceMode && state.practiceSessionId && isOnline()) {
        const s = state.score();
        await endVoluntaryPracticeSession(state.practiceSessionId, s.total, s.correct);
      }
      // Clear saved assessment state
      if (state.learnerId && state.topicId) {
        await clearAssessmentState(`${state.learnerId}:${state.topicId}`);
      }
      set({ status: 'complete' });
    } else {
      set({
        currentIndex: nextIdx,
        selectedAnswer: null,
        isSubmitted: false,
        isCorrect: null,
        hintsRevealed: 0,
        questionStartTime: Date.now(),
        status: 'in_progress',
      });
    }
  },

  reset: () => {
    set({
      sessionId: null,
      learnerId: null,
      topicId: null,
      questions: [],
      currentIndex: 0,
      answers: new Map(),
      status: 'idle',
      startedAt: null,
      questionStartTime: Date.now(),
      practiceMode: false,
      practiceSessionId: null,
      selectedAnswer: null,
      isSubmitted: false,
      isCorrect: null,
      hintsRevealed: 0,
    });
  },

  score: () => {
    const answers = get().answers;
    let correct = 0;
    for (const record of answers.values()) {
      if (record.is_correct) correct++;
    }
    const total = answers.size;
    return { correct, total, pct: total > 0 ? Math.round((correct / total) * 100) : 0 };
  },

  isGradedQuestion: () => {
    const state = get();
    const question = state.questions[state.currentIndex];
    return question ? !question.is_review : false;
  },
}));
