import Button from '@/components/ui/Button';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/Dialog';
import { X } from 'lucide-react';

interface PracticeLevelModalProps {
  homeClassLevel: string;
  onSelect: (level: string) => void;
  onClose: () => void;
}

export default function PracticeLevelModal({ homeClassLevel, onSelect, onClose }: PracticeLevelModalProps) {
  const allLevels = [
    { value: 'B7', label: 'Basic 7 (JHS 1)', desc: 'Foundation concepts' },
    { value: 'B8', label: 'Basic 8 (JHS 2)', desc: 'Intermediate concepts' },
    { value: 'B9', label: 'Basic 9 (JHS 3)', desc: 'Advanced & BECE prep' },
  ];

  const levels = homeClassLevel ? allLevels.filter((l) => l.value !== homeClassLevel) : allLevels;

  return (
    <Dialog open onOpenChange={(open) => !open && onClose()}>
      <DialogContent className="max-w-sm">
        <div className="flex items-center justify-between mb-2">
          <DialogHeader className="mb-0">
            <DialogTitle>Practice Another Level</DialogTitle>
          </DialogHeader>
          <button
            type="button"
            onClick={onClose}
            aria-label="Close level selector"
            className="p-1.5 hover:bg-slate-100 rounded-lg text-slate-400 hover:text-navy-900"
          >
            <X className="w-5 h-5" />
          </button>
        </div>
        <p className="text-sm text-slate-600 mb-5">
          {homeClassLevel ? (
            <>
              You are enrolled in <span className="font-bold text-navy-900">{homeClassLevel}</span>. Pick another level for ungraded adaptive practice:
            </>
          ) : (
            'Pick a class level for ungraded adaptive practice:'
          )}
        </p>
        <div className="space-y-2.5">
          {levels.map((level) => (
            <Button
              key={level.value}
              variant="outline"
              onClick={() => onSelect(level.value)}
              className="w-full justify-start h-auto py-3 px-4"
            >
              <div className="text-left">
                <p className="font-semibold text-navy-900">{level.label}</p>
                <p className="text-xs text-slate-500 font-normal">{level.desc}</p>
              </div>
            </Button>
          ))}
        </div>
      </DialogContent>
    </Dialog>
  );
}
