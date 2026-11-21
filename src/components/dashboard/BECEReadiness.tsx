import { Card, CardContent } from '@/components/ui/Card';
import { Award } from 'lucide-react';

interface BECEReadinessProps {
  score: number; // 0-100
  retainedTopics: number;
  firstPassTopics: number;
  totalTopics: number;
}

function getReadinessColor(score: number): { text: string; bg: string; ring: string; label: string } {
  if (score >= 70) return { text: 'text-emerald-600', bg: 'bg-emerald-50', ring: 'stroke-emerald-500', label: 'Ready' };
  if (score >= 40) return { text: 'text-amber-600', bg: 'bg-amber-50', ring: 'stroke-amber-500', label: 'Developing' };
  return { text: 'text-rose-600', bg: 'bg-rose-50', ring: 'stroke-rose-400', label: 'Early Stage' };
}

export default function BECEReadiness({
  score,
  retainedTopics,
  firstPassTopics,
  totalTopics,
}: BECEReadinessProps) {
  const safeScore = Math.max(0, Math.min(100, Number.isFinite(score) ? score : 0));
  const colors = getReadinessColor(safeScore);
  const circumference = 2 * Math.PI * 45;
  const offset = circumference - (safeScore / 100) * circumference;

  return (
    <Card>
      <CardContent className="p-6">
        <div className="flex items-center gap-6">
          {/* Circular gauge */}
          <div className="relative flex-shrink-0">
            <svg width="110" height="110" className="-rotate-90" aria-hidden="true">
              <circle
                cx="55"
                cy="55"
                r="45"
                fill="none"
                strokeWidth="10"
                className="stroke-slate-100"
              />
              <circle
                cx="55"
                cy="55"
                r="45"
                fill="none"
                strokeWidth="10"
                className={colors.ring}
                strokeDasharray={circumference}
                strokeDashoffset={offset}
                strokeLinecap="round"
              />
            </svg>
            <div className="absolute inset-0 flex flex-col items-center justify-center">
              <span className={`text-2xl font-bold tabular-nums ${colors.text}`}>
                {Math.round(safeScore)}%
              </span>
            </div>
          </div>

          {/* Details */}
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 mb-1">
              <Award className={`w-5 h-5 flex-shrink-0 ${colors.text}`} />
              <h3 className="font-semibold text-navy-900">BECE Readiness</h3>
            </div>
            <span className={`inline-block px-2.5 py-0.5 text-xs font-medium rounded-full ${colors.bg} ${colors.text} mb-3`}>
              {colors.label}
            </span>

            <div className="space-y-1.5 text-sm">
              <div className="flex items-center justify-between gap-2">
                <span className="text-slate-500">Retained mastery</span>
                <span className="font-medium text-navy-900 tabular-nums">{retainedTopics} topics</span>
              </div>
              <div className="flex items-center justify-between gap-2">
                <span className="text-slate-500">First-pass only</span>
                <span className="font-medium text-navy-900 tabular-nums">{firstPassTopics} topics</span>
              </div>
              <div className="flex items-center justify-between gap-2">
                <span className="text-slate-500">Total curriculum</span>
                <span className="font-medium text-navy-900 tabular-nums">{totalTopics} topics</span>
              </div>
            </div>
          </div>
        </div>

        <p className="text-xs text-slate-400 mt-4">
          Weighted: 70% retained mastery + 30% first-pass mastery
        </p>
      </CardContent>
    </Card>
  );
}
