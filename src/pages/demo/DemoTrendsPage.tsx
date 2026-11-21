import { useState, lazy, Suspense } from 'react';
import Select from '@/components/ui/Select';
import BECEReadiness from '@/components/dashboard/BECEReadiness';
import { computeBeceReadiness } from '@/lib/exportUtils';
import { TrendingUp, TrendingDown, Minus } from 'lucide-react';
import { DEMO_LEARNERS, DEMO_TOPICS, getDemoTrends, getDemoDrillDown } from './demoData';

const MasteryTrendChart = lazy(() => import('@/components/dashboard/MasteryTrendChart'));

export default function DemoTrendsPage() {
  const [selectedLearnerId, setSelectedLearnerId] = useState(DEMO_LEARNERS[0].id);
  const [selectedTopicId, setSelectedTopicId] = useState('');

  const trendData = getDemoTrends(selectedLearnerId);
  const topicMastery = getDemoDrillDown(selectedLearnerId);

  const retained = topicMastery.filter((m) => m.retained_mastered).length;
  const firstPass = topicMastery.filter((m) => m.first_pass_mastered).length;
  const totalTopics = DEMO_TOPICS.length;
  const beceScore = computeBeceReadiness(retained, firstPass, totalTopics);

  const getTrendIcon = () => {
    if (trendData.length < 2) return <Minus className="w-4 h-4 text-slate-400" />;
    const last = trendData[trendData.length - 1].pct;
    const prev = trendData[trendData.length - 2].pct;
    if (last > prev) return <TrendingUp className="w-4 h-4 text-emerald-500" />;
    if (last < prev) return <TrendingDown className="w-4 h-4 text-rose-500" />;
    return <Minus className="w-4 h-4 text-slate-400" />;
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-navy-900">Learner Trends</h1>
        <p className="text-sm text-slate-500">Track individual mastery progress over time</p>
      </div>

      <div className="flex flex-col sm:flex-row gap-4 flex-wrap">
        <div className="w-full sm:w-64">
          <Select
            label="Learner"
            value={selectedLearnerId}
            options={DEMO_LEARNERS.map((l) => ({ value: l.id, label: l.display_name }))}
            onChange={(e) => setSelectedLearnerId(e.target.value)}
          />
        </div>
        <div className="w-full sm:w-80">
          <Select
            label="Topic (optional)"
            value={selectedTopicId}
            options={[
              { value: '', label: 'All Topics (aggregate)' },
              ...DEMO_TOPICS.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` })),
            ]}
            onChange={(e) => setSelectedTopicId(e.target.value)}
          />
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="lg:col-span-2">
          <div className="flex items-center gap-2 mb-2.5">
            {getTrendIcon()}
            <span className="text-xs font-medium text-slate-500">
              {trendData.length} session day{trendData.length !== 1 ? 's' : ''} recorded
            </span>
          </div>
          <Suspense
            fallback={
              <div className="h-[300px] bg-slate-50 rounded-xl animate-pulse flex items-center justify-center">
                <span className="text-sm text-slate-400">Loading chart...</span>
              </div>
            }
          >
            <MasteryTrendChart
              data={trendData}
              topicName={selectedTopicId ? DEMO_TOPICS.find((t) => t.id === selectedTopicId)?.name : undefined}
            />
          </Suspense>
        </div>
        <div>
          <BECEReadiness
            score={beceScore}
            retainedTopics={retained}
            firstPassTopics={Math.max(0, firstPass - retained)}
            totalTopics={totalTopics}
          />
        </div>
      </div>
    </div>
  );
}
