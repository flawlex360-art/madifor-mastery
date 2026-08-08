import { useState, useEffect, useMemo } from 'react';
import Select from '@/components/ui/Select';
import KpiCards from '@/components/dashboard/KpiCards';
import MasteryHeatmap from '@/components/dashboard/MasteryHeatmap';
import LearnerTable from '@/components/dashboard/LearnerTable';
import AlertPanel, { generateAlerts, type DashboardAlert } from '@/components/dashboard/AlertPanel';
import BECEReadiness from '@/components/dashboard/BECEReadiness';
import ExportButton from '@/components/dashboard/ExportButton';
import LearnerDrillDown from '@/components/dashboard/LearnerDrillDown';
import {
  DEMO_CLASSES,
  DEMO_TEACHER,
  DEMO_TOPICS,
  getDemoLearnerSummary,
  getDemoMasteryOverview,
  getDemoVoluntaryPractice,
  getDemoHeatmapCells,
  getDemoHistory,
  getDemoDrillDown,
} from './demoData';

export default function DemoDashboardPage() {
  const teacher = DEMO_TEACHER;
  const classes = DEMO_CLASSES;
  const [selectedClassId, setSelectedClassId] = useState(classes[0]?.id || '');
  
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

  const selectedClass = classes.find(c => c.id === selectedClassId);

  useEffect(() => {
    if (!selectedClassId) return;
    setLoading(true);
    setDrillDownLearnerId(null);
    setDrillDownData(null);

    // Simulate network delay for realism
    setTimeout(() => {
      const ls = getDemoLearnerSummary(selectedClassId);
      const mo = getDemoMasteryOverview(selectedClassId);
      const vp = getDemoVoluntaryPractice(selectedClassId);
      const tt = DEMO_TOPICS.length;

      setLearnerSummary(ls);
      setMasteryOverview(mo);
      setVoluntaryPractice(vp);
      setTotalTopics(tt);

      // Detect declining trends using demo history
      const history = getDemoHistory();
      const declining: { learner_id: string; display_name: string; topic_name: string }[] = [];
      const topicNameMap = new Map(DEMO_TOPICS.map(t => [t.id, t.name]));
      const learnerNameMap = new Map(ls.map(l => [l.learner_id as string, l.display_name as string]));

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

      setAlerts(generateAlerts(ls, selectedClassId, declining));
      setLoading(false);
    }, 600);
  }, [selectedClassId]);

  // Drill-down handler
  const handleLearnerClick = async (learnerId: string) => {
    setDrillDownLearnerId(learnerId);
    const learner = learnerSummary.find((l) => l.learner_id === learnerId);
    if (!learner) return;
    
    // Simulate delay
    setTimeout(() => {
      const topicMastery = getDemoDrillDown(learnerId);
      setDrillDownData({ learner, topicMastery });
    }, 300);
  };

  const handleDismissAlert = (alertId: string) => {
    setAlerts((prev) => prev.filter((a) => a.id !== alertId));
  };

  // Merge voluntary practice (demo doesn't have last_active for simplicity, just VP)
  const enrichedLearners: Record<string, unknown>[] = useMemo(
    () =>
      learnerSummary.map((learner) => {
        const vpData = voluntaryPractice.find((v) => v.learner_id === learner.learner_id);
        return {
          ...learner,
          voluntary_practice_sessions: (vpData?.voluntary_practice_sessions as number) || 0,
          voluntary_practice_topics: (vpData?.voluntary_practice_topics as number) || 0,
          last_active: new Date().toISOString(), // Mock recent activity
        };
      }),
    [learnerSummary, voluntaryPractice]
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

  const uniqueTopics = Array.from(new Map(heatmapTopics.map((t) => [t.topic_id, t])).values());

  const [heatmapCellData, setHeatmapCellData] = useState<
    { learner_id: string; topic_id: string; first_pass_pct: number; retained_mastered: boolean; first_pass_mastered: boolean; status: string }[]
  >([]);

  useEffect(() => {
    if (!selectedClassId || enrichedLearners.length === 0) return;
    setHeatmapCellData(getDemoHeatmapCells(selectedClassId));
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
      <div className="mb-4 bg-teal-50 border border-teal-200 rounded-lg p-4 text-teal-800 text-sm">
        <strong className="font-bold">👋 Welcome to the Demo Environment!</strong> You are viewing completely safe, realistic mock data. Feel free to explore—nothing you do here will affect a real account.
      </div>

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
        <div className="text-center py-8 text-gray-500">Loading demo data...</div>
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
              retainedTopics={totalRetained}
              firstPassTopics={totalFirstPass}
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
