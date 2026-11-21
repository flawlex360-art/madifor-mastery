export interface DashboardAlert {
  id: string;
  type: 'at_risk' | 'declining' | 'overdue_reviews' | 'inactive';
  severity: 'high' | 'medium' | 'low';
  message: string;
  detail?: string;
  learnerIds?: string[];
}

export function generateAlerts(
  learners: Record<string, unknown>[],
  _classId: string,
  decliningLearners?: { learner_id: string; display_name: string; topic_name: string }[]
): DashboardAlert[] {
  const alerts: DashboardAlert[] = [];
  let alertIdx = 0;

  // At-risk learners (mastery < 40%)
  const atRisk = learners.filter(
    (l) => ((l.overall_avg_pct as number) || 0) < 40 && ((l.topics_attempted as number) || 0) > 0
  );
  if (atRisk.length > 0) {
    alerts.push({
      id: `alert-${alertIdx++}`,
      type: 'at_risk',
      severity: atRisk.length >= 3 ? 'high' : 'medium',
      message: `${atRisk.length} learner${atRisk.length > 1 ? 's' : ''} below 40% mastery`,
      detail: atRisk.map((l) => l.display_name as string).join(', '),
      learnerIds: atRisk.map((l) => l.learner_id as string),
    });
  }

  // Declining trend learners
  if (decliningLearners && decliningLearners.length > 0) {
    const byLearner = new Map<string, string[]>();
    for (const d of decliningLearners) {
      const existing = byLearner.get(d.learner_id) || [];
      existing.push(d.topic_name);
      byLearner.set(d.learner_id, existing);
    }

    for (const [learnerId, topicNames] of byLearner) {
      const name = decliningLearners.find((d) => d.learner_id === learnerId)?.display_name || 'Unknown';
      alerts.push({
        id: `alert-${alertIdx++}`,
        type: 'declining',
        severity: topicNames.length >= 2 ? 'high' : 'medium',
        message: `${name} declining in ${topicNames.length} topic${topicNames.length > 1 ? 's' : ''}`,
        detail: topicNames.join(', '),
        learnerIds: [learnerId],
      });
    }
  }

  // Inactive learners (0 topics attempted)
  const inactive = learners.filter((l) => ((l.topics_attempted as number) || 0) === 0);
  if (inactive.length > 0) {
    alerts.push({
      id: `alert-${alertIdx++}`,
      type: 'inactive',
      severity: 'low',
      message: `${inactive.length} learner${inactive.length > 1 ? 's' : ''} haven't started any topics`,
      detail: inactive.map((l) => l.display_name as string).join(', '),
      learnerIds: inactive.map((l) => l.learner_id as string),
    });
  }

  return alerts;
}
