import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { Clock, AlertTriangle, CheckCircle } from 'lucide-react';
import { getDemoReviewQueue } from './demoData';

export default function DemoReviewQueuePage() {
  const reviews = getDemoReviewQueue();

  const byLearner = new Map<string, typeof reviews>();
  for (const r of reviews) {
    const existing = byLearner.get(r.learner_id) || [];
    existing.push(r);
    byLearner.set(r.learner_id, existing);
  }

  const totalPending = reviews.length;
  const totalOverdue = reviews.filter((r) => r.is_overdue).length;
  const learnerCount = byLearner.size;

  const getStageLabel = (stage: string) => {
    switch (stage) {
      case 'missed': return 'Missed';
      case 'review_1': return 'Review 1 (3d)';
      case 'review_2': return 'Review 2 (7d)';
      case 'review_3': return 'Review 3 (14d)';
      default: return stage;
    }
  };

  const getStageColor = (stage: string) => {
    switch (stage) {
      case 'missed': return 'bg-rose-50 text-rose-700';
      case 'review_1': return 'bg-amber-50 text-amber-700';
      case 'review_2': return 'bg-indigo-50 text-indigo-700';
      case 'review_3': return 'bg-emerald-50 text-emerald-700';
      default: return 'bg-slate-100 text-slate-600';
    }
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-navy-900">Review Queue</h1>
        <p className="text-sm text-slate-500">Track pending spaced-repetition reviews across your class</p>
      </div>

      {/* Summary cards */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <Card>
          <CardContent className="p-4 flex items-center gap-3.5">
            <div className="w-10 h-10 rounded-xl bg-amber-50 flex items-center justify-center flex-shrink-0">
              <Clock className="w-5 h-5 text-amber-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-navy-900 tabular-nums">{totalPending}</p>
              <p className="text-xs text-slate-500">Pending Reviews</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3.5">
            <div className="w-10 h-10 rounded-xl bg-rose-50 flex items-center justify-center flex-shrink-0">
              <AlertTriangle className="w-5 h-5 text-rose-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-navy-900 tabular-nums">{totalOverdue}</p>
              <p className="text-xs text-slate-500">Overdue</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3.5">
            <div className="w-10 h-10 rounded-xl bg-indigo-50 flex items-center justify-center flex-shrink-0">
              <CheckCircle className="w-5 h-5 text-indigo-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-navy-900 tabular-nums">{learnerCount}</p>
              <p className="text-xs text-slate-500">Learners with Reviews</p>
            </div>
          </CardContent>
        </Card>
      </div>

      <Card>
        <CardHeader>
          <h2 className="font-semibold text-navy-900">Pending Spaced-Repetition Items by Learner</h2>
        </CardHeader>
        <CardContent className="p-0">
          <div className="divide-y divide-slate-100">
            {Array.from(byLearner.entries()).map(([learnerId, items]) => {
              const overdueCount = items.filter((r) => r.is_overdue).length;
              return (
                <div key={learnerId} className="px-4 py-3.5">
                  <div className="flex items-center justify-between mb-2">
                    <div className="flex items-center gap-2">
                      <span className="font-semibold text-navy-900">{items[0].display_name}</span>
                      {overdueCount > 0 && (
                        <span className="px-2 py-0.5 text-xs font-medium bg-rose-50 text-rose-700 rounded-full">
                          {overdueCount} overdue
                        </span>
                      )}
                    </div>
                    <span className="text-xs text-slate-500">
                      {items.length} question{items.length !== 1 ? 's' : ''}
                    </span>
                  </div>
                  <div className="flex flex-wrap gap-1.5">
                    {items.map((item, i) => (
                      <span
                        key={`${item.question_id}-${i}`}
                        className={`px-2.5 py-1 text-xs font-medium rounded-full ${getStageColor(item.stage)} ${
                          item.is_overdue ? 'ring-1 ring-rose-300' : ''
                        }`}
                        title={`${item.topic_code} — ${item.topic_name}\nDue: ${new Date(item.due_at).toLocaleDateString('en-GB')}`}
                      >
                        {item.topic_code.split('.').pop()} &middot; {getStageLabel(item.stage)}
                        {item.is_overdue && ' (Overdue)'}
                      </span>
                    ))}
                  </div>
                </div>
              );
            })}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
