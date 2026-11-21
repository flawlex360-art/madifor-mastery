import { create } from 'zustand';
import type { Question } from '@/types/curriculum';
import {
  submitAttempt,
  getQuestionsForAssessment,
  getReviewQuestions,
  getInitialQuestionForAssessment,
  getRemainingQuestionsForAssessment,
  getAdaptiveQuestion,
} from '@/api/assessment';
import { createVoluntaryPracticeSession, endVoluntaryPracticeSession, getTopicClassLevel } from '@/api/voluntaryPractice';
import { ASSESSMENT_CONFIG } from '@/config/assessment';
import { generateUUID } from '@/lib/utils';
import { gradeClientAnswer } from '@/lib/grading';
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

type SessionStatus = 'idle' | 'loading' | 'in_progress' | 'feedback' | 'complete' | 'empty' | 'error';

interface AssessmentState {
  sessionId: string | null;
  learnerId: string | null;
  topicId: string | null;
  questions: AssessmentQuestion[];
  currentIndex: number;
  answers: Map<string, AnswerRecord>;
  status: SessionStatus;
  errorMessage: string | null;
  startedAt: Date | null;
  questionStartTime: number;

  // Practice mode
  practiceMode: boolean;
  practiceSessionId: string | null;
  adaptiveExhausted: boolean;

  // Review mode
  isReviewMode: boolean;
  isBackgroundLoading: boolean;
  isFetchingNext: boolean;
  lastAttemptPromise: Promise<void> | null;

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
  startReviewSession: (learnerId: string) => Promise<void>;
  selectAnswer: (answer: number | string) => void;
  submitAnswer: () => Promise<void>;
  revealHint: () => void;
  nextQuestion: () => Promise<void>;
  reset: () => void;

  // Computed
  score: () => { correct: number; total: number; pct: number };
  isGradedQuestion: () => boolean;
}

function shuffleLocal<T>(items: T[]): T[] {
  const arr = [...items];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

export const useAssessmentStore = create<AssessmentState>((set, get) => ({
  sessionId: null,
  learnerId: null,
  topicId: null,
  questions: [],
  currentIndex: 0,
  answers: new Map(),
  status: 'idle',
  errorMessage: null,
  startedAt: null,
  questionStartTime: Date.now(),
  practiceMode: false,
  practiceSessionId: null,
  adaptiveExhausted: false,
  isReviewMode: false,
  isBackgroundLoading: false,
  isFetchingNext: false,
  lastAttemptPromise: null,
  selectedAnswer: null,
  isSubmitted: false,
  isCorrect: null,
  hintsRevealed: 0,
  pendingAttemptCount: 0,

  prefetchTopic: async (topicId: string) => {
    try {
      const cached = await getCachedQuestionsByTopic(topicId);
      if (cached.length >= ASSESSMENT_CONFIG.questionsPerTopic) return;

      if (isOnline()) {
        const q = await getQuestionsForAssessment(topicId, ASSESSMENT_CONFIG.questionsPerTopic);
        if (q.length > 0) {
          await cacheQuestions(q as unknown as CachedQuestion[]);
        }
      }
    } catch {
      // Prefetch failures are non-fatal
    }
  },

  startAssessment: async (learnerId: string, topicId: string, practiceMode = false) => {
    const sessionId = generateUUID();
    set({
      sessionId,
      status: 'loading',
      errorMessage: null,
      learnerId,
      topicId,
      practiceMode,
      practiceSessionId: null,
      adaptiveExhausted: false,
      isReviewMode: false,
      isBackgroundLoading: true,
      isFetchingNext: false,
      lastAttemptPromise: null,
      questions: [],
      answers: new Map(),
      currentIndex: 0,
      selectedAnswer: null,
      isSubmitted: false,
      isCorrect: null,
      hintsRevealed: 0,
    });

    try {
      let practiceSessionId: string | null = null;
      if (practiceMode && isOnline()) {
        try {
          const classLevel = await getTopicClassLevel(topicId);
          practiceSessionId = await createVoluntaryPracticeSession({
            learner_id: learnerId,
            topic_id: topicId,
            practice_class_level: classLevel || 'B7',
          });
        } catch {
          practiceSessionId = null;
        }
      }

      if (get().sessionId !== sessionId) return;

      let topicQuestions: CachedQuestion[] = [];
      let initialQuestion: Question | null = null;

      if (practiceMode && isOnline()) {
        initialQuestion = await getAdaptiveQuestion(learnerId, topicId, []);
      }

      if (!initialQuestion) {
        topicQuestions = shuffleLocal(await getCachedQuestionsByTopic(topicId));
        if (topicQuestions.length > 0) {
          initialQuestion = topicQuestions[0] as unknown as Question;
        } else if (isOnline()) {
          const initialBatch = await getInitialQuestionForAssessment(topicId);
          if (initialBatch.length > 0) {
            initialQuestion = initialBatch[0];
          }
        }
      }

      if (get().sessionId !== sessionId) return;

      if (!initialQuestion) {
        set({ status: 'empty', isBackgroundLoading: false, errorMessage: null });
        return;
      }

      const firstAssessmentQuestion: AssessmentQuestion = { ...initialQuestion, is_review: false };

      set({
        sessionId,
        practiceSessionId,
        isReviewMode: false,
        questions: [firstAssessmentQuestion],
        currentIndex: 0,
        answers: new Map(),
        status: 'in_progress',
        startedAt: new Date(),
        questionStartTime: Date.now(),
        selectedAnswer: null,
        isSubmitted: false,
        isCorrect: null,
        hintsRevealed: 0,
        isBackgroundLoading: !practiceMode,
      });

      if (practiceMode && isOnline()) {
        return;
      }

      const loadBackground = async () => {
        try {
          const maxAdditional = ASSESSMENT_CONFIG.questionsPerTopic - 1;
          let remainingTopicQuestions: Question[] = [];

          if (topicQuestions.length >= ASSESSMENT_CONFIG.questionsPerTopic) {
            remainingTopicQuestions = topicQuestions.slice(1, ASSESSMENT_CONFIG.questionsPerTopic) as unknown as Question[];
          } else if (isOnline()) {
            remainingTopicQuestions = await getRemainingQuestionsForAssessment(
              topicId,
              maxAdditional,
              initialQuestion!.id
            );
          } else if (topicQuestions.length > 1) {
            remainingTopicQuestions = topicQuestions.slice(1, ASSESSMENT_CONFIG.questionsPerTopic) as unknown as Question[];
          }

          let reviewQuestions: Record<string, unknown>[] = [];
          if (!practiceMode && isOnline()) {
            try {
              reviewQuestions = await getReviewQuestions(learnerId, ASSESSMENT_CONFIG.reviewInterleaveCount.max);
            } catch {
              reviewQuestions = [];
            }
          }

          if (get().sessionId !== sessionId) return;

          const seenIds = new Set(get().questions.map((q) => q.id));
          const additionalQuestions: AssessmentQuestion[] = [];

          for (const q of remainingTopicQuestions) {
            if (!seenIds.has(q.id)) {
              seenIds.add(q.id);
              additionalQuestions.push({ ...q, is_review: false });
            }
          }

          for (const rq of reviewQuestions) {
            const rqId = rq.id as string;
            if (!seenIds.has(rqId)) {
              seenIds.add(rqId);
              additionalQuestions.push({
                ...(rq as unknown as Question),
                is_review: true,
                review_topic_id: rq.review_topic_id as string | undefined,
                review_stage: rq.review_stage as string | undefined,
                topic_id: (rq.review_topic_id as string) || (rq.topic_id as string),
              });
            }
          }

          if (additionalQuestions.length > 0) {
            const shuffledAdditional = shuffleLocal(additionalQuestions);
            set((state) => {
              if (state.sessionId !== sessionId) return state;
              return {
                questions: [...state.questions, ...shuffledAdditional],
                isBackgroundLoading: false,
              };
            });
          } else {
            set((state) => (state.sessionId === sessionId ? { isBackgroundLoading: false } : state));
          }

          if (isOnline()) {
            const toCache = [initialQuestion!, ...remainingTopicQuestions];
            if (toCache.length > 0) {
              cacheQuestions(toCache as unknown as CachedQuestion[]).catch(() => {});
            }
          }
        } catch (e) {
          console.error('Background load failed', e);
          if (get().sessionId === sessionId) {
            set({ isBackgroundLoading: false });
          }
        }
      };

      loadBackground();
    } catch (err) {
      if (get().sessionId === sessionId) {
        set({
          status: 'error',
          isBackgroundLoading: false,
          errorMessage: err instanceof Error ? err.message : 'Unable to start assessment.',
        });
      }
    }
  },

  startReviewSession: async (learnerId: string) => {
    const sessionId = generateUUID();
    set({
      sessionId,
      status: 'loading',
      errorMessage: null,
      learnerId,
      topicId: null,
      practiceMode: false,
      practiceSessionId: null,
      adaptiveExhausted: false,
      isReviewMode: true,
      isBackgroundLoading: false,
      isFetchingNext: false,
      lastAttemptPromise: null,
      questions: [],
      answers: new Map(),
      currentIndex: 0,
      selectedAnswer: null,
      isSubmitted: false,
      isCorrect: null,
      hintsRevealed: 0,
    });

    try {
      let reviewQuestions: Record<string, unknown>[] = [];
      if (isOnline()) {
        reviewQuestions = await getReviewQuestions(learnerId, 15);
      }

      if (get().sessionId !== sessionId) return;

      const allQuestions: AssessmentQuestion[] = shuffleLocal(
        reviewQuestions.map((q) => ({
          ...(q as unknown as Question),
          is_review: true,
          review_topic_id: q.review_topic_id as string | undefined,
          review_stage: q.review_stage as string | undefined,
          topic_id: (q.review_topic_id as string) || (q.topic_id as string),
        }))
      );

      if (allQuestions.length === 0) {
        set({ status: 'empty', errorMessage: null });
        return;
      }

      set({
        sessionId,
        isReviewMode: true,
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
      if (get().sessionId === sessionId) {
        set({
          status: 'error',
          errorMessage: err instanceof Error ? err.message : 'Unable to load review session.',
        });
      }
    }
  },

  selectAnswer: (answer) => {
    if (get().isSubmitted) return;
    set({ selectedAnswer: answer });
  },

  submitAnswer: async () => {
    const state = get();
    if (state.selectedAnswer === null || state.isSubmitted) return;

    const question = state.questions[state.currentIndex];
    if (!question) return;

    if (question.question_type === 'fill_in_blank' && String(state.selectedAnswer).trim().length === 0) {
      return;
    }

    set({ isSubmitted: true });

    const timeTaken = Math.max(0, Math.round((Date.now() - state.questionStartTime) / 1000));
    const isCorrect = gradeClientAnswer(question, state.selectedAnswer);

    const record: AnswerRecord = {
      answer: state.selectedAnswer,
      is_correct: isCorrect,
      time_taken: timeTaken,
      hints_used: state.hintsRevealed,
    };

    const newAnswers = new Map(state.answers);
    newAnswers.set(question.id, record);

    const attemptType = state.practiceMode
      ? 'self_practice'
      : question.is_review
      ? 'review'
      : 'graded';

    const attemptData = {
      learner_id: state.learnerId!,
      question_id: question.id,
      topic_id: question.is_review && question.review_topic_id ? question.review_topic_id : question.topic_id,
      is_correct: isCorrect,
      learner_answer: state.selectedAnswer,
      time_taken: timeTaken,
      hints_used: state.hintsRevealed,
      attempt_type: attemptType,
      session_id: state.sessionId!,
      session_question_index: state.currentIndex,
    };

    let attemptPromise: Promise<void> | null = null;
    if (isOnline()) {
      attemptPromise = submitAttempt(attemptData).catch(async () => {
        await savePendingAttempt({
          ...attemptData,
          id: generateOfflineId(),
          created_at: new Date().toISOString(),
        });
        set((s) => ({ pendingAttemptCount: s.pendingAttemptCount + 1 }));
      });
    } else {
      savePendingAttempt({
        ...attemptData,
        id: generateOfflineId(),
        created_at: new Date().toISOString(),
      })
        .then(() => {
          set((s) => ({ pendingAttemptCount: s.pendingAttemptCount + 1 }));
        })
        .catch(() => {});
    }

    set({
      answers: newAnswers,
      isSubmitted: true,
      isCorrect,
      status: 'feedback',
      lastAttemptPromise: attemptPromise,
    });

    const stateKey = `${state.learnerId}:${state.topicId ?? 'review'}`;
    saveAssessmentState({
      id: stateKey,
      session_id: state.sessionId!,
      learner_id: state.learnerId!,
      topic_id: state.topicId,
      questions: state.questions as unknown as Record<string, unknown>[],
      answers: Array.from(newAnswers.entries()) as unknown as [string, Record<string, unknown>][],
      current_index: state.currentIndex,
      practice_mode: state.practiceMode,
      is_review_mode: state.isReviewMode,
      saved_at: new Date().toISOString(),
    }).catch(() => {});
  },

  revealHint: () => {
    const state = get();
    const question = state.questions[state.currentIndex];
    const maxHints = question?.hints?.length ?? 0;
    if (state.hintsRevealed < maxHints) {
      set({ hintsRevealed: state.hintsRevealed + 1 });
    }
  },

  nextQuestion: async () => {
    const state = get();
    if (state.isFetchingNext) return;
    set({ isFetchingNext: true });

    try {
      const nextIdx = state.currentIndex + 1;
      const targetLength = ASSESSMENT_CONFIG.questionsPerTopic;

      if (
        nextIdx >= state.questions.length &&
        state.practiceMode &&
        isOnline() &&
        !state.adaptiveExhausted &&
        state.questions.length < targetLength
      ) {
        set({ isBackgroundLoading: true });
        try {
          if (state.lastAttemptPromise) {
            await state.lastAttemptPromise;
          }
          const excludeIds = get().questions.map((q) => q.id);
          const nextQ = await getAdaptiveQuestion(state.learnerId!, state.topicId!, excludeIds);
          if (nextQ && !excludeIds.includes(nextQ.id)) {
            set((s) => ({
              questions: [...s.questions, { ...nextQ, is_review: false }],
              isBackgroundLoading: false,
            }));
          } else {
            set({ isBackgroundLoading: false, adaptiveExhausted: true });
          }
        } catch (e) {
          console.error('Failed to fetch adaptive question', e);
          set({ isBackgroundLoading: false, adaptiveExhausted: true });
        }
      }

      const freshState = get();

      if (nextIdx >= freshState.questions.length) {
        if (freshState.isBackgroundLoading) {
          return;
        }
        if (freshState.practiceMode && freshState.practiceSessionId && isOnline()) {
          const s = freshState.score();
          endVoluntaryPracticeSession(freshState.practiceSessionId, s.total, s.correct).catch(() => {});
        }
        if (freshState.learnerId) {
          const stateKey = `${freshState.learnerId}:${freshState.topicId ?? 'review'}`;
          clearAssessmentState(stateKey).catch(() => {});
        }
        set({ status: 'complete', practiceSessionId: null });
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
    } finally {
      set({ isFetchingNext: false });
    }
  },

  reset: () => {
    const state = get();
    if (state.practiceMode && state.practiceSessionId && isOnline()) {
      const s = state.score();
      endVoluntaryPracticeSession(state.practiceSessionId, s.total, s.correct).catch(() => {});
    }
    if (state.learnerId) {
      const stateKey = `${state.learnerId}:${state.topicId ?? 'review'}`;
      clearAssessmentState(stateKey).catch(() => {});
    }

    set({
      sessionId: null,
      learnerId: null,
      topicId: null,
      questions: [],
      currentIndex: 0,
      answers: new Map(),
      status: 'idle',
      errorMessage: null,
      startedAt: null,
      questionStartTime: Date.now(),
      practiceMode: false,
      practiceSessionId: null,
      adaptiveExhausted: false,
      isReviewMode: false,
      isBackgroundLoading: false,
      isFetchingNext: false,
      lastAttemptPromise: null,
      selectedAnswer: null,
      isSubmitted: false,
      isCorrect: null,
      hintsRevealed: 0,
    });
  },

  score: () => {
    const { answers, questions, isReviewMode } = get();
    let correct = 0;
    let total = 0;

    if (isReviewMode) {
      for (const record of answers.values()) {
        total++;
        if (record.is_correct) correct++;
      }
    } else {
      const reviewIds = new Set(questions.filter((q) => q.is_review).map((q) => q.id));
      for (const [qId, record] of answers.entries()) {
        if (!reviewIds.has(qId)) {
          total++;
          if (record.is_correct) correct++;
        }
      }
    }

    return { correct, total, pct: total > 0 ? Math.round((correct / total) * 100) : 0 };
  },

  isGradedQuestion: () => {
    const state = get();
    const question = state.questions[state.currentIndex];
    return question ? !question.is_review : false;
  },
}));
