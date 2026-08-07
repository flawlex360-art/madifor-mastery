import { X } from 'lucide-react';
import { Card, CardContent } from '@/components/ui/Card';
import Button from '@/components/ui/Button';

interface PracticeLevelModalProps {
  homeClassLevel: string;
  onSelect: (level: string) => void;
  onClose: () => void;
}

export default function PracticeLevelModal({ homeClassLevel, onSelect, onClose }: PracticeLevelModalProps) {
  const allLevels = [
    { value: 'B7', label: 'Basic 7', desc: 'Foundation topics' },
    { value: 'B8', label: 'Basic 8', desc: 'Intermediate topics' },
    { value: 'B9', label: 'Basic 9', desc: 'Advanced topics' },
  ];

  // Only show levels the learner is NOT in
  const levels = allLevels.filter(l => l.value !== homeClassLevel);

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <Card className="w-full max-w-sm" onClick={e => e.stopPropagation()}>
        <CardContent className="p-6">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-bold text-zinc-900">Practice from Another Level</h2>
            <button onClick={onClose} className="p-1 hover:bg-gray-100 rounded">
              <X className="w-5 h-5 text-gray-400" />
            </button>
          </div>
          <p className="text-sm text-gray-500 mb-5">
            You're in <span className="font-semibold text-navy-700">{homeClassLevel}</span>. Pick another level to practice — this won't affect your mastery scores.
          </p>
          <div className="space-y-2">
            {levels.map(level => (
              <Button
                key={level.value}
                variant="outline"
                onClick={() => onSelect(level.value)}
                className="w-full justify-start h-auto py-3"
              >
                <div className="text-left">
                  <p className="font-semibold">{level.label} ({level.value})</p>
                  <p className="text-xs text-gray-500 font-normal">{level.desc}</p>
                </div>
              </Button>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
