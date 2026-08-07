import { Bell } from 'lucide-react';

interface ReviewBadgeProps {
  count: number;
  onClick: () => void;
}

export default function ReviewBadge({ count, onClick }: ReviewBadgeProps) {
  if (count === 0) return null;

  return (
    <button
      onClick={onClick}
      className="flex items-center gap-2 px-4 py-2 bg-amber-50 border border-amber-200 rounded-lg hover:bg-amber-100 transition-colors"
    >
      <div className="relative">
        <Bell className="w-5 h-5 text-amber-600" />
        <span className="absolute -top-1 -right-1 w-4 h-4 bg-red-500 text-white text-[10px] font-bold rounded-full flex items-center justify-center">
          {count > 9 ? '9+' : count}
        </span>
      </div>
      <span className="text-sm font-medium text-amber-800">
        {count} review{count !== 1 ? 's' : ''} due
      </span>
    </button>
  );
}
