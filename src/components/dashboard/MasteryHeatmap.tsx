import { useState } from 'react';
import { Card, CardHeader, CardContent } from '@/components/ui/Card';

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

function getCellColor(cell: HeatmapCell | undefined, view: 'first_pass' | 'retained'): string {
  if (!cell) return 'bg-gray-100';

  if (view === 'retained') {
    if (cell.retained_mastered) return 'bg-green-500';
    if (cell.first_pass_mastered) return 'bg-amber-400';
    if (cell.first_pass_pct > 0) return 'bg-red-300';
    return 'bg-gray-100';
  }

  // first_pass view
  if (cell.first_pass_pct >= 80) return 'bg-green-500';
  if (cell.first_pass_pct >= 40) return 'bg-amber-400';
  if (cell.first_pass_pct > 0) return 'bg-red-300';
  return 'bg-gray-100';
}

function getCellLabel(cell: HeatmapCell | undefined, view: 'first_pass' | 'retained'): string {
  if (!cell) return '—';
  if (view === 'retained') {
    if (cell.retained_mastered) return '★';
    if (cell.first_pass_mastered) return '✓';
    if (cell.first_pass_pct > 0) return `${Math.round(cell.first_pass_pct)}%`;
    return '—';
  }
  if (cell.first_pass_pct > 0) return `${Math.round(cell.first_pass_pct)}%`;
  return '—';
}

function getCellTextColor(cell: HeatmapCell | undefined, view: 'first_pass' | 'retained'): string {
  if (!cell) return 'text-gray-400';
  if (view === 'retained') {
    if (cell.retained_mastered) return 'text-white';
    if (cell.first_pass_mastered) return 'text-zinc-900';
    return 'text-gray-600';
  }
  if (cell.first_pass_pct >= 80) return 'text-white';
  if (cell.first_pass_pct >= 40) return 'text-zinc-900';
  return 'text-gray-600';
}

export default function MasteryHeatmap({
  learners, topics, cells, view, onViewChange, onLearnerClick,
}: MasteryHeatmapProps) {
  const [hoveredCell, setHoveredCell] = useState<{ learner: string; topic: string } | null>(null);

  const cellMap = new Map<string, HeatmapCell>();
  for (const c of cells) {
    cellMap.set(`${c.learner_id}:${c.topic_id}`, c);
  }

  // Limit display to avoid overwhelming the UI
  const displayTopics = topics.slice(0, 20);
  const displayLearners = learners.slice(0, 30);

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <h2 className="font-semibold text-zinc-900">Mastery Heatmap</h2>
          <div className="flex items-center gap-1 bg-gray-100 rounded-lg p-1">
            <button
              onClick={() => onViewChange('first_pass')}
              className={`px-3 py-1.5 text-xs font-medium rounded-md transition-colors ${
                view === 'first_pass'
                  ? 'bg-white text-zinc-900 shadow-sm'
                  : 'text-gray-500 hover:text-navy-700'
              }`}
            >
              First Pass
            </button>
            <button
              onClick={() => onViewChange('retained')}
              className={`px-3 py-1.5 text-xs font-medium rounded-md transition-colors ${
                view === 'retained'
                  ? 'bg-white text-zinc-900 shadow-sm'
                  : 'text-gray-500 hover:text-navy-700'
              }`}
            >
              Retained
            </button>
          </div>
        </div>
      </CardHeader>
      <CardContent className="p-0">
        {displayLearners.length === 0 || displayTopics.length === 0 ? (
          <p className="text-center text-gray-500 py-8">No data to display yet.</p>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-xs">
              <thead>
                <tr className="bg-gray-50">
                  <th className="sticky left-0 bg-gray-50 z-10 text-left px-3 py-2 font-medium text-gray-600 min-w-[140px]">
                    Learner
                  </th>
                  {displayTopics.map((t) => (
                    <th
                      key={t.topic_id}
                      className="px-2 py-2 font-medium text-gray-600 min-w-[56px] max-w-[80px]"
                      title={`${t.topic_code} — ${t.topic_name}`}
                    >
                      <div className="truncate">{t.topic_code.split('.').pop()}</div>
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {displayLearners.map((learner) => (
                  <tr key={learner.learner_id} className="border-t hover:bg-gray-50/50">
                    <td
                      className={`sticky left-0 bg-white z-10 px-3 py-2 font-medium text-zinc-900 whitespace-nowrap ${
                        onLearnerClick ? 'cursor-pointer hover:text-zinc-900' : ''
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
                          className="px-1 py-1 text-center"
                          onMouseEnter={() =>
                            setHoveredCell({ learner: learner.learner_id, topic: topic.topic_id })
                          }
                          onMouseLeave={() => setHoveredCell(null)}
                        >
                          <div
                            className={`w-10 h-10 rounded-md flex items-center justify-center text-xs font-medium transition-all
                              ${getCellColor(cell, view)} ${getCellTextColor(cell, view)}
                              ${isHovered ? 'ring-2 ring-navy-400 scale-110' : ''}
                            `}
                            title={
                              cell
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

        {/* Legend */}
        <div className="flex items-center justify-center gap-4 py-3 border-t text-xs text-gray-500">
          <div className="flex items-center gap-1">
            <div className="w-4 h-4 rounded bg-gray-100" />
            <span>Not started</span>
          </div>
          <div className="flex items-center gap-1">
            <div className="w-4 h-4 rounded bg-red-300" />
            <span>Below 40%</span>
          </div>
          <div className="flex items-center gap-1">
            <div className="w-4 h-4 rounded bg-amber-400" />
            <span>{view === 'retained' ? 'First-pass only' : '40–79%'}</span>
          </div>
          <div className="flex items-center gap-1">
            <div className="w-4 h-4 rounded bg-green-500" />
            <span>{view === 'retained' ? 'Retained' : '≥80%'}</span>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
