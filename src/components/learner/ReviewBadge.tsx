import { Bell } from 'lucide-react';

interface ReviewBadgeProps {
  count: number;
  onClick: () => void;
}

export default function ReviewBadge({ count, onClick }: ReviewBadgeProps) {
  if (count === 0) return null;

  return (
    <button
      type="button"
      onClick={onClick}
      className="flex items-center gap-2 px-3.5 py-2 bg-amber-50 border border-amber-200 rounded-xl hover:bg-amber-100 transition-colors"
    >
      <div className="relative">
        <Bell className="w-4 h-4 text-amber-700" />
        <span className="absolute -top-1.5 -right-1.5 w-4 h-4 bg-red-600 text-white text-[10px] font-bold rounded-full flex items-center justify-center">
          {count > 9 ? '9+' : count}
        </span>
      </div>
      <span className="text-sm font-semibold text-amber-900">
        {count} review{count !== 1 ? 's' : ''} due
      </span>
    </button>
  );
}
