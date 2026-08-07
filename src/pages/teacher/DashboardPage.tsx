import { useState, useEffect, useMemo } from 'react';
import { useAuth } from '@/hooks/useAuth';
import { useSelectedClass } from '@/context/SelectedClassContext';
import { supabase } from '@/lib/supabase';
import { getLearnerSummary, getClassMasteryOverview, getTotalTopicsCount, getLearnerTopicMastery } from '@/api/assessment';
import { getClassVoluntaryPractice } from '@/api/voluntaryPractice';
import Select from '@/components/ui/Select';
import KpiCards from '@/components/dashboard/KpiCards';
import MasteryHeatmap from '@/components/dashboard/MasteryHeatmap';
import LearnerTable from '@/components/dashboard/LearnerTable';
import AlertPanel, { generateAlerts, type DashboardAlert } from '@/components/dashboard/AlertPanel';
import BECEReadiness from '@/components/dashboard/BECEReadiness';
import ExportButton from '@/components/dashboard/ExportButton';
import LearnerDrillDown from '@/components/dashboard/LearnerDrillDown';

export default function DashboardPage() {
  const { teacher } = useAuth();
  const { classes, selectedClassId, setSelectedClassId, selectedClass } = useSelectedClass();
  const [learnerSummary, setLearnerSummary] = useState<Record<string, unknown>[]>([]);
  const [masteryOverview, setMasteryOverview] = useState<Record<string, unknown>[]>([]);
  const [voluntaryPractice, setVoluntaryPractice] = useState<Record<string, unknown>[]>([]);
  const [totalTopics, setTotalTopics] = useState(0);
  const [loading, setLoading] = useState(true);
  const [alerts, setAlerts] = useState<DashboardAlert[]>([]);
  const [heatmapView, setHeatmapView] = useState<'first_pass' | 'retained'>('first_pass');

  // Drill-down state
  const [drillDownLearnerId, setDrillDownLearnerId] = useState<string | null>(null);
  const [drillDownData, setDrillDownData] = useState<{
    learner: Record<string, unknown>;
    topicMastery: Record<string, unknown>[];
  } | null>(null);

  useEffect(() => {
    if (!selectedClassId) return;
    setLoading(true);
    setDrillDownLearnerId(null);
    setDrillDownData(null);

    Promise.all([
      getLearnerSummary(selectedClassId),
      getClassMasteryOverview(selectedClassId),
      getClassVoluntaryPractice(selectedClassId),
      getTotalTopicsCount(),
    ])
      .then(async ([ls, mo, vp, tt]) => {
        setLearnerSummary(ls);
        setMasteryOverview(mo);
        setVoluntaryPractice(vp);
        setTotalTopics(tt);

        // Detect declining trends: learners whose mastery dropped in last 2 attempts
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const db = supabase as any;
        const learnerIds = (ls as Record<string, unknown>[]).map((l) => l.learner_id as string);
        let declining: { learner_id: string; display_name: string; topic_name: string }[] = [];

        if (learnerIds.length > 0) {
          try {
            // Get recent mastery history entries
            const { data: history } = await db
              .from('mastery_history')
              .select('learner_id, topic_id, first_pass_pct, recorded_at')
              .in('learner_id', learnerIds)
              .order('recorded_at', { ascending: false })
              .limit(200);

            if (history && history.length > 0) {
              // Get topic names
              const topicIds = [...new Set(history.map((h: Record<string, unknown>) => h.topic_id as string))];
              const { data: topics } = await db
                .from('topics')
                .select('id, name')
                .in('id', topicIds);
              const topicNameMap = new Map((topics || []).map((t: Record<string, unknown>) => [t.id, t.name]));

              // Get learner names
              const learnerNameMap = new Map(
                (ls as Record<string, unknown>[]).map((l) => [l.learner_id as string, l.display_name as string])
              );

              // Group by (learner, topic), check if last 2 entries show decline
              const grouped = new Map<string, Record<string, unknown>[]>();
              for (const h of history as Record<string, unknown>[]) {
                const key = `${h.learner_id}:${h.topic_id}`;
                const existing = grouped.get(key) || [];
                existing.push(h);
                grouped.set(key, existing);
              }

              for (const [key, entries] of grouped) {
                if (entries.length < 2) continue;
                // entries are already sorted desc by recorded_at
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
          } catch {
            // Silently skip decline detection if query fails
          }
        }

        setAlerts(generateAlerts(ls as Record<string, unknown>[], selectedClassId, declining));
      })
      .finally(() => setLoading(false));
  }, [selectedClassId]);

  // Drill-down handler
  const handleLearnerClick = async (learnerId: string) => {
    setDrillDownLearnerId(learnerId);
    const learner = learnerSummary.find((l) => l.learner_id === learnerId);
    if (!learner) return;
    const topicMastery = await getLearnerTopicMastery(learnerId);
    setDrillDownData({ learner, topicMastery });
  };

  const handleDismissAlert = (alertId: string) => {
    setAlerts((prev) => prev.filter((a) => a.id !== alertId));
  };

  // Fetch last active timestamps per learner
  const [lastActiveMap, setLastActiveMap] = useState<Record<string, string>>({});

  useEffect(() => {
    if (!selectedClassId) return;
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const db = supabase as any;

    // Get learner IDs for this class, then find their last attempt
    db.from('learners')
      .select('id')
      .eq('class_id', selectedClassId)
      .then(({ data: learners }: { data: { id: string }[] | null }) => {
        if (!learners || learners.length === 0) return;
        const ids = learners.map((l) => l.id);

        db.from('attempts')
          .select('learner_id, created_at')
          .in('learner_id', ids)
          .order('created_at', { ascending: false })
          .limit(500)
          .then(({ data: attempts }: { data: { learner_id: string; created_at: string }[] | null }) => {
            if (!attempts) return;
            const map: Record<string, string> = {};
            for (const a of attempts) {
              if (!map[a.learner_id]) {
                map[a.learner_id] = a.created_at;
              }
            }
            setLastActiveMap(map);
          });
      });
  }, [selectedClassId]);

  // Merge voluntary practice and last active into learner summary
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

  // KPI calculations
  const totalLearners = learnerSummary.length;
  const avgMastery =
    learnerSummary.length > 0
      ? Math.round(
          learnerSummary.reduce(
            (sum: number, l: Record<string, unknown>) => sum + ((l.overall_avg_pct as number) || 0),
            0
          ) / learnerSummary.length
        )
      : 0;
  const learnersAtRisk = learnerSummary.filter(
    (l: Record<string, unknown>) => ((l.overall_avg_pct as number) || 0) < 40
  ).length;
  const topicsAttempted = learnerSummary.reduce(
    (sum: number, l: Record<string, unknown>) => sum + ((l.topics_attempted as number) || 0),
    0
  );
  const totalVoluntaryPractice = voluntaryPractice.reduce(
    (sum: number, v: Record<string, unknown>) => sum + ((v.voluntary_practice_sessions as number) || 0),
    0
  );

  // BECE readiness: average across all learners
  const totalRetained = learnerSummary.reduce(
    (sum: number, l: Record<string, unknown>) => sum + ((l.topics_retained as number) || 0),
    0
  );
  const totalFirstPass = learnerSummary.reduce(
    (sum: number, l: Record<string, unknown>) => sum + ((l.topics_first_pass as number) || 0),
    0
  );
  const beceScore =
    totalTopics > 0 && totalLearners > 0
      ? ((totalRetained / (totalTopics * totalLearners)) * 0.7 +
          (totalFirstPass / (totalTopics * totalLearners)) * 0.3) *
        100
      : 0;

  // Heatmap data
  const heatmapLearners = enrichedLearners.map((l) => ({
    learner_id: l.learner_id as string,
    display_name: l.display_name as string,
    learner_code: (l.learner_code as string) || '',
  }));

  const heatmapTopics = masteryOverview
    .filter((m: Record<string, unknown>) => (m.class_id as string) === selectedClassId)
    .map((m: Record<string, unknown>) => ({
      topic_id: m.topic_id as string,
      topic_name: m.topic_name as string,
      topic_code: m.topic_code as string,
    }));

  // Deduplicate topics
  const uniqueTopics = Array.from(new Map(heatmapTopics.map((t) => [t.topic_id, t])).values());

  // Build heatmap cells from per-learner topic mastery
  // Since mv_class_mastery is aggregated per class-topic (not per learner-topic),
  // we need to fetch per-learner topic mastery for the heatmap.
  // We'll use a simple approach: for each learner, we know their avg_pct and topics_attempted.
  // The actual per-cell data comes from topic_mastery table queries.
  // For now, build from what we have — the mastery overview gives us topic-level aggregates.
  // A proper implementation would fetch topic_mastery for all learners in the class.
  // Let's do that inline:
  const [heatmapCellData, setHeatmapCellData] = useState<
    { learner_id: string; topic_id: string; first_pass_pct: number; retained_mastered: boolean; first_pass_mastered: boolean; status: string }[]
  >([]);

  useEffect(() => {
    if (!selectedClassId || enrichedLearners.length === 0) return;

    const fetchHeatmapCells = async () => {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const db = supabase as any;
      const learnerIds = enrichedLearners.map((l) => l.learner_id as string);

      const { data } = await db
        .from('topic_mastery')
        .select('learner_id, topic_id, first_pass_pct, first_pass_mastered, retained_mastered, status')
        .in('learner_id', learnerIds);

      setHeatmapCellData(data || []);
    };

    fetchHeatmapCells();
  }, [selectedClassId, enrichedLearners.length]);

  // Show drill-down view
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
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-zinc-900">Dashboard</h1>
          <p className="text-gray-500">Welcome back, {teacher?.full_name}</p>
        </div>
        <div className="flex items-center gap-3">
          {classes.length > 0 && (
            <div className="flex flex-col items-end">
              <Select
                value={selectedClassId}
                onChange={(e) => setSelectedClassId(e.target.value)}
                options={classes.map((c) => ({ value: c.id, label: c.name }))}
              />
              {selectedClassCode && (
                <div className="text-sm font-medium mt-1 bg-teal-50 text-teal-700 px-3 py-1 rounded-full border border-teal-100">
                  Class Code: <span className="font-bold tracking-widest">{selectedClassCode}</span>
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

      {classes.length === 0 ? (
        <div className="text-center py-12 text-gray-500">
          No classes yet. Create a class to get started.
        </div>
      ) : loading ? (
        <div className="text-center py-8 text-gray-500">Loading...</div>
      ) : (
        <>
          {/* KPI Cards */}
          <KpiCards
            totalLearners={totalLearners}
            avgMastery={avgMastery}
            learnersAtRisk={learnersAtRisk}
            topicsAttempted={topicsAttempted}
            voluntaryPracticeSessions={totalVoluntaryPractice}
          />

          {/* BECE Readiness + Alerts row */}
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <BECEReadiness
              score={beceScore}
              retainedTopics={totalRetained}
              firstPassTopics={totalFirstPass}
              totalTopics={totalTopics}
            />
            <AlertPanel alerts={alerts} onDismiss={handleDismissAlert} />
          </div>

          {/* Mastery Heatmap */}
          <MasteryHeatmap
            learners={heatmapLearners}
            topics={uniqueTopics}
            cells={heatmapCellData}
            view={heatmapView}
            onViewChange={setHeatmapView}
            onLearnerClick={handleLearnerClick}
          />

          {/* Learner Table */}
          <LearnerTable
            learners={enrichedLearners as never}
            onLearnerClick={handleLearnerClick}
          />
        </>
      )}
    </div>
  );
}
