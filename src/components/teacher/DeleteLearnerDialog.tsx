import { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import { AlertTriangle, Loader2 } from 'lucide-react';
import { Learner } from '@/types/auth';

interface DeleteLearnerDialogProps {
  open: boolean;
  learner: Learner | null;
  onConfirm: () => void | Promise<void>;
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

  const trimmedName = learner.display_name.trim();
  const isMatch = confirmName.trim().toLowerCase() === trimmedName.toLowerCase();
  const isDisabled = !isMatch || loading;

  return (
    <Dialog open={open} onOpenChange={(isOpen) => !isOpen && onCancel()} disableClose={loading}>
      <DialogContent className="sm:max-w-[440px]">
        <div className="flex flex-col items-center text-center space-y-4">
          <div className="w-14 h-14 rounded-full bg-rose-100 flex items-center justify-center text-rose-600">
            <AlertTriangle size={28} />
          </div>

          <DialogHeader className="w-full text-center">
            <DialogTitle className="text-xl text-center">Delete Learner?</DialogTitle>
          </DialogHeader>

          <div className="text-slate-600 space-y-3 w-full text-sm">
            <p>
              You are about to delete <strong className="text-navy-900">{trimmedName}</strong>.
            </p>
            <p className="text-rose-700 font-medium bg-rose-50 border border-rose-200 p-3 rounded-lg">
              This will permanently remove their account, attempts, and mastery history. This cannot be undone.
            </p>

            <div className="text-left w-full pt-2">
              <Input
                label={`Type "${trimmedName}" to confirm`}
                value={confirmName}
                onChange={(e) => setConfirmName(e.target.value)}
                placeholder="Enter learner name"
              />
            </div>
          </div>

          <DialogFooter className="w-full pt-2 flex-col-reverse sm:flex-row gap-2">
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
        </div>
      </DialogContent>
    </Dialog>
  );
}
