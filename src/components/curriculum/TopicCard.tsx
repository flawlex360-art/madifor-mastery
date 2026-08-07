import { cn } from '@/lib/utils';
import { ChevronRight } from 'lucide-react';

interface TopicCardProps {
  name: string;
  code: string;
  questionCount: number;
  masteryPct?: number;
  status?: 'not_started' | 'in_progress' | 'first_pass_mastered' | 'retained_mastered';
  onClick: () => void;
  onHover?: () => void;
}

export default function TopicCard({ name, code, questionCount, masteryPct = 0, status = 'not_started', onClick, onHover }: TopicCardProps) {
  const ringColor = status === 'retained_mastered' ? 'stroke-mastery-green'
    : status === 'first_pass_mastered' ? 'stroke-mastery-amber'
    : masteryPct > 0 ? 'stroke-mastery-amber' : 'stroke-gray-200';

  const radius = 20;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference - (masteryPct / 100) * circumference;

  return (
    <button
      onClick={onClick}
      onMouseEnter={onHover}
      onTouchStart={onHover}
      className="w-full text-left p-4 rounded-xl border bg-white hover:border-teal-400 hover:shadow-md transition-all group"
    >
      <div className="flex items-center gap-4">
        <div className="relative w-12 h-12 flex-shrink-0">
          <svg className="w-12 h-12 -rotate-90" viewBox="0 0 48 48">
            <circle cx="24" cy="24" r={radius} fill="none" stroke="#e5e7eb" strokeWidth="4" />
            <circle
              cx="24" cy="24" r={radius} fill="none"
              className={cn(ringColor)}
              strokeWidth="4"
              strokeDasharray={circumference}
              strokeDashoffset={offset}
              strokeLinecap="round"
            />
          </svg>
          <span className="absolute inset-0 flex items-center justify-center text-xs font-bold text-zinc-900">
            {masteryPct}%
          </span>
        </div>
        <div className="flex-1 min-w-0">
          <p className="font-medium text-zinc-900 truncate">{name}</p>
          <p className="text-xs text-gray-500">{code} · {questionCount} questions</p>
        </div>
        <ChevronRight className="w-5 h-5 text-gray-400 group-hover:text-zinc-900 transition-colors" />
      </div>
    </button>
  );
}
