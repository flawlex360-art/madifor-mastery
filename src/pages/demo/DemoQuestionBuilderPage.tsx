import { useState } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Select from '@/components/ui/Select';
import QuestionPreview from '@/components/question-builder/QuestionPreview';
import type { Question } from '@/types/curriculum';
import { Plus, Eye, BookOpen, Upload, X } from 'lucide-react';
import { toast } from '@/stores/toastStore';
import { DEMO_QUESTIONS, DEMO_TOPICS } from './demoData';

const DEMO_SUBJECTS = [{ id: 's1', name: 'Integrated Science' }];

export default function DemoQuestionBuilderPage() {
  const [selectedTopicId, setSelectedTopicId] = useState(DEMO_TOPICS[0].id);
  const [previewQuestion, setPreviewQuestion] = useState<Question | null>(null);

  const handleReadOnly = () => {
    toast.info('Demo mode is read-only. Sign up for a free teacher account to author or import questions.');
  };

  const topicQuestions = DEMO_QUESTIONS.filter((q) => q.topic_id === selectedTopicId);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-navy-900">Question Builder</h1>
        <p className="text-sm text-slate-500">Preview questions and hints organized by NaCCA topic</p>
      </div>

      <div className="space-y-6">
        <div className="flex gap-4 flex-wrap items-end">
          <div className="w-full sm:w-64">
            <Select
              label="Subject"
              options={DEMO_SUBJECTS.map((s) => ({ value: s.id, label: s.name }))}
              value="s1"
              onChange={() => {}}
            />
          </div>
          <div className="flex-1 min-w-[260px]">
            <Select
              label="Topic"
              value={selectedTopicId}
              options={DEMO_TOPICS.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` }))}
              onChange={(e) => setSelectedTopicId(e.target.value)}
            />
          </div>
          <div className="text-xs font-semibold bg-indigo-50 text-indigo-700 px-3 py-2 rounded-lg border border-indigo-100">
            Basic 8 (JHS 2) Topics
          </div>
        </div>

        <div className="flex flex-wrap items-center justify-between gap-3">
          <p className="text-sm text-slate-500">
            {topicQuestions.length} question{topicQuestions.length !== 1 ? 's' : ''} in this topic
          </p>
          <div className="flex items-center gap-2">
            <Button variant="outline" onClick={handleReadOnly}>
              <Upload className="w-4 h-4 mr-2" />
              Bulk Import
            </Button>
            <Button onClick={handleReadOnly}>
              <Plus className="w-4 h-4 mr-2" />
              New Question
            </Button>
          </div>
        </div>

        <Card>
          <CardHeader>
            <h2 className="font-semibold text-navy-900">Questions</h2>
          </CardHeader>
          <CardContent className="p-0">
            {topicQuestions.length === 0 ? (
              <div className="p-8 text-center text-slate-500">
                <BookOpen className="w-8 h-8 mx-auto mb-2 text-slate-300" />
                No questions yet for this topic.
              </div>
            ) : (
              <div className="divide-y divide-slate-100">
                {topicQuestions.map((q, i) => (
                  <div
                    key={q.id}
                    className="px-4 py-3.5 flex items-start gap-3 hover:bg-slate-50/70 transition-colors"
                  >
                    <span className="text-xs font-semibold text-slate-400 mt-1 w-6 tabular-nums">
                      {i + 1}
                    </span>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-navy-900 line-clamp-2">{q.stem}</p>
                      <div className="flex flex-wrap items-center gap-1.5 mt-1.5">
                        <span className="text-xs px-2 py-0.5 rounded-md bg-slate-100 text-slate-600 font-medium">
                          MCQ
                        </span>
                        <span className="text-xs px-2 py-0.5 rounded-md bg-slate-100 text-slate-600">
                          {q.difficulty.replace(/_/g, ' ')}
                        </span>
                        <span className="text-xs px-2 py-0.5 rounded-md bg-slate-100 text-slate-600">
                          {q.blooms_level}
                        </span>
                      </div>
                    </div>
                    <div className="flex items-center gap-1 flex-shrink-0">
                      <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => setPreviewQuestion(q)}
                        title="Preview question"
                      >
                        <Eye className="w-4 h-4 text-indigo-600 mr-1" />
                        <span className="text-xs font-medium text-indigo-600">Preview</span>
                      </Button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </CardContent>
        </Card>
      </div>

      {/* Interactive Question Preview Modal */}
      {previewQuestion && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center p-4"
          onClick={() => setPreviewQuestion(null)}
        >
          <div className="absolute inset-0 bg-navy-950/50 backdrop-blur-sm" />
          <div
            className="relative w-full max-w-lg max-h-[85vh] overflow-y-auto rounded-2xl border border-slate-200 bg-white shadow-2xl custom-scrollbar"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="sticky top-0 z-10 flex items-center justify-between px-6 py-4 border-b border-slate-100 bg-white rounded-t-2xl">
              <h3 className="text-lg font-semibold text-navy-900">Question Preview</h3>
              <button
                type="button"
                onClick={() => setPreviewQuestion(null)}
                className="p-1.5 rounded-lg hover:bg-slate-100 transition-colors"
                aria-label="Close preview"
              >
                <X className="w-5 h-5 text-slate-500" />
              </button>
            </div>
            <div className="p-6">
              <QuestionPreview question={previewQuestion} />
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
