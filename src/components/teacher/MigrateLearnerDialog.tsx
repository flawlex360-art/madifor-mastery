import { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import Select from '@/components/ui/Select';
import { ArrowRight, Loader2 } from 'lucide-react';
import { Learner, Class } from '@/types/auth';

interface MigrateLearnerDialogProps {
  open: boolean;
  learner: Learner | null;
  currentClass: Class | null;
  allClasses: Class[];
  onConfirm: (newClassId: string) => void | Promise<void>;
  onCancel: () => void;
  loading: boolean;
}

export default function MigrateLearnerDialog({
  open,
  learner,
  currentClass,
  allClasses,
  onConfirm,
  onCancel,
  loading,
}: MigrateLearnerDialogProps) {
  const [selectedClassId, setSelectedClassId] = useState('');

  useEffect(() => {
    if (open) {
      setSelectedClassId('');
    }
  }, [open]);

  if (!learner || !currentClass) return null;

  const availableClasses = allClasses.filter((c) => c.id !== currentClass.id);
  const classOptions = [
    { value: '', label: availableClasses.length > 0 ? 'Select a class...' : 'No other classes available' },
    ...availableClasses.map((c) => ({
      value: c.id,
      label: `${c.name} (${c.class_level})`,
    })),
  ];

  const handleMigrate = () => {
    if (selectedClassId && !loading) {
      onConfirm(selectedClassId);
    }
  };

  return (
    <Dialog open={open} onOpenChange={(isOpen) => !isOpen && onCancel()} disableClose={loading}>
      <DialogContent className="sm:max-w-[480px]">
        <DialogHeader>
          <DialogTitle>Transfer Learner to Another Class</DialogTitle>
        </DialogHeader>

        <div className="py-4 space-y-5">
          <div className="text-center space-y-1">
            <h3 className="font-semibold text-lg text-navy-900">{learner.display_name}</h3>
            <p className="text-sm text-slate-500">Select a destination class for this learner.</p>
          </div>

          <div className="flex flex-col sm:flex-row items-center justify-between gap-4 p-4 bg-slate-50 rounded-xl border border-slate-200">
            <div className="flex-1 text-center truncate w-full">
              <span className="text-[11px] font-semibold text-slate-400 uppercase tracking-wider block mb-1">
                Current
              </span>
              <span className="font-semibold text-navy-900">
                {currentClass.name} ({currentClass.class_level})
              </span>
            </div>

            <div className="text-slate-400 rotate-90 sm:rotate-0">
              <ArrowRight size={20} />
            </div>

            <div className="flex-1 w-full">
              <span className="text-[11px] font-semibold text-slate-400 uppercase tracking-wider block mb-1 text-center">
                New Class
              </span>
              <Select
                options={classOptions}
                value={selectedClassId}
                disabled={availableClasses.length === 0}
                onChange={(e) => setSelectedClassId(e.target.value)}
              />
            </div>
          </div>

          <div className="bg-indigo-50 text-indigo-800 border border-indigo-100 p-3.5 rounded-xl text-sm">
            {availableClasses.length === 0
              ? 'Create another class on your Class Management page before transferring learners.'
              : 'All progress data, attempts, and mastery records stay intact when transferring classes.'}
          </div>
        </div>

        <DialogFooter>
          <Button variant="outline" onClick={onCancel} disabled={loading}>
            Cancel
          </Button>
          <Button
            variant="primary"
            onClick={handleMigrate}
            disabled={!selectedClassId || loading}
          >
            {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
            Transfer Learner
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
