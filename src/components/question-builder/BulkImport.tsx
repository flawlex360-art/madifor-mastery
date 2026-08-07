import { useState, useRef } from 'react';
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
  onImport: (questions: { topic_id: string; question_type: string; stem: string; options: string[]; correct_answer: number; explanation: string; difficulty: string; blooms_level: string; visibility: string }[]) => Promise<void>;
  onCancel: () => void;
}

// Parse a simple text format:
// Q: question stem
// A: option A
// B: option B
// C: option C
// D: option D
// Answer: B
// Explanation: explanation text
function parseTextFormat(text: string): ParsedQuestion[] {
  const questions: ParsedQuestion[] = [];
  const blocks = text.split(/\n\s*\n/).filter((b) => b.trim());

  for (const block of blocks) {
    const lines = block.split('\n').map((l) => l.trim()).filter(Boolean);
    const question: ParsedQuestion = {
      stem: '',
      options: [],
      correct_answer: 0,
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
      const ansMatch = line.match(/^Answer:\s*([A-Da-d])/i);
      const expMatch = line.match(/^Explanation:\s*(.+)/i);
      const diffMatch = line.match(/^Difficulty:\s*(easy|core|bece_level)/i);
      const bloomMatch = line.match(/^Bloom(?:'s)?:\s*(recall|application|analysis)/i);

      if (qMatch) question.stem = qMatch[1].trim();
      else if (aMatch) question.options[0] = aMatch[1].trim();
      else if (bMatch) question.options[1] = bMatch[1].trim();
      else if (cMatch) question.options[2] = cMatch[1].trim();
      else if (dMatch) question.options[3] = dMatch[1].trim();
      else if (ansMatch) question.correct_answer = ansMatch[1].toUpperCase().charCodeAt(0) - 65;
      else if (expMatch) question.explanation = expMatch[1].trim();
      else if (diffMatch) question.difficulty = diffMatch[1].toLowerCase() as 'easy' | 'core' | 'bece_level';
      else if (bloomMatch) question.blooms_level = bloomMatch[1].toLowerCase() as 'recall' | 'application' | 'analysis';
    }

    // Validate
    if (!question.stem) {
      question.valid = false;
      question.errors.push('Missing question stem (Q:)');
    }
    if (question.options.filter(Boolean).length < 2) {
      question.valid = false;
      question.errors.push('Need at least 2 options (A:, B:)');
    }
    if (question.correct_answer < 0 || question.correct_answer > 3) {
      question.valid = false;
      question.errors.push('Invalid answer (must be A-D)');
    }
    if (!question.explanation) {
      question.valid = false;
      question.errors.push('Missing explanation');
    }

    questions.push(question);
  }

  return questions;
}

export default function BulkImport({ topics, onImport, onCancel }: BulkImportProps) {
  const [selectedTopicId, setSelectedTopicId] = useState(topics[0]?.id || '');
  const [rawText, setRawText] = useState('');
  const [parsed, setParsed] = useState<ParsedQuestion[]>([]);
  const [step, setStep] = useState<'input' | 'preview' | 'importing' | 'done'>('input');
  const [importCount, setImportCount] = useState(0);
  const fileInputRef = useRef<HTMLInputElement>(null);

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
      toast.error('Import failed. Please try again.');
      setStep('preview');
    }
  };

  const validCount = parsed.filter((q) => q.valid).length;
  const invalidCount = parsed.length - validCount;

  if (step === 'done') {
    return (
      <Card>
        <CardContent className="p-8 text-center">
          <CheckCircle className="w-12 h-12 mx-auto mb-4 text-green-500" />
          <h2 className="text-xl font-bold text-zinc-900 mb-2">Import Complete!</h2>
          <p className="text-gray-500 mb-6">
            Successfully imported {importCount} question{importCount !== 1 ? 's' : ''}.
          </p>
          <Button onClick={onCancel}>Done</Button>
        </CardContent>
      </Card>
    );
  }

  return (
    <div className="space-y-6">
      {/* Topic selector */}
      <div className="w-72">
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
            <h2 className="font-semibold text-zinc-900">Bulk Import Questions</h2>
          </CardHeader>
          <CardContent className="space-y-4">
            <div>
              <p className="text-sm text-gray-500 mb-3">
                Paste questions in this format (separate each question with a blank line):
              </p>
              <pre className="text-xs bg-gray-50 p-3 rounded-lg border text-gray-600 overflow-x-auto">
{`Q: Which of the following is a contact force?
A: Gravity
B: Magnetic force
C: Friction
D: Electric force
Answer: C
Explanation: Friction is a contact force because it acts when two surfaces are in direct contact.
Difficulty: easy
Bloom: recall`}
              </pre>
            </div>

            <div>
              <label className="block text-sm font-medium text-navy-700 mb-1.5">
                Paste questions or upload a file
              </label>
              <textarea
                value={rawText}
                onChange={(e) => setRawText(e.target.value)}
                placeholder="Paste your questions here..."
                rows={12}
                className="w-full rounded-lg border border-gray-300 bg-white px-4 py-2.5 text-sm text-zinc-900 placeholder:text-gray-400 focus:border-teal-400 focus:outline-none focus:ring-2 focus:ring-teal-400/20 transition-colors resize-y font-mono"
              />
            </div>

            <div className="flex items-center gap-3">
              <input
                ref={fileInputRef}
                type="file"
                accept=".txt,.md,.csv"
                onChange={handleFileUpload}
                className="hidden"
              />
              <Button
                variant="outline"
                size="sm"
                onClick={() => fileInputRef.current?.click()}
              >
                <Upload className="w-4 h-4 mr-2" />
                Upload File
              </Button>
              <span className="text-xs text-gray-400">.txt, .md, or .csv</span>
            </div>

            <div className="flex gap-3">
              <Button onClick={handleParse} disabled={!rawText.trim()}>
                <FileText className="w-4 h-4 mr-2" />
                Parse Questions
              </Button>
              <Button variant="outline" onClick={onCancel}>
                Cancel
              </Button>
            </div>
          </CardContent>
        </Card>
      )}

      {step === 'preview' && (
        <div className="space-y-4">
          {/* Summary */}
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <span className="text-sm font-medium text-zinc-900">
                {parsed.length} question{parsed.length !== 1 ? 's' : ''} parsed
              </span>
              {validCount > 0 && (
                <span className="text-xs px-2 py-0.5 bg-green-100 text-green-700 rounded-full">
                  {validCount} valid
                </span>
              )}
              {invalidCount > 0 && (
                <span className="text-xs px-2 py-0.5 bg-red-100 text-red-700 rounded-full">
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

          {/* Question list */}
          <Card>
            <CardContent className="p-0">
              <div className="divide-y">
                {parsed.map((q, i) => (
                  <div key={i} className={`px-4 py-3 ${!q.valid ? 'bg-red-50/50' : ''}`}>
                    <div className="flex items-start gap-3">
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 mb-1">
                          <span className="text-xs font-medium text-gray-400">Q{i + 1}</span>
                          {q.valid ? (
                            <CheckCircle className="w-3.5 h-3.5 text-green-500" />
                          ) : (
                            <AlertTriangle className="w-3.5 h-3.5 text-red-500" />
                          )}
                        </div>
                        <p className="text-sm text-zinc-900 line-clamp-2">{q.stem || '(no stem)'}</p>
                        {q.options.length > 0 && (
                          <div className="flex flex-wrap gap-1.5 mt-1">
                            {q.options.map((opt, j) => (
                              <span
                                key={j}
                                className={`text-xs px-1.5 py-0.5 rounded ${
                                  j === q.correct_answer
                                    ? 'bg-green-100 text-green-700'
                                    : 'bg-gray-100 text-gray-600'
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
                              <p key={j} className="text-xs text-red-500">{err}</p>
                            ))}
                          </div>
                        )}
                      </div>
                      <button
                        onClick={() => handleRemoveQuestion(i)}
                        className="p-1 text-gray-400 hover:text-red-500 rounded"
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
            <div className="animate-spin w-8 h-8 border-2 border-teal-400 border-t-transparent rounded-full mx-auto mb-4" />
            <p className="text-gray-500">Importing questions...</p>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
