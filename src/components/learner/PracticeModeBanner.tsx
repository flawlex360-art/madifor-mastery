import { ArrowLeft, BookOpen } from 'lucide-react';
import Button from '@/components/ui/Button';

interface PracticeModeBannerProps {
  practiceLevel: string;
  onExit: () => void;
}

export default function PracticeModeBanner({ practiceLevel, onExit }: PracticeModeBannerProps) {
  return (
    <div className="bg-indigo-50 border border-indigo-200 rounded-2xl p-4 flex flex-col sm:flex-row sm:items-center justify-between gap-3">
      <div className="flex items-center gap-3">
        <div className="w-10 h-10 rounded-xl bg-indigo-100 flex items-center justify-center flex-shrink-0">
          <BookOpen className="w-5 h-5 text-indigo-700" />
        </div>
        <div>
          <p className="font-bold text-indigo-950">Practicing {practiceLevel} Content</p>
          <p className="text-xs sm:text-sm text-indigo-700">
            Adaptive voluntary practice — does not affect your official class mastery scores.
          </p>
        </div>
      </div>
      <Button variant="outline" size="sm" onClick={onExit} className="self-start sm:self-auto">
        <ArrowLeft className="w-4 h-4 mr-1.5" />
        Back to My Class
      </Button>
    </div>
  );
}
