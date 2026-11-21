import { useState, useMemo } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Select from '@/components/ui/Select';
import { Clock, HelpCircle, TrendingUp } from 'lucide-react';
import { getDemoAnalytics, DEMO_TOPICS } from './demoData';

function formatDifficultyLabel(diff: string): string {
  switch (diff) {
    case 'bece_level':
      return 'BECE Level';
    case 'core':
      return 'Core';
    case 'easy':
      return 'Easy';
    default:
      return diff.replace(/_/g, ' ');
  }
}

export default function DemoAnalyticsPage() {
  const [selectedTopicId, setSelectedTopicId] = useState<string>('');
  const [activeTab, setActiveTab] = useState<'classical' | 'irt'>('classical');

  const analytics = useMemo(() => {
    const all = getDemoAnalytics();
    const filtered = selectedTopicId ? all.filter((a) => a.topic_id === selectedTopicId) : all;
    if (activeTab === 'irt') {
      return [...filtered].sort((a, b) => b.difficulty_b - a.difficulty_b);
    }
    return [...filtered].sort((a, b) => a.success_rate_pct - b.success_rate_pct);
  }, [selectedTopicId, activeTab]);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-navy-900">Question Analytics</h1>
        <p className="text-sm text-slate-500">Inspect item success rates and Rasch difficulty calibration</p>
      </div>

      <div className="flex flex-col sm:flex-row gap-4 items-stretch sm:items-end justify-between border-b border-slate-200 pb-4">
        <div className="w-full sm:w-80">
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

        <div className="flex bg-slate-100 p-1 rounded-xl self-start sm:self-auto">
          <button
            type="button"
            onClick={() => setActiveTab('classical')}
            className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${
              activeTab === 'classical'
                ? 'bg-white text-indigo-700 shadow-sm'
                : 'text-slate-600 hover:text-navy-900'
            }`}
          >
            Performance (Classical)
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('irt')}
            className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors ${
              activeTab === 'irt'
                ? 'bg-white text-indigo-700 shadow-sm'
                : 'text-slate-600 hover:text-navy-900'
            }`}
          >
            Psychometrics (IRT)
          </button>
        </div>
      </div>

      {analytics.length === 0 ? (
        <Card>
          <CardContent className="p-10 text-center text-slate-500 text-sm">
            No question analytics found for the selected topic.
          </CardContent>
        </Card>
      ) : activeTab === 'irt' ? (
        <Card>
          <CardHeader>
            <h2 className="font-semibold text-navy-900 flex items-center gap-2">
              <TrendingUp className="w-5 h-5 text-indigo-600" />
              Item Response Theory (1PL Rasch) Calibration
            </h2>
            <p className="text-xs text-slate-500 mt-1">
              Difficulty (b) is centered at 0.0 (positive = harder item, negative = easier item).
            </p>
          </CardHeader>
          <CardContent className="p-0">
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 bg-slate-50/80">
                    <th className="text-left px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Question</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Difficulty (b)</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Discrimination (a)</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Calibration Attempts</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100">
                  {analytics.map((q) => (
                    <tr key={q.question_id} className="hover:bg-slate-50/80 transition-colors">
                      <td className="px-4 py-3 max-w-md">
                        <p className="text-sm text-navy-900 line-clamp-2">{q.stem}</p>
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span
                          className={`font-mono px-2.5 py-1 rounded-md text-xs font-semibold tabular-nums ${
                            q.difficulty_b > 0.5
                              ? 'bg-rose-50 text-rose-700'
                              : q.difficulty_b < -0.5
                                ? 'bg-emerald-50 text-emerald-700'
                                : 'bg-indigo-50 text-indigo-700'
                          }`}
                        >
                          {q.difficulty_b > 0 ? '+' : ''}
                          {q.difficulty_b.toFixed(3)}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center text-slate-700 font-mono text-xs tabular-nums">
                        {q.discrimination_a.toFixed(2)}
                      </td>
                      <td className="px-4 py-3 text-center text-slate-500 tabular-nums">
                        {q.total_attempts}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </CardContent>
        </Card>
      ) : (
        <Card>
          <CardHeader>
            <h2 className="font-semibold text-navy-900">
              Questions by Success Rate ({analytics.length})
            </h2>
            <p className="text-xs text-slate-500 mt-1">
              Sorted lowest success rate first to highlight challenging questions
            </p>
          </CardHeader>
          <CardContent className="p-0">
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 bg-slate-50/80">
                    <th className="text-left px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Question</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Type</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Difficulty</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Attempts</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Success Rate</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Avg Time</th>
                    <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Avg Hints</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100">
                  {analytics.map((q) => (
                    <tr key={q.question_id} className="hover:bg-slate-50/80 transition-colors">
                      <td className="px-4 py-3 max-w-xs">
                        <p className="text-sm text-navy-900 line-clamp-2">{q.stem}</p>
                      </td>
                      <td className="px-4 py-3 text-center whitespace-nowrap">
                        <span className="text-xs px-2 py-0.5 rounded-md bg-slate-100 text-slate-600 font-medium">
                          MCQ
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center whitespace-nowrap">
                        <span
                          className={`text-xs px-2 py-0.5 rounded-md font-medium ${
                            q.difficulty === 'bece_level'
                              ? 'bg-rose-50 text-rose-700'
                              : q.difficulty === 'core'
                                ? 'bg-indigo-50 text-indigo-700'
                                : 'bg-emerald-50 text-emerald-700'
                          }`}
                        >
                          {formatDifficultyLabel(q.difficulty)}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center text-navy-900 tabular-nums font-medium">
                        {q.total_attempts}
                      </td>
                      <td className="px-4 py-3 text-center">
                        <div className="flex items-center justify-center gap-2">
                          <div className="w-16 h-2 bg-slate-200 rounded-full overflow-hidden">
                            <div
                              className={`h-full rounded-full ${
                                q.success_rate_pct >= 70
                                  ? 'bg-emerald-500'
                                  : q.success_rate_pct >= 40
                                    ? 'bg-amber-400'
                                    : 'bg-rose-500'
                              }`}
                              style={{ width: `${q.success_rate_pct}%` }}
                            />
                          </div>
                          <span
                            className={`text-xs font-semibold tabular-nums ${
                              q.success_rate_pct >= 70
                                ? 'text-emerald-600'
                                : q.success_rate_pct >= 40
                                  ? 'text-amber-600'
                                  : 'text-rose-600'
                            }`}
                          >
                            {Math.round(q.success_rate_pct)}%
                          </span>
                        </div>
                      </td>
                      <td className="px-4 py-3 text-center text-slate-600 tabular-nums whitespace-nowrap">
                        <div className="flex items-center justify-center gap-1">
                          <Clock className="w-3.5 h-3.5 text-slate-400" />
                          {q.avg_time_seconds}s
                        </div>
                      </td>
                      <td className="px-4 py-3 text-center text-slate-600 tabular-nums whitespace-nowrap">
                        <div className="flex items-center justify-center gap-1">
                          <HelpCircle className="w-3.5 h-3.5 text-slate-400" />
                          {q.avg_hints_used.toFixed(1)}
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
