import { Card, CardContent } from '@/components/ui/Card';
import type { Question } from '@/types/curriculum';
import {
  parseOptionsList,
  resolveCorrectOptionIndex,
  formatCorrectAnswerDisplay,
} from '@/lib/grading';

interface QuestionPreviewProps {
  question: Question;
}

export default function QuestionPreview({ question }: QuestionPreviewProps) {
  const options = parseOptionsList(question.options);
  const correctIndex = resolveCorrectOptionIndex(question.correct_answer, options);

  return (
    <Card className="border-slate-200 shadow-none">
      <CardContent className="p-5 space-y-4">
        <div className="flex flex-wrap items-center gap-2">
          <span className="text-xs px-2.5 py-0.5 rounded-full bg-indigo-50 text-indigo-700 font-medium">
            {question.question_type === 'multiple_choice'
              ? 'MCQ'
              : question.question_type === 'fill_in_blank'
                ? 'Fill-in'
                : question.question_type}
          </span>
          <span className="text-xs px-2.5 py-0.5 rounded-full bg-slate-100 text-slate-600">
            {question.difficulty}
          </span>
          <span className="text-xs px-2.5 py-0.5 rounded-full bg-slate-100 text-slate-600">
            {question.blooms_level}
          </span>
          <span
            className={`text-xs px-2.5 py-0.5 rounded-full font-medium ${
              question.visibility === 'shared'
                ? 'bg-emerald-50 text-emerald-700'
                : question.visibility === 'school'
                  ? 'bg-indigo-50 text-indigo-700'
                  : 'bg-slate-100 text-slate-600'
            }`}
          >
            {question.visibility}
          </span>
        </div>

        <p className="text-base font-semibold text-navy-900 leading-relaxed">{question.stem}</p>

        {question.question_type === 'multiple_choice' && options.length > 0 && (
          <div className="space-y-2">
            {options.map((opt, idx) => {
              const isCorrect = correctIndex === idx;
              return (
                <div
                  key={idx}
                  className={`flex items-center gap-3 p-3 rounded-xl border ${
                    isCorrect
                      ? 'border-emerald-300 bg-emerald-50'
                      : 'border-slate-200 bg-white'
                  }`}
                >
                  <span
                    className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold flex-shrink-0 ${
                      isCorrect ? 'bg-emerald-500 text-white' : 'bg-slate-100 text-slate-600'
                    }`}
                  >
                    {String.fromCharCode(65 + idx)}
                  </span>
                  <span className={`text-sm flex-1 ${isCorrect ? 'font-medium text-emerald-900' : 'text-navy-800'}`}>
                    {opt}
                  </span>
                  {isCorrect && (
                    <span className="ml-auto text-xs font-semibold text-emerald-700">Correct</span>
                  )}
                </div>
              );
            })}
          </div>
        )}

        {question.question_type === 'fill_in_blank' && (
          <div className="p-3.5 rounded-xl border border-emerald-200 bg-emerald-50">
            <p className="text-xs font-semibold text-emerald-700 mb-1">Accepted Answer(s):</p>
            <p className="text-sm font-medium text-emerald-900">
              {formatCorrectAnswerDisplay(question)}
            </p>
          </div>
        )}

        <div className="p-3.5 rounded-xl bg-indigo-50/70 border border-indigo-100">
          <p className="text-xs font-semibold text-indigo-700 mb-1">Explanation (shown on incorrect attempt):</p>
          <p className="text-sm text-navy-800">{question.explanation}</p>
        </div>

        {question.hints && question.hints.length > 0 && (
          <div className="space-y-1.5 bg-amber-50/70 border border-amber-100 p-3.5 rounded-xl">
            <p className="text-xs font-semibold text-amber-700">Hints (progressive):</p>
            {question.hints.map((hint, i) => (
              <div key={i} className="flex items-start gap-2 text-sm text-amber-900">
                <span className="text-xs font-semibold text-amber-500 mt-0.5">{i + 1}.</span>
                <span>{hint}</span>
              </div>
            ))}
          </div>
        )}
      </CardContent>
    </Card>
  );
}
