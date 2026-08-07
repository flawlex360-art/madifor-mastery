import { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import Select from '@/components/ui/Select';
import { ArrowRight, Loader2 } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { Learner, Class } from '@/types/auth';

interface MigrateLearnerDialogProps {
  open: boolean;
  learner: Learner | null;
  currentClass: Class | null;
  allClasses: Class[];
  onConfirm: (newClassId: string) => void;
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
    { value: '', label: 'Select a class...' },
    ...availableClasses.map((c) => ({
      value: c.id,
      label: `${c.name} (${c.class_level})`,
    })),
  ];

  const handleMigrate = () => {
    if (selectedClassId) {
      onConfirm(selectedClassId);
    }
  };

  return (
    <Dialog open={open} onOpenChange={(isOpen) => !isOpen && onCancel()}>
      <AnimatePresence>
        {open && (
          <DialogContent>
            <motion.div
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              transition={{ duration: 0.2 }}
            >
              <DialogHeader>
                <DialogTitle>Migrate Learner</DialogTitle>
              </DialogHeader>

              <div className="py-6 space-y-6">
                <div className="text-center space-y-1">
                  <h3 className="font-semibold text-lg">{learner.display_name}</h3>
                  <p className="text-sm text-zinc-500">Select a destination class to transfer this learner.</p>
                </div>

                <div className="flex items-center justify-between gap-4 p-4 bg-zinc-50 rounded-lg border border-zinc-200">
                  <div className="flex-1 text-center truncate">
                    <span className="text-xs text-zinc-500 uppercase tracking-wider block mb-1">Current</span>
                    <span className="font-medium text-zinc-900">{currentClass.name}</span>
                  </div>
                  
                  <div className="text-zinc-400">
                    <ArrowRight size={24} />
                  </div>
                  
                  <div className="flex-1">
                    <span className="text-xs text-zinc-500 uppercase tracking-wider block mb-1 text-center">New Class</span>
                    <Select
                      options={classOptions}
                      value={selectedClassId}
                      onChange={(e) => setSelectedClassId(e.target.value)}
                    />
                  </div>
                </div>

                <div className="bg-blue-50 text-blue-800 p-3 rounded-md text-sm">
                  All progress data, attempts, and mastery scores will be transferred with the learner.
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
                  className="flex items-center"
                >
                  {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                  Migrate Learner
                </Button>
              </DialogFooter>
            </motion.div>
          </DialogContent>
        )}
      </AnimatePresence>
    </Dialog>
  );
}
