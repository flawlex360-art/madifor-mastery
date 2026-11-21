import { useState, useEffect, useMemo } from 'react';
import Select from '@/components/ui/Select';
import KpiCards from '@/components/dashboard/KpiCards';
import MasteryHeatmap from '@/components/dashboard/MasteryHeatmap';
import LearnerTable from '@/components/dashboard/LearnerTable';
import AlertPanel from '@/components/dashboard/AlertPanel';
import { generateAlerts, type DashboardAlert } from '@/lib/alerts';
import BECEReadiness from '@/components/dashboard/BECEReadiness';
import ExportButton from '@/components/dashboard/ExportButton';
import LearnerDrillDown from '@/components/dashboard/LearnerDrillDown';
import { computeBeceReadiness } from '@/lib/exportUtils';
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
  const [loading, setLoading] = useState(true);
  const [alerts, setAlerts] = useState<DashboardAlert[]>([]);
  const [heatmapView, setHeatmapView] = useState<'first_pass' | 'retained'>('first_pass');

  const [drillDownLearnerId, setDrillDownLearnerId] = useState<string | null>(null);
  const [drillDownData, setDrillDownData] = useState<{
    learner: Record<string, unknown>;
    topicMastery: Record<string, unknown>[];
  } | null>(null);

  const selectedClass = classes.find((c) => c.id === selectedClassId);

  useEffect(() => {
    if (!selectedClassId) return;
    setLoading(true);
    setDrillDownLearnerId(null);
    setDrillDownData(null);

    const timer = setTimeout(() => {
      const ls = getDemoLearnerSummary(selectedClassId);
      const mo = getDemoMasteryOverview(selectedClassId);
      const vp = getDemoVoluntaryPractice(selectedClassId);
      const cells = getDemoHeatmapCells(selectedClassId);

      setLearnerSummary(ls);
      setMasteryOverview(mo);
      setVoluntaryPractice(vp);
      setHeatmapCellData(cells);

      const history = getDemoHistory();
      const declining: { learner_id: string; display_name: string; topic_name: string }[] = [];
      const topicNameMap = new Map(DEMO_TOPICS.map((t) => [t.id, t.name]));
      const learnerNameMap = new Map(ls.map((l) => [l.learner_id, l.display_name]));

      const grouped = new Map<string, typeof history>();
      for (const h of history) {
        if (!learnerNameMap.has(h.learner_id)) continue;
        const key = `${h.learner_id}:${h.topic_id}`;
        const existing = grouped.get(key) || [];
        existing.push(h);
        grouped.set(key, existing);
      }

      for (const [key, entries] of grouped) {
        if (entries.length < 2) continue;
        if (entries[1].first_pass_pct - entries[0].first_pass_pct >= 10) {
          const [learnerId, topicId] = key.split(':');
          declining.push({
            learner_id: learnerId,
            display_name: learnerNameMap.get(learnerId) || 'Unknown',
            topic_name: topicNameMap.get(topicId) || 'Unknown topic',
          });
        }
      }

      setAlerts(generateAlerts(ls, selectedClassId, declining));
      setLoading(false);
    }, 200);

    return () => clearTimeout(timer);
  }, [selectedClassId]);

  const enrichedLearners: Record<string, unknown>[] = useMemo(
    () =>
      learnerSummary.map((learner) => {
        const vpData = voluntaryPractice.find((v) => v.learner_id === learner.learner_id);
        return {
          ...learner,
          voluntary_practice_sessions: (vpData?.voluntary_practice_sessions as number) || 0,
          voluntary_practice_topics: (vpData?.voluntary_practice_topics as number) || 0,
          last_active: '2026-11-20T15:30:00Z',
        };
      }),
    [learnerSummary, voluntaryPractice]
  );

  const handleLearnerClick = (learnerId: string) => {
    const learner = enrichedLearners.find((l) => l.learner_id === learnerId);
    if (!learner) return;
    setDrillDownLearnerId(learnerId);
    setDrillDownData({
      learner: { ...learner, class_name: selectedClass?.name || '' },
      topicMastery: getDemoDrillDown(learnerId),
    });
  };

  const handleDismissAlert = (alertId: string) => {
    setAlerts((prev) => prev.filter((a) => a.id !== alertId));
  };

  const totalTopics = DEMO_TOPICS.length;
  const totalLearners = learnerSummary.length;
  const activeLearners = learnerSummary.filter(
    (l) => ((l.topics_attempted as number) || 0) > 0
  );
  const avgMastery =
    activeLearners.length > 0
      ? Math.round(
          activeLearners.reduce(
            (sum, l) => sum + ((l.overall_avg_pct as number) || 0),
            0
          ) / activeLearners.length
        )
      : 0;
  const learnersAtRisk = activeLearners.filter(
    (l) => ((l.overall_avg_pct as number) || 0) < 40
  ).length;
  const topicsAttempted = learnerSummary.reduce(
    (sum, l) => sum + ((l.topics_attempted as number) || 0),
    0
  );
  const totalVoluntaryPractice = voluntaryPractice.reduce(
    (sum, v) => sum + ((v.voluntary_practice_sessions as number) || 0),
    0
  );

  const totalRetained = learnerSummary.reduce(
    (sum, l) => sum + ((l.topics_retained as number) || 0),
    0
  );
  const totalFirstPass = learnerSummary.reduce(
    (sum, l) => sum + ((l.topics_first_pass as number) || 0),
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

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-navy-900">Dashboard</h1>
          <p className="text-sm text-slate-500">Welcome back, {teacher.full_name}</p>
        </div>
        <div className="flex flex-wrap items-center gap-3">
          <div className="flex items-center gap-2">
            <div className="w-48">
              <Select
                value={selectedClassId}
                onChange={(e) => setSelectedClassId(e.target.value)}
                options={classes.map((c) => ({ value: c.id, label: c.name }))}
              />
            </div>
            {selectedClass?.class_code && (
              <div className="text-xs font-medium bg-indigo-50 text-indigo-700 px-3 py-2 rounded-lg border border-indigo-100 whitespace-nowrap">
                Code: <span className="font-bold font-mono">{selectedClass.class_code}</span>
              </div>
            )}
          </div>
          <ExportButton
            classId={selectedClassId}
            learners={enrichedLearners}
            classMastery={masteryOverview}
            className_={selectedClass?.name || 'demo-class'}
          />
        </div>
      </div>

      {loading ? (
        <div className="space-y-6">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
            {[1, 2, 3, 4, 5].map((n) => (
              <div key={n} className="h-24 bg-white border border-slate-200 rounded-xl animate-pulse" />
            ))}
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
            topics={heatmapTopics}
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
