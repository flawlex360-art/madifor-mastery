import { useState, useEffect } from 'react';
import { Card, CardHeader, CardContent } from '@/components/ui/Card';
import { ChevronLeft, ChevronRight } from 'lucide-react';

interface HeatmapLearner {
  learner_id: string;
  display_name: string;
  learner_code: string;
}

interface HeatmapTopic {
  topic_id: string;
  topic_name: string;
  topic_code: string;
}

interface HeatmapCell {
  learner_id: string;
  topic_id: string;
  first_pass_pct: number;
  retained_mastered: boolean;
  first_pass_mastered: boolean;
  status: string;
}

interface MasteryHeatmapProps {
  learners: HeatmapLearner[];
  topics: HeatmapTopic[];
  cells: HeatmapCell[];
  view: 'first_pass' | 'retained';
  onViewChange: (view: 'first_pass' | 'retained') => void;
  onLearnerClick?: (learnerId: string) => void;
}

const LEARNERS_PER_PAGE = 25;
const TOPICS_PER_PAGE = 15;

function isAttempted(cell: HeatmapCell | undefined): cell is HeatmapCell {
  return Boolean(cell && cell.status !== 'not_started');
}

function getCellColor(cell: HeatmapCell | undefined, view: 'first_pass' | 'retained'): string {
  if (!isAttempted(cell)) return 'bg-slate-100 border border-slate-200/70';

  if (view === 'retained') {
    if (cell.retained_mastered) return 'bg-emerald-500';
    if (cell.first_pass_mastered) return 'bg-amber-400';
    return 'bg-rose-400';
  }

  if (cell.first_pass_pct >= 80) return 'bg-emerald-500';
  if (cell.first_pass_pct >= 40) return 'bg-amber-400';
  return 'bg-rose-400';
}

function getCellLabel(cell: HeatmapCell | undefined, view: 'first_pass' | 'retained'): string {
  if (!isAttempted(cell)) return '—';
  if (view === 'retained') {
    if (cell.retained_mastered) return '★';
    if (cell.first_pass_mastered) return '✓';
    return `${Math.round(cell.first_pass_pct)}%`;
  }
  return `${Math.round(cell.first_pass_pct)}%`;
}

function getCellTextColor(cell: HeatmapCell | undefined, view: 'first_pass' | 'retained'): string {
  if (!isAttempted(cell)) return 'text-slate-400';
  if (view === 'retained') {
    if (cell.retained_mastered) return 'text-white';
    if (cell.first_pass_mastered) return 'text-navy-950';
    return 'text-white';
  }
  if (cell.first_pass_pct >= 80) return 'text-white';
  if (cell.first_pass_pct >= 40) return 'text-navy-950';
  return 'text-white';
}

export default function MasteryHeatmap({
  learners,
  topics,
  cells,
  view,
  onViewChange,
  onLearnerClick,
}: MasteryHeatmapProps) {
  const [hoveredCell, setHoveredCell] = useState<{ learner: string; topic: string } | null>(null);
  const [learnerPage, setLearnerPage] = useState(0);
  const [topicPage, setTopicPage] = useState(0);

  const totalLearnerPages = Math.max(1, Math.ceil(learners.length / LEARNERS_PER_PAGE));
  const totalTopicPages = Math.max(1, Math.ceil(topics.length / TOPICS_PER_PAGE));

  useEffect(() => {
    if (learnerPage >= totalLearnerPages) setLearnerPage(0);
  }, [learners.length, learnerPage, totalLearnerPages]);

  useEffect(() => {
    if (topicPage >= totalTopicPages) setTopicPage(0);
  }, [topics.length, topicPage, totalTopicPages]);

  const cellMap = new Map<string, HeatmapCell>();
  for (const c of cells) {
    cellMap.set(`${c.learner_id}:${c.topic_id}`, c);
  }

  const displayTopics = topics.slice(topicPage * TOPICS_PER_PAGE, (topicPage + 1) * TOPICS_PER_PAGE);
  const displayLearners = learners.slice(learnerPage * LEARNERS_PER_PAGE, (learnerPage + 1) * LEARNERS_PER_PAGE);

  return (
    <Card>
      <CardHeader>
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <div>
            <h2 className="font-semibold text-navy-900">Mastery Heatmap</h2>
            <p className="text-xs text-slate-500 mt-0.5">
              {learners.length} learners &middot; {topics.length} topics
            </p>
          </div>
          <div className="flex items-center gap-1 bg-slate-100 rounded-lg p-1 self-start sm:self-auto">
            <button
              type="button"
              onClick={() => onViewChange('first_pass')}
              className={`px-3 py-1.5 text-xs font-medium rounded-md transition-colors ${
                view === 'first_pass'
                  ? 'bg-white text-indigo-700 shadow-sm'
                  : 'text-slate-600 hover:text-navy-900'
              }`}
            >
              First Pass
            </button>
            <button
              type="button"
              onClick={() => onViewChange('retained')}
              className={`px-3 py-1.5 text-xs font-medium rounded-md transition-colors ${
                view === 'retained'
                  ? 'bg-white text-indigo-700 shadow-sm'
                  : 'text-slate-600 hover:text-navy-900'
              }`}
            >
              Retained
            </button>
          </div>
        </div>
      </CardHeader>
      <CardContent className="p-0">
        {displayLearners.length === 0 || displayTopics.length === 0 ? (
          <p className="text-center text-slate-500 py-10 text-sm">No mastery data to display yet.</p>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-xs">
              <thead>
                <tr className="bg-slate-50 border-b border-slate-200">
                  <th className="sticky left-0 bg-slate-50 z-10 text-left px-3 py-2.5 font-semibold text-slate-600 min-w-[150px] border-r border-slate-200/70">
                    Learner
                  </th>
                  {displayTopics.map((t) => (
                    <th
                      key={t.topic_id}
                      className="px-2 py-2.5 font-semibold text-slate-600 min-w-[56px] max-w-[84px]"
                      title={`${t.topic_code} — ${t.topic_name}`}
                    >
                      <div className="truncate">{t.topic_code.split('.').pop()}</div>
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {displayLearners.map((learner) => (
                  <tr key={learner.learner_id} className="hover:bg-slate-50/70">
                    <td
                      className={`sticky left-0 bg-white z-10 px-3 py-2 font-medium text-navy-900 whitespace-nowrap border-r border-slate-100 ${
                        onLearnerClick ? 'cursor-pointer hover:text-indigo-600' : ''
                      }`}
                      onClick={() => onLearnerClick?.(learner.learner_id)}
                    >
                      {learner.display_name}
                    </td>
                    {displayTopics.map((topic) => {
                      const cell = cellMap.get(`${learner.learner_id}:${topic.topic_id}`);
                      const isHovered =
                        hoveredCell?.learner === learner.learner_id &&
                        hoveredCell?.topic === topic.topic_id;

                      return (
                        <td
                          key={topic.topic_id}
                          className="px-1 py-1.5 text-center"
                          onMouseEnter={() =>
                            setHoveredCell({ learner: learner.learner_id, topic: topic.topic_id })
                          }
                          onMouseLeave={() => setHoveredCell(null)}
                        >
                          <div
                            className={`w-10 h-10 mx-auto rounded-lg flex items-center justify-center text-xs font-semibold tabular-nums transition-all
                              ${getCellColor(cell, view)} ${getCellTextColor(cell, view)}
                              ${isHovered ? 'ring-2 ring-indigo-500 scale-105' : ''}
                            `}
                            title={
                              isAttempted(cell)
                                ? `${learner.display_name} — ${topic.topic_name}: ${Math.round(cell.first_pass_pct)}%${cell.retained_mastered ? ' (Retained)' : ''}`
                                : `${learner.display_name} — ${topic.topic_name}: Not started`
                            }
                          >
                            {getCellLabel(cell, view)}
                          </div>
                        </td>
                      );
                    })}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}

        {(totalLearnerPages > 1 || totalTopicPages > 1) && (
          <div className="flex flex-wrap items-center justify-between gap-3 px-4 py-2.5 border-t border-slate-100 bg-slate-50/60 text-xs text-slate-600">
            {totalLearnerPages > 1 ? (
              <div className="flex items-center gap-2">
                <span>
                  Learners {learnerPage * LEARNERS_PER_PAGE + 1}–
                  {Math.min((learnerPage + 1) * LEARNERS_PER_PAGE, learners.length)} of {learners.length}
                </span>
                <button
                  type="button"
                  disabled={learnerPage === 0}
                  onClick={() => setLearnerPage((p) => Math.max(0, p - 1))}
                  className="p-1 rounded border border-slate-200 bg-white hover:bg-slate-100 disabled:opacity-40"
                  aria-label="Previous learners"
                >
                  <ChevronLeft className="w-3.5 h-3.5" />
                </button>
                <button
                  type="button"
                  disabled={learnerPage >= totalLearnerPages - 1}
                  onClick={() => setLearnerPage((p) => Math.min(totalLearnerPages - 1, p + 1))}
                  className="p-1 rounded border border-slate-200 bg-white hover:bg-slate-100 disabled:opacity-40"
                  aria-label="Next learners"
                >
                  <ChevronRight className="w-3.5 h-3.5" />
                </button>
              </div>
            ) : <div />}

            {totalTopicPages > 1 && (
              <div className="flex items-center gap-2">
                <span>
                  Topics {topicPage * TOPICS_PER_PAGE + 1}–
                  {Math.min((topicPage + 1) * TOPICS_PER_PAGE, topics.length)} of {topics.length}
                </span>
                <button
                  type="button"
                  disabled={topicPage === 0}
                  onClick={() => setTopicPage((p) => Math.max(0, p - 1))}
                  className="p-1 rounded border border-slate-200 bg-white hover:bg-slate-100 disabled:opacity-40"
                  aria-label="Previous topics"
                >
                  <ChevronLeft className="w-3.5 h-3.5" />
                </button>
                <button
                  type="button"
                  disabled={topicPage >= totalTopicPages - 1}
                  onClick={() => setTopicPage((p) => Math.min(totalTopicPages - 1, p + 1))}
                  className="p-1 rounded border border-slate-200 bg-white hover:bg-slate-100 disabled:opacity-40"
                  aria-label="Next topics"
                >
                  <ChevronRight className="w-3.5 h-3.5" />
                </button>
              </div>
            )}
          </div>
        )}

        {/* Legend */}
        <div className="flex flex-wrap items-center justify-center gap-4 py-3 px-4 border-t border-slate-100 text-xs text-slate-500">
          <div className="flex items-center gap-1.5">
            <div className="w-3.5 h-3.5 rounded bg-slate-100 border border-slate-200" />
            <span>Not started</span>
          </div>
          <div className="flex items-center gap-1.5">
            <div className="w-3.5 h-3.5 rounded bg-rose-400" />
            <span>Below 40%</span>
          </div>
          <div className="flex items-center gap-1.5">
            <div className="w-3.5 h-3.5 rounded bg-amber-400" />
            <span>{view === 'retained' ? 'First-pass only' : '40–79%'}</span>
          </div>
          <div className="flex items-center gap-1.5">
            <div className="w-3.5 h-3.5 rounded bg-emerald-500" />
            <span>{view === 'retained' ? 'Retained' : '≥80%'}</span>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
