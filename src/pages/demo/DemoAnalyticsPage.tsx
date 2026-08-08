import { useState } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Select from '@/components/ui/Select';
import { Clock, HelpCircle } from 'lucide-react';
import { getDemoAnalytics, DEMO_TOPICS } from './demoData';

export default function DemoAnalyticsPage() {
  const [selectedTopicId, setSelectedTopicId] = useState<string>('');
  const allAnalytics = getDemoAnalytics();
  
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  let analytics: any[] = allAnalytics;
  if (selectedTopicId) {
    const topic = DEMO_TOPICS.find(t => t.id === selectedTopicId);
    if (topic) {
      analytics = allAnalytics.filter(a => a.topic_name === topic.name);
    }
  }

  // Sort by success rate
  analytics.sort((a, b) => a.success_rate - b.success_rate);

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
            ...DEMO_TOPICS.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` })),
          ]}
          onChange={(e) => setSelectedTopicId(e.target.value)}
        />
      </div>

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
                      <p className="text-sm text-zinc-900 line-clamp-2">{q.question_text}</p>
                    </td>
                    <td className="px-4 py-3 text-center">
                      <span className="text-xs px-1.5 py-0.5 rounded bg-gray-100 text-gray-600">
                        {q.type === 'multiple_choice' ? 'MCQ' : 'Open'}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-center">
                      <span className={`text-xs px-1.5 py-0.5 rounded ${
                        q.difficulty === 'hard' ? 'bg-red-100 text-red-700'
                          : q.difficulty === 'medium' ? 'bg-amber-100 text-amber-700'
                          : 'bg-green-100 text-green-700'
                      }`}>
                        {q.difficulty}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-center text-zinc-900">
                      {q.attempts}
                    </td>
                    <td className="px-4 py-3 text-center">
                      <div className="flex items-center justify-center gap-2">
                        <div className="w-16 h-2 bg-gray-200 rounded-full overflow-hidden">
                          <div
                            className={`h-full rounded-full ${
                              q.success_rate >= 70 ? 'bg-green-500'
                                : q.success_rate >= 40 ? 'bg-amber-400'
                                : 'bg-red-400'
                            }`}
                            style={{ width: `${q.success_rate}%` }}
                          />
                        </div>
                        <span className={`text-xs font-medium ${
                          q.success_rate >= 70 ? 'text-green-600'
                            : q.success_rate >= 40 ? 'text-amber-600'
                            : 'text-red-600'
                        }`}>
                          {Math.round(q.success_rate)}%
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
                        {(Math.random() * 2).toFixed(1)}
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
