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

export default function TopicCard({
  name,
  code,
  questionCount,
  masteryPct = 0,
  status = 'not_started',
  onClick,
  onHover,
}: TopicCardProps) {
  const safePct = Math.min(100, Math.max(0, Math.round(masteryPct)));
  const isDisabled = questionCount <= 0;

  const ringColor =
    status === 'retained_mastered'
      ? 'stroke-mastery-green'
      : status === 'first_pass_mastered'
        ? 'stroke-indigo-500'
        : status === 'in_progress' || safePct > 0
          ? safePct >= 40
            ? 'stroke-mastery-amber'
            : 'stroke-mastery-red'
          : 'stroke-slate-200';

  const radius = 20;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference - (safePct / 100) * circumference;

  return (
    <button
      type="button"
      onClick={onClick}
      onMouseEnter={onHover}
      disabled={isDisabled}
      className={cn(
        'w-full text-left p-4 rounded-2xl border border-slate-200/80 bg-white transition-all group',
        isDisabled
          ? 'opacity-60 cursor-not-allowed'
          : 'hover:border-indigo-400 hover:shadow-md active:scale-[0.99]'
      )}
    >
      <div className="flex items-center gap-4">
        <div className="relative w-12 h-12 flex-shrink-0">
          <svg className="w-12 h-12 -rotate-90" viewBox="0 0 48 48">
            <circle cx="24" cy="24" r={radius} fill="none" stroke="#e2e8f0" strokeWidth="4" />
            <circle
              cx="24"
              cy="24"
              r={radius}
              fill="none"
              className={cn(ringColor)}
              strokeWidth="4"
              strokeDasharray={circumference}
              strokeDashoffset={offset}
              strokeLinecap="round"
            />
          </svg>
          <span className="absolute inset-0 flex items-center justify-center text-xs font-bold text-navy-900">
            {safePct}%
          </span>
        </div>

        <div className="flex-1 min-w-0">
          <p className="font-semibold text-navy-900 truncate">{name}</p>
          <p className="text-xs text-slate-500 mt-0.5">
            {code} &middot; {questionCount} {questionCount === 1 ? 'question' : 'questions'}
            {isDisabled && ' (No questions yet)'}
          </p>
        </div>

        {!isDisabled && (
          <ChevronRight className="w-5 h-5 text-slate-400 group-hover:text-indigo-600 transition-colors flex-shrink-0" />
        )}
      </div>
    </button>
  );
}
