import { Card, CardHeader, CardContent } from '@/components/ui/Card';
import { AlertTriangle, Clock, TrendingDown, X } from 'lucide-react';

export interface DashboardAlert {
  id: string;
  type: 'at_risk' | 'declining' | 'overdue_reviews' | 'inactive';
  severity: 'high' | 'medium' | 'low';
  message: string;
  detail?: string;
  learnerIds?: string[];
}

interface AlertPanelProps {
  alerts: DashboardAlert[];
  onDismiss?: (alertId: string) => void;
  onAlertClick?: (alert: DashboardAlert) => void;
}

function getAlertIcon(type: DashboardAlert['type']) {
  switch (type) {
    case 'at_risk':
      return <AlertTriangle className="w-4 h-4 text-red-500" />;
    case 'declining':
      return <TrendingDown className="w-4 h-4 text-amber-500" />;
    case 'overdue_reviews':
      return <Clock className="w-4 h-4 text-amber-500" />;
    case 'inactive':
      return <Clock className="w-4 h-4 text-gray-400" />;
  }
}

function getSeverityStyles(severity: DashboardAlert['severity']): string {
  switch (severity) {
    case 'high':
      return 'border-l-red-500 bg-red-50';
    case 'medium':
      return 'border-l-amber-400 bg-amber-50';
    case 'low':
      return 'border-l-gray-300 bg-gray-50';
  }
}

export default function AlertPanel({ alerts, onDismiss, onAlertClick }: AlertPanelProps) {
  if (alerts.length === 0) {
    return (
      <Card>
        <CardHeader>
          <h2 className="font-semibold text-zinc-900">Alerts</h2>
        </CardHeader>
        <CardContent>
          <p className="text-sm text-gray-500 text-center py-4">No alerts — everything looks good!</p>
        </CardContent>
      </Card>
    );
  }

  // Sort by severity
  const sorted = [...alerts].sort((a, b) => {
    const order = { high: 0, medium: 1, low: 2 };
    return order[a.severity] - order[b.severity];
  });

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <h2 className="font-semibold text-zinc-900">Alerts</h2>
          <span className="px-2 py-0.5 text-xs font-medium bg-red-100 text-red-700 rounded-full">
            {alerts.length}
          </span>
        </div>
      </CardHeader>
      <CardContent className="p-0">
        <div className="divide-y">
          {sorted.map((alert) => (
            <div
              key={alert.id}
              className={`flex items-start gap-3 px-4 py-3 border-l-4 ${getSeverityStyles(alert.severity)} ${
                onAlertClick ? 'cursor-pointer hover:bg-opacity-80' : ''
              }`}
              onClick={() => onAlertClick?.(alert)}
            >
              <div className="mt-0.5 flex-shrink-0">{getAlertIcon(alert.type)}</div>
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium text-zinc-900">{alert.message}</p>
                {alert.detail && (
                  <p className="text-xs text-gray-500 mt-0.5">{alert.detail}</p>
                )}
              </div>
              {onDismiss && (
                <button
                  onClick={(e) => {
                    e.stopPropagation();
                    onDismiss(alert.id);
                  }}
                  className="flex-shrink-0 p-1 text-gray-400 hover:text-gray-600 rounded"
                >
                  <X className="w-3.5 h-3.5" />
                </button>
              )}
            </div>
          ))}
        </div>
      </CardContent>
    </Card>
  );
}

// Utility: generate alerts from learner summary data
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
    // Group by learner
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

  // Inactive learners (0 topics attempted but enrolled)
  const inactive = learners.filter(
    (l) => ((l.topics_attempted as number) || 0) === 0
  );
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
