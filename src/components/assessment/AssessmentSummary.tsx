import { useState } from 'react';
import Button from '@/components/ui/Button';
import { Card, CardContent } from '@/components/ui/Card';
import { Trophy, Target, BookOpen, RotateCcw, Home, XCircle, CheckCircle, ArrowRight } from 'lucide-react';
import { ASSESSMENT_CONFIG } from '@/config/assessment';

interface SummaryQuestion {
  id: string;
  stem: string;
  is_correct: boolean;
  is_review: boolean;
}

interface AssessmentSummaryProps {
  score: { correct: number; total: number; pct: number };
  topicName: string;
  isPractice?: boolean;
  isReviewMode?: boolean;
  questions?: SummaryQuestion[];
  onRetry: () => void;
  onHome: () => void;
}

export default function AssessmentSummary({
  score,
  topicName,
  isPractice,
  isReviewMode,
  questions = [],
  onRetry,
  onHome,
}: AssessmentSummaryProps) {
  const [showDetails, setShowDetails] = useState(false);
  const thresholdPct = ASSESSMENT_CONFIG.firstPassMasteryThreshold * 100;
  const mastered = score.pct >= thresholdPct;
  const missedQuestions = questions.filter((q) => !q.is_correct);
  const correctQuestions = questions.filter((q) => q.is_correct);

  const heading = isReviewMode
    ? 'Review Complete!'
    : isPractice
      ? 'Practice Complete!'
      : mastered
        ? 'Topic Mastered!'
        : 'Keep Practicing!';

  return (
    <div className="max-w-lg mx-auto space-y-4">
      <Card>
        <CardContent className="p-8 text-center">
          <div
            className={`w-20 h-20 mx-auto rounded-full flex items-center justify-center mb-4 ${
              isPractice
                ? 'bg-indigo-100'
                : mastered
                  ? 'bg-green-100'
                  : 'bg-amber-100'
            }`}
          >
            {isPractice ? (
              <BookOpen className="w-10 h-10 text-indigo-600" />
            ) : mastered ? (
              <Trophy className="w-10 h-10 text-green-600" />
            ) : (
              <Target className="w-10 h-10 text-amber-600" />
            )}
          </div>

          <h2 className="text-2xl font-bold text-navy-900 mb-1">{heading}</h2>
          <p className="text-slate-500 text-sm mb-6">{topicName}</p>

          <div className="flex justify-center gap-8 mb-6">
            <div className="text-center">
              <p className="text-3xl font-bold text-navy-900">
                {score.correct}/{score.total}
              </p>
              <p className="text-xs font-medium text-slate-500 uppercase tracking-wider mt-1">Correct</p>
            </div>
            <div className="text-center">
              <p
                className={`text-3xl font-bold ${
                  isPractice ? 'text-indigo-600' : mastered ? 'text-green-600' : 'text-amber-600'
                }`}
              >
                {score.pct}%
              </p>
              <p className="text-xs font-medium text-slate-500 uppercase tracking-wider mt-1">Score</p>
            </div>
          </div>

          {isReviewMode ? (
            <p className="text-sm text-indigo-800 bg-indigo-50 border border-indigo-200 p-3.5 rounded-xl mb-5">
              Spaced repetition complete! Correct answers moved forward in your memory schedule; any missed items will return sooner for reinforcement.
            </p>
          ) : isPractice ? (
            <p className="text-sm text-indigo-800 bg-indigo-50 border border-indigo-200 p-3.5 rounded-xl mb-5">
              Practice complete! Voluntary practice does not alter your official mastery scores.
            </p>
          ) : mastered ? (
            <p className="text-sm text-green-800 bg-green-50 border border-green-200 p-3.5 rounded-xl mb-5">
              Great work! You passed the {thresholdPct}% mastery threshold.
              {missedQuestions.length > 0 &&
                ` The ${missedQuestions.length} missed question${missedQuestions.length > 1 ? 's' : ''} will return later for review.`}
            </p>
          ) : (
            <p className="text-sm text-amber-800 bg-amber-50 border border-amber-200 p-3.5 rounded-xl mb-5">
              You need {thresholdPct}% to reach first-pass mastery. Review what you missed below and try again!
            </p>
          )}

          {questions.length > 0 && (
            <div className="text-left mb-5">
              <button
                type="button"
                onClick={() => setShowDetails(!showDetails)}
                className="flex items-center gap-2 text-sm font-semibold text-navy-700 hover:text-navy-900 transition-colors"
              >
                <ArrowRight className={`w-4 h-4 transition-transform ${showDetails ? 'rotate-90' : ''}`} />
                {showDetails ? 'Hide' : 'Show'} question details
              </button>

              {showDetails && (
                <div className="mt-3 space-y-3 bg-slate-50 p-3.5 rounded-xl border border-slate-200/80">
                  {missedQuestions.length > 0 && (
                    <div>
                      <p className="text-xs font-semibold text-red-600 mb-1.5">
                        Missed ({missedQuestions.length}) — queued for spaced review:
                      </p>
                      {missedQuestions.map((q) => (
                        <div key={`miss-${q.id}`} className="flex items-start gap-2 py-1.5">
                          <XCircle className="w-4 h-4 text-red-500 mt-0.5 flex-shrink-0" />
                          <p className="text-xs text-slate-700 line-clamp-2">{q.stem}</p>
                        </div>
                      ))}
                    </div>
                  )}
                  {correctQuestions.length > 0 && (
                    <div className={missedQuestions.length > 0 ? 'pt-2 border-t border-slate-200' : ''}>
                      <p className="text-xs font-semibold text-green-600 mb-1.5">
                        Correct ({correctQuestions.length}):
                      </p>
                      {correctQuestions.slice(0, 5).map((q) => (
                        <div key={`ok-${q.id}`} className="flex items-start gap-2 py-1">
                          <CheckCircle className="w-4 h-4 text-green-500 mt-0.5 flex-shrink-0" />
                          <p className="text-xs text-slate-700 line-clamp-1">{q.stem}</p>
                        </div>
                      ))}
                      {correctQuestions.length > 5 && (
                        <p className="text-xs text-slate-400 pl-6">+{correctQuestions.length - 5} more</p>
                      )}
                    </div>
                  )}
                </div>
              )}
            </div>
          )}

          <div className="flex gap-3">
            <Button variant="outline" className="flex-1" onClick={onRetry}>
              <RotateCcw className="w-4 h-4 mr-2" />
              Try Again
            </Button>
            <Button className="flex-1" onClick={onHome}>
              <Home className="w-4 h-4 mr-2" />
              Home
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
