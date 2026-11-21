import { cn } from '@/lib/utils';
import { parseOptionsList, resolveCorrectOptionIndex } from '@/lib/grading';
import type { Question } from '@/types/curriculum';

interface QuestionCardProps {
  question: Question;
  selectedAnswer: number | string | null;
  isSubmitted: boolean;
  isCorrectResult?: boolean | null;
  onSelect: (answer: number | string) => void;
}

export default function QuestionCard({
  question,
  selectedAnswer,
  isSubmitted,
  isCorrectResult,
  onSelect,
}: QuestionCardProps) {
  const optionsList = parseOptionsList(question.options);
  const correctOptionIndex = resolveCorrectOptionIndex(question.correct_answer, optionsList);

  const diagramBlock = question.diagram_url ? (
    <div className="my-3 rounded-xl border border-slate-200 bg-slate-50 p-3 flex justify-center">
      <img
        src={question.diagram_url}
        alt="Question diagram"
        className="max-h-64 w-auto object-contain rounded-lg"
      />
    </div>
  ) : null;

  if (question.question_type === 'multiple_choice' && optionsList.length > 0) {
    return (
      <div className="space-y-4">
        <p className="text-lg font-semibold text-navy-900 leading-relaxed">{question.stem}</p>
        {diagramBlock}
        <div className="space-y-2.5">
          {optionsList.map((option, idx) => {
            const isSelected = selectedAnswer === idx;
            const isCorrect = correctOptionIndex === idx;
            const showResult = isSubmitted;

            return (
              <button
                key={idx}
                type="button"
                onClick={() => onSelect(idx)}
                disabled={isSubmitted}
                className={cn(
                  'w-full text-left p-4 rounded-xl border-2 transition-all',
                  !isSubmitted && !isSelected && 'border-slate-200 hover:border-indigo-400 hover:bg-indigo-50/50',
                  !isSubmitted && isSelected && 'border-indigo-600 bg-indigo-50/70 shadow-sm',
                  showResult && isCorrect && 'border-green-500 bg-green-50',
                  showResult && isSelected && !isCorrect && 'border-red-500 bg-red-50',
                  showResult && !isSelected && !isCorrect && 'border-slate-200 opacity-60'
                )}
              >
                <div className="flex items-center gap-3.5">
                  <span
                    className={cn(
                      'w-8 h-8 rounded-full flex items-center justify-center text-sm font-bold flex-shrink-0',
                      !isSubmitted && !isSelected && 'bg-slate-100 text-slate-700',
                      !isSubmitted && isSelected && 'bg-indigo-600 text-white',
                      showResult && isCorrect && 'bg-green-600 text-white',
                      showResult && isSelected && !isCorrect && 'bg-red-600 text-white',
                      showResult && !isSelected && !isCorrect && 'bg-slate-100 text-slate-400'
                    )}
                  >
                    {String.fromCharCode(65 + idx)}
                  </span>
                  <span
                    className={cn(
                      'text-sm sm:text-base font-medium text-slate-800',
                      showResult && !isSelected && !isCorrect && 'text-slate-400'
                    )}
                  >
                    {option}
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
    const isCorrect = Boolean(isCorrectResult);
    return (
      <div className="space-y-4">
        <p className="text-lg font-semibold text-navy-900 leading-relaxed">{question.stem}</p>
        {diagramBlock}
        <input
          type="text"
          value={typeof selectedAnswer === 'string' ? selectedAnswer : ''}
          onChange={(e) => onSelect(e.target.value)}
          disabled={isSubmitted}
          placeholder="Type your answer..."
          className={cn(
            'w-full p-4 rounded-xl border-2 text-base sm:text-lg focus:outline-none transition-colors',
            !isSubmitted && 'border-slate-200 focus:border-indigo-600 bg-white',
            isSubmitted && isCorrect && 'border-green-500 bg-green-50 text-green-900',
            isSubmitted && !isCorrect && 'border-red-500 bg-red-50 text-red-900'
          )}
        />
      </div>
    );
  }

  return (
    <div className="space-y-3">
      <p className="text-lg font-semibold text-navy-900 leading-relaxed">{question.stem}</p>
      {diagramBlock}
      <p className="text-sm text-amber-700 bg-amber-50 border border-amber-200 rounded-xl p-4">
        This question format ({question.question_type}) is not supported interactively on this screen.
      </p>
    </div>
  );
}
