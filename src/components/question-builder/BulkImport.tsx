import { useState, useRef, useEffect } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Select from '@/components/ui/Select';
import { Upload, FileText, AlertTriangle, CheckCircle, Trash2, ArrowRight } from 'lucide-react';
import { toast } from '@/stores/toastStore';
import type { Topic } from '@/types/curriculum';

interface ParsedQuestion {
  stem: string;
  options: string[];
  correct_answer: number;
  explanation: string;
  difficulty: 'easy' | 'core' | 'bece_level';
  blooms_level: 'recall' | 'application' | 'analysis';
  valid: boolean;
  errors: string[];
}

interface BulkImportProps {
  topics: Topic[];
  defaultTopicId?: string;
  onImport: (
    questions: {
      topic_id: string;
      question_type: string;
      stem: string;
      options: string[];
      correct_answer: number;
      explanation: string;
      difficulty: string;
      blooms_level: string;
      visibility: string;
    }[]
  ) => Promise<void>;
  onCancel: () => void;
}

function parseTextFormat(text: string): ParsedQuestion[] {
  const questions: ParsedQuestion[] = [];
  const blocks = text.split(/\n\s*\n/).filter((b) => b.trim());

  for (const block of blocks) {
    const lines = block.split('\n').map((l) => l.trim()).filter(Boolean);
    const optionSlots: (string | undefined)[] = [undefined, undefined, undefined, undefined];
    let hasAnswer = false;
    let rawAnswerIdx = -1;

    const question: ParsedQuestion = {
      stem: '',
      options: [],
      correct_answer: -1,
      explanation: '',
      difficulty: 'core',
      blooms_level: 'recall',
      valid: true,
      errors: [],
    };

    for (const line of lines) {
      const qMatch = line.match(/^Q:\s*(.+)/i);
      const aMatch = line.match(/^A:\s*(.+)/i);
      const bMatch = line.match(/^B:\s*(.+)/i);
      const cMatch = line.match(/^C:\s*(.+)/i);
      const dMatch = line.match(/^D:\s*(.+)/i);
      const ansMatch = line.match(/^Answer:\s*([A-Da-d])\s*$/i);
      const expMatch = line.match(/^Explanation:\s*(.+)/i);
      const diffMatch = line.match(/^Difficulty:\s*(easy|core|bece_level)/i);
      const bloomMatch = line.match(/^Bloom(?:'s)?:\s*(recall|application|analysis)/i);

      if (qMatch) question.stem = qMatch[1].trim();
      else if (aMatch) optionSlots[0] = aMatch[1].trim();
      else if (bMatch) optionSlots[1] = bMatch[1].trim();
      else if (cMatch) optionSlots[2] = cMatch[1].trim();
      else if (dMatch) optionSlots[3] = dMatch[1].trim();
      else if (ansMatch) {
        hasAnswer = true;
        rawAnswerIdx = ansMatch[1].toUpperCase().charCodeAt(0) - 65;
      } else if (expMatch) question.explanation = expMatch[1].trim();
      else if (diffMatch) question.difficulty = diffMatch[1].toLowerCase() as 'easy' | 'core' | 'bece_level';
      else if (bloomMatch) question.blooms_level = bloomMatch[1].toLowerCase() as 'recall' | 'application' | 'analysis';
    }

    // Compact options while preserving positions to detect skipped letters
    const filledIndices = optionSlots
      .map((val, idx) => (val ? idx : -1))
      .filter((idx) => idx !== -1);
    const hasGap = filledIndices.some((idx, pos) => idx !== pos);
    question.options = optionSlots.filter((v): v is string => Boolean(v));
    question.correct_answer = rawAnswerIdx;

    if (!question.stem) {
      question.valid = false;
      question.errors.push('Missing question stem (Q:)');
    }
    if (hasGap) {
      question.valid = false;
      question.errors.push('Options must be sequential (A, B, C, D) without gaps');
    } else if (question.options.length < 2) {
      question.valid = false;
      question.errors.push('Need at least 2 options (A:, B:)');
    }
    if (!hasAnswer || rawAnswerIdx < 0 || rawAnswerIdx >= optionSlots.length || !optionSlots[rawAnswerIdx]) {
      question.valid = false;
      question.errors.push('Missing or invalid Answer: (must match an option letter A–D)');
    }
    if (!question.explanation) {
      question.valid = false;
      question.errors.push('Missing explanation (Explanation:)');
    }

    questions.push(question);
  }

  return questions;
}

export default function BulkImport({ topics, defaultTopicId, onImport, onCancel }: BulkImportProps) {
  const [selectedTopicId, setSelectedTopicId] = useState(defaultTopicId || topics[0]?.id || '');
  const [rawText, setRawText] = useState('');
  const [parsed, setParsed] = useState<ParsedQuestion[]>([]);
  const [step, setStep] = useState<'input' | 'preview' | 'importing' | 'done'>('input');
  const [importCount, setImportCount] = useState(0);
  const fileInputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (defaultTopicId && topics.some((t) => t.id === defaultTopicId)) {
      setSelectedTopicId(defaultTopicId);
    } else if (!selectedTopicId && topics.length > 0) {
      setSelectedTopicId(topics[0].id);
    }
  }, [defaultTopicId, topics, selectedTopicId]);

  const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    const text = await file.text();
    setRawText(text);
  };

  const handleParse = () => {
    const questions = parseTextFormat(rawText);
    setParsed(questions);
    setStep('preview');
  };

  const handleRemoveQuestion = (idx: number) => {
    setParsed((prev) => prev.filter((_, i) => i !== idx));
  };

  const handleImport = async () => {
    if (!selectedTopicId) {
      toast.error('Please select a target topic.');
      return;
    }
    setStep('importing');
    const validQuestions = parsed.filter((q) => q.valid);
    try {
      await onImport(
        validQuestions.map((q) => ({
          topic_id: selectedTopicId,
          question_type: 'multiple_choice',
          stem: q.stem,
          options: q.options,
          correct_answer: q.correct_answer,
          explanation: q.explanation,
          difficulty: q.difficulty,
          blooms_level: q.blooms_level,
          visibility: 'private',
        }))
      );
      setImportCount(validQuestions.length);
      setStep('done');
    } catch (err) {
      console.error('Import failed:', err);
      toast.error('Import failed. Please check the questions and try again.');
      setStep('preview');
    }
  };

  const validCount = parsed.filter((q) => q.valid).length;
  const invalidCount = parsed.length - validCount;

  if (step === 'done') {
    return (
      <Card>
        <CardContent className="p-8 text-center">
          <CheckCircle className="w-12 h-12 mx-auto mb-4 text-emerald-500" />
          <h2 className="text-xl font-bold text-navy-900 mb-2">Import Complete</h2>
          <p className="text-slate-500 mb-6">
            Successfully imported {importCount} question{importCount !== 1 ? 's' : ''}.
          </p>
          <Button onClick={onCancel}>Done</Button>
        </CardContent>
      </Card>
    );
  }

  return (
    <div className="space-y-6">
      <div className="w-full sm:w-80">
        <Select
          label="Import into Topic"
          value={selectedTopicId}
          options={topics.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` }))}
          onChange={(e) => setSelectedTopicId(e.target.value)}
        />
      </div>

      {step === 'input' && (
        <Card>
          <CardHeader>
            <h2 className="font-semibold text-navy-900">Bulk Import Questions</h2>
          </CardHeader>
          <CardContent className="space-y-4">
            <div>
              <p className="text-sm text-slate-600 mb-2.5">
                Paste questions in this format (separate each question with a blank line):
              </p>
              <pre className="text-xs bg-slate-50 p-3.5 rounded-xl border border-slate-200 text-slate-600 overflow-x-auto">
{`Q: Which of the following is a contact force?
A: Gravity
B: Magnetic force
C: Friction
D: Electric force
Answer: C
Explanation: Friction acts when two surfaces are in direct physical contact.
Difficulty: easy
Bloom: recall`}
              </pre>
            </div>

            <div>
              <label className="block text-sm font-medium text-navy-800 mb-1.5">
                Paste questions or upload a file
              </label>
              <textarea
                value={rawText}
                onChange={(e) => setRawText(e.target.value)}
                placeholder="Paste your formatted questions here..."
                rows={12}
                className="w-full rounded-lg border border-slate-300 bg-white px-4 py-2.5 text-sm text-navy-900 placeholder:text-slate-400 focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 transition-colors resize-y font-mono"
              />
            </div>

            <div className="flex items-center gap-3">
              <input
                ref={fileInputRef}
                type="file"
                accept=".txt,.md"
                onChange={handleFileUpload}
                className="hidden"
              />
              <Button
                type="button"
                variant="outline"
                size="sm"
                onClick={() => fileInputRef.current?.click()}
              >
                <Upload className="w-4 h-4 mr-2" />
                Upload File
              </Button>
              <span className="text-xs text-slate-400">.txt or .md</span>
            </div>

            <div className="flex gap-3">
              <Button type="button" onClick={handleParse} disabled={!rawText.trim()}>
                <FileText className="w-4 h-4 mr-2" />
                Parse Questions
              </Button>
              <Button type="button" variant="outline" onClick={onCancel}>
                Cancel
              </Button>
            </div>
          </CardContent>
        </Card>
      )}

      {step === 'preview' && (
        <div className="space-y-4">
          <div className="flex flex-wrap items-center justify-between gap-3">
            <div className="flex items-center gap-3">
              <span className="text-sm font-semibold text-navy-900">
                {parsed.length} question{parsed.length !== 1 ? 's' : ''} parsed
              </span>
              {validCount > 0 && (
                <span className="text-xs px-2.5 py-0.5 bg-emerald-50 text-emerald-700 font-medium rounded-full">
                  {validCount} valid
                </span>
              )}
              {invalidCount > 0 && (
                <span className="text-xs px-2.5 py-0.5 bg-rose-50 text-rose-700 font-medium rounded-full">
                  {invalidCount} invalid
                </span>
              )}
            </div>
            <div className="flex gap-2">
              <Button variant="outline" size="sm" onClick={() => { setStep('input'); setParsed([]); }}>
                Back
              </Button>
              <Button size="sm" onClick={handleImport} disabled={validCount === 0}>
                <ArrowRight className="w-4 h-4 mr-1" />
                Import {validCount} Question{validCount !== 1 ? 's' : ''}
              </Button>
            </div>
          </div>

          <Card>
            <CardContent className="p-0">
              <div className="divide-y divide-slate-100">
                {parsed.map((q, i) => (
                  <div key={i} className={`px-4 py-3.5 ${!q.valid ? 'bg-rose-50/50' : ''}`}>
                    <div className="flex items-start gap-3">
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 mb-1">
                          <span className="text-xs font-semibold text-slate-400">Q{i + 1}</span>
                          {q.valid ? (
                            <CheckCircle className="w-3.5 h-3.5 text-emerald-500" />
                          ) : (
                            <AlertTriangle className="w-3.5 h-3.5 text-rose-500" />
                          )}
                        </div>
                        <p className="text-sm font-medium text-navy-900 line-clamp-2">{q.stem || '(no stem)'}</p>
                        {q.options.length > 0 && (
                          <div className="flex flex-wrap gap-1.5 mt-1.5">
                            {q.options.map((opt, j) => (
                              <span
                                key={j}
                                className={`text-xs px-2 py-0.5 rounded ${
                                  j === q.correct_answer
                                    ? 'bg-emerald-50 text-emerald-700 font-medium'
                                    : 'bg-slate-100 text-slate-600'
                                }`}
                              >
                                {String.fromCharCode(65 + j)}: {opt}
                              </span>
                            ))}
                          </div>
                        )}
                        {q.errors.length > 0 && (
                          <div className="mt-1.5 space-y-0.5">
                            {q.errors.map((err, j) => (
                              <p key={j} className="text-xs text-rose-600">{err}</p>
                            ))}
                          </div>
                        )}
                      </div>
                      <button
                        type="button"
                        onClick={() => handleRemoveQuestion(i)}
                        className="p-1 text-slate-400 hover:text-rose-600 rounded"
                        aria-label={`Remove question ${i + 1}`}
                      >
                        <Trash2 className="w-4 h-4" />
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </div>
      )}

      {step === 'importing' && (
        <Card>
          <CardContent className="p-8 text-center">
            <div className="animate-spin w-8 h-8 border-2 border-indigo-600 border-t-transparent rounded-full mx-auto mb-4" />
            <p className="text-slate-600 text-sm">Importing questions...</p>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
