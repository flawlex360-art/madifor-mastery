import { cn } from '@/lib/utils';
import type { Question } from '@/types/curriculum';

interface QuestionCardProps {
  question: Question;
  selectedAnswer: number | string | null;
  isSubmitted: boolean;
  onSelect: (answer: number | string) => void;
}

export default function QuestionCard({ question, selectedAnswer, isSubmitted, onSelect }: QuestionCardProps) {
  if (question.question_type === 'multiple_choice' && Array.isArray(question.options)) {
    return (
      <div className="space-y-3">
        <p className="text-lg font-medium text-zinc-900 leading-relaxed">{question.stem}</p>
        <div className="space-y-2">
          {question.options.map((option, idx) => {
            const isSelected = selectedAnswer === idx;
            // C-3 FIX: Use Number() normalization to match store logic
            const isCorrect = Number(question.correct_answer) === idx;
            const showResult = isSubmitted;

            return (
              <button
                key={idx}
                onClick={() => onSelect(idx)}
                disabled={isSubmitted}
                className={cn(
                  'w-full text-left p-4 rounded-lg border-2 transition-all',
                  !isSubmitted && !isSelected && 'border-gray-200 hover:border-teal-400 hover:bg-teal-50',
                  !isSubmitted && isSelected && 'border-teal-400 bg-teal-50',
                  showResult && isSelected && isCorrect && 'border-green-500 bg-green-50',
                  showResult && isSelected && !isCorrect && 'border-red-500 bg-red-50',
                  showResult && !isSelected && isCorrect && 'border-green-500 bg-green-50',
                  showResult && !isSelected && !isCorrect && 'border-gray-200 opacity-60',
                )}
              >
                <div className="flex items-center gap-3">
                  <span className={cn(
                    'w-8 h-8 rounded-full flex items-center justify-center text-sm font-bold flex-shrink-0',
                    !isSubmitted && !isSelected && 'bg-gray-100 text-gray-600',
                    !isSubmitted && isSelected && 'bg-teal-400 text-white',
                    showResult && isSelected && isCorrect && 'bg-green-500 text-white',
                    showResult && isSelected && !isCorrect && 'bg-red-500 text-white',
                    showResult && !isSelected && isCorrect && 'bg-green-500 text-white',
                    showResult && !isSelected && !isCorrect && 'bg-gray-100 text-gray-400',
                  )}>
                    {String.fromCharCode(65 + idx)}
                  </span>
                  <span className={cn(
                    'text-sm',
                    showResult && !isSelected && !isCorrect && 'text-gray-400',
                  )}>
                    {typeof option === 'string' ? option : JSON.stringify(option)}
                  </span>
                </div>
              </button>
            );
          })}
        </div>
      </div>
    );
  }

  if (question.question_type === 'fill_in_blank') {
    return (
      <div className="space-y-3">
        <p className="text-lg font-medium text-zinc-900 leading-relaxed">{question.stem}</p>
        <input
          type="text"
          value={typeof selectedAnswer === 'string' ? selectedAnswer : ''}
          onChange={e => onSelect(e.target.value)}
          disabled={isSubmitted}
          placeholder="Type your answer..."
          className={cn(
            'w-full p-4 rounded-lg border-2 text-lg focus:outline-none transition-colors',
            !isSubmitted && 'border-gray-200 focus:border-teal-400',
            isSubmitted && String(selectedAnswer).toLowerCase().trim() === String(question.correct_answer).toLowerCase().trim() && 'border-green-500 bg-green-50',
            isSubmitted && String(selectedAnswer).toLowerCase().trim() !== String(question.correct_answer).toLowerCase().trim() && 'border-red-500 bg-red-50',
          )}
        />
      </div>
    );
  }

  return <p className="text-gray-500">Unsupported question type: {question.question_type}</p>;
}
