import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { getLearnerSession } from '@/api/auth';
import { getLearnerTopicMastery } from '@/api/assessment';
import { Card, CardContent } from '@/components/ui/Card';
import { Trophy, Target, BookOpen, Award, ChevronDown, ChevronRight } from 'lucide-react';

interface TopicMasteryRow {
  id: string;
  topic_id: string;
  topic_name?: string;
  topic_code?: string;
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
  const [expandedStrands, setExpandedStrands] = useState<Set<string>>(new Set());

  useEffect(() => {
    if (!session) {
      navigate('/');
      return;
    }
    getLearnerTopicMastery(session.learner_id)
      .then(setMastery)
      .finally(() => setLoading(false));
  }, []);

  if (!session) return null;

  const retained = mastery.filter((m) => m.status === 'retained_mastered').length;
  const firstPass = mastery.filter((m) => m.status === 'first_pass_mastered').length;
  const inProgress = mastery.filter((m) => m.status === 'in_progress').length;
  const totalPct =
    mastery.length > 0
      ? Math.round(mastery.reduce((sum, m) => sum + m.first_pass_pct, 0) / mastery.length)
      : 0;

  // Group by strand (first 2 segments of topic code, e.g. "B7.4")
  const strandMap = new Map<string, TopicMasteryRow[]>();
  for (const m of mastery) {
    const code = m.topic_code || '';
    const strandCode = code.split('.').slice(0, 2).join('.') || 'Other';
    const existing = strandMap.get(strandCode) || [];
    existing.push(m);
    strandMap.set(strandCode, existing);
  }

  // Sort topics within each strand by code
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
        <h1 className="text-2xl font-bold text-zinc-900">My Progress</h1>
        <p className="text-gray-500">{session.display_name} &middot; {session.class_level}</p>
      </div>

      {/* Summary cards */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-green-100 flex items-center justify-center">
              <Trophy className="w-5 h-5 text-green-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-zinc-900">{retained}</p>
              <p className="text-xs text-gray-500">Retained</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-amber-100 flex items-center justify-center">
              <Target className="w-5 h-5 text-amber-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-zinc-900">{firstPass}</p>
              <p className="text-xs text-gray-500">First-Pass</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-blue-100 flex items-center justify-center">
              <BookOpen className="w-5 h-5 text-blue-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-zinc-900">{inProgress}</p>
              <p className="text-xs text-gray-500">In Progress</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-purple-100 flex items-center justify-center">
              <Award className="w-5 h-5 text-purple-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-zinc-900">{totalPct}%</p>
              <p className="text-xs text-gray-500">Overall</p>
            </div>
          </CardContent>
        </Card>
      </div>

      {loading ? (
        <div className="text-center py-8 text-gray-500">Loading...</div>
      ) : mastery.length === 0 ? (
        <Card>
          <CardContent className="p-8 text-center">
            <BookOpen className="w-8 h-8 mx-auto mb-2 text-gray-400" />
            <p className="text-gray-500">Start a topic assessment to see your progress here.</p>
          </CardContent>
        </Card>
      ) : (
        <div className="space-y-2">
          {Array.from(strandMap.entries()).map(([strandCode, strandTopics]) => {
            const strandMastered = strandTopics.filter((t) => t.retained_mastered || t.first_pass_mastered).length;
            const strandPct = Math.round(
              strandTopics.reduce((sum, t) => sum + t.first_pass_pct, 0) / strandTopics.length
            );

            return (
              <Card key={strandCode}>
                <button
                  onClick={() => toggleStrand(strandCode)}
                  className="w-full flex items-center justify-between px-4 py-3 hover:bg-gray-50 transition-colors"
                >
                  <div className="flex items-center gap-3">
                    {expandedStrands.has(strandCode) ? (
                      <ChevronDown className="w-5 h-5 text-gray-400" />
                    ) : (
                      <ChevronRight className="w-5 h-5 text-gray-400" />
                    )}
                    <div className="text-left">
                      <p className="font-semibold text-zinc-900">{strandCode}</p>
                      <p className="text-xs text-gray-500">
                        {strandMastered}/{strandTopics.length} mastered &middot; {strandPct}% avg
                      </p>
                    </div>
                  </div>
                  <div className="flex items-center gap-2">
                    <div className="w-24 h-2 bg-gray-100 rounded-full overflow-hidden">
                      <div
                        className={`h-full rounded-full transition-all ${
                          strandPct >= 80 ? 'bg-green-500' : strandPct >= 40 ? 'bg-amber-400' : 'bg-red-400'
                        }`}
                        style={{ width: `${Math.min(strandPct, 100)}%` }}
                      />
                    </div>
                    <span className="text-sm font-medium text-zinc-900 w-10 text-right">{strandPct}%</span>
                  </div>
                </button>

                {expandedStrands.has(strandCode) && (
                  <div className="divide-y border-t">
                    {strandTopics.map((m) => (
                      <div key={m.id} className="px-4 py-3 flex items-center gap-4 pl-12">
                        {/* Mastery ring */}
                        <div className="relative w-10 h-10 flex-shrink-0">
                          <svg className="w-10 h-10 -rotate-90" viewBox="0 0 40 40">
                            <circle cx="20" cy="20" r="16" fill="none" stroke="#e5e7eb" strokeWidth="3" />
                            <circle
                              cx="20" cy="20" r="16" fill="none"
                              className={
                                m.status === 'retained_mastered'
                                  ? 'stroke-green-500'
                                  : m.status === 'first_pass_mastered'
                                    ? 'stroke-amber-400'
                                    : 'stroke-blue-400'
                              }
                              strokeWidth="3"
                              strokeDasharray={2 * Math.PI * 16}
                              strokeDashoffset={2 * Math.PI * 16 - (m.first_pass_pct / 100) * 2 * Math.PI * 16}
                              strokeLinecap="round"
                            />
                          </svg>
                          <span className="absolute inset-0 flex items-center justify-center text-[10px] font-bold text-zinc-900">
                            {Math.round(m.first_pass_pct)}
                          </span>
                        </div>

                        <div className="flex-1 min-w-0">
                          <p className="text-sm font-medium text-zinc-900 truncate">
                            {m.topic_name || `Topic ${m.topic_id.slice(-4)}`}
                          </p>
                          <p className="text-xs text-gray-500">
                            {m.topic_code && `${m.topic_code} \u00b7 `}
                            {m.first_pass_correct}/{m.first_pass_total} correct
                          </p>
                        </div>

                        <div className="flex items-center gap-2 flex-shrink-0">
                          <span className="text-sm font-semibold text-zinc-900">{Math.round(m.first_pass_pct)}%</span>
                          <span
                            className={`px-2 py-1 text-xs font-medium rounded-full ${
                              m.status === 'retained_mastered'
                                ? 'bg-green-100 text-green-700'
                                : m.status === 'first_pass_mastered'
                                  ? 'bg-amber-100 text-amber-700'
                                  : 'bg-blue-100 text-blue-700'
                            }`}
                          >
                            {m.status === 'retained_mastered'
                              ? 'Retained'
                              : m.status === 'first_pass_mastered'
                                ? 'Mastered'
                                : 'In Progress'}
                          </span>
                        </div>
                      </div>
                    ))}
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
