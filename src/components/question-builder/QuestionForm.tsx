import { useState } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Select from '@/components/ui/Select';
import type { Question } from '@/types/curriculum';

interface QuestionFormProps {
  initialData?: Question | null;
  onSave: (data: Record<string, unknown>) => void;
  onCancel: () => void;
}

export default function QuestionForm({ initialData, onSave, onCancel }: QuestionFormProps) {
  const [questionType, setQuestionType] = useState<string>(initialData?.question_type || 'multiple_choice');
  const [stem, setStem] = useState(initialData?.stem || '');
  const [options, setOptions] = useState<string[]>(
    Array.isArray(initialData?.options) ? (initialData.options as string[]) : ['', '', '', '']
  );
  const [correctIdx, setCorrectIdx] = useState<number>(
    typeof initialData?.correct_answer === 'number' ? initialData.correct_answer : 0
  );
  const [fillInAnswer, setFillInAnswer] = useState<string>(
    typeof initialData?.correct_answer === 'string' 
      ? initialData.correct_answer 
      : Array.isArray(initialData?.correct_answer) 
        ? initialData.correct_answer.join(', ')
        : ''
  );
  const [explanation, setExplanation] = useState(initialData?.explanation || '');
  const [hints, setHints] = useState<string[]>(initialData?.hints || []);
  const [hintInput, setHintInput] = useState('');
  const [difficulty, setDifficulty] = useState<string>(initialData?.difficulty || 'core');
  const [bloomsLevel, setBloomsLevel] = useState<string>(initialData?.blooms_level || 'recall');
  const [visibility, setVisibility] = useState<string>(initialData?.visibility || 'private');

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    const data: Record<string, unknown> = {
      question_type: questionType,
      stem,
      explanation,
      hints: hints.length > 0 ? hints : null,
      difficulty,
      blooms_level: bloomsLevel,
      visibility,
      diagram_url: null,
    };

    if (questionType === 'multiple_choice') {
      data.options = options;
      data.correct_answer = correctIdx;
    } else if (questionType === 'fill_in_blank') {
      data.options = null;
      // Pass as a JSON array to ensure PostgREST doesn't fail parsing raw strings into JSONB
      data.correct_answer = fillInAnswer.split(',').map(s => s.trim()).filter(Boolean);
    } else {
      data.options = options;
      data.correct_answer = correctIdx;
    }

    onSave(data);
  };

  const addHint = () => {
    if (hintInput.trim()) {
      setHints([...hints, hintInput.trim()]);
      setHintInput('');
    }
  };

  const removeHint = (idx: number) => {
    setHints(hints.filter((_, i) => i !== idx));
  };

  return (
    <Card>
      <CardHeader>
        <h2 className="font-semibold text-zinc-900">
          {initialData ? 'Edit Question' : 'New Question'}
        </h2>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          {/* Question type */}
          <Select
            label="Question Type"
            value={questionType}
            options={[
              { value: 'multiple_choice', label: 'Multiple Choice (MCQ)' },
              { value: 'fill_in_blank', label: 'Fill in the Blank' },
            ]}
            onChange={(e) => setQuestionType(e.target.value)}
          />

          {/* Stem */}
          <div>
            <label className="block text-sm font-medium text-navy-700 mb-1.5">
              Question Stem
            </label>
            <textarea
              value={stem}
              onChange={(e) => setStem(e.target.value)}
              placeholder="Enter the question..."
              required
              rows={3}
              className="w-full rounded-lg border border-gray-300 bg-white px-4 py-2.5 text-sm text-zinc-900 placeholder:text-gray-400 focus:border-teal-400 focus:outline-none focus:ring-2 focus:ring-teal-400/20 transition-colors resize-y"
            />
          </div>

          {/* MCQ options */}
          {questionType === 'multiple_choice' && (
            <div className="space-y-2">
              <label className="block text-sm font-medium text-navy-700">
                Answer Options
              </label>
              {options.map((opt, i) => (
                <div key={i} className="flex items-center gap-2">
                  <input
                    type="radio"
                    name="correct"
                    checked={correctIdx === i}
                    onChange={() => setCorrectIdx(i)}
                    className="w-4 h-4 text-zinc-900"
                    title="Mark as correct answer"
                  />
                  <span className="text-xs font-medium text-gray-500 w-6">
                    {String.fromCharCode(65 + i)}
                  </span>
                  <Input
                    value={opt}
                    onChange={(e) => {
                      const next = [...options];
                      next[i] = e.target.value;
                      setOptions(next);
                    }}
                    placeholder={`Option ${String.fromCharCode(65 + i)}`}
                    required
                  />
                </div>
              ))}
              <p className="text-xs text-gray-500">
                Select the radio button next to the correct answer
              </p>
            </div>
          )}

          {/* Fill-in-blank answer */}
          {questionType === 'fill_in_blank' && (
            <div>
              <Input
                label="Correct Answer"
                value={fillInAnswer}
                onChange={(e) => setFillInAnswer(e.target.value)}
                placeholder="e.g. high low, higher lower"
                required
              />
              <p className="text-xs text-gray-500 mt-1">
                You can provide multiple acceptable answers separated by commas (e.g. <span className="font-mono bg-gray-100 px-1 py-0.5 rounded">high low, higher lower</span>).
              </p>
            </div>
          )}

          {/* Explanation */}
          <div>
            <label className="block text-sm font-medium text-navy-700 mb-1.5">
              Explanation <span className="text-red-400">*</span>
            </label>
            <textarea
              value={explanation}
              onChange={(e) => setExplanation(e.target.value)}
              placeholder="Shown when the learner gets it wrong. Explain the correct concept..."
              required
              rows={2}
              className="w-full rounded-lg border border-gray-300 bg-white px-4 py-2.5 text-sm text-zinc-900 placeholder:text-gray-400 focus:border-teal-400 focus:outline-none focus:ring-2 focus:ring-teal-400/20 transition-colors resize-y"
            />
          </div>

          {/* Hints */}
          <div>
            <label className="block text-sm font-medium text-navy-700 mb-1.5">
              Hints (optional, progressive)
            </label>
            {hints.length > 0 && (
              <div className="space-y-1 mb-2">
                {hints.map((hint, i) => (
                  <div key={i} className="flex items-center gap-2 text-sm">
                    <span className="text-xs text-gray-400">{i + 1}.</span>
                    <span className="flex-1 text-navy-700">{hint}</span>
                    <button
                      type="button"
                      onClick={() => removeHint(i)}
                      className="text-red-400 hover:text-red-600 text-xs"
                    >
                      Remove
                    </button>
                  </div>
                ))}
              </div>
            )}
            <div className="flex gap-2">
              <Input
                value={hintInput}
                onChange={(e) => setHintInput(e.target.value)}
                placeholder="Add a hint..."
                onKeyDown={(e) => {
                  if (e.key === 'Enter') {
                    e.preventDefault();
                    addHint();
                  }
                }}
              />
              <Button type="button" variant="outline" size="sm" onClick={addHint}>
                Add
              </Button>
            </div>
          </div>

          {/* Metadata row */}
          <div className="grid grid-cols-3 gap-4">
            <Select
              label="Difficulty"
              value={difficulty}
              options={[
                { value: 'easy', label: 'Easy' },
                { value: 'core', label: 'Core' },
                { value: 'bece_level', label: 'BECE Level' },
              ]}
              onChange={(e) => setDifficulty(e.target.value)}
            />
            <Select
              label="Bloom's Level"
              value={bloomsLevel}
              options={[
                { value: 'recall', label: 'Recall' },
                { value: 'application', label: 'Application' },
                { value: 'analysis', label: 'Analysis' },
              ]}
              onChange={(e) => setBloomsLevel(e.target.value)}
            />
            <Select
              label="Visibility"
              value={visibility}
              options={[
                { value: 'private', label: 'Private (only me)' },
                { value: 'school', label: 'School (my school)' },
                { value: 'shared', label: 'Shared (all teachers)' },
              ]}
              onChange={(e) => setVisibility(e.target.value)}
            />
          </div>

          {/* Actions */}
          <div className="flex gap-3 pt-2">
            <Button type="submit" className="flex-1">
              {initialData ? 'Update Question' : 'Save Question'}
            </Button>
            <Button type="button" variant="outline" onClick={onCancel}>
              Cancel
            </Button>
          </div>
        </form>
      </CardContent>
    </Card>
  );
}
