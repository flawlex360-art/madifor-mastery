import { useAssessmentStore } from '@/stores/assessmentStore';
import QuestionCard from './QuestionCard';
import FeedbackPanel from './FeedbackPanel';
import AssessmentSummary from './AssessmentSummary';
import Button from '@/components/ui/Button';
import { X } from 'lucide-react';

interface AssessmentSessionProps {
  topicName: string;
  onHome: () => void;
}

import { AssessmentSkeleton } from './AssessmentSkeleton';

export default function AssessmentSession({ topicName, onHome }: AssessmentSessionProps) {
  const {
    questions, currentIndex, status, selectedAnswer, isSubmitted, isCorrect,
    hintsRevealed, selectAnswer, submitAnswer, revealHint, nextQuestion,
    score, startAssessment, learnerId, topicId, reset, practiceMode, answers,
  } = useAssessmentStore();

  if (status === 'loading') {
    return (
      <div className="py-8">
        <AssessmentSkeleton />
      </div>
    );
  }

  if (status === 'complete') {
    // Build summary question data
    const summaryQuestions = questions.map((q) => ({
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
        questions={summaryQuestions}
        onRetry={() => {
          reset();
          if (learnerId && topicId) startAssessment(learnerId, topicId, practiceMode);
        }}
        onHome={() => { reset(); onHome(); }}
      />
    );
  }

  if (status === 'idle' || questions.length === 0) {
    return (
      <div className="text-center py-20">
        <p className="text-gray-500">No questions available.</p>
        <Button onClick={onHome} className="mt-4">Go Home</Button>
      </div>
    );
  }

  const question = questions[currentIndex];
  const currentScore = score();

  return (
    <div className="max-w-2xl mx-auto">
      {/* Header */}
      <div className="flex justify-between items-center mb-6">
        <h2 className="text-lg font-semibold text-zinc-950">{topicName}</h2>
        <Button variant="ghost" size="sm" onClick={() => { reset(); onHome(); }} className="text-gray-500 hover:text-red-600 hover:bg-red-50">
          <X className="w-4 h-4 mr-2" />
          Quit Session
        </Button>
      </div>

      {/* Progress bar */}
      <div className="mb-6">
        <div className="flex items-center justify-between mb-2">
          <span className="text-sm text-gray-500">
            Question {currentIndex + 1} of {questions.length}
            {question.is_review && <span className="ml-2 text-amber-600 font-medium">(Review)</span>}
            {practiceMode && !question.is_review && <span className="ml-2 text-purple-600 font-medium">(Practice)</span>}
          </span>
          <span className="text-sm font-medium text-zinc-900">
            {currentScore.correct}/{currentScore.total} correct
          </span>
        </div>
        <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
          <div
            className="h-full bg-teal-400 transition-all duration-300"
            style={{ width: `${((currentIndex + 1) / questions.length) * 100}%` }}
          />
        </div>
      </div>

      {/* Question */}
      <QuestionCard
        question={question}
        selectedAnswer={selectedAnswer}
        isSubmitted={isSubmitted}
        onSelect={selectAnswer}
      />

      {/* Submit button */}
      {!isSubmitted && (
        <Button
          onClick={submitAnswer}
          disabled={selectedAnswer === null}
          className="w-full mt-6"
          size="lg"
        >
          Check Answer
        </Button>
      )}

      {/* Feedback */}
      {isSubmitted && isCorrect !== null && (
        <FeedbackPanel
          isCorrect={isCorrect}
          explanation={question.explanation}
          hints={question.hints ?? []}
          hintsRevealed={hintsRevealed}
          onRevealHint={revealHint}
          onNext={nextQuestion}
          isLast={currentIndex === questions.length - 1}
        />
      )}
    </div>
  );
}
