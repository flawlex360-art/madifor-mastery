import { useState, useMemo } from 'react';
import { Card, CardHeader, CardContent } from '@/components/ui/Card';
import { Search, ArrowUpDown, ArrowUp, ArrowDown } from 'lucide-react';

export interface LearnerRow {
  learner_id: string;
  display_name: string;
  learner_code?: string;
  topics_attempted?: number;
  topics_retained?: number;
  topics_first_pass?: number;
  overall_avg_pct?: number;
  voluntary_practice_sessions?: number;
  voluntary_practice_topics?: number;
  last_active?: string | null;
}

interface LearnerTableProps {
  learners: LearnerRow[];
  onLearnerClick?: (learnerId: string) => void;
}

type SortKey =
  | 'display_name'
  | 'topics_attempted'
  | 'overall_avg_pct'
  | 'topics_retained'
  | 'last_active'
  | 'voluntary_practice_sessions';
type SortDir = 'asc' | 'desc';

function getStatus(avgPct: number, attempted: number): { label: string; bg: string; text: string } {
  if (attempted === 0) return { label: 'Not Started', bg: 'bg-slate-100', text: 'text-slate-600' };
  if (avgPct >= 80) return { label: 'On Track', bg: 'bg-emerald-50', text: 'text-emerald-700' };
  if (avgPct >= 40) return { label: 'Progressing', bg: 'bg-amber-50', text: 'text-amber-700' };
  return { label: 'At Risk', bg: 'bg-rose-50', text: 'text-rose-700' };
}

function formatLastActive(dateStr: string | null | undefined): string {
  if (!dateStr) return 'Never';
  const date = new Date(dateStr);
  if (Number.isNaN(date.getTime())) return '—';
  const now = new Date();
  const diffMs = now.getTime() - date.getTime();
  const diffMins = Math.floor(diffMs / 60000);
  const diffHours = Math.floor(diffMins / 60);
  const diffDays = Math.floor(diffHours / 24);

  if (diffMins < 1) return 'Just now';
  if (diffMins < 60) return `${diffMins}m ago`;
  if (diffHours < 24) return `${diffHours}h ago`;
  if (diffDays === 1) return 'Yesterday';
  if (diffDays < 7) return `${diffDays}d ago`;
  return date.toLocaleDateString('en-GB', { day: 'numeric', month: 'short' });
}

function getLastActiveColor(dateStr: string | null | undefined): string {
  if (!dateStr) return 'text-slate-400';
  const date = new Date(dateStr);
  if (Number.isNaN(date.getTime())) return 'text-slate-400';
  const diffDays = Math.floor((Date.now() - date.getTime()) / 86400000);
  if (diffDays <= 1) return 'text-emerald-600';
  if (diffDays <= 3) return 'text-amber-600';
  return 'text-rose-600';
}

function SortableHeader({
  label,
  sortKey,
  currentSort,
  currentDir,
  align = 'center',
  onSort,
}: {
  label: string;
  sortKey: SortKey;
  currentSort: SortKey;
  currentDir: SortDir;
  align?: 'left' | 'center';
  onSort: (key: SortKey) => void;
}) {
  const active = currentSort === sortKey;
  return (
    <th
      className={`${
        align === 'left' ? 'text-left' : 'text-center'
      } px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500 cursor-pointer select-none hover:bg-slate-100/80 transition-colors`}
      onClick={() => onSort(sortKey)}
    >
      <div className={`flex items-center gap-1 ${align === 'left' ? 'justify-start' : 'justify-center'}`}>
        {label}
        {active ? (
          currentDir === 'asc' ? <ArrowUp className="w-3.5 h-3.5 text-indigo-600" /> : <ArrowDown className="w-3.5 h-3.5 text-indigo-600" />
        ) : (
          <ArrowUpDown className="w-3.5 h-3.5 opacity-35" />
        )}
      </div>
    </th>
  );
}

export default function LearnerTable({ learners, onLearnerClick }: LearnerTableProps) {
  const [search, setSearch] = useState('');
  const [sortKey, setSortKey] = useState<SortKey>('display_name');
  const [sortDir, setSortDir] = useState<SortDir>('asc');

  const handleSort = (key: SortKey) => {
    if (sortKey === key) {
      setSortDir(sortDir === 'asc' ? 'desc' : 'asc');
    } else {
      setSortKey(key);
      setSortDir(key === 'display_name' ? 'asc' : 'desc');
    }
  };

  const filtered = useMemo(() => {
    const q = search.toLowerCase().trim();
    const list = q
      ? learners.filter(
          (l) =>
            l.display_name.toLowerCase().includes(q) ||
            (l.learner_code || '').toLowerCase().includes(q)
        )
      : learners;

    return [...list].sort((a, b) => {
      let aVal: string | number = '';
      let bVal: string | number = '';

      switch (sortKey) {
        case 'display_name':
          aVal = a.display_name.toLowerCase();
          bVal = b.display_name.toLowerCase();
          break;
        case 'topics_attempted':
          aVal = a.topics_attempted || 0;
          bVal = b.topics_attempted || 0;
          break;
        case 'overall_avg_pct':
          aVal = a.overall_avg_pct || 0;
          bVal = b.overall_avg_pct || 0;
          break;
        case 'topics_retained':
          aVal = a.topics_retained || 0;
          bVal = b.topics_retained || 0;
          break;
        case 'last_active':
          aVal = a.last_active || '';
          bVal = b.last_active || '';
          break;
        case 'voluntary_practice_sessions':
          aVal = a.voluntary_practice_sessions || 0;
          bVal = b.voluntary_practice_sessions || 0;
          break;
      }

      if (aVal < bVal) return sortDir === 'asc' ? -1 : 1;
      if (aVal > bVal) return sortDir === 'asc' ? 1 : -1;
      return 0;
    });
  }, [learners, search, sortKey, sortDir]);

  return (
    <Card>
      <CardHeader>
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <h2 className="font-semibold text-navy-900">Learners</h2>
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
            <input
              type="text"
              placeholder="Search name or code..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="pl-9 pr-3 py-1.5 text-sm border border-slate-200 rounded-lg bg-white text-navy-900 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-500/30 focus:border-indigo-500 w-full sm:w-56"
            />
          </div>
        </div>
      </CardHeader>
      <CardContent className="p-0">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-slate-200 bg-slate-50/80">
                <SortableHeader label="Name" sortKey="display_name" currentSort={sortKey} currentDir={sortDir} align="left" onSort={handleSort} />
                <th className="text-left px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">ID</th>
                <SortableHeader label="Topics" sortKey="topics_attempted" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
                <SortableHeader label="Mastery" sortKey="overall_avg_pct" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
                <SortableHeader label="Retained" sortKey="topics_retained" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
                <th className="text-center px-4 py-3 text-xs font-semibold uppercase tracking-wider text-slate-500">Status</th>
                <SortableHeader label="Last Active" sortKey="last_active" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
                <SortableHeader label="Practice" sortKey="voluntary_practice_sessions" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {filtered.length === 0 ? (
                <tr>
                  <td colSpan={8} className="px-4 py-8 text-center text-slate-400">
                    {search ? 'No learners match your search.' : 'No learners enrolled yet.'}
                  </td>
                </tr>
              ) : (
                filtered.map((learner) => {
                  const attempted = learner.topics_attempted || 0;
                  const avgPct = Math.round(learner.overall_avg_pct || 0);
                  const status = getStatus(avgPct, attempted);

                  return (
                    <tr
                      key={learner.learner_id}
                      className={`transition-colors hover:bg-slate-50/80 ${onLearnerClick ? 'cursor-pointer' : ''}`}
                      onClick={() => onLearnerClick?.(learner.learner_id)}
                    >
                      <td className="px-4 py-3 font-medium text-navy-900 whitespace-nowrap">
                        {learner.display_name}
                      </td>
                      <td className="px-4 py-3 text-slate-500 font-mono text-xs whitespace-nowrap">
                        {learner.learner_code || '—'}
                      </td>
                      <td className="px-4 py-3 text-center tabular-nums text-slate-700">
                        {attempted}
                      </td>
                      <td className="px-4 py-3 text-center tabular-nums">
                        {attempted > 0 ? (
                          <span
                            className={`font-semibold ${
                              avgPct >= 80
                                ? 'text-emerald-600'
                                : avgPct >= 40
                                  ? 'text-amber-600'
                                  : 'text-rose-600'
                            }`}
                          >
                            {avgPct}%
                          </span>
                        ) : (
                          <span className="text-slate-400">—</span>
                        )}
                      </td>
                      <td className="px-4 py-3 text-center tabular-nums">
                        {(learner.topics_retained || 0) > 0 ? (
                          <span className="font-semibold text-emerald-600">
                            {learner.topics_retained}
                          </span>
                        ) : (
                          <span className="text-slate-400">0</span>
                        )}
                      </td>
                      <td className="px-4 py-3 text-center whitespace-nowrap">
                        <span className={`px-2.5 py-1 text-xs font-medium rounded-full ${status.bg} ${status.text}`}>
                          {status.label}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center whitespace-nowrap">
                        <span className={`text-xs font-medium ${getLastActiveColor(learner.last_active)}`}>
                          {formatLastActive(learner.last_active)}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center whitespace-nowrap">
                        {(learner.voluntary_practice_sessions || 0) > 0 ? (
                          <span className="px-2.5 py-1 text-xs font-medium bg-indigo-50 text-indigo-700 rounded-full">
                            {learner.voluntary_practice_sessions} sessions
                          </span>
                        ) : (
                          <span className="text-slate-400">—</span>
                        )}
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
        {search && filtered.length > 0 && (
          <div className="px-4 py-2.5 text-xs text-slate-500 border-t border-slate-100 bg-slate-50/50">
            Showing {filtered.length} of {learners.length} learners
          </div>
        )}
      </CardContent>
    </Card>
  );
}
