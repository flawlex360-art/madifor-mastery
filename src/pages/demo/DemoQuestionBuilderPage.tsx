import { useState } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Select from '@/components/ui/Select';
import { Plus, Eye, BookOpen, Upload } from 'lucide-react';
import { toast } from '@/stores/toastStore';
import { DEMO_QUESTIONS, DEMO_TOPICS } from './demoData';

const DEMO_SUBJECTS = [{ id: 's1', name: 'Science' }];

export default function DemoQuestionBuilderPage() {
  const [selectedTopicId, setSelectedTopicId] = useState(DEMO_TOPICS[0].id);

  const handleAction = () => {
    toast.error('Editing is disabled in the demo environment.');
  };

  const topicQuestions = DEMO_QUESTIONS.filter(q => q.topic_id === selectedTopicId);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-zinc-900">Question Builder</h1>
        <p className="text-gray-500">Create and manage questions for your topics</p>
      </div>

      <div className="space-y-6">
        <div className="flex gap-4 flex-wrap items-end">
          <div className="w-64">
            <Select
              label="Subject"
              options={DEMO_SUBJECTS.map((s) => ({ value: s.id, label: s.name }))}
              value="s1"
              onChange={() => {}}
            />
          </div>
          <div className="flex-1 min-w-[280px]">
            <Select
              label="Topic"
              value={selectedTopicId}
              options={DEMO_TOPICS.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` }))}
              onChange={(e) => setSelectedTopicId(e.target.value)}
            />
          </div>
          <div className="text-xs font-medium bg-teal-50 text-teal-700 px-3 py-1.5 rounded-full border border-teal-100 mb-0.5">
            Showing Basic 8 topics
          </div>
        </div>

        <div className="flex items-center justify-between">
          <p className="text-sm text-gray-500">
            {topicQuestions.length} question{topicQuestions.length !== 1 ? 's' : ''} for this topic
          </p>
          <div className="flex items-center gap-2">
            <Button variant="outline" onClick={handleAction}>
              <Upload className="w-4 h-4 mr-2" />
              Bulk Import
            </Button>
            <Button onClick={handleAction}>
              <Plus className="w-4 h-4 mr-2" />
              New Question
            </Button>
          </div>
        </div>

        <Card>
          <CardHeader>
            <h2 className="font-semibold text-zinc-900">Questions</h2>
          </CardHeader>
          <CardContent className="p-0">
            {topicQuestions.length === 0 ? (
              <div className="p-8 text-center text-gray-500">
                <BookOpen className="w-8 h-8 mx-auto mb-2 text-gray-400" />
                No questions yet for this topic.
              </div>
            ) : (
              <div className="divide-y">
                {topicQuestions.map((q, i) => (
                  <div key={q.id} className="px-4 py-3 flex items-start gap-3 hover:bg-gray-50/50">
                    <span className="text-xs font-medium text-gray-400 mt-1 w-6">{i + 1}</span>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-zinc-900 line-clamp-2">{q.text}</p>
                      <div className="flex items-center gap-2 mt-1">
                        <span className="text-xs px-1.5 py-0.5 rounded bg-gray-100 text-gray-600">
                          {q.type.replace('_', ' ')}
                        </span>
                        <span className="text-xs px-1.5 py-0.5 rounded bg-gray-100 text-gray-600">
                          {q.difficulty}
                        </span>
                      </div>
                    </div>
                    <div className="flex items-center gap-1 flex-shrink-0">
                      <Button variant="ghost" size="sm" onClick={handleAction} title="Preview">
                        <Eye className="w-4 h-4 text-gray-400" />
                      </Button>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
