import { Card, CardContent } from '@/components/ui/Card';
import { Award } from 'lucide-react';

interface BECEReadinessProps {
  score: number; // 0–100
  retainedTopics: number;
  firstPassTopics: number;
  totalTopics: number;
}

function getReadinessColor(score: number): { text: string; bg: string; ring: string; label: string } {
  if (score >= 70) return { text: 'text-green-600', bg: 'bg-green-100', ring: 'stroke-green-500', label: 'Ready' };
  if (score >= 40) return { text: 'text-amber-600', bg: 'bg-amber-100', ring: 'stroke-amber-500', label: 'Developing' };
  return { text: 'text-red-600', bg: 'bg-red-100', ring: 'stroke-red-400', label: 'Early Stage' };
}

export default function BECEReadiness({
  score, retainedTopics, firstPassTopics, totalTopics,
}: BECEReadinessProps) {
  const colors = getReadinessColor(score);
  const circumference = 2 * Math.PI * 45;
  const offset = circumference - (score / 100) * circumference;

  return (
    <Card>
      <CardContent className="p-6">
        <div className="flex items-center gap-6">
          {/* Circular gauge */}
          <div className="relative flex-shrink-0">
            <svg width="110" height="110" className="-rotate-90">
              <circle
                cx="55" cy="55" r="45"
                fill="none" strokeWidth="10" className="stroke-gray-100"
              />
              <circle
                cx="55" cy="55" r="45"
                fill="none" strokeWidth="10"
                className={colors.ring}
                strokeDasharray={circumference}
                strokeDashoffset={offset}
                strokeLinecap="round"
              />
            </svg>
            <div className="absolute inset-0 flex flex-col items-center justify-center">
              <span className={`text-2xl font-bold ${colors.text}`}>{Math.round(score)}%</span>
            </div>
          </div>

          {/* Details */}
          <div className="flex-1">
            <div className="flex items-center gap-2 mb-1">
              <Award className={`w-5 h-5 ${colors.text}`} />
              <h3 className="font-semibold text-zinc-900">BECE Readiness</h3>
            </div>
            <span className={`inline-block px-2 py-0.5 text-xs font-medium rounded-full ${colors.bg} ${colors.text} mb-3`}>
              {colors.label}
            </span>

            <div className="space-y-1.5 text-sm">
              <div className="flex items-center justify-between">
                <span className="text-gray-500">Retained mastery</span>
                <span className="font-medium text-zinc-900">{retainedTopics} topics</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-gray-500">First-pass only</span>
                <span className="font-medium text-zinc-900">{firstPassTopics} topics</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-gray-500">Total curriculum</span>
                <span className="font-medium text-zinc-900">{totalTopics} topics</span>
              </div>
            </div>
          </div>
        </div>

        <p className="text-xs text-gray-400 mt-4">
          Weighted: 70% retained mastery + 30% first-pass mastery
        </p>
      </CardContent>
    </Card>
  );
}
