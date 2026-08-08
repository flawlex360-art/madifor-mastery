import { useState } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import { Clock, AlertTriangle, CheckCircle, Eye } from 'lucide-react';
import { getDemoReviewQueue } from './demoData';
import { toast } from '@/stores/toastStore';

export default function DemoReviewQueuePage() {
  const reviews = getDemoReviewQueue();
  const [selectedReview, setSelectedReview] = useState<typeof reviews[0] | null>(null);

  const totalPending = reviews.length;
  const totalOverdue = reviews.filter(r => new Date(r.submitted_at).getTime() < Date.now() - 86400000).length;
  const learnerCount = new Set(reviews.map(r => r.learner_id)).size;

  const handleAction = () => {
    toast.error('Editing is disabled in the demo environment.');
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-zinc-900">Review Queue</h1>
        <p className="text-gray-500">Review AI-graded open-ended answers</p>
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
              <p className="text-xs text-gray-500">Overdue (24h+)</p>
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
              <p className="text-xs text-gray-500">Learners</p>
            </div>
          </CardContent>
        </Card>
      </div>

      <Card>
        <CardHeader>
          <h2 className="font-semibold text-zinc-900">Pending Answers</h2>
        </CardHeader>
        <CardContent className="p-0">
          <div className="divide-y">
            {reviews.map((r) => (
              <div key={r.id} className="p-4 hover:bg-gray-50 transition-colors">
                <div className="flex justify-between items-start mb-2">
                  <div>
                    <h3 className="font-medium text-zinc-900">{r.learner_name}</h3>
                    <p className="text-sm text-gray-500">{new Date(r.submitted_at).toLocaleString()}</p>
                  </div>
                  <Button variant="outline" size="sm" onClick={() => setSelectedReview(r)}>
                    <Eye className="w-4 h-4 mr-2" />
                    Review
                  </Button>
                </div>
                <p className="text-sm text-zinc-800 line-clamp-1 border-l-2 border-gray-200 pl-3">
                  <span className="font-medium">Q:</span> {r.question_text}
                </p>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Review Modal */}
      {selectedReview && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40 backdrop-blur-sm" onClick={() => setSelectedReview(null)}>
          <div className="bg-white rounded-2xl w-full max-w-2xl max-h-[90vh] flex flex-col shadow-2xl" onClick={e => e.stopPropagation()}>
            <div className="p-6 border-b border-gray-100 flex justify-between items-center">
              <h2 className="text-lg font-bold text-zinc-900">Review Answer: {selectedReview.learner_name}</h2>
              <div className="px-3 py-1 bg-blue-50 text-blue-700 rounded-full text-sm font-semibold">
                AI Score: {selectedReview.ai_score}%
              </div>
            </div>
            <div className="p-6 overflow-y-auto space-y-6">
              <div>
                <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Question</h4>
                <p className="text-zinc-900 bg-gray-50 p-4 rounded-lg border border-gray-100">{selectedReview.question_text}</p>
              </div>
              <div>
                <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Student Answer</h4>
                <p className="text-zinc-900 bg-blue-50/50 p-4 rounded-lg border border-blue-100">{selectedReview.student_answer}</p>
              </div>
              <div>
                <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">AI Feedback</h4>
                <p className="text-zinc-700 bg-amber-50/50 p-4 rounded-lg border border-amber-100">{selectedReview.ai_feedback}</p>
              </div>
            </div>
            <div className="p-6 border-t border-gray-100 flex justify-end gap-3 bg-gray-50 rounded-b-2xl">
              <Button variant="outline" onClick={() => setSelectedReview(null)}>Close</Button>
              <Button variant="outline" className="text-red-600 hover:text-red-700 hover:bg-red-50" onClick={handleAction}>Reject Answer</Button>
              <Button onClick={handleAction}>Approve Answer</Button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
