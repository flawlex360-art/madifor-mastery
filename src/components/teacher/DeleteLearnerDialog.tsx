import { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import { AlertTriangle, Loader2 } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { Learner } from '@/types/auth';

interface DeleteLearnerDialogProps {
  open: boolean;
  learner: Learner | null;
  onConfirm: () => void;
  onCancel: () => void;
  loading: boolean;
}

export default function DeleteLearnerDialog({
  open,
  learner,
  onConfirm,
  onCancel,
  loading,
}: DeleteLearnerDialogProps) {
  const [confirmName, setConfirmName] = useState('');

  useEffect(() => {
    if (open) {
      setConfirmName('');
    }
  }, [open]);

  if (!learner) return null;

  const isMatch = confirmName.toLowerCase() === learner.display_name.toLowerCase();
  const isDisabled = !isMatch || loading;

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
              className="flex flex-col items-center text-center p-4 space-y-4"
            >
              <div className="w-16 h-16 rounded-full bg-red-100 flex items-center justify-center text-red-600 mb-2">
                <AlertTriangle size={32} />
              </div>
              
              <DialogHeader className="w-full text-center">
                <DialogTitle className="text-xl">Delete Learner?</DialogTitle>
              </DialogHeader>

              <div className="text-zinc-600 space-y-4 w-full">
                <p>
                  You are about to delete <strong>{learner.display_name}</strong>.
                </p>
                <p className="text-sm text-red-600 font-medium bg-red-50 p-3 rounded-md">
                  This will permanently delete all their data including progress, attempts, and mastery. This cannot be undone.
                </p>
                
                <div className="text-left w-full mt-4">
                  <Input
                    label={`Type "${learner.display_name}" to confirm`}
                    value={confirmName}
                    onChange={(e) => setConfirmName(e.target.value)}
                    placeholder="Enter learner name"
                  />
                </div>
              </div>

              <DialogFooter className="w-full sm:justify-between mt-6 flex-col sm:flex-row gap-2">
                <Button variant="outline" onClick={onCancel} disabled={loading} className="w-full sm:w-auto">
                  Cancel
                </Button>
                <Button 
                  variant="destructive" 
                  onClick={onConfirm} 
                  disabled={isDisabled}
                  className="w-full sm:w-auto flex items-center justify-center"
                >
                  {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                  Delete Learner
                </Button>
              </DialogFooter>
            </motion.div>
          </DialogContent>
        )}
      </AnimatePresence>
    </Dialog>
  );
}
