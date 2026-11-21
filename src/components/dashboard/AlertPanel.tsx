import { Card, CardHeader, CardContent } from '@/components/ui/Card';
import { AlertTriangle, Clock, TrendingDown, X } from 'lucide-react';
import type { DashboardAlert } from '@/lib/alerts';

interface AlertPanelProps {
  alerts: DashboardAlert[];
  onDismiss?: (alertId: string) => void;
  onAlertClick?: (alert: DashboardAlert) => void;
}

function getAlertIcon(type: DashboardAlert['type']) {
  switch (type) {
    case 'at_risk':
      return <AlertTriangle className="w-4 h-4 text-rose-500" />;
    case 'declining':
      return <TrendingDown className="w-4 h-4 text-amber-500" />;
    case 'overdue_reviews':
      return <Clock className="w-4 h-4 text-amber-500" />;
    case 'inactive':
      return <Clock className="w-4 h-4 text-slate-400" />;
  }
}

function getSeverityStyles(severity: DashboardAlert['severity']): string {
  switch (severity) {
    case 'high':
      return 'border-l-rose-500 bg-rose-50/70';
    case 'medium':
      return 'border-l-amber-400 bg-amber-50/70';
    case 'low':
      return 'border-l-slate-300 bg-slate-50/70';
  }
}

export default function AlertPanel({ alerts, onDismiss, onAlertClick }: AlertPanelProps) {
  if (alerts.length === 0) {
    return (
      <Card>
        <CardHeader>
          <h2 className="font-semibold text-navy-900">Alerts</h2>
        </CardHeader>
        <CardContent>
          <p className="text-sm text-slate-500 text-center py-6">No alerts — everything looks on track.</p>
        </CardContent>
      </Card>
    );
  }

  const order = { high: 0, medium: 1, low: 2 };
  const sorted = [...alerts].sort((a, b) => order[a.severity] - order[b.severity]);

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <h2 className="font-semibold text-navy-900">Alerts</h2>
          <span className="px-2.5 py-0.5 text-xs font-semibold bg-rose-50 text-rose-700 rounded-full">
            {alerts.length}
          </span>
        </div>
      </CardHeader>
      <CardContent className="p-0">
        <div className="divide-y divide-slate-100 max-h-80 overflow-y-auto custom-scrollbar">
          {sorted.map((alert) => (
            <div
              key={alert.id}
              className={`flex items-start gap-3 px-4 py-3 border-l-4 transition-colors ${getSeverityStyles(alert.severity)} ${
                onAlertClick ? 'cursor-pointer hover:brightness-95' : ''
              }`}
              onClick={() => onAlertClick?.(alert)}
            >
              <div className="mt-0.5 flex-shrink-0">{getAlertIcon(alert.type)}</div>
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium text-navy-900">{alert.message}</p>
                {alert.detail && (
                  <p className="text-xs text-slate-500 mt-0.5 line-clamp-2">{alert.detail}</p>
                )}
              </div>
              {onDismiss && (
                <button
                  type="button"
                  aria-label="Dismiss alert"
                  onClick={(e) => {
                    e.stopPropagation();
                    onDismiss(alert.id);
                  }}
                  className="flex-shrink-0 p-1 text-slate-400 hover:text-slate-600 rounded"
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
