import { useState, useMemo } from 'react';
import { Card, CardHeader, CardContent } from '@/components/ui/Card';
import { Search, ArrowUpDown, ArrowUp, ArrowDown } from 'lucide-react';

interface LearnerRow {
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

type SortKey = 'display_name' | 'topics_attempted' | 'overall_avg_pct' | 'topics_retained' | 'last_active' | 'voluntary_practice_sessions';
type SortDir = 'asc' | 'desc';

function getStatus(avgPct: number): { label: string; bg: string; text: string } {
  if (avgPct >= 80) return { label: 'On Track', bg: 'bg-green-100', text: 'text-green-700' };
  if (avgPct >= 40) return { label: 'Progressing', bg: 'bg-amber-100', text: 'text-amber-700' };
  return { label: 'At Risk', bg: 'bg-red-100', text: 'text-red-700' };
}

function formatLastActive(dateStr: string | null | undefined): string {
  if (!dateStr) return 'Never';
  const date = new Date(dateStr);
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
  if (!dateStr) return 'text-gray-400';
  const date = new Date(dateStr);
  const now = new Date();
  const diffDays = Math.floor((now.getTime() - date.getTime()) / 86400000);
  if (diffDays <= 1) return 'text-green-600';
  if (diffDays <= 3) return 'text-amber-600';
  return 'text-red-500';
}

function SortableHeader({
  label, sortKey, currentSort, currentDir, onSort,
}: {
  label: string; sortKey: SortKey; currentSort: SortKey; currentDir: SortDir; onSort: (key: SortKey) => void;
}) {
  const active = currentSort === sortKey;
  return (
    <th
      className="text-center px-4 py-3 font-medium text-gray-600 cursor-pointer select-none hover:bg-gray-100 transition-colors"
      onClick={() => onSort(sortKey)}
    >
      <div className="flex items-center justify-center gap-1">
        {label}
        {active ? (
          currentDir === 'asc' ? <ArrowUp className="w-3 h-3" /> : <ArrowDown className="w-3 h-3" />
        ) : (
          <ArrowUpDown className="w-3 h-3 opacity-30" />
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
    let list = learners;
    if (q) {
      list = list.filter(
        (l) =>
          l.display_name.toLowerCase().includes(q) ||
          (l.learner_code || '').toLowerCase().includes(q)
      );
    }

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
        <div className="flex items-center justify-between">
          <h2 className="font-semibold text-zinc-900">Learners</h2>
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
            <input
              type="text"
              placeholder="Search learners..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="pl-9 pr-3 py-1.5 text-sm border rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-teal-400/40 focus:border-teal-400 w-56"
            />
          </div>
        </div>
      </CardHeader>
      <CardContent className="p-0">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b bg-gray-50">
                <SortableHeader label="Name" sortKey="display_name" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
                <th className="text-left px-4 py-3 font-medium text-gray-600">ID</th>
                <SortableHeader label="Topics" sortKey="topics_attempted" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
                <SortableHeader label="Mastery" sortKey="overall_avg_pct" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
                <SortableHeader label="Retained" sortKey="topics_retained" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
                <th className="text-center px-4 py-3 font-medium text-gray-600">Status</th>
                <SortableHeader label="Last Active" sortKey="last_active" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
                <SortableHeader label="Practice" sortKey="voluntary_practice_sessions" currentSort={sortKey} currentDir={sortDir} onSort={handleSort} />
              </tr>
            </thead>
            <tbody>
              {filtered.length === 0 ? (
                <tr>
                  <td colSpan={8} className="px-4 py-8 text-center text-gray-400">
                    {search ? 'No learners match your search.' : 'No learners yet.'}
                  </td>
                </tr>
              ) : (
                filtered.map((learner) => {
                  const avgPct = Math.round(learner.overall_avg_pct || 0);
                  const status = getStatus(avgPct);

                  return (
                    <tr
                      key={learner.learner_id}
                      className={`border-b hover:bg-gray-50 ${onLearnerClick ? 'cursor-pointer' : ''}`}
                      onClick={() => onLearnerClick?.(learner.learner_id)}
                    >
                      <td className="px-4 py-3 font-medium text-zinc-900">
                        {learner.display_name}
                      </td>
                      <td className="px-4 py-3 text-gray-500">
                        {learner.learner_code || '\u2014'}
                      </td>
                      <td className="px-4 py-3 text-center">
                        {learner.topics_attempted || 0}
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span
                          className={`font-semibold ${
                            avgPct >= 80
                              ? 'text-green-600'
                              : avgPct >= 40
                                ? 'text-amber-600'
                                : 'text-red-600'
                          }`}
                        >
                          {avgPct}%
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center">
                        {(learner.topics_retained || 0) > 0 ? (
                          <span className="font-medium text-green-600">
                            {learner.topics_retained}
                          </span>
                        ) : (
                          <span className="text-gray-400">0</span>
                        )}
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span
                          className={`px-2 py-1 text-xs font-medium rounded-full ${status.bg} ${status.text}`}
                        >
                          {status.label}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center">
                        <span className={`text-xs font-medium ${getLastActiveColor(learner.last_active)}`}>
                          {formatLastActive(learner.last_active)}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center">
                        {(learner.voluntary_practice_sessions || 0) > 0 ? (
                          <span className="px-2 py-1 text-xs font-medium bg-purple-100 text-purple-700 rounded-full">
                            {learner.voluntary_practice_sessions} sessions
                          </span>
                        ) : (
                          <span className="text-gray-400">\u2014</span>
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
          <div className="px-4 py-2 text-xs text-gray-400 border-t">
            Showing {filtered.length} of {learners.length} learners
          </div>
        )}
      </CardContent>
    </Card>
  );
}
