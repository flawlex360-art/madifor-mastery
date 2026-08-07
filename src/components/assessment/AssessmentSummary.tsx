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
  questions?: SummaryQuestion[];
  onRetry: () => void;
  onHome: () => void;
}

export default function AssessmentSummary({
  score, topicName, isPractice, questions = [], onRetry, onHome,
}: AssessmentSummaryProps) {
  const [showDetails, setShowDetails] = useState(false);
  const mastered = score.pct >= ASSESSMENT_CONFIG.firstPassMasteryThreshold * 100;
  const missedQuestions = questions.filter((q) => !q.is_correct);
  const correctQuestions = questions.filter((q) => q.is_correct);

  return (
    <div className="max-w-lg mx-auto space-y-4">
      {/* Score card */}
      <Card>
        <CardContent className="p-8 text-center">
          <div className={`w-20 h-20 mx-auto rounded-full flex items-center justify-center mb-4 ${
            isPractice ? 'bg-purple-100' : mastered ? 'bg-green-100' : 'bg-amber-100'
          }`}>
            {isPractice ? (
              <BookOpen className="w-10 h-10 text-purple-600" />
            ) : mastered ? (
              <Trophy className="w-10 h-10 text-green-600" />
            ) : (
              <Target className="w-10 h-10 text-amber-600" />
            )}
          </div>

          <h2 className="text-2xl font-bold text-zinc-900 mb-2">
            {isPractice ? 'Practice Complete!' : mastered ? 'Topic Mastered!' : 'Keep Practicing!'}
          </h2>
          <p className="text-gray-500 mb-6">{topicName}</p>

          <div className="flex justify-center gap-8 mb-6">
            <div className="text-center">
              <p className="text-3xl font-bold text-zinc-900">{score.correct}/{score.total}</p>
              <p className="text-sm text-gray-500">Correct</p>
            </div>
            <div className="text-center">
              <p className={`text-3xl font-bold ${
                isPractice ? 'text-purple-600' : mastered ? 'text-green-600' : 'text-amber-600'
              }`}>
                {score.pct}%
              </p>
              <p className="text-sm text-gray-500">Score</p>
            </div>
          </div>

          {/* Feedback message */}
          {isPractice ? (
            <p className="text-sm text-purple-700 bg-purple-50 p-3 rounded-lg mb-4">
              Practice complete! This doesn't affect your mastery scores, but it helps you learn. Keep it up!
            </p>
          ) : mastered ? (
            <p className="text-sm text-green-700 bg-green-50 p-3 rounded-lg mb-4">
              Great work! You passed the first-pass mastery threshold ({ASSESSMENT_CONFIG.firstPassMasteryThreshold * 100}%).
              {missedQuestions.length > 0 && ` The ${missedQuestions.length} question${missedQuestions.length > 1 ? 's' : ''} you missed will come back for review later.`}
            </p>
          ) : (
            <p className="text-sm text-amber-700 bg-amber-50 p-3 rounded-lg mb-4">
              You need {ASSESSMENT_CONFIG.firstPassMasteryThreshold * 100}% to master this topic.
              Review the explanations below and try again!
            </p>
          )}

          {/* Missed questions summary */}
          {!isPractice && missedQuestions.length > 0 && (
            <div className="text-left mb-4">
              <button
                onClick={() => setShowDetails(!showDetails)}
                className="flex items-center gap-2 text-sm font-medium text-navy-700 hover:text-zinc-950 transition-colors"
              >
                <ArrowRight className={`w-4 h-4 transition-transform ${showDetails ? 'rotate-90' : ''}`} />
                {showDetails ? 'Hide' : 'Show'} question details
              </button>

              {showDetails && (
                <div className="mt-3 space-y-2">
                  {missedQuestions.length > 0 && (
                    <div>
                      <p className="text-xs font-medium text-red-600 mb-1.5">
                        Missed ({missedQuestions.length}) — will resurface for review:
                      </p>
                      {missedQuestions.map((q) => (
                        <div key={q.id} className="flex items-start gap-2 py-1.5">
                          <XCircle className="w-4 h-4 text-red-400 mt-0.5 flex-shrink-0" />
                          <p className="text-xs text-gray-600 line-clamp-2">{q.stem}</p>
                        </div>
                      ))}
                    </div>
                  )}
                  {correctQuestions.length > 0 && (
                    <div className="pt-2 border-t">
                      <p className="text-xs font-medium text-green-600 mb-1.5">
                        Correct ({correctQuestions.length}):
                      </p>
                      {correctQuestions.slice(0, 3).map((q) => (
                        <div key={q.id} className="flex items-start gap-2 py-1">
                          <CheckCircle className="w-4 h-4 text-green-400 mt-0.5 flex-shrink-0" />
                          <p className="text-xs text-gray-600 line-clamp-1">{q.stem}</p>
                        </div>
                      ))}
                      {correctQuestions.length > 3 && (
                        <p className="text-xs text-gray-400 pl-6">
                          +{correctQuestions.length - 3} more
                        </p>
                      )}
                    </div>
                  )}
                </div>
              )}
            </div>
          )}

          {/* Actions */}
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
