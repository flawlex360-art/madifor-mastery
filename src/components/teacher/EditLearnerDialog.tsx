import { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import { Eye, EyeOff, Loader2 } from 'lucide-react';
import { Learner } from '@/types/auth';

interface EditLearnerDialogProps {
  open: boolean;
  learner: Learner | null;
  onSave: (updates: { display_name: string; email: string; password?: string }) => void | Promise<void>;
  onCancel: () => void;
  loading: boolean;
}

export default function EditLearnerDialog({
  open,
  learner,
  onSave,
  onCancel,
  loading,
}: EditLearnerDialogProps) {
  const [displayName, setDisplayName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);

  useEffect(() => {
    if (learner && open) {
      setDisplayName(learner.display_name);
      setEmail(learner.email || '');
      setPassword('');
      setShowPassword(false);
    }
  }, [learner, open]);

  if (!learner) return null;

  const passwordTooShort = password.length > 0 && password.length < 6;
  const isFormValid =
    displayName.trim() !== '' &&
    email.trim() !== '' &&
    !passwordTooShort;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!isFormValid || loading) return;
    onSave({
      display_name: displayName.trim(),
      email: email.trim(),
      ...(password ? { password } : {}),
    });
  };

  return (
    <Dialog open={open} onOpenChange={(isOpen) => !isOpen && onCancel()} disableClose={loading}>
      <DialogContent className="sm:max-w-[440px]">
        <DialogHeader>
          <DialogTitle>Edit Learner Profile</DialogTitle>
        </DialogHeader>

        <form onSubmit={handleSubmit} className="space-y-4 pt-4">
          <Input
            label="Full Name"
            value={displayName}
            onChange={(e) => setDisplayName(e.target.value)}
            placeholder="Enter full name"
            required
          />

          <Input
            label="Email"
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder="learner@school.edu"
            required
          />

          <div className="relative">
            <Input
              label="New Password (optional)"
              type={showPassword ? 'text' : 'password'}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Minimum 6 characters"
              minLength={6}
              error={passwordTooShort ? 'Password must be at least 6 characters.' : undefined}
            />
            <button
              type="button"
              onClick={() => setShowPassword(!showPassword)}
              className="absolute right-3 top-[38px] text-slate-400 hover:text-navy-700 focus:outline-none"
              aria-label="Toggle password visibility"
            >
              {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
            </button>
            <p className="text-xs text-slate-500 mt-1">
              Leave blank to keep the learner&apos;s current password.
            </p>
          </div>

          <DialogFooter className="pt-2">
            <Button type="button" variant="outline" onClick={onCancel} disabled={loading}>
              Cancel
            </Button>
            <Button type="submit" variant="primary" disabled={loading || !isFormValid}>
              {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
              Save Changes
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  );
}
