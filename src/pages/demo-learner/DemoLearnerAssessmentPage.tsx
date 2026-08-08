import { useState } from 'react';
import { useNavigate, useLocation, useParams } from 'react-router-dom';
import { ArrowLeft, CheckCircle2, XCircle, ArrowRight } from 'lucide-react';
import { DEMO_QUESTIONS } from '../demo/demoData';

export default function DemoLearnerAssessmentPage() {
  const navigate = useNavigate();
  const location = useLocation();
  const { topicId } = useParams();
  
  const [questionIndex, setQuestionIndex] = useState(0);
  const [selectedAnswer, setSelectedAnswer] = useState<string | null>(null);
  const [isSubmitted, setIsSubmitted] = useState(false);

  // We filter demo questions by topic, or just show all if none match so the demo works
  const topicQuestions = DEMO_QUESTIONS.filter(q => q.topic_id === topicId);
  const demoQuestions = topicQuestions.length > 0 ? topicQuestions : DEMO_QUESTIONS;
  
  const currentQuestion = demoQuestions[questionIndex % demoQuestions.length];
  
  const handleSelect = (optionKey: string) => {
    if (isSubmitted) return;
    setSelectedAnswer(optionKey);
  };

  const handleSubmit = () => {
    if (!selectedAnswer) return;
    setIsSubmitted(true);
  };

  const handleNext = () => {
    setSelectedAnswer(null);
    setIsSubmitted(false);
    setQuestionIndex(prev => prev + 1);
  };

  // If user reaches 5 questions, show upsell screen
  if (questionIndex >= 5) {
    return (
      <div className="max-w-2xl mx-auto py-12 px-4 text-center">
        <div className="w-20 h-20 bg-purple-100 text-purple-600 rounded-full flex items-center justify-center mx-auto mb-6">
          <CheckCircle2 className="w-10 h-10" />
        </div>
        <h2 className="text-3xl font-bold text-zinc-900 mb-4">Great Job!</h2>
        <p className="text-lg text-zinc-600 mb-8">
          You've reached the end of the demo assessment. Join thousands of other learners and unlock the full experience!
        </p>
        
        <div className="bg-white border border-zinc-200 rounded-2xl p-6 shadow-sm mb-8 text-left max-w-sm mx-auto">
          <ul className="space-y-3">
            <li className="flex items-center gap-2 text-zinc-700">
              <CheckCircle2 className="w-5 h-5 text-emerald-500" /> Over 2,000+ BECE questions
            </li>
            <li className="flex items-center gap-2 text-zinc-700">
              <CheckCircle2 className="w-5 h-5 text-emerald-500" /> Detailed AI explanations
            </li>
            <li className="flex items-center gap-2 text-zinc-700">
              <CheckCircle2 className="w-5 h-5 text-emerald-500" /> Track your progress
            </li>
          </ul>
        </div>

        <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
          <button 
            onClick={() => navigate('/learner/login')}
            className="w-full sm:w-auto px-8 py-3 bg-zinc-900 text-white font-semibold rounded-full hover:bg-zinc-800 transition-colors"
          >
            Sign Up for Free
          </button>
          <button 
            onClick={() => navigate('/demo-learner/home')}
            className="w-full sm:w-auto px-8 py-3 bg-white text-zinc-900 font-semibold border border-zinc-200 rounded-full hover:bg-zinc-50 transition-colors"
          >
            Back to Demo Home
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-3xl mx-auto pb-24">
      {/* Header */}
      <div className="flex items-center gap-4 mb-8">
        <button
          onClick={() => navigate('/demo-learner/home')}
          className="p-2 -ml-2 text-zinc-400 hover:text-zinc-900 transition-colors"
        >
          <ArrowLeft className="w-5 h-5" />
        </button>
        <div className="flex-1">
          <div className="text-sm font-medium text-zinc-500 uppercase tracking-wider mb-1">
            Demo Practice • Question {questionIndex + 1} of 5
          </div>
          <h1 className="text-xl font-bold text-zinc-900 line-clamp-1">
            {location.state?.topicName || 'Topic Practice'}
          </h1>
        </div>
      </div>

      {/* Question Card */}
      <div className="bg-white rounded-2xl border border-zinc-200 shadow-sm overflow-hidden mb-6">
        <div className="p-6 sm:p-8">
          <p className="text-lg sm:text-xl text-zinc-900 font-medium leading-relaxed mb-8">
            {currentQuestion.text}
          </p>

          <div className="space-y-3">
            {currentQuestion.type === 'multiple_choice' && currentQuestion.options ? (
              Object.entries(currentQuestion.options).map(([key, value]) => {
                const isSelected = selectedAnswer === key;
                const isCorrect = key === currentQuestion.correct_answer;
                
                let stateClass = "border-zinc-200 hover:border-zinc-300 hover:bg-zinc-50";
                if (isSelected && !isSubmitted) {
                  stateClass = "border-purple-600 bg-purple-50 ring-1 ring-purple-600";
                } else if (isSubmitted) {
                  if (isCorrect) {
                    stateClass = "border-emerald-500 bg-emerald-50 ring-1 ring-emerald-500";
                  } else if (isSelected && !isCorrect) {
                    stateClass = "border-red-500 bg-red-50 ring-1 ring-red-500";
                  } else {
                    stateClass = "border-zinc-200 opacity-50";
                  }
                }

                return (
                  <button
                    key={key}
                    onClick={() => handleSelect(key)}
                    className={`w-full text-left p-4 rounded-xl border-2 transition-all flex items-center justify-between ${stateClass}`}
                  >
                    <div className="flex items-center gap-4">
                      <div className={`w-8 h-8 rounded-lg flex items-center justify-center font-bold text-sm
                        ${isSelected && !isSubmitted ? 'bg-purple-600 text-white' : 
                          isSubmitted && isCorrect ? 'bg-emerald-500 text-white' :
                          isSubmitted && isSelected && !isCorrect ? 'bg-red-500 text-white' :
                          'bg-zinc-100 text-zinc-500'}`}
                      >
                        {key.toUpperCase()}
                      </div>
                      <span className={`text-base font-medium ${isSelected || isSubmitted ? 'text-zinc-900' : 'text-zinc-700'}`}>
                        {String(value)}
                      </span>
                    </div>
                    
                    {isSubmitted && isCorrect && <CheckCircle2 className="w-5 h-5 text-emerald-500" />}
                    {isSubmitted && isSelected && !isCorrect && <XCircle className="w-5 h-5 text-red-500" />}
                  </button>
                );
              })
            ) : (
              // Open ended mock
              <div className="space-y-4">
                <textarea
                  className="w-full h-32 p-4 border border-zinc-200 rounded-xl focus:ring-2 focus:ring-purple-600 outline-none resize-none"
                  placeholder="Type your answer here..."
                  value={selectedAnswer || ''}
                  onChange={(e) => handleSelect(e.target.value)}
                  disabled={isSubmitted}
                />
                {isSubmitted && (
                  <div className="p-4 bg-emerald-50 border border-emerald-200 rounded-xl">
                    <p className="text-sm font-medium text-emerald-800 mb-1">Example Good Answer:</p>
                    <p className="text-emerald-700">{currentQuestion.sample_answer}</p>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Action Bar */}
      <div className="flex justify-end">
        {!isSubmitted ? (
          <button
            onClick={handleSubmit}
            disabled={!selectedAnswer}
            className={`px-8 py-3 rounded-xl font-bold transition-colors ${
              selectedAnswer 
                ? 'bg-zinc-900 text-white hover:bg-zinc-800' 
                : 'bg-zinc-100 text-zinc-400 cursor-not-allowed'
            }`}
          >
            Check Answer
          </button>
        ) : (
          <button
            onClick={handleNext}
            className="flex items-center gap-2 px-8 py-3 rounded-xl font-bold bg-purple-600 text-white hover:bg-purple-700 transition-colors"
          >
            Next Question <ArrowRight className="w-5 h-5" />
          </button>
        )}
      </div>
    </div>
  );
}
