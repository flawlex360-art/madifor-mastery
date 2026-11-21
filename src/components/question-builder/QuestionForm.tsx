import { useState } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Select from '@/components/ui/Select';
import type { Question } from '@/types/curriculum';
import { parseOptionsList, resolveCorrectOptionIndex } from '@/lib/grading';
import { toast } from '@/stores/toastStore';

interface QuestionFormProps {
  initialData?: Question | null;
  onSave: (data: Record<string, unknown>) => void;
  onCancel: () => void;
}

function getInitialOptions(rawOptions: unknown): string[] {
  const parsed = parseOptionsList(rawOptions);
  const padded = [...parsed.slice(0, 4)];
  while (padded.length < 4) padded.push('');
  return padded;
}

function getInitialFillInAnswer(rawAnswer: unknown): string {
  if (typeof rawAnswer === 'string') return rawAnswer;
  if (Array.isArray(rawAnswer)) return rawAnswer.map((v) => String(v)).join(', ');
  return '';
}

export default function QuestionForm({ initialData, onSave, onCancel }: QuestionFormProps) {
  const [questionType, setQuestionType] = useState<string>(initialData?.question_type || 'multiple_choice');
  const [stem, setStem] = useState(initialData?.stem || '');
  const [options, setOptions] = useState<string[]>(() => getInitialOptions(initialData?.options));
  const [correctIdx, setCorrectIdx] = useState<number>(() => {
    const parsedOpts = parseOptionsList(initialData?.options);
    const resolved = resolveCorrectOptionIndex(initialData?.correct_answer, parsedOpts);
    return resolved ?? 0;
  });
  const [fillInAnswer, setFillInAnswer] = useState<string>(() =>
    getInitialFillInAnswer(initialData?.correct_answer)
  );
  const [explanation, setExplanation] = useState(initialData?.explanation || '');
  const [hints, setHints] = useState<string[]>(initialData?.hints || []);
  const [hintInput, setHintInput] = useState('');
  const [difficulty, setDifficulty] = useState<string>(initialData?.difficulty || 'core');
  const [bloomsLevel, setBloomsLevel] = useState<string>(initialData?.blooms_level || 'recall');
  const [visibility, setVisibility] = useState<string>(initialData?.visibility || 'private');

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    if (!stem.trim()) {
      toast.error('Please enter a question stem.');
      return;
    }

    if (!explanation.trim()) {
      toast.error('Please enter an explanation.');
      return;
    }

    const data: Record<string, unknown> = {
      question_type: questionType,
      stem: stem.trim(),
      explanation: explanation.trim(),
      hints: hints.length > 0 ? hints : null,
      difficulty,
      blooms_level: bloomsLevel,
      visibility,
      diagram_url: initialData?.diagram_url ?? null,
    };

    if (questionType === 'multiple_choice') {
      const cleanedOptions = options.map((o) => o.trim());
      if (cleanedOptions.some((o) => !o)) {
        toast.error('Please fill in all four MCQ options.');
        return;
      }
      data.options = cleanedOptions;
      data.correct_answer = correctIdx;
    } else if (questionType === 'fill_in_blank') {
      const acceptedAnswers = fillInAnswer
        .split(',')
        .map((s) => s.trim())
        .filter(Boolean);
      if (acceptedAnswers.length === 0) {
        toast.error('Please enter at least one accepted answer.');
        return;
      }
      data.options = null;
      data.correct_answer = acceptedAnswers;
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
    <Card className="border-slate-200 shadow-none">
      <CardHeader className="pb-3">
        <h2 className="font-semibold text-navy-900">
          {initialData ? 'Edit Question' : 'New Question'}
        </h2>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          <Select
            label="Question Type"
            value={questionType}
            options={[
              { value: 'multiple_choice', label: 'Multiple Choice (MCQ)' },
              { value: 'fill_in_blank', label: 'Fill in the Blank' },
            ]}
            onChange={(e) => setQuestionType(e.target.value)}
          />

          <div>
            <label className="block text-sm font-medium text-navy-800 mb-1.5">
              Question Stem <span className="text-rose-500">*</span>
            </label>
            <textarea
              value={stem}
              onChange={(e) => setStem(e.target.value)}
              placeholder="Enter the question..."
              required
              rows={3}
              className="w-full rounded-lg border border-slate-300 bg-white px-4 py-2.5 text-sm text-navy-900 placeholder:text-slate-400 focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 transition-colors resize-y"
            />
          </div>

          {questionType === 'multiple_choice' && (
            <div className="space-y-2.5">
              <label className="block text-sm font-medium text-navy-800">
                Answer Options
              </label>
              {options.map((opt, i) => (
                <div key={i} className="flex items-center gap-2.5">
                  <input
                    type="radio"
                    name="correct"
                    checked={correctIdx === i}
                    onChange={() => setCorrectIdx(i)}
                    className="w-4 h-4 text-indigo-600 focus:ring-indigo-500"
                    title="Mark as correct answer"
                  />
                  <span className="text-xs font-semibold text-slate-500 w-5">
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
              <p className="text-xs text-slate-500">
                Select the radio button next to the correct option.
              </p>
            </div>
          )}

          {questionType === 'fill_in_blank' && (
            <div>
              <Input
                label="Accepted Answers"
                value={fillInAnswer}
                onChange={(e) => setFillInAnswer(e.target.value)}
                placeholder="e.g. photosynthesis, chloroplast"
                required
              />
              <p className="text-xs text-slate-500 mt-1">
                Separate multiple acceptable variations with commas (case-insensitive grading).
              </p>
            </div>
          )}

          <div>
            <label className="block text-sm font-medium text-navy-800 mb-1.5">
              Explanation <span className="text-rose-500">*</span>
            </label>
            <textarea
              value={explanation}
              onChange={(e) => setExplanation(e.target.value)}
              placeholder="Shown when the learner answers incorrectly. Explain the key concept..."
              required
              rows={2}
              className="w-full rounded-lg border border-slate-300 bg-white px-4 py-2.5 text-sm text-navy-900 placeholder:text-slate-400 focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 transition-colors resize-y"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-navy-800 mb-1.5">
              Hints (optional, progressive)
            </label>
            {hints.length > 0 && (
              <div className="space-y-1.5 mb-2">
                {hints.map((hint, i) => (
                  <div key={i} className="flex items-center gap-2 text-sm bg-slate-50 px-3 py-1.5 rounded-lg">
                    <span className="text-xs text-slate-400 font-semibold">{i + 1}.</span>
                    <span className="flex-1 text-navy-800">{hint}</span>
                    <button
                      type="button"
                      onClick={() => removeHint(i)}
                      className="text-rose-500 hover:text-rose-700 text-xs font-medium"
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
                placeholder="Add a progressive hint..."
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

          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
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
