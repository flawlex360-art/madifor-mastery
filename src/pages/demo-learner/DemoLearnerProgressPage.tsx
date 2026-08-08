import { Target, Trophy, Flame, TrendingUp } from 'lucide-react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';

export default function DemoLearnerProgressPage() {
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-zinc-900">My Progress</h1>
      </div>

      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        <Card className="bg-gradient-to-br from-emerald-50 to-emerald-100/50 border-emerald-200">
          <CardContent className="p-4">
            <div className="flex justify-between items-start mb-2">
              <div className="p-2 bg-emerald-100 text-emerald-600 rounded-lg">
                <Target className="w-5 h-5" />
              </div>
              <span className="text-sm font-medium text-emerald-600">+12% this week</span>
            </div>
            <div className="text-2xl font-bold text-emerald-950">85%</div>
            <p className="text-xs text-emerald-700/80 mt-1 font-medium">Overall Mastery</p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-purple-50 to-purple-100/50 border-purple-200">
          <CardContent className="p-4">
            <div className="flex justify-between items-start mb-2">
              <div className="p-2 bg-purple-100 text-purple-600 rounded-lg">
                <Trophy className="w-5 h-5" />
              </div>
            </div>
            <div className="text-2xl font-bold text-purple-950">14</div>
            <p className="text-xs text-purple-700/80 mt-1 font-medium">Topics Mastered</p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-amber-50 to-amber-100/50 border-amber-200">
          <CardContent className="p-4">
            <div className="flex justify-between items-start mb-2">
              <div className="p-2 bg-amber-100 text-amber-600 rounded-lg">
                <Flame className="w-5 h-5" />
              </div>
            </div>
            <div className="text-2xl font-bold text-amber-950">3 Days</div>
            <p className="text-xs text-amber-700/80 mt-1 font-medium">Current Streak</p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-blue-50 to-blue-100/50 border-blue-200">
          <CardContent className="p-4">
            <div className="flex justify-between items-start mb-2">
              <div className="p-2 bg-blue-100 text-blue-600 rounded-lg">
                <TrendingUp className="w-5 h-5" />
              </div>
            </div>
            <div className="text-2xl font-bold text-blue-950">124</div>
            <p className="text-xs text-blue-700/80 mt-1 font-medium">Questions Answered</p>
          </CardContent>
        </Card>
      </div>

      <Card>
        <CardHeader>
          <h2 className="text-lg font-semibold">Mastery History (Demo)</h2>
        </CardHeader>
        <CardContent>
          <div className="h-64 flex items-end gap-2 text-xs text-zinc-500 pt-8 pb-4 border-b border-zinc-100">
            {/* Fake bar chart */}
            {[40, 45, 42, 50, 58, 65, 70, 68, 75, 82, 85].map((val, i) => (
              <div key={i} className="flex-1 flex flex-col justify-end items-center gap-2 group">
                <div 
                  className="w-full bg-purple-100 rounded-t-sm group-hover:bg-purple-200 transition-colors relative"
                  style={{ height: `${val}%` }}
                >
                  <div className="absolute -top-6 left-1/2 -translate-x-1/2 opacity-0 group-hover:opacity-100 bg-zinc-800 text-white px-2 py-0.5 rounded text-[10px] whitespace-nowrap transition-opacity">
                    {val}%
                  </div>
                </div>
              </div>
            ))}
          </div>
          <div className="flex justify-between mt-2 text-xs text-zinc-400">
            <span>30 days ago</span>
            <span>Today</span>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
