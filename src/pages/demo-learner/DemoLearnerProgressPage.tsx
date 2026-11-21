import { Target, Trophy, Flame, TrendingUp } from 'lucide-react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';

const HISTORY_POINTS = [
  { label: 'Day 1', pct: 40 },
  { label: 'Day 4', pct: 46 },
  { label: 'Day 7', pct: 44 },
  { label: 'Day 10', pct: 52 },
  { label: 'Day 13', pct: 58 },
  { label: 'Day 16', pct: 64 },
  { label: 'Day 19', pct: 68 },
  { label: 'Day 22', pct: 71 },
  { label: 'Day 25', pct: 76 },
  { label: 'Day 28', pct: 81 },
  { label: 'Today', pct: 85 },
];

export default function DemoLearnerProgressPage() {
  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-navy-900">My Progress</h1>
        <p className="text-sm text-slate-500">Sample Basic 8 Integrated Science mastery overview</p>
      </div>

      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        <Card className="bg-emerald-50/70 border-emerald-200">
          <CardContent className="p-4">
            <div className="flex justify-between items-start mb-2">
              <div className="p-2 bg-emerald-100 text-emerald-700 rounded-lg">
                <Target className="w-5 h-5" />
              </div>
              <span className="text-xs font-semibold text-emerald-700">+12% this week</span>
            </div>
            <div className="text-2xl font-bold text-emerald-950 tabular-nums">85%</div>
            <p className="text-xs text-emerald-800/80 mt-1 font-medium">Overall Mastery</p>
          </CardContent>
        </Card>

        <Card className="bg-indigo-50/70 border-indigo-200">
          <CardContent className="p-4">
            <div className="flex justify-between items-start mb-2">
              <div className="p-2 bg-indigo-100 text-indigo-700 rounded-lg">
                <Trophy className="w-5 h-5" />
              </div>
            </div>
            <div className="text-2xl font-bold text-navy-900 tabular-nums">14</div>
            <p className="text-xs text-indigo-800/80 mt-1 font-medium">Topics Mastered</p>
          </CardContent>
        </Card>

        <Card className="bg-amber-50/70 border-amber-200">
          <CardContent className="p-4">
            <div className="flex justify-between items-start mb-2">
              <div className="p-2 bg-amber-100 text-amber-700 rounded-lg">
                <Flame className="w-5 h-5" />
              </div>
            </div>
            <div className="text-2xl font-bold text-amber-950 tabular-nums">3 Days</div>
            <p className="text-xs text-amber-800/80 mt-1 font-medium">Current Streak</p>
          </CardContent>
        </Card>

        <Card className="bg-sky-50/70 border-sky-200">
          <CardContent className="p-4">
            <div className="flex justify-between items-start mb-2">
              <div className="p-2 bg-sky-100 text-sky-700 rounded-lg">
                <TrendingUp className="w-5 h-5" />
              </div>
            </div>
            <div className="text-2xl font-bold text-sky-950 tabular-nums">124</div>
            <p className="text-xs text-sky-800/80 mt-1 font-medium">Questions Answered</p>
          </CardContent>
        </Card>
      </div>

      <Card>
        <CardHeader>
          <h2 className="text-lg font-semibold text-navy-900">Mastery History (Demo)</h2>
          <p className="text-xs text-slate-500">Rolling first-pass mastery percentage over the past 30 days</p>
        </CardHeader>
        <CardContent>
          <div className="h-64 flex items-end gap-2 sm:gap-3 pt-8 pb-2 border-b border-slate-200">
            {HISTORY_POINTS.map((point) => (
              <div
                key={point.label}
                className="flex-1 h-full flex flex-col justify-end items-center group"
              >
                <div
                  className="w-full max-w-[36px] bg-indigo-500/85 hover:bg-indigo-600 rounded-t-md transition-colors relative"
                  style={{ height: `${point.pct}%` }}
                  title={`${point.label}: ${point.pct}%`}
                >
                  <div className="absolute -top-7 left-1/2 -translate-x-1/2 opacity-0 group-hover:opacity-100 bg-navy-900 text-white px-2 py-0.5 rounded text-[11px] font-semibold whitespace-nowrap transition-opacity pointer-events-none">
                    {point.pct}%
                  </div>
                </div>
              </div>
            ))}
          </div>
          <div className="flex justify-between mt-2.5 text-xs text-slate-400">
            <span>30 days ago</span>
            <span>Mid-month</span>
            <span>Today</span>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
