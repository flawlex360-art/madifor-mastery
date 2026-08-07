import { ArrowLeft, BookOpen } from 'lucide-react';
import Button from '@/components/ui/Button';

interface PracticeModeBannerProps {
  practiceLevel: string;
  onExit: () => void;
}

export default function PracticeModeBanner({ practiceLevel, onExit }: PracticeModeBannerProps) {
  return (
    <div className="bg-purple-50 border border-purple-200 rounded-xl p-4 flex items-center justify-between">
      <div className="flex items-center gap-3">
        <div className="w-10 h-10 rounded-lg bg-purple-100 flex items-center justify-center">
          <BookOpen className="w-5 h-5 text-purple-600" />
        </div>
        <div>
          <p className="font-semibold text-purple-800">Practicing {practiceLevel} Content</p>
          <p className="text-sm text-purple-600">This won't count toward your mastery — just for practice!</p>
        </div>
      </div>
      <Button variant="outline" size="sm" onClick={onExit}>
        <ArrowLeft className="w-4 h-4 mr-1" />
        Back to My Class
      </Button>
    </div>
  );
}
