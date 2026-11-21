import { useState, useEffect } from 'react';
import { useAuth } from '@/hooks/useAuth';
import { getCurriculumTree, getSubjects } from '@/api/curriculum';
import { getQuestionAnalytics } from '@/api/assessment';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Select from '@/components/ui/Select';
import type { Topic } from '@/types/curriculum';
import { Clock, HelpCircle } from 'lucide-react';
import PsychometricsTab from '@/components/analytics/PsychometricsTab';
import { toast } from '@/stores/toastStore';

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

export default function QuestionAnalyticsPage() {
  const { teacher } = useAuth();
  const [topics, setTopics] = useState<Topic[]>([]);
  const [selectedTopicId, setSelectedTopicId] = useState<string>('');
  const [analytics, setAnalytics] = useState<QuestionAnalytic[]>([]);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState<'classical' | 'irt'>('classical');

  useEffect(() => {
    if (!teacher) return;
    let active = true;
    getSubjects()
      .then((subjects) => {
        if (subjects.length > 0) {
          return getCurriculumTree(subjects[0].id);
        }
        return null;
      })
      .then((tree) => {
        if (!active || !tree) return;
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const allTopics = tree.strands.flatMap((s: any) =>
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          s.sub_strands.flatMap((ss: any) => ss.topics)
        );
        setTopics(allTopics as Topic[]);
      })
      .catch((err) => console.error('Failed to load topics for filter:', err));

    return () => {
      active = false;
    };
  }, [teacher]);

  useEffect(() => {
    let active = true;
    setLoading(true);
    getQuestionAnalytics(selectedTopicId || undefined)
      .then((rows) => {
        if (active) setAnalytics(rows);
      })
      .catch((err) => {
        console.error('Failed to load question analytics:', err);
        if (active) toast.error('Could not load question analytics.');
      })
      .finally(() => {
        if (active) setLoading(false);
      });

    return () => {
      active = false;
    };
  }, [selectedTopicId]);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-navy-900">Question Analytics</h1>
        <p className="text-sm text-slate-500">Analyze item difficulty, hint usage, and IRT calibration</p>
      </div>

      <div className="flex flex-col sm:flex-row gap-4 items-stretch sm:items-end justify-between border-b border-slate-200 pb-4">
        <div className="w-full sm:w-80">
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

      {activeTab === 'irt' ? (
        <PsychometricsTab topicId={selectedTopicId || undefined} />
      ) : loading ? (
        <Card>
          <CardContent className="p-8 space-y-3">
            <div className="h-4 w-56 bg-slate-200 animate-pulse rounded" />
            <div className="h-32 w-full bg-slate-100 animate-pulse rounded-xl" />
          </CardContent>
        </Card>
      ) : analytics.length === 0 ? (
        <Card>
          <CardContent className="p-10 text-center text-slate-500 text-sm">
            No question attempts recorded yet. Analytics will populate once learners complete questions.
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
                  {analytics.map((q) => {
                    const rate = Math.max(0, Math.min(100, Number(q.success_rate_pct ?? 0)));
                    return (
                      <tr key={q.question_id} className="hover:bg-slate-50/80 transition-colors">
                        <td className="px-4 py-3 max-w-xs">
                          <p className="text-sm text-navy-900 line-clamp-2">{q.stem}</p>
                        </td>
                        <td className="px-4 py-3 text-center whitespace-nowrap">
                          <span className="text-xs px-2 py-0.5 rounded-md bg-slate-100 text-slate-600 font-medium">
                            {q.question_type === 'multiple_choice' ? 'MCQ' : 'Fill-in'}
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
                                  rate >= 70
                                    ? 'bg-emerald-500'
                                    : rate >= 40
                                      ? 'bg-amber-400'
                                      : 'bg-rose-500'
                                }`}
                                style={{ width: `${rate}%` }}
                              />
                            </div>
                            <span
                              className={`text-xs font-semibold tabular-nums ${
                                rate >= 70
                                  ? 'text-emerald-600'
                                  : rate >= 40
                                    ? 'text-amber-600'
                                    : 'text-rose-600'
                              }`}
                            >
                              {Math.round(rate)}%
                            </span>
                          </div>
                        </td>
                        <td className="px-4 py-3 text-center text-slate-600 tabular-nums whitespace-nowrap">
                          <div className="flex items-center justify-center gap-1">
                            <Clock className="w-3.5 h-3.5 text-slate-400" />
                            {Math.round(q.avg_time_seconds || 0)}s
                          </div>
                        </td>
                        <td className="px-4 py-3 text-center text-slate-600 tabular-nums whitespace-nowrap">
                          <div className="flex items-center justify-center gap-1">
                            <HelpCircle className="w-3.5 h-3.5 text-slate-400" />
                            {(q.avg_hints_used || 0).toFixed(1)}
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
