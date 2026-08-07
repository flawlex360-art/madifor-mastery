import { useState, useEffect } from 'react';
import { useSelectedClass } from '@/context/SelectedClassContext';
import { getClassReviewQueue } from '@/api/assessment';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { Clock, AlertTriangle, CheckCircle } from 'lucide-react';

interface ReviewItem {
  learner_id: string;
  display_name: string;
  question_id: string;
  topic_id: string;
  topic_name: string;
  topic_code: string;
  stage: string;
  due_at: string;
  is_overdue: boolean;
}

export default function ReviewQueuePage() {
  const { selectedClassId } = useSelectedClass();
  const [reviews, setReviews] = useState<ReviewItem[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!selectedClassId) return;
    setLoading(true);
    getClassReviewQueue(selectedClassId)
      .then((data) => setReviews(data as unknown as ReviewItem[]))
      .finally(() => setLoading(false));
  }, [selectedClassId]);

  // Group by learner
  const byLearner = new Map<string, ReviewItem[]>();
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
      case 'review_1': return 'Review 1';
      case 'review_2': return 'Review 2';
      case 'review_3': return 'Review 3';
      default: return stage;
    }
  };

  const getStageColor = (stage: string) => {
    switch (stage) {
      case 'missed': return 'bg-red-100 text-red-700';
      case 'review_1': return 'bg-amber-100 text-amber-700';
      case 'review_2': return 'bg-blue-100 text-blue-700';
      case 'review_3': return 'bg-purple-100 text-purple-700';
      default: return 'bg-gray-100 text-gray-600';
    }
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-zinc-900">Review Queue</h1>
        <p className="text-gray-500">See which learners have pending reviews</p>
      </div>

      {/* Summary cards */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-amber-100 flex items-center justify-center">
              <Clock className="w-5 h-5 text-amber-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-zinc-900">{totalPending}</p>
              <p className="text-xs text-gray-500">Pending Reviews</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-red-100 flex items-center justify-center">
              <AlertTriangle className="w-5 h-5 text-red-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-zinc-900">{totalOverdue}</p>
              <p className="text-xs text-gray-500">Overdue</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-blue-100 flex items-center justify-center">
              <CheckCircle className="w-5 h-5 text-blue-600" />
            </div>
            <div>
              <p className="text-xl font-bold text-zinc-900">{learnerCount}</p>
              <p className="text-xs text-gray-500">Learners with Reviews</p>
            </div>
          </CardContent>
        </Card>
      </div>

      {loading ? (
        <div className="text-center py-8 text-gray-500">Loading...</div>
      ) : reviews.length === 0 ? (
        <Card>
          <CardContent className="p-8 text-center text-gray-500">
            <CheckCircle className="w-8 h-8 mx-auto mb-2 text-green-400" />
            No pending reviews — all caught up!
          </CardContent>
        </Card>
      ) : (
        <Card>
          <CardHeader>
            <h2 className="font-semibold text-zinc-900">Pending Reviews by Learner</h2>
          </CardHeader>
          <CardContent className="p-0">
            <div className="divide-y">
              {Array.from(byLearner.entries()).map(([learnerId, items]) => {
                const overdueCount = items.filter((r) => r.is_overdue).length;
                return (
                  <div key={learnerId} className="px-4 py-3">
                    <div className="flex items-center justify-between mb-2">
                      <div className="flex items-center gap-2">
                        <span className="font-medium text-zinc-900">{items[0].display_name}</span>
                        {overdueCount > 0 && (
                          <span className="px-1.5 py-0.5 text-xs bg-red-100 text-red-700 rounded-full">
                            {overdueCount} overdue
                          </span>
                        )}
                      </div>
                      <span className="text-xs text-gray-500">
                        {items.length} question{items.length !== 1 ? 's' : ''}
                      </span>
                    </div>
                    <div className="flex flex-wrap gap-1.5">
                      {items.map((item, i) => (
                        <span
                          key={i}
                          className={`px-2 py-1 text-xs rounded-full ${getStageColor(item.stage)} ${
                            item.is_overdue ? 'ring-1 ring-red-300' : ''
                          }`}
                          title={`${item.topic_code} — ${item.topic_name}\nStage: ${getStageLabel(item.stage)}\nDue: ${new Date(item.due_at).toLocaleDateString()}`}
                        >
                          {item.topic_code.split('.').pop()} · {getStageLabel(item.stage)}
                          {item.is_overdue && ' ⚠'}
                        </span>
                      ))}
                    </div>
                  </div>
                );
              })}
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
