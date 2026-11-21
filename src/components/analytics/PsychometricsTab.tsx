import { useState, useEffect, useMemo } from 'react';
import { getPsychometricAnalytics } from '@/api/assessment';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { AlertCircle, TrendingUp, TrendingDown, Target } from 'lucide-react';

interface PsychoData {
  question_id: string;
  difficulty_b: number;
  discrimination_a: number;
  total_attempts: number;
  stem: string;
  question_type: string;
  topic_id?: string | null;
}

export default function PsychometricsTab({ topicId }: { topicId?: string }) {
  const [data, setData] = useState<PsychoData[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let active = true;
    setLoading(true);
    setError(null);

    getPsychometricAnalytics(topicId)
      .then((rows) => {
        if (active) setData(rows || []);
      })
      .catch((err) => {
        console.error('Failed to load psychometric analytics:', err);
        if (active) setError('Could not load IRT calibration parameters.');
      })
      .finally(() => {
        if (active) setLoading(false);
      });

    return () => {
      active = false;
    };
  }, [topicId]);

  const sortedData = useMemo(() => {
    return [...data].sort((a, b) => (b.difficulty_b ?? 0) - (a.difficulty_b ?? 0));
  }, [data]);

  const flaggedQuestions = useMemo(() => {
    return sortedData.filter(
      (q) =>
        (q.total_attempts ?? 0) >= 5 &&
        ((q.difficulty_b ?? 0) > 2.0 || (q.discrimination_a ?? 1) < 0.2)
    );
  }, [sortedData]);

  if (loading) {
    return (
      <Card>
        <CardContent className="p-8 space-y-3">
          <div className="h-4 w-48 bg-slate-200 animate-pulse rounded" />
          <div className="h-24 w-full bg-slate-100 animate-pulse rounded-lg" />
        </CardContent>
      </Card>
    );
  }

  if (error) {
    return (
      <Card>
        <CardContent className="p-8 text-center text-rose-600 text-sm">{error}</CardContent>
      </Card>
    );
  }

  if (sortedData.length === 0) {
    return (
      <Card>
        <CardContent className="p-8 text-center text-slate-500 text-sm">
          Not enough calibrated attempts yet. Questions appear here after learners answer unhinted assessment items.
        </CardContent>
      </Card>
    );
  }

  return (
    <div className="space-y-6">
      {flaggedQuestions.length > 0 && (
        <div className="bg-rose-50 border border-rose-200 rounded-xl p-4">
          <div className="flex items-center gap-2 text-rose-800 font-semibold mb-1.5">
            <AlertCircle className="w-5 h-5 flex-shrink-0" />
            Flagged Questions Detected ({flaggedQuestions.length})
          </div>
          <p className="text-sm text-rose-700 mb-4">
            Items with very high difficulty (b &gt; 2.0) or low discrimination (a &lt; 0.2) after 5+ attempts may have ambiguous stems or a miskeyed answer.
          </p>
          <div className="space-y-2.5">
            {flaggedQuestions.map((q) => {
              const b = Number(q.difficulty_b ?? 0);
              const a = Number(q.discrimination_a ?? 1);
              return (
                <div key={q.question_id} className="bg-white border border-rose-100 rounded-lg p-3 text-sm">
                  <p className="font-medium text-navy-900 mb-1.5">{q.stem}</p>
                  <div className="flex flex-wrap gap-4 text-xs text-slate-600">
                    <span className="flex items-center gap-1">
                      <Target className="w-3.5 h-3.5 text-rose-500" />
                      Diff (b): <span className="font-semibold text-rose-600 tabular-nums">{b.toFixed(2)}</span>
                    </span>
                    <span className="flex items-center gap-1">
                      <TrendingDown className="w-3.5 h-3.5 text-rose-500" />
                      Discrim (a): <span className="font-semibold text-rose-600 tabular-nums">{a.toFixed(2)}</span>
                    </span>
                    <span className="tabular-nums">Attempts: {q.total_attempts ?? 0}</span>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      )}

      <Card>
        <CardHeader>
          <h2 className="font-semibold text-navy-900 flex items-center gap-2">
            <TrendingUp className="w-5 h-5 text-indigo-600" />
            Item Response Theory (1PL Rasch) Calibration
          </h2>
          <p className="text-xs text-slate-500 mt-1">
            Difficulty (b) spans [-4.0, +4.0], centered around 0.0 (positive = harder, negative = easier). Discrimination (a) indicates item fit (1PL baseline 1.00).
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
                {sortedData.map((q) => {
                  const b = Number(q.difficulty_b ?? 0);
                  const a = Number(q.discrimination_a ?? 1);
                  return (
                    <tr key={q.question_id} className="hover:bg-slate-50/80 transition-colors">
                      <td className="px-4 py-3 max-w-md">
                        <p className="text-sm text-navy-900 line-clamp-2">{q.stem}</p>
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span
                          className={`font-mono px-2.5 py-1 rounded-md text-xs font-semibold tabular-nums ${
                            b > 1.5
                              ? 'bg-rose-50 text-rose-700'
                              : b < -1.5
                                ? 'bg-emerald-50 text-emerald-700'
                                : 'bg-indigo-50 text-indigo-700'
                          }`}
                        >
                          {b > 0 ? '+' : ''}
                          {b.toFixed(3)}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center text-slate-700 font-mono text-xs tabular-nums">
                        {a.toFixed(2)}
                      </td>
                      <td className="px-4 py-3 text-center text-slate-500 tabular-nums">
                        {q.total_attempts ?? 0}
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
