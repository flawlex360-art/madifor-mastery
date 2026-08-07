import { useState, useEffect } from 'react';
import { useAuth } from '@/hooks/useAuth';
import { getCurriculumTree, getSubjects } from '@/api/curriculum';
import { getQuestionAnalytics } from '@/api/assessment';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Select from '@/components/ui/Select';
import type { Topic } from '@/types/curriculum';
import { Clock, HelpCircle } from 'lucide-react';

interface QuestionAnalytic {
  question_id: string;
  topic_id: string;
  stem: string;
  question_type: string;
  difficulty: string;
  blooms_level: string;
  total_attempts: number;
  correct_count: number;
  success_rate_pct: number;
  avg_time_seconds: number;
  avg_hints_used: number;
}

export default function QuestionAnalyticsPage() {
  const { teacher } = useAuth();
  const [topics, setTopics] = useState<Topic[]>([]);
  const [selectedTopicId, setSelectedTopicId] = useState<string>('');
  const [analytics, setAnalytics] = useState<QuestionAnalytic[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!teacher) return;
    getSubjects().then((subjects) => {
      if (subjects.length > 0) {
        getCurriculumTree(subjects[0].id).then((tree) => {
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          const allTopics = tree.strands.flatMap((s: any) =>
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            s.sub_strands.flatMap((ss: any) => ss.topics)
          );
          setTopics(allTopics as Topic[]);
        });
      }
    });
  }, [teacher]);

  useEffect(() => {
    setLoading(true);
    getQuestionAnalytics(selectedTopicId || undefined)
      .then(setAnalytics)
      .finally(() => setLoading(false));
  }, [selectedTopicId]);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-zinc-900">Question Analytics</h1>
        <p className="text-gray-500">See which questions learners struggle with most</p>
      </div>

      <div className="w-72">
        <Select
          label="Filter by Topic"
          value={selectedTopicId}
          options={[
            { value: '', label: 'All Topics' },
            ...topics.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` })),
          ]}
          onChange={(e) => setSelectedTopicId(e.target.value)}
        />
      </div>

      {loading ? (
        <div className="text-center py-8 text-gray-500">Loading...</div>
      ) : analytics.length === 0 ? (
        <Card>
          <CardContent className="p-8 text-center text-gray-500">
            No question data yet. Analytics will appear once learners start answering questions.
          </CardContent>
        </Card>
      ) : (
        <Card>
          <CardHeader>
            <h2 className="font-semibold text-zinc-900">
              Questions by Difficulty ({analytics.length})
            </h2>
            <p className="text-xs text-gray-500 mt-1">
              Sorted by success rate — lowest first (hardest questions)
            </p>
          </CardHeader>
          <CardContent className="p-0">
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b bg-gray-50">
                    <th className="text-left px-4 py-3 font-medium text-gray-600">Question</th>
                    <th className="text-center px-4 py-3 font-medium text-gray-600">Type</th>
                    <th className="text-center px-4 py-3 font-medium text-gray-600">Difficulty</th>
                    <th className="text-center px-4 py-3 font-medium text-gray-600">Attempts</th>
                    <th className="text-center px-4 py-3 font-medium text-gray-600">Success Rate</th>
                    <th className="text-center px-4 py-3 font-medium text-gray-600">Avg Time</th>
                    <th className="text-center px-4 py-3 font-medium text-gray-600">Avg Hints</th>
                  </tr>
                </thead>
                <tbody>
                  {analytics.map((q) => (
                    <tr key={q.question_id} className="border-b hover:bg-gray-50">
                      <td className="px-4 py-3 max-w-xs">
                        <p className="text-sm text-zinc-900 line-clamp-2">{q.stem}</p>
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span className="text-xs px-1.5 py-0.5 rounded bg-gray-100 text-gray-600">
                          {q.question_type === 'multiple_choice' ? 'MCQ' : 'Fill-in'}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span className={`text-xs px-1.5 py-0.5 rounded ${
                          q.difficulty === 'bece_level' ? 'bg-red-100 text-red-700'
                            : q.difficulty === 'core' ? 'bg-blue-100 text-blue-700'
                            : 'bg-green-100 text-green-700'
                        }`}>
                          {q.difficulty}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center text-zinc-900">
                        {q.total_attempts}
                      </td>
                      <td className="px-4 py-3 text-center">
                        <div className="flex items-center justify-center gap-2">
                          <div className="w-16 h-2 bg-gray-200 rounded-full overflow-hidden">
                            <div
                              className={`h-full rounded-full ${
                                q.success_rate_pct >= 70 ? 'bg-green-500'
                                  : q.success_rate_pct >= 40 ? 'bg-amber-400'
                                  : 'bg-red-400'
                              }`}
                              style={{ width: `${q.success_rate_pct}%` }}
                            />
                          </div>
                          <span className={`text-xs font-medium ${
                            q.success_rate_pct >= 70 ? 'text-green-600'
                              : q.success_rate_pct >= 40 ? 'text-amber-600'
                              : 'text-red-600'
                          }`}>
                            {Math.round(q.success_rate_pct)}%
                          </span>
                        </div>
                      </td>
                      <td className="px-4 py-3 text-center text-gray-600">
                        <div className="flex items-center justify-center gap-1">
                          <Clock className="w-3 h-3" />
                          {Math.round(q.avg_time_seconds || 0)}s
                        </div>
                      </td>
                      <td className="px-4 py-3 text-center text-gray-600">
                        <div className="flex items-center justify-center gap-1">
                          <HelpCircle className="w-3 h-3" />
                          {(q.avg_hints_used || 0).toFixed(1)}
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
