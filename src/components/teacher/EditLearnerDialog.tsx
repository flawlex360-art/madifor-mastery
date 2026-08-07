import { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import { Eye, EyeOff, Loader2 } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { Learner } from '@/types/auth';

interface EditLearnerDialogProps {
  open: boolean;
  learner: Learner | null;
  onSave: (updates: { display_name: string; email: string; password?: string }) => void;
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

  const handleSave = () => {
    if (!displayName || !email) return;
    
    onSave({
      display_name: displayName,
      email: email,
      ...(password ? { password } : {}),
    });
  };

  const isFormValid = displayName.trim() !== '' && email.trim() !== '';

  if (!learner) return null;

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
                <DialogTitle>Edit Learner Profile</DialogTitle>
              </DialogHeader>

              <div className="space-y-4 py-4">
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
                  placeholder="learner@example.com"
                  required
                />

                <div className="relative">
                  <Input
                    label="New Password"
                    type={showPassword ? 'text' : 'password'}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="Enter new password"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="absolute right-3 top-[38px] text-zinc-500 hover:text-zinc-700 focus:outline-none"
                    aria-label="Toggle password visibility"
                  >
                    {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
                  </button>
                  <p className="text-xs text-zinc-500 mt-1">
                    Leave blank to keep current password
                  </p>
                </div>
              </div>

              <DialogFooter>
                <Button variant="outline" onClick={onCancel} disabled={loading}>
                  Cancel
                </Button>
                <Button 
                  variant="primary" 
                  onClick={handleSave} 
                  disabled={loading || !isFormValid}
                  className="flex items-center"
                >
                  {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                  Save Changes
                </Button>
              </DialogFooter>
            </motion.div>
          </DialogContent>
        )}
      </AnimatePresence>
    </Dialog>
  );
}
