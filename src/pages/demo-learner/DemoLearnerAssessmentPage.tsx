import { useState, useEffect } from 'react';
import { useNavigate, useLocation, useParams } from 'react-router-dom';
import { ArrowLeft, CheckCircle2, XCircle, ArrowRight, Lightbulb, Trophy } from 'lucide-react';
import { DEMO_QUESTIONS, DEMO_TOPICS } from '../demo/demoData';

export default function DemoLearnerAssessmentPage() {
  const navigate = useNavigate();
  const location = useLocation();
  const { topicId } = useParams();

  const resolvedTopic = DEMO_TOPICS.find((t) => t.id === topicId) || DEMO_TOPICS[0];
  const topicName =
    (location.state as { topicName?: string } | null)?.topicName || resolvedTopic.name;

  const topicQuestions = DEMO_QUESTIONS.filter((q) => q.topic_id === resolvedTopic.id);
  const demoQuestions = topicQuestions.slice(0, 5);

  const [questionIndex, setQuestionIndex] = useState(0);
  const [selectedIdx, setSelectedIdx] = useState<number | null>(null);
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [correctCount, setCorrectCount] = useState(0);
  const [showHint, setShowHint] = useState(false);

  useEffect(() => {
    setQuestionIndex(0);
    setSelectedIdx(null);
    setIsSubmitted(false);
    setCorrectCount(0);
    setShowHint(false);
  }, [topicId]);

  const currentQuestion = demoQuestions[questionIndex];
  const totalQuestions = demoQuestions.length;

  const handleSelect = (idx: number) => {
    if (isSubmitted) return;
    setSelectedIdx(idx);
  };

  const handleSubmit = () => {
    if (selectedIdx === null || !currentQuestion || isSubmitted) return;
    const isCorrect = selectedIdx === Number(currentQuestion.correct_answer);
    if (isCorrect) {
      setCorrectCount((prev) => prev + 1);
    }
    setIsSubmitted(true);
  };

  const handleNext = () => {
    setSelectedIdx(null);
    setIsSubmitted(false);
    setShowHint(false);
    setQuestionIndex((prev) => prev + 1);
  };

  if (questionIndex >= totalQuestions || !currentQuestion) {
    const scorePct = totalQuestions > 0 ? Math.round((correctCount / totalQuestions) * 100) : 0;
    const mastered = scorePct >= 80;

    return (
      <div className="max-w-xl mx-auto py-8 px-4 text-center">
        <div
          className={`w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-5 ${
            mastered ? 'bg-emerald-100 text-emerald-600' : 'bg-indigo-100 text-indigo-600'
          }`}
        >
          <Trophy className="w-10 h-10" />
        </div>
        <h2 className="text-2xl sm:text-3xl font-bold text-navy-900 mb-2">
          {mastered ? 'Topic Mastered!' : 'Demo Session Complete'}
        </h2>
        <p className="text-slate-600 mb-6">
          You scored <strong className="text-navy-900">{correctCount} out of {totalQuestions}</strong> ({scorePct}%) on{' '}
          <strong className="text-navy-900">{topicName}</strong>.
        </p>

        <div className="bg-white border border-slate-200 rounded-2xl p-6 shadow-sm mb-8 text-left">
          <p className="text-xs font-semibold uppercase tracking-wider text-slate-400 mb-3">
            Full Student Account Features
          </p>
          <ul className="space-y-2.5 text-sm">
            <li className="flex items-center gap-2.5 text-navy-800">
              <CheckCircle2 className="w-4 h-4 text-emerald-500 flex-shrink-0" />
              1,800+ NaCCA BECE Science questions across B7–B9
            </li>
            <li className="flex items-center gap-2.5 text-navy-800">
              <CheckCircle2 className="w-4 h-4 text-emerald-500 flex-shrink-0" />
              Adaptive question difficulty matched to your ability level
            </li>
            <li className="flex items-center gap-2.5 text-navy-800">
              <CheckCircle2 className="w-4 h-4 text-emerald-500 flex-shrink-0" />
              3-day, 7-day, and 14-day spaced repetition to lock in memory
            </li>
          </ul>
        </div>

        <div className="flex flex-col sm:flex-row items-center justify-center gap-3">
          <button
            type="button"
            onClick={() => navigate('/learner/login')}
            className="w-full sm:w-auto px-7 py-3 bg-indigo-600 text-white font-semibold rounded-xl hover:bg-indigo-700 transition-colors"
          >
            Sign In as Learner
          </button>
          <button
            type="button"
            onClick={() => navigate('/demo-learner/home')}
            className="w-full sm:w-auto px-7 py-3 bg-white text-navy-900 font-semibold border border-slate-300 rounded-xl hover:bg-slate-50 transition-colors"
          >
            Back to Demo Home
          </button>
        </div>
      </div>
    );
  }

  const options = Array.isArray(currentQuestion.options)
    ? (currentQuestion.options as string[])
    : [];
  const correctIdx = Number(currentQuestion.correct_answer);
  const progressPct = Math.round(((questionIndex + (isSubmitted ? 1 : 0)) / totalQuestions) * 100);

  return (
    <div className="max-w-3xl mx-auto">
      {/* Header */}
      <div className="flex items-center gap-3 mb-4">
        <button
          type="button"
          onClick={() => navigate('/demo-learner/home')}
          className="p-2 -ml-2 text-slate-400 hover:text-navy-900 rounded-lg hover:bg-white transition-colors"
          aria-label="Back to topics"
        >
          <ArrowLeft className="w-5 h-5" />
        </button>
        <div className="flex-1 min-w-0">
          <div className="flex items-center justify-between text-xs font-semibold text-slate-500 uppercase tracking-wider mb-1">
            <span>
              Question {questionIndex + 1} of {totalQuestions}
            </span>
            <span className="text-indigo-600">
              Score: {correctCount}/{questionIndex + (isSubmitted ? 1 : 0)}
            </span>
          </div>
          <h1 className="text-lg sm:text-xl font-bold text-navy-900 truncate">{topicName}</h1>
        </div>
      </div>

      {/* Progress bar */}
      <div className="h-2 bg-slate-200 rounded-full overflow-hidden mb-6">
        <div
          className="h-full bg-indigo-600 rounded-full transition-all duration-300"
          style={{ width: `${progressPct}%` }}
        />
      </div>

      {/* Question Card */}
      <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden mb-5">
        <div className="p-6 sm:p-8">
          <div className="flex items-center justify-between gap-3 mb-4">
            <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-slate-100 text-slate-600 uppercase">
              {currentQuestion.difficulty.replace(/_/g, ' ')}
            </span>
            {currentQuestion.hints && currentQuestion.hints.length > 0 && !isSubmitted && (
              <button
                type="button"
                onClick={() => setShowHint((v) => !v)}
                className="inline-flex items-center gap-1.5 text-xs font-semibold text-amber-700 bg-amber-50 hover:bg-amber-100 px-3 py-1 rounded-full transition-colors"
              >
                <Lightbulb className="w-3.5 h-3.5" />
                {showHint ? 'Hide Hint' : 'Show Hint'}
              </button>
            )}
          </div>

          {showHint && currentQuestion.hints?.[0] && (
            <div className="mb-5 p-3.5 rounded-xl bg-amber-50 border border-amber-200 text-sm text-amber-900">
              <strong>Hint:</strong> {currentQuestion.hints[0]}
            </div>
          )}

          <p className="text-base sm:text-lg text-navy-900 font-semibold leading-relaxed mb-6">
            {currentQuestion.stem}
          </p>

          <div className="space-y-3">
            {options.map((optText, idx) => {
              const isSelected = selectedIdx === idx;
              const isCorrect = idx === correctIdx;

              let stateClass = 'border-slate-200 hover:border-indigo-300 hover:bg-slate-50';
              if (isSelected && !isSubmitted) {
                stateClass = 'border-indigo-600 bg-indigo-50 ring-1 ring-indigo-600';
              } else if (isSubmitted) {
                if (isCorrect) {
                  stateClass = 'border-emerald-500 bg-emerald-50 ring-1 ring-emerald-500';
                } else if (isSelected && !isCorrect) {
                  stateClass = 'border-rose-500 bg-rose-50 ring-1 ring-rose-500';
                } else {
                  stateClass = 'border-slate-200 opacity-60';
                }
              }

              return (
                <button
                  key={idx}
                  type="button"
                  disabled={isSubmitted}
                  onClick={() => handleSelect(idx)}
                  className={`w-full text-left p-4 rounded-xl border-2 transition-all flex items-center justify-between gap-3 ${stateClass} disabled:cursor-default`}
                >
                  <div className="flex items-center gap-3.5 min-w-0">
                    <div
                      className={`w-8 h-8 rounded-lg flex items-center justify-center font-bold text-sm flex-shrink-0 ${
                        isSelected && !isSubmitted
                          ? 'bg-indigo-600 text-white'
                          : isSubmitted && isCorrect
                            ? 'bg-emerald-500 text-white'
                            : isSubmitted && isSelected && !isCorrect
                              ? 'bg-rose-500 text-white'
                              : 'bg-slate-100 text-slate-600'
                      }`}
                    >
                      {String.fromCharCode(65 + idx)}
                    </div>
                    <span
                      className={`text-sm sm:text-base font-medium ${
                        isSelected || isSubmitted ? 'text-navy-900' : 'text-slate-700'
                      }`}
                    >
                      {optText}
                    </span>
                  </div>

                  {isSubmitted && isCorrect && (
                    <CheckCircle2 className="w-5 h-5 text-emerald-600 flex-shrink-0" />
                  )}
                  {isSubmitted && isSelected && !isCorrect && (
                    <XCircle className="w-5 h-5 text-rose-600 flex-shrink-0" />
                  )}
                </button>
              );
            })}
          </div>

          {isSubmitted && (
            <div
              className={`mt-6 p-4 rounded-xl border text-sm ${
                selectedIdx === correctIdx
                  ? 'bg-emerald-50 border-emerald-200 text-emerald-900'
                  : 'bg-indigo-50 border-indigo-200 text-navy-900'
              }`}
            >
              <p className="font-semibold mb-1">
                {selectedIdx === correctIdx ? 'Correct!' : `Correct answer: ${String.fromCharCode(65 + correctIdx)}`}
              </p>
              <p className="text-slate-700 leading-relaxed">{currentQuestion.explanation}</p>
            </div>
          )}
        </div>
      </div>

      {/* Action Bar */}
      <div className="flex justify-end">
        {!isSubmitted ? (
          <button
            type="button"
            onClick={handleSubmit}
            disabled={selectedIdx === null}
            className={`px-7 py-3 rounded-xl font-semibold transition-colors ${
              selectedIdx !== null
                ? 'bg-navy-900 text-white hover:bg-navy-800'
                : 'bg-slate-200 text-slate-400 cursor-not-allowed'
            }`}
          >
            Check Answer
          </button>
        ) : (
          <button
            type="button"
            onClick={handleNext}
            className="flex items-center gap-2 px-7 py-3 rounded-xl font-semibold bg-indigo-600 text-white hover:bg-indigo-700 transition-colors"
          >
            {questionIndex >= totalQuestions - 1 ? 'Finish Assessment' : 'Next Question'}
            <ArrowRight className="w-4 h-4" />
          </button>
        )}
      </div>
    </div>
  );
}
