import { useAssessmentStore } from '@/stores/assessmentStore';
import QuestionCard from './QuestionCard';
import FeedbackPanel from './FeedbackPanel';
import AssessmentSummary from './AssessmentSummary';
import { AssessmentSkeleton } from './AssessmentSkeleton';
import Button from '@/components/ui/Button';
import { ASSESSMENT_CONFIG } from '@/config/assessment';
import { X, AlertCircle, BookOpen, Lightbulb, RotateCcw } from 'lucide-react';

interface AssessmentSessionProps {
  topicName: string;
  onRetry?: () => void;
  onHome: () => void;
}

export default function AssessmentSession({ topicName, onRetry, onHome }: AssessmentSessionProps) {
  const {
    questions,
    currentIndex,
    status,
    errorMessage,
    selectedAnswer,
    isSubmitted,
    isCorrect,
    hintsRevealed,
    selectAnswer,
    submitAnswer,
    revealHint,
    nextQuestion,
    score,
    startAssessment,
    startReviewSession,
    learnerId,
    topicId,
    reset,
    practiceMode,
    isReviewMode,
    adaptiveExhausted,
    answers,
    isBackgroundLoading,
    isFetchingNext,
  } = useAssessmentStore();

  if (status === 'loading') {
    return (
      <div className="py-8">
        <AssessmentSkeleton />
      </div>
    );
  }

  if (status === 'error') {
    return (
      <div className="max-w-md mx-auto text-center py-16 px-4">
        <div className="w-14 h-14 mx-auto rounded-full bg-red-50 flex items-center justify-center mb-4">
          <AlertCircle className="w-7 h-7 text-red-500" />
        </div>
        <h2 className="text-xl font-bold text-navy-900 mb-2">Unable to load questions</h2>
        <p className="text-sm text-slate-500 mb-6">
          {errorMessage || 'Check your connection and try again.'}
        </p>
        <div className="flex gap-3 justify-center">
          {onRetry && (
            <Button variant="outline" onClick={onRetry}>
              <RotateCcw className="w-4 h-4 mr-2" />
              Try Again
            </Button>
          )}
          <Button onClick={onHome}>Back to Home</Button>
        </div>
      </div>
    );
  }

  if (status === 'empty') {
    return (
      <div className="max-w-md mx-auto text-center py-16 px-4">
        <div className="w-14 h-14 mx-auto rounded-full bg-navy-50 flex items-center justify-center mb-4">
          <BookOpen className="w-7 h-7 text-navy-700" />
        </div>
        <h2 className="text-xl font-bold text-navy-900 mb-2">
          {isReviewMode ? 'No Reviews Due Right Now' : 'No Questions Available Yet'}
        </h2>
        <p className="text-sm text-slate-500 mb-6">
          {isReviewMode
            ? 'You are all caught up! Come back later when your spaced-repetition items become due.'
            : 'There are currently no questions available offline or in this topic.'}
        </p>
        <Button onClick={onHome}>Back to Home</Button>
      </div>
    );
  }

  if (status === 'complete') {
    const summaryQuestions = questions
      .filter((q) => answers.has(q.id))
      .map((q) => ({
        id: q.id,
        stem: q.stem,
        is_correct: answers.get(q.id)?.is_correct ?? false,
        is_review: q.is_review,
      }));

    return (
      <AssessmentSummary
        score={score()}
        topicName={topicName}
        isPractice={practiceMode}
        isReviewMode={isReviewMode}
        questions={summaryQuestions}
        onRetry={() => {
          const prevLearnerId = learnerId;
          const prevTopicId = topicId;
          const prevPractice = practiceMode;
          const prevReview = isReviewMode;
          reset();
          if (onRetry) {
            onRetry();
          } else if (prevLearnerId && prevReview) {
            startReviewSession(prevLearnerId);
          } else if (prevLearnerId && prevTopicId) {
            startAssessment(prevLearnerId, prevTopicId, prevPractice);
          }
        }}
        onHome={() => {
          reset();
          onHome();
        }}
      />
    );
  }

  if (status === 'idle' || questions.length === 0) {
    return (
      <div className="py-8">
        <AssessmentSkeleton />
      </div>
    );
  }

  const question = questions[currentIndex];
  const currentScore = score();
  const hints = question.hints ?? [];

  const targetTotal = practiceMode
    ? ASSESSMENT_CONFIG.questionsPerTopic
    : isBackgroundLoading
      ? Math.max(questions.length, ASSESSMENT_CONFIG.questionsPerTopic)
      : questions.length;

  const isAtEndOfQueue = currentIndex >= questions.length - 1;
  const isReallyLast = practiceMode
    ? currentIndex >= ASSESSMENT_CONFIG.questionsPerTopic - 1 || adaptiveExhausted
    : isAtEndOfQueue && !isBackgroundLoading;
  const isWaitingForMore = (!practiceMode && isAtEndOfQueue && isBackgroundLoading) || isFetchingNext;

  const isBlankFill =
    question.question_type === 'fill_in_blank' &&
    (typeof selectedAnswer !== 'string' || selectedAnswer.trim().length === 0);
  const canSubmit = selectedAnswer !== null && !isBlankFill;

  return (
    <div className="max-w-2xl mx-auto">
      {/* Header */}
      <div className="flex justify-between items-center mb-6 gap-4">
        <h2 className="text-lg font-bold text-navy-900 truncate">{topicName}</h2>
        <Button
          variant="ghost"
          size="sm"
          onClick={() => {
            reset();
            onHome();
          }}
          className="text-slate-500 hover:text-red-600 hover:bg-red-50 flex-shrink-0"
        >
          <X className="w-4 h-4 mr-1.5" />
          Quit
        </Button>
      </div>

      {/* Progress bar */}
      <div className="mb-6 bg-white p-4 rounded-2xl border border-slate-200/80 shadow-sm">
        <div className="flex items-center justify-between mb-2">
          <span className="text-sm font-medium text-slate-600">
            Question {currentIndex + 1} of {practiceMode ? targetTotal : isBackgroundLoading ? '...' : questions.length}
            {question.is_review && <span className="ml-2 px-2 py-0.5 text-xs rounded-full bg-amber-50 text-amber-700 font-semibold">Review</span>}
            {practiceMode && !question.is_review && <span className="ml-2 px-2 py-0.5 text-xs rounded-full bg-indigo-50 text-indigo-700 font-semibold">Adaptive Practice</span>}
          </span>
          <span className="text-sm font-bold text-navy-900">
            {currentScore.correct}/{currentScore.total} correct
          </span>
        </div>
        <div className="h-2 bg-slate-100 rounded-full overflow-hidden">
          <div
            className="h-full bg-indigo-600 rounded-full transition-all duration-300"
            style={{ width: `${Math.min(100, ((currentIndex + 1) / Math.max(1, targetTotal)) * 100)}%` }}
          />
        </div>
      </div>

      {/* Question Card */}
      <div className="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm">
        <QuestionCard
          question={question}
          selectedAnswer={selectedAnswer}
          isSubmitted={isSubmitted}
          isCorrectResult={isCorrect}
          onSelect={selectAnswer}
        />

        {/* Pre-submission hints (so learners can actually use hints while thinking & hints_used logs accurately!) */}
        {!isSubmitted && hints.length > 0 && (
          <div className="mt-5 space-y-2">
            {hints.slice(0, hintsRevealed).map((hint, i) => (
              <div key={i} className="flex items-start gap-2.5 p-3 bg-amber-50 border border-amber-200 rounded-xl">
                <Lightbulb className="w-4 h-4 text-amber-600 mt-0.5 flex-shrink-0" />
                <p className="text-sm text-amber-900">{hint}</p>
              </div>
            ))}
            {hintsRevealed < hints.length && (
              <Button variant="outline" size="sm" onClick={revealHint}>
                <Lightbulb className="w-4 h-4 mr-1.5 text-amber-500" />
                Show Hint ({hintsRevealed + 1}/{hints.length})
              </Button>
            )}
          </div>
        )}

        {/* Submit or Skip fallback */}
        {!isSubmitted && question.question_type !== 'multiple_choice' && question.question_type !== 'fill_in_blank' ? (
          <Button onClick={nextQuestion} className="w-full mt-6" size="lg" variant="outline">
            Skip Unsupported Question
          </Button>
        ) : (
          !isSubmitted && (
            <Button
              onClick={submitAnswer}
              disabled={!canSubmit}
              className="w-full mt-6"
              size="lg"
            >
              Check Answer
            </Button>
          )
        )}

        {/* Post-submission feedback */}
        {isSubmitted && isCorrect !== null && (
          <FeedbackPanel
            isCorrect={isCorrect}
            explanation={question.explanation}
            hints={hints}
            hintsRevealed={hintsRevealed}
            onRevealHint={revealHint}
            onNext={nextQuestion}
            isLast={isReallyLast}
            isLoadingNext={isWaitingForMore}
          />
        )}
      </div>
    </div>
  );
}
