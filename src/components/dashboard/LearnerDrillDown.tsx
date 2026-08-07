import { Card, CardHeader, CardContent } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import PdfExportButton from './PdfExportButton';
import { ArrowLeft, Award, BookOpen, Clock, Target } from 'lucide-react';

interface LearnerDrillDownData {
  learner_id: string;
  display_name: string;
  learner_code?: string;
  class_name?: string;
  topics_retained?: number;
  topics_first_pass?: number;
  topics_in_progress?: number;
  topics_attempted?: number;
  overall_avg_pct?: number;
  self_practice_sessions_week?: number;
}

interface TopicMasteryRow {
  topic_id: string;
  topic_name?: string;
  topic_code?: string;
  first_pass_pct: number;
  first_pass_mastered: boolean;
  retained_mastered: boolean;
  status: string;
}

interface LearnerDrillDownProps {
  learner: LearnerDrillDownData;
  topicMastery: TopicMasteryRow[];
  totalTopics?: number;
  onBack: () => void;
}

function getStatusIcon(status: string) {
  switch (status) {
    case 'retained_mastered':
      return <Award className="w-4 h-4 text-green-600" />;
    case 'first_pass_mastered':
      return <Target className="w-4 h-4 text-amber-500" />;
    case 'in_progress':
      return <BookOpen className="w-4 h-4 text-blue-500" />;
    default:
      return <Clock className="w-4 h-4 text-gray-400" />;
  }
}

function getStatusLabel(status: string): string {
  switch (status) {
    case 'retained_mastered': return 'Retained';
    case 'first_pass_mastered': return 'First-Pass';
    case 'in_progress': return 'In Progress';
    default: return 'Not Started';
  }
}

function getStatusColor(status: string): string {
  switch (status) {
    case 'retained_mastered': return 'bg-green-100 text-green-700';
    case 'first_pass_mastered': return 'bg-amber-100 text-amber-700';
    case 'in_progress': return 'bg-blue-100 text-blue-700';
    default: return 'bg-gray-100 text-gray-500';
  }
}

export default function LearnerDrillDown({ learner, topicMastery, totalTopics, onBack }: LearnerDrillDownProps) {
  const avgPct = Math.round(learner.overall_avg_pct || 0);

  // Prepare PDF data
  const retainedCount = topicMastery.filter((t) => t.retained_mastered).length;
  const firstPassCount = topicMastery.filter((t) => t.first_pass_mastered).length;
  const total = totalTopics || topicMastery.length;
  const readinessScore = total > 0
    ? ((retainedCount / total) * 0.7 + (firstPassCount / total) * 0.3) * 100
    : 0;

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-4">
          <Button variant="ghost" size="sm" onClick={onBack}>
            <ArrowLeft className="w-4 h-4 mr-1" />
            Back
          </Button>
          <div>
            <h2 className="text-xl font-bold text-zinc-900">{learner.display_name}</h2>
            {learner.learner_code && (
              <p className="text-sm text-gray-500">ID: {learner.learner_code}</p>
            )}
          </div>
        </div>
        <PdfExportButton
          learnerData={{
            learner_name: learner.display_name,
            learner_code: learner.learner_code || '',
            class_name: learner.class_name || '',
            readiness_score: readinessScore,
            retained_count: retainedCount,
            first_pass_count: firstPassCount,
            total_topics: total,
            topic_mastery: topicMastery.map((tm) => ({
              topic_code: tm.topic_code || '',
              topic_name: tm.topic_name || '',
              first_pass_pct: tm.first_pass_pct,
              status: tm.status,
            })),
          }}
        />
      </div>

      {/* Summary cards */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
        <Card>
          <CardContent className="p-4 text-center">
            <p className="text-2xl font-bold text-zinc-900">{avgPct}%</p>
            <p className="text-xs text-gray-500">Avg Mastery</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 text-center">
            <p className="text-2xl font-bold text-green-600">{learner.topics_retained || 0}</p>
            <p className="text-xs text-gray-500">Retained</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 text-center">
            <p className="text-2xl font-bold text-amber-600">{learner.topics_first_pass || 0}</p>
            <p className="text-xs text-gray-500">First-Pass</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 text-center">
            <p className="text-2xl font-bold text-blue-600">{learner.self_practice_sessions_week || 0}</p>
            <p className="text-xs text-gray-500">Practice This Week</p>
          </CardContent>
        </Card>
      </div>

      {/* Topic-by-topic mastery */}
      <Card>
        <CardHeader>
          <h3 className="font-semibold text-zinc-900">Topic Mastery</h3>
        </CardHeader>
        <CardContent className="p-0">
          {topicMastery.length === 0 ? (
            <p className="text-center text-gray-500 py-8">No topics attempted yet.</p>
          ) : (
            <div className="divide-y">
              {topicMastery.map((tm) => (
                <div key={tm.topic_id} className="flex items-center gap-4 px-4 py-3">
                  <div className="flex-shrink-0">{getStatusIcon(tm.status)}</div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-zinc-900 truncate">
                      {tm.topic_name || tm.topic_code || 'Unknown Topic'}
                    </p>
                    {tm.topic_code && tm.topic_name && (
                      <p className="text-xs text-gray-400">{tm.topic_code}</p>
                    )}
                  </div>

                  {/* Mastery bar */}
                  <div className="w-32 flex-shrink-0">
                    <div className="flex items-center justify-between text-xs mb-1">
                      <span className="text-gray-500">First-pass</span>
                      <span className="font-medium text-zinc-900">{Math.round(tm.first_pass_pct)}%</span>
                    </div>
                    <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
                      <div
                        className={`h-full rounded-full transition-all ${
                          tm.first_pass_pct >= 80
                            ? 'bg-green-500'
                            : tm.first_pass_pct >= 40
                              ? 'bg-amber-400'
                              : 'bg-red-400'
                        }`}
                        style={{ width: `${Math.min(tm.first_pass_pct, 100)}%` }}
                      />
                    </div>
                  </div>

                  <span className={`px-2 py-1 text-xs font-medium rounded-full flex-shrink-0 ${getStatusColor(tm.status)}`}>
                    {getStatusLabel(tm.status)}
                  </span>
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
