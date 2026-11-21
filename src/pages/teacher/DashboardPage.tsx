import { useState, useEffect, useMemo } from 'react';
import { useAuth } from '@/hooks/useAuth';
import { useSelectedClass } from '@/context/SelectedClassContext';
import { supabase } from '@/lib/supabase';
import {
  getLearnerSummary,
  getClassMasteryOverview,
  getTotalTopicsCount,
  getLearnerTopicMastery,
} from '@/api/assessment';
import { getClassVoluntaryPractice } from '@/api/voluntaryPractice';
import { computeBeceReadiness } from '@/lib/exportUtils';
import Select from '@/components/ui/Select';
import KpiCards from '@/components/dashboard/KpiCards';
import MasteryHeatmap from '@/components/dashboard/MasteryHeatmap';
import LearnerTable from '@/components/dashboard/LearnerTable';
import AlertPanel from '@/components/dashboard/AlertPanel';
import { generateAlerts, type DashboardAlert } from '@/lib/alerts';
import BECEReadiness from '@/components/dashboard/BECEReadiness';
import ExportButton from '@/components/dashboard/ExportButton';
import LearnerDrillDown from '@/components/dashboard/LearnerDrillDown';
import { toast } from '@/stores/toastStore';

export default function DashboardPage() {
  const { teacher } = useAuth();
  const { classes, selectedClassId, setSelectedClassId, selectedClass, loading: classesLoading } =
    useSelectedClass();

  const [learnerSummary, setLearnerSummary] = useState<Record<string, unknown>[]>([]);
  const [masteryOverview, setMasteryOverview] = useState<Record<string, unknown>[]>([]);
  const [voluntaryPractice, setVoluntaryPractice] = useState<Record<string, unknown>[]>([]);
  const [totalTopics, setTotalTopics] = useState(0);
  const [loading, setLoading] = useState(true);
  const [alerts, setAlerts] = useState<DashboardAlert[]>([]);
  const [heatmapView, setHeatmapView] = useState<'first_pass' | 'retained'>('first_pass');
  const [lastActiveMap, setLastActiveMap] = useState<Record<string, string>>({});
  const [heatmapCellData, setHeatmapCellData] = useState<
    {
      learner_id: string;
      topic_id: string;
      first_pass_pct: number;
      retained_mastered: boolean;
      first_pass_mastered: boolean;
      status: string;
    }[]
  >([]);

  // Drill-down state
  const [drillDownLearnerId, setDrillDownLearnerId] = useState<string | null>(null);
  const [drillDownData, setDrillDownData] = useState<{
    learner: Record<string, unknown>;
    topicMastery: Record<string, unknown>[];
  } | null>(null);

  useEffect(() => {
    if (classesLoading) return;
    if (!selectedClassId) {
      setLearnerSummary([]);
      setMasteryOverview([]);
      setVoluntaryPractice([]);
      setAlerts([]);
      setLastActiveMap({});
      setHeatmapCellData([]);
      setLoading(false);
      return;
    }

    let active = true;
    setLoading(true);
    setDrillDownLearnerId(null);
    setDrillDownData(null);
    setLastActiveMap({});
    setHeatmapCellData([]);

    Promise.all([
      getLearnerSummary(selectedClassId),
      getClassMasteryOverview(selectedClassId),
      getClassVoluntaryPractice(selectedClassId),
      getTotalTopicsCount(selectedClass?.class_level),
    ])
      .then(async ([ls, mo, vp, tt]) => {
        if (!active) return;
        setLearnerSummary(ls);
        setMasteryOverview(mo);
        setVoluntaryPractice(vp);
        setTotalTopics(tt);

        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const db = supabase as any;
        const learnerIds = (ls as Record<string, unknown>[]).map((l) => l.learner_id as string);
        const declining: { learner_id: string; display_name: string; topic_name: string }[] = [];

        if (learnerIds.length > 0) {
          const [historyRes, attemptsRes, cellsRes] = await Promise.allSettled([
            db
              .from('mastery_history')
              .select('learner_id, topic_id, first_pass_pct, recorded_at')
              .in('learner_id', learnerIds)
              .order('recorded_at', { ascending: false })
              .limit(200),
            db
              .from('attempts')
              .select('learner_id, created_at')
              .in('learner_id', learnerIds)
              .order('created_at', { ascending: false })
              .limit(500),
            db
              .from('topic_mastery')
              .select('learner_id, topic_id, first_pass_pct, first_pass_mastered, retained_mastered, status')
              .in('learner_id', learnerIds),
          ]);

          if (!active) return;

          if (attemptsRes.status === 'fulfilled' && attemptsRes.value.data) {
            const map: Record<string, string> = {};
            for (const a of attemptsRes.value.data as { learner_id: string; created_at: string }[]) {
              if (!map[a.learner_id]) map[a.learner_id] = a.created_at;
            }
            setLastActiveMap(map);
          }

          if (cellsRes.status === 'fulfilled' && cellsRes.value.data) {
            setHeatmapCellData(cellsRes.value.data);
          }

          if (historyRes.status === 'fulfilled' && historyRes.value.data?.length) {
            const history = historyRes.value.data as Record<string, unknown>[];
            const topicIds = [...new Set(history.map((h) => h.topic_id as string))];
            const { data: topics } = await db.from('topics').select('id, name').in('id', topicIds);
            if (!active) return;

            const topicNameMap = new Map(
              (topics || []).map((t: Record<string, unknown>) => [t.id, t.name])
            );
            const learnerNameMap = new Map(
              (ls as Record<string, unknown>[]).map((l) => [
                l.learner_id as string,
                l.display_name as string,
              ])
            );

            const grouped = new Map<string, Record<string, unknown>[]>();
            for (const h of history) {
              const key = `${h.learner_id}:${h.topic_id}`;
              const existing = grouped.get(key) || [];
              existing.push(h);
              grouped.set(key, existing);
            }

            for (const [key, entries] of grouped) {
              if (entries.length < 2) continue;
              const latest = entries[0].first_pass_pct as number;
              const previous = entries[1].first_pass_pct as number;
              if (latest < previous && previous - latest >= 10) {
                const [learnerId, topicId] = key.split(':');
                declining.push({
                  learner_id: learnerId,
                  display_name: learnerNameMap.get(learnerId) || 'Unknown',
                  topic_name: (topicNameMap.get(topicId) as string) || 'Unknown topic',
                });
              }
            }
          }
        }

        if (active) {
          setAlerts(generateAlerts(ls as Record<string, unknown>[], selectedClassId, declining));
        }
      })
      .catch((err) => {
        console.error('Dashboard load failed:', err);
        if (active) toast.error('Failed to load class dashboard data.');
      })
      .finally(() => {
        if (active) setLoading(false);
      });

    return () => {
      active = false;
    };
  }, [selectedClassId, selectedClass?.class_level, classesLoading]);

  const handleLearnerClick = async (learnerId: string) => {
    const learner = enrichedLearners.find((l) => l.learner_id === learnerId);
    if (!learner) return;
    setDrillDownLearnerId(learnerId);
    try {
      const topicMastery = await getLearnerTopicMastery(learnerId);
      setDrillDownData({
        learner: { ...learner, class_name: selectedClass?.name || '' },
        topicMastery,
      });
    } catch (err) {
      console.error('Failed to load learner details:', err);
      toast.error('Could not load learner mastery detail.');
      setDrillDownLearnerId(null);
    }
  };

  const handleDismissAlert = (alertId: string) => {
    setAlerts((prev) => prev.filter((a) => a.id !== alertId));
  };

  const enrichedLearners: Record<string, unknown>[] = useMemo(
    () =>
      learnerSummary.map((learner) => {
        const vpData = voluntaryPractice.find((v) => v.learner_id === learner.learner_id);
        return {
          ...learner,
          voluntary_practice_sessions: (vpData?.voluntary_practice_sessions as number) || 0,
          voluntary_practice_topics: (vpData?.voluntary_practice_topics as number) || 0,
          last_active: lastActiveMap[learner.learner_id as string] || null,
        };
      }),
    [learnerSummary, voluntaryPractice, lastActiveMap]
  );

  const totalLearners = learnerSummary.length;
  const activeLearners = learnerSummary.filter(
    (l) => ((l.topics_attempted as number) || 0) > 0
  );
  const avgMastery =
    activeLearners.length > 0
      ? Math.round(
          activeLearners.reduce(
            (sum: number, l) => sum + ((l.overall_avg_pct as number) || 0),
            0
          ) / activeLearners.length
        )
      : 0;
  const learnersAtRisk = activeLearners.filter(
    (l) => ((l.overall_avg_pct as number) || 0) < 40
  ).length;
  const topicsAttempted = learnerSummary.reduce(
    (sum: number, l) => sum + ((l.topics_attempted as number) || 0),
    0
  );
  const totalVoluntaryPractice = voluntaryPractice.reduce(
    (sum: number, v) => sum + ((v.voluntary_practice_sessions as number) || 0),
    0
  );

  const totalRetained = learnerSummary.reduce(
    (sum: number, l) => sum + ((l.topics_retained as number) || 0),
    0
  );
  const totalFirstPass = learnerSummary.reduce(
    (sum: number, l) => sum + ((l.topics_first_pass as number) || 0),
    0
  );
  const beceScore =
    totalLearners > 0
      ? computeBeceReadiness(totalRetained, totalFirstPass, totalTopics * totalLearners)
      : 0;

  const heatmapLearners = enrichedLearners.map((l) => ({
    learner_id: l.learner_id as string,
    display_name: l.display_name as string,
    learner_code: (l.learner_code as string) || '',
  }));

  const heatmapTopics = masteryOverview
    .filter((m) => (m.class_id as string) === selectedClassId)
    .map((m) => ({
      topic_id: m.topic_id as string,
      topic_name: m.topic_name as string,
      topic_code: m.topic_code as string,
    }));

  const uniqueTopics = Array.from(new Map(heatmapTopics.map((t) => [t.topic_id, t])).values());

  if (drillDownLearnerId && drillDownData) {
    return (
      <LearnerDrillDown
        learner={drillDownData.learner as never}
        topicMastery={drillDownData.topicMastery as never}
        totalTopics={totalTopics}
        onBack={() => {
          setDrillDownLearnerId(null);
          setDrillDownData(null);
        }}
      />
    );
  }

  const selectedClassName = selectedClass?.name || '';
  const selectedClassCode = selectedClass?.class_code || '';

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-navy-900">Dashboard</h1>
          <p className="text-sm text-slate-500">Welcome back, {teacher?.full_name}</p>
        </div>
        <div className="flex flex-wrap items-center gap-3">
          {classes.length > 0 && (
            <div className="flex items-center gap-2">
              <div className="w-44">
                <Select
                  value={selectedClassId}
                  onChange={(e) => setSelectedClassId(e.target.value)}
                  options={classes.map((c) => ({ value: c.id, label: c.name }))}
                />
              </div>
              {selectedClassCode && (
                <div className="text-xs font-medium bg-indigo-50 text-indigo-700 px-3 py-2 rounded-lg border border-indigo-100 whitespace-nowrap">
                  Code: <span className="font-bold tracking-wider font-mono">{selectedClassCode}</span>
                </div>
              )}
            </div>
          )}
          <ExportButton
            classId={selectedClassId}
            learners={enrichedLearners}
            classMastery={masteryOverview}
            className_={selectedClassName}
          />
        </div>
      </div>

      {!classesLoading && classes.length === 0 ? (
        <div className="bg-white rounded-xl border border-slate-200 p-12 text-center text-slate-500">
          No classes yet. Visit Classes in the sidebar to create your first class.
        </div>
      ) : loading || classesLoading ? (
        <div className="space-y-6">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
            {[1, 2, 3, 4, 5].map((n) => (
              <div key={n} className="h-24 bg-white border border-slate-200 rounded-xl animate-pulse" />
            ))}
          </div>
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <div className="h-52 bg-white border border-slate-200 rounded-xl animate-pulse" />
            <div className="h-52 bg-white border border-slate-200 rounded-xl animate-pulse" />
          </div>
          <div className="h-64 bg-white border border-slate-200 rounded-xl animate-pulse" />
        </div>
      ) : (
        <>
          <KpiCards
            totalLearners={totalLearners}
            avgMastery={avgMastery}
            learnersAtRisk={learnersAtRisk}
            topicsAttempted={topicsAttempted}
            voluntaryPracticeSessions={totalVoluntaryPractice}
          />

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <BECEReadiness
              score={beceScore}
              retainedTopics={totalLearners > 0 ? Math.round(totalRetained / totalLearners) : 0}
              firstPassTopics={
                totalLearners > 0
                  ? Math.round(Math.max(0, totalFirstPass - totalRetained) / totalLearners)
                  : 0
              }
              totalTopics={totalTopics}
            />
            <AlertPanel alerts={alerts} onDismiss={handleDismissAlert} />
          </div>

          <MasteryHeatmap
            learners={heatmapLearners}
            topics={uniqueTopics}
            cells={heatmapCellData}
            view={heatmapView}
            onViewChange={setHeatmapView}
            onLearnerClick={handleLearnerClick}
          />

          <LearnerTable
            learners={enrichedLearners as never}
            onLearnerClick={handleLearnerClick}
          />
        </>
      )}
    </div>
  );
}
