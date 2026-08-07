import { useState, useEffect, lazy, Suspense } from 'react';
import { useSelectedClass } from '@/context/SelectedClassContext';
import { supabase } from '@/lib/supabase';
import { getClassLearners } from '@/api/auth';
import { getMasteryHistory, getTotalTopicsCount } from '@/api/assessment';
import { getCurriculumTree, getSubjects } from '@/api/curriculum';
import Select from '@/components/ui/Select';
import { aggregateTrendData } from '@/lib/trendUtils';
import BECEReadiness from '@/components/dashboard/BECEReadiness';
import { TrendingUp, TrendingDown, Minus } from 'lucide-react';
import type { Learner } from '@/types/auth';
import type { Topic } from '@/types/curriculum';

// Lazy-load Recharts (code-split — not in main bundle)
const MasteryTrendChart = lazy(() => import('@/components/dashboard/MasteryTrendChart'));

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

export default function LearnerTrendsPage() {
  const { selectedClassId } = useSelectedClass();
  const [learners, setLearners] = useState<Learner[]>([]);
  const [selectedLearnerId, setSelectedLearnerId] = useState('');
  const [topics, setTopics] = useState<Topic[]>([]);
  const [selectedTopicId, setSelectedTopicId] = useState('');
  const [trendData, setTrendData] = useState<ReturnType<typeof aggregateTrendData>>([]);
  const [learnerMastery, setLearnerMastery] = useState<Record<string, unknown>[]>([]);
  const [totalTopics, setTotalTopics] = useState(0);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    getSubjects().then((subjects) => {
      if (subjects.length > 0) {
        getCurriculumTree(subjects[0].id).then((tree) => {
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          const allTopics = tree.strands.flatMap((s: any) =>
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            s.sub_strands.flatMap((ss: any) => ss.topics)
          );
          setTopics(allTopics as Topic[]);
        });
      }
    });
    getTotalTopicsCount().then(setTotalTopics);
  }, []);

  useEffect(() => {
    if (!selectedClassId) return;
    getClassLearners(selectedClassId).then((ls) => {
      setLearners(ls);
      if (ls.length > 0) setSelectedLearnerId(ls[0].id);
    });
  }, [selectedClassId]);

  useEffect(() => {
    if (!selectedLearnerId) return;
    setLoading(true);

    db.from('topic_mastery')
      .select('*')
      .eq('learner_id', selectedLearnerId)
      .then(({ data }: { data: Record<string, unknown>[] | null }) => {
        setLearnerMastery(data || []);
      });

    getMasteryHistory(selectedLearnerId, selectedTopicId || undefined)
      .then((history) => setTrendData(aggregateTrendData(history)))
      .finally(() => setLoading(false));
  }, [selectedLearnerId, selectedTopicId]);

  const retained = learnerMastery.filter((m) => m.status === 'retained_mastered').length;
  const firstPass = learnerMastery.filter((m) => m.first_pass_mastered).length;
  const beceScore =
    totalTopics > 0
      ? ((retained / totalTopics) * 0.7 + (firstPass / totalTopics) * 0.3) * 100
      : 0;

  const getTrendIcon = () => {
    if (trendData.length < 2) return <Minus className="w-4 h-4 text-gray-400" />;
    const last = trendData[trendData.length - 1].pct;
    const prev = trendData[trendData.length - 2].pct;
    if (last > prev) return <TrendingUp className="w-4 h-4 text-green-500" />;
    if (last < prev) return <TrendingDown className="w-4 h-4 text-red-500" />;
    return <Minus className="w-4 h-4 text-gray-400" />;
  };

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
            options={learners.map((l) => ({ value: l.id, label: l.display_name }))}
            onChange={(e) => setSelectedLearnerId(e.target.value)}
          />
        </div>
        <div className="w-64">
          <Select
            label="Topic (optional)"
            value={selectedTopicId}
            options={[
              { value: '', label: 'All Topics (aggregate)' },
              ...topics.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` })),
            ]}
            onChange={(e) => setSelectedTopicId(e.target.value)}
          />
        </div>
      </div>

      {loading ? (
        <div className="text-center py-8 text-gray-500">Loading...</div>
      ) : (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          <div className="lg:col-span-2">
            <div className="flex items-center gap-2 mb-2">
              {getTrendIcon()}
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
                topicName={selectedTopicId ? topics.find((t) => t.id === selectedTopicId)?.name : undefined}
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
      )}
    </div>
  );
}
