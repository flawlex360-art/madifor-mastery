import { Card, CardContent } from '@/components/ui/Card';
import type { Question } from '@/types/curriculum';

interface QuestionPreviewProps {
  question: Question;
}

export default function QuestionPreview({ question }: QuestionPreviewProps) {
  return (
    <Card>
      <CardContent className="p-6 space-y-4">
        {/* Metadata badges */}
        <div className="flex items-center gap-2">
          <span className="text-xs px-2 py-0.5 rounded-full bg-teal-100 text-teal-700 font-medium">
            {question.question_type === 'multiple_choice' ? 'MCQ' : question.question_type === 'fill_in_blank' ? 'Fill-in' : question.question_type}
          </span>
          <span className="text-xs px-2 py-0.5 rounded-full bg-gray-100 text-gray-600">
            {question.difficulty}
          </span>
          <span className="text-xs px-2 py-0.5 rounded-full bg-gray-100 text-gray-600">
            {question.blooms_level}
          </span>
          <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${
            question.visibility === 'shared' ? 'bg-green-100 text-green-700'
              : question.visibility === 'school' ? 'bg-blue-100 text-blue-700'
              : 'bg-gray-100 text-gray-600'
          }`}>
            {question.visibility}
          </span>
        </div>

        {/* Question stem */}
        <p className="text-lg font-medium text-zinc-900 leading-relaxed">{question.stem}</p>

        {/* Answer options */}
        {question.question_type === 'multiple_choice' && Array.isArray(question.options) && (
          <div className="space-y-2">
            {(question.options as string[]).map((opt, idx) => {
              const isCorrect = Number(question.correct_answer) === idx;
              return (
                <div
                  key={idx}
                  className={`flex items-center gap-3 p-3 rounded-lg border ${
                    isCorrect
                      ? 'border-green-300 bg-green-50'
                      : 'border-gray-200 bg-white'
                  }`}
                >
                  <span className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold ${
                    isCorrect ? 'bg-green-500 text-white' : 'bg-gray-100 text-gray-600'
                  }`}>
                    {String.fromCharCode(65 + idx)}
                  </span>
                  <span className={`text-sm ${isCorrect ? 'font-medium text-green-800' : 'text-navy-700'}`}>
                    {opt}
                  </span>
                  {isCorrect && (
                    <span className="ml-auto text-xs font-medium text-green-600">Correct</span>
                  )}
                </div>
              );
            })}
          </div>
        )}

        {question.question_type === 'fill_in_blank' && (
          <div className="p-3 rounded-lg border border-green-300 bg-green-50">
            <p className="text-xs text-green-600 mb-1">Correct answer:</p>
            <p className="text-sm font-medium text-green-800">
              {String(question.correct_answer)}
            </p>
          </div>
        )}

        {/* Explanation */}
        <div className="p-3 rounded-lg bg-blue-50 border border-blue-200">
          <p className="text-xs font-medium text-blue-600 mb-1">Explanation (shown on wrong answer):</p>
          <p className="text-sm text-blue-800">{question.explanation}</p>
        </div>

        {/* Hints */}
        {question.hints && question.hints.length > 0 && (
          <div className="space-y-1">
            <p className="text-xs font-medium text-amber-600">Hints (progressive):</p>
            {question.hints.map((hint, i) => (
              <div key={i} className="flex items-start gap-2 text-sm text-amber-800">
                <span className="text-xs text-amber-400 mt-0.5">{i + 1}.</span>
                <span>{hint}</span>
              </div>
            ))}
          </div>
        )}
      </CardContent>
    </Card>
  );
}
