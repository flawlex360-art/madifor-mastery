import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { getLearnerSession } from '@/api/auth';
import { getLearnerTopicMastery } from '@/api/assessment';
import { Card, CardContent } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import { Trophy, Target, BookOpen, Award, ChevronDown, ChevronRight, AlertCircle, RefreshCw } from 'lucide-react';

interface TopicMasteryRow {
  id: string;
  topic_id: string;
  topic_name?: string;
  topic_code?: string;
  class_level?: string;
  first_pass_correct: number;
  first_pass_total: number;
  first_pass_pct: number;
  first_pass_mastered: boolean;
  retained_mastered: boolean;
  status: string;
}

export default function ProgressPage() {
  const session = getLearnerSession();
  const navigate = useNavigate();
  const [mastery, setMastery] = useState<TopicMasteryRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [expandedStrands, setExpandedStrands] = useState<Set<string>>(new Set());

  const loadMastery = useCallback(() => {
    const current = getLearnerSession();
    if (!current) {
      navigate('/');
      return;
    }
    setLoading(true);
    setError(null);
    getLearnerTopicMastery(current.learner_id)
      .then((rows) => {
        setMastery(rows as TopicMasteryRow[]);
      })
      .catch((err) => {
        setError(err instanceof Error ? err.message : 'Unable to load progress.');
      })
      .finally(() => setLoading(false));
  }, [navigate]);

  useEffect(() => {
    loadMastery();
  }, [loadMastery]);

  if (!session) return null;

  const retained = mastery.filter((m) => m.status === 'retained_mastered' || m.retained_mastered).length;
  const firstPass = mastery.filter(
    (m) => m.status === 'first_pass_mastered' && !m.retained_mastered
  ).length;
  const inProgress = mastery.filter((m) => m.status === 'in_progress').length;
  const totalPct =
    mastery.length > 0
      ? Math.round(mastery.reduce((sum, m) => sum + Number(m.first_pass_pct || 0), 0) / mastery.length)
      : 0;

  const strandMap = new Map<string, TopicMasteryRow[]>();
  for (const m of mastery) {
    const code = m.topic_code || '';
    const strandCode = code.includes('.') ? code.split('.').slice(0, 2).join('.') : m.class_level || 'Other';
    const existing = strandMap.get(strandCode) || [];
    existing.push(m);
    strandMap.set(strandCode, existing);
  }

  for (const [, topics] of strandMap) {
    topics.sort((a, b) => (a.topic_code || '').localeCompare(b.topic_code || ''));
  }

  const toggleStrand = (strand: string) => {
    setExpandedStrands((prev) => {
      const next = new Set(prev);
      if (next.has(strand)) {
        next.delete(strand);
      } else {
        next.add(strand);
      }
      return next;
    });
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-navy-900">My Progress</h1>
        <p className="text-sm text-slate-500 mt-0.5">
          {session.display_name} &middot; {session.class_level}
        </p>
      </div>

      {/* Summary cards */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-green-100 flex items-center justify-center flex-shrink-0">
              <Trophy className="w-5 h-5 text-green-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-navy-900">{retained}</p>
              <p className="text-xs text-slate-500">Retained</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-indigo-100 flex items-center justify-center flex-shrink-0">
              <Target className="w-5 h-5 text-indigo-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-navy-900">{firstPass}</p>
              <p className="text-xs text-slate-500">First-Pass</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-amber-100 flex items-center justify-center flex-shrink-0">
              <BookOpen className="w-5 h-5 text-amber-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-navy-900">{inProgress}</p>
              <p className="text-xs text-slate-500">In Progress</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-navy-100 flex items-center justify-center flex-shrink-0">
              <Award className="w-5 h-5 text-navy-700" />
            </div>
            <div>
              <p className="text-xl font-bold text-navy-900">{totalPct}%</p>
              <p className="text-xs text-slate-500">Attempted Avg</p>
            </div>
          </CardContent>
        </Card>
      </div>

      {loading ? (
        <div className="text-center py-8 text-slate-500 text-sm">Loading progress...</div>
      ) : error ? (
        <Card className="border-red-200 bg-red-50">
          <CardContent className="p-6 text-center">
            <AlertCircle className="w-8 h-8 text-red-500 mx-auto mb-2" />
            <p className="text-sm text-red-800 mb-3">{error}</p>
            <Button variant="outline" size="sm" onClick={loadMastery}>
              <RefreshCw className="w-4 h-4 mr-1.5" />
              Retry
            </Button>
          </CardContent>
        </Card>
      ) : mastery.length === 0 ? (
        <Card>
          <CardContent className="p-8 text-center">
            <BookOpen className="w-8 h-8 mx-auto mb-2 text-slate-400" />
            <p className="text-slate-500 text-sm">Start a topic assessment to see your progress here.</p>
          </CardContent>
        </Card>
      ) : (
        <div className="space-y-3">
          {Array.from(strandMap.entries()).map(([strandCode, strandTopics]) => {
            const strandMastered = strandTopics.filter(
              (t) =>
                t.retained_mastered ||
                t.first_pass_mastered ||
                t.status === 'retained_mastered' ||
                t.status === 'first_pass_mastered'
            ).length;
            const strandPct = Math.min(
              100,
              Math.round(
                strandTopics.reduce((sum, t) => sum + Number(t.first_pass_pct || 0), 0) / strandTopics.length
              )
            );

            return (
              <Card key={strandCode} className="overflow-hidden">
                <button
                  type="button"
                  onClick={() => toggleStrand(strandCode)}
                  className="w-full flex items-center justify-between px-4 py-3.5 hover:bg-slate-50 transition-colors"
                >
                  <div className="flex items-center gap-3 min-w-0">
                    {expandedStrands.has(strandCode) ? (
                      <ChevronDown className="w-5 h-5 text-slate-400 flex-shrink-0" />
                    ) : (
                      <ChevronRight className="w-5 h-5 text-slate-400 flex-shrink-0" />
                    )}
                    <div className="text-left min-w-0">
                      <p className="font-bold text-navy-900 truncate">{strandCode}</p>
                      <p className="text-xs text-slate-500">
                        {strandMastered}/{strandTopics.length} mastered &middot; {strandPct}% avg
                      </p>
                    </div>
                  </div>
                  <div className="flex items-center gap-2 flex-shrink-0">
                    <div className="w-24 h-2 bg-slate-100 rounded-full overflow-hidden">
                      <div
                        className={`h-full rounded-full transition-all ${
                          strandPct >= 80 ? 'bg-green-500' : strandPct >= 40 ? 'bg-amber-400' : 'bg-red-400'
                        }`}
                        style={{ width: `${Math.min(100, Math.max(0, strandPct))}%` }}
                      />
                    </div>
                    <span className="text-sm font-semibold text-navy-900 w-10 text-right">{strandPct}%</span>
                  </div>
                </button>

                {expandedStrands.has(strandCode) && (
                  <div className="divide-y divide-slate-100 border-t border-slate-100">
                    {strandTopics.map((m) => {
                      const pct = Math.min(100, Math.max(0, Number(m.first_pass_pct || 0)));
                      const circumference = 2 * Math.PI * 16;
                      const strokeDashoffset = circumference - (pct / 100) * circumference;

                      const badgeClass =
                        m.status === 'retained_mastered'
                          ? 'bg-green-100 text-green-700'
                          : m.status === 'first_pass_mastered'
                            ? 'bg-indigo-100 text-indigo-700'
                            : m.status === 'in_progress'
                              ? 'bg-amber-100 text-amber-700'
                              : 'bg-slate-100 text-slate-600';

                      const badgeLabel =
                        m.status === 'retained_mastered'
                          ? 'Retained'
                          : m.status === 'first_pass_mastered'
                            ? 'Mastered'
                            : m.status === 'in_progress'
                              ? 'In Progress'
                              : 'Not Started';

                      return (
                        <div key={m.id} className="px-4 py-3 flex items-center gap-4 pl-8 sm:pl-12">
                          <div className="relative w-10 h-10 flex-shrink-0">
                            <svg className="w-10 h-10 -rotate-90" viewBox="0 0 40 40">
                              <circle cx="20" cy="20" r="16" fill="none" stroke="#e2e8f0" strokeWidth="3" />
                              <circle
                                cx="20"
                                cy="20"
                                r="16"
                                fill="none"
                                className={
                                  m.status === 'retained_mastered'
                                    ? 'stroke-green-500'
                                    : m.status === 'first_pass_mastered'
                                      ? 'stroke-indigo-500'
                                      : pct >= 40
                                        ? 'stroke-amber-400'
                                        : 'stroke-red-400'
                                }
                                strokeWidth="3"
                                strokeDasharray={circumference}
                                strokeDashoffset={strokeDashoffset}
                                strokeLinecap="round"
                              />
                            </svg>
                            <span className="absolute inset-0 flex items-center justify-center text-[10px] font-bold text-navy-900">
                              {Math.round(pct)}
                            </span>
                          </div>

                          <div className="flex-1 min-w-0">
                            <p className="text-sm font-semibold text-navy-900 truncate">
                              {m.topic_name || `Topic ${m.topic_id.slice(-4)}`}
                            </p>
                            <p className="text-xs text-slate-500">
                              {m.topic_code && `${m.topic_code} · `}
                              {m.first_pass_correct}/{m.first_pass_total} correct
                            </p>
                          </div>

                          <div className="flex items-center gap-2 flex-shrink-0">
                            <span className="text-sm font-bold text-navy-900">{Math.round(pct)}%</span>
                            <span className={`px-2.5 py-0.5 text-xs font-semibold rounded-full ${badgeClass}`}>
                              {badgeLabel}
                            </span>
                          </div>
                        </div>
                      );
                    })}
                  </div>
                )}
              </Card>
            );
          })}
        </div>
      )}
    </div>
  );
}
