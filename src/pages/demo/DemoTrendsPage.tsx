import { useState, lazy, Suspense } from 'react';
import Select from '@/components/ui/Select';
import BECEReadiness from '@/components/dashboard/BECEReadiness';
import { TrendingUp } from 'lucide-react';
import { DEMO_LEARNERS, DEMO_TOPICS, getDemoTrends } from './demoData';

const MasteryTrendChart = lazy(() => import('@/components/dashboard/MasteryTrendChart'));

export default function DemoTrendsPage() {
  const [selectedLearnerId, setSelectedLearnerId] = useState(DEMO_LEARNERS[0].id);
  const [selectedTopicId, setSelectedTopicId] = useState('');

  // Map mock trends to expected Recharts format
  const trendData = getDemoTrends().map(t => ({ date: t.date, pct: t.avg_mastery, status: 'mock' }));
  
  // Fake BECE readiness stats based on selected learner
  const selectedLearner = DEMO_LEARNERS.find(l => l.id === selectedLearnerId);
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const isGood = (selectedLearner as any)?.type === 'good';
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const isRisk = (selectedLearner as any)?.type === 'at_risk';
  
  const retained = isGood ? 25 : isRisk ? 5 : 15;
  const firstPass = isGood ? 10 : isRisk ? 5 : 12;
  const totalTopics = 40;
  const beceScore = ((retained / totalTopics) * 0.7 + (firstPass / totalTopics) * 0.3) * 100;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-zinc-900">Learner Trends</h1>
        <p className="text-gray-500">Track mastery progress over time</p>
      </div>

      <div className="flex gap-4 flex-wrap">
        <div className="w-56">
          <Select
            label="Learner"
            value={selectedLearnerId}
            options={DEMO_LEARNERS.map((l) => ({ value: l.id, label: l.display_name }))}
            onChange={(e) => setSelectedLearnerId(e.target.value)}
          />
        </div>
        <div className="w-64">
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
          <div className="flex items-center gap-2 mb-2">
            <TrendingUp className="w-4 h-4 text-green-500" />
            <span className="text-sm text-gray-500">
              {trendData.length} data point{trendData.length !== 1 ? 's' : ''}
            </span>
          </div>
          <Suspense
            fallback={
              <div className="h-[300px] bg-gray-50 rounded-xl animate-pulse flex items-center justify-center">
                <span className="text-sm text-gray-400">Loading chart...</span>
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
            firstPassTopics={firstPass}
            totalTopics={totalTopics}
          />
        </div>
      </div>
    </div>
  );
}
