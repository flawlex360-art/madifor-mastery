import { useState, useEffect, lazy, Suspense, useMemo } from 'react';
import { useSelectedClass } from '@/context/SelectedClassContext';
import { supabase } from '@/lib/supabase';
import { getClassLearners } from '@/api/auth';
import { getMasteryHistory, getTotalTopicsCount } from '@/api/assessment';
import { getCurriculumTree, getSubjects } from '@/api/curriculum';
import Select from '@/components/ui/Select';
import { aggregateTrendData } from '@/lib/trendUtils';
import { computeBeceReadiness } from '@/lib/exportUtils';
import BECEReadiness from '@/components/dashboard/BECEReadiness';
import { TrendingUp, TrendingDown, Minus } from 'lucide-react';
import type { Learner } from '@/types/auth';
import type { Topic } from '@/types/curriculum';
import { toast } from '@/stores/toastStore';

const MasteryTrendChart = lazy(() => import('@/components/dashboard/MasteryTrendChart'));

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

export default function LearnerTrendsPage() {
  const { selectedClassId, selectedClass, loading: classesLoading } = useSelectedClass();
  const [learners, setLearners] = useState<Learner[]>([]);
  const [selectedLearnerId, setSelectedLearnerId] = useState('');
  const [allTopics, setAllTopics] = useState<Topic[]>([]);
  const [selectedTopicId, setSelectedTopicId] = useState('');
  const [trendData, setTrendData] = useState<ReturnType<typeof aggregateTrendData>>([]);
  const [learnerMastery, setLearnerMastery] = useState<Record<string, unknown>[]>([]);
  const [totalTopics, setTotalTopics] = useState(0);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    getSubjects()
      .then((subjects) => {
        if (subjects.length > 0) {
          return getCurriculumTree(subjects[0].id);
        }
        return null;
      })
      .then((tree) => {
        if (!tree) return;
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const flatTopics = tree.strands.flatMap((s: any) =>
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          s.sub_strands.flatMap((ss: any) => ss.topics)
        );
        setAllTopics(flatTopics as Topic[]);
      })
      .catch((err) => console.error('Failed to load topics:', err));
  }, []);

  useEffect(() => {
    getTotalTopicsCount(selectedClass?.class_level)
      .then(setTotalTopics)
      .catch(() => setTotalTopics(0));
    setSelectedTopicId('');
  }, [selectedClass?.class_level]);

  const classTopics = useMemo(() => {
    if (!selectedClass?.class_level) return allTopics;
    return allTopics.filter((t) => t.class_level === selectedClass.class_level);
  }, [allTopics, selectedClass?.class_level]);

  useEffect(() => {
    if (classesLoading) return;
    if (!selectedClassId) {
      setLearners([]);
      setSelectedLearnerId('');
      setLearnerMastery([]);
      setTrendData([]);
      return;
    }

    let active = true;
    getClassLearners(selectedClassId)
      .then((ls) => {
        if (!active) return;
        setLearners(ls);
        if (ls.length > 0) {
          setSelectedLearnerId(ls[0].id);
        } else {
          setSelectedLearnerId('');
          setLearnerMastery([]);
          setTrendData([]);
        }
      })
      .catch((err) => {
        console.error('Failed to load learners:', err);
        if (active) toast.error('Could not load learners for this class.');
      });

    return () => {
      active = false;
    };
  }, [selectedClassId, classesLoading]);

  useEffect(() => {
    if (!selectedLearnerId) {
      setLearnerMastery([]);
      setTrendData([]);
      setLoading(false);
      return;
    }

    let active = true;
    setLoading(true);

    Promise.all([
      db.from('topic_mastery').select('*').eq('learner_id', selectedLearnerId),
      getMasteryHistory(selectedLearnerId, selectedTopicId || undefined),
    ])
      .then(([masteryRes, history]) => {
        if (!active) return;
        if (masteryRes.error) {
          console.error('Failed to load learner topic mastery:', masteryRes.error);
          setLearnerMastery([]);
        } else {
          setLearnerMastery(masteryRes.data || []);
        }
        setTrendData(aggregateTrendData(history));
      })
      .catch((err) => {
        console.error('Failed to load learner trends:', err);
        if (active) toast.error('Failed to load learner trend history.');
      })
      .finally(() => {
        if (active) setLoading(false);
      });

    return () => {
      active = false;
    };
  }, [selectedLearnerId, selectedTopicId]);

  const retained = learnerMastery.filter((m) => m.status === 'retained_mastered').length;
  const firstPass = learnerMastery.filter((m) => m.first_pass_mastered).length;
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
        <p className="text-sm text-slate-500">Track individual mastery trajectory and BECE readiness over time</p>
      </div>

      <div className="flex flex-col sm:flex-row gap-4 flex-wrap">
        <div className="w-full sm:w-64">
          <Select
            label="Learner"
            value={selectedLearnerId}
            options={
              learners.length > 0
                ? learners.map((l) => ({ value: l.id, label: l.display_name }))
                : [{ value: '', label: 'No learners in class' }]
            }
            disabled={learners.length === 0}
            onChange={(e) => setSelectedLearnerId(e.target.value)}
          />
        </div>
        <div className="w-full sm:w-80">
          <Select
            label="Topic (optional)"
            value={selectedTopicId}
            options={[
              { value: '', label: 'All Topics (daily average)' },
              ...classTopics.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` })),
            ]}
            disabled={!selectedLearnerId}
            onChange={(e) => setSelectedTopicId(e.target.value)}
          />
        </div>
      </div>

      {!selectedLearnerId ? (
        <div className="bg-white border border-slate-200 rounded-xl p-10 text-center text-sm text-slate-500">
          {learners.length === 0
            ? 'Enroll learners in this class to track their trends over time.'
            : 'Select a learner to view their trend data.'}
        </div>
      ) : loading ? (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          <div className="lg:col-span-2 h-[300px] bg-white border border-slate-200 rounded-xl animate-pulse" />
          <div className="h-[220px] bg-white border border-slate-200 rounded-xl animate-pulse" />
        </div>
      ) : (
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
                topicName={selectedTopicId ? classTopics.find((t) => t.id === selectedTopicId)?.name : undefined}
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
      )}
    </div>
  );
}
