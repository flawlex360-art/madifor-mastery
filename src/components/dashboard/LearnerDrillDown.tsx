import { Card, CardHeader, CardContent } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import PdfExportButton from './PdfExportButton';
import { ArrowLeft, Award, BookOpen, Clock, Target } from 'lucide-react';
import { computeBeceReadiness } from '@/lib/exportUtils';

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
      return <Award className="w-4 h-4 text-emerald-600" />;
    case 'first_pass_mastered':
      return <Target className="w-4 h-4 text-amber-500" />;
    case 'in_progress':
      return <BookOpen className="w-4 h-4 text-indigo-500" />;
    default:
      return <Clock className="w-4 h-4 text-slate-400" />;
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
    case 'retained_mastered': return 'bg-emerald-50 text-emerald-700';
    case 'first_pass_mastered': return 'bg-amber-50 text-amber-700';
    case 'in_progress': return 'bg-indigo-50 text-indigo-700';
    default: return 'bg-slate-100 text-slate-500';
  }
}

export default function LearnerDrillDown({ learner, topicMastery, totalTopics, onBack }: LearnerDrillDownProps) {
  const avgPct = Math.round(learner.overall_avg_pct || 0);

  const retainedCount = topicMastery.filter((t) => t.retained_mastered).length;
  const firstPassCount = topicMastery.filter((t) => t.first_pass_mastered).length;
  const total = totalTopics || topicMastery.length;
  const readinessScore = computeBeceReadiness(retainedCount, firstPassCount, total);

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div className="flex items-center gap-3">
          <Button variant="ghost" size="sm" onClick={onBack}>
            <ArrowLeft className="w-4 h-4 mr-1" />
            Back
          </Button>
          <div>
            <h2 className="text-xl font-bold text-navy-900">{learner.display_name}</h2>
            {learner.learner_code && (
              <p className="text-xs font-mono text-slate-500">ID: {learner.learner_code}</p>
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
            <p className="text-2xl font-bold text-navy-900 tabular-nums">{avgPct}%</p>
            <p className="text-xs text-slate-500 mt-0.5">Avg Mastery</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 text-center">
            <p className="text-2xl font-bold text-emerald-600 tabular-nums">{learner.topics_retained ?? retainedCount}</p>
            <p className="text-xs text-slate-500 mt-0.5">Retained</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 text-center">
            <p className="text-2xl font-bold text-amber-600 tabular-nums">{learner.topics_first_pass ?? firstPassCount}</p>
            <p className="text-xs text-slate-500 mt-0.5">First-Pass</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4 text-center">
            <p className="text-2xl font-bold text-indigo-600 tabular-nums">{learner.self_practice_sessions_week || 0}</p>
            <p className="text-xs text-slate-500 mt-0.5">Practice This Week</p>
          </CardContent>
        </Card>
      </div>

      {/* Topic-by-topic mastery */}
      <Card>
        <CardHeader>
          <h3 className="font-semibold text-navy-900">Topic Mastery</h3>
        </CardHeader>
        <CardContent className="p-0">
          {topicMastery.length === 0 ? (
            <p className="text-center text-slate-500 py-8 text-sm">No topics attempted yet.</p>
          ) : (
            <div className="divide-y divide-slate-100">
              {topicMastery.map((tm) => {
                const attempted = tm.status !== 'not_started';
                return (
                  <div key={tm.topic_id} className="flex flex-wrap sm:flex-nowrap items-center gap-3 sm:gap-4 px-4 py-3">
                    <div className="flex-shrink-0">{getStatusIcon(tm.status)}</div>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-navy-900 truncate">
                        {tm.topic_name || tm.topic_code || 'Unknown Topic'}
                      </p>
                      {tm.topic_code && tm.topic_name && (
                        <p className="text-xs font-mono text-slate-400">{tm.topic_code}</p>
                      )}
                    </div>

                    {/* Mastery bar */}
                    <div className="w-32 flex-shrink-0">
                      <div className="flex items-center justify-between text-xs mb-1">
                        <span className="text-slate-500">First-pass</span>
                        <span className="font-medium text-navy-900 tabular-nums">
                          {attempted ? `${Math.round(tm.first_pass_pct)}%` : '—'}
                        </span>
                      </div>
                      <div className="h-2 bg-slate-100 rounded-full overflow-hidden">
                        <div
                          className={`h-full rounded-full transition-all ${
                            !attempted
                              ? 'bg-slate-200'
                              : tm.first_pass_pct >= 80
                                ? 'bg-emerald-500'
                                : tm.first_pass_pct >= 40
                                  ? 'bg-amber-400'
                                  : 'bg-rose-400'
                          }`}
                          style={{ width: attempted ? `${Math.min(tm.first_pass_pct, 100)}%` : '0%' }}
                        />
                      </div>
                    </div>

                    <span className={`px-2.5 py-1 text-xs font-medium rounded-full flex-shrink-0 ${getStatusColor(tm.status)}`}>
                      {getStatusLabel(tm.status)}
                    </span>
                  </div>
                );
              })}
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
