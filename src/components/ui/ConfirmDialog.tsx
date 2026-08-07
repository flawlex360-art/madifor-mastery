import { useState, useEffect } from 'react';
import Button from '@/components/ui/Button';
import { AlertTriangle } from 'lucide-react';

interface ConfirmDialogProps {
  open: boolean;
  title: string;
  message: string;
  confirmLabel?: string;
  cancelLabel?: string;
  variant?: 'danger' | 'warning';
  onConfirm: () => void;
  onCancel: () => void;
}

export default function ConfirmDialog({
  open,
  title,
  message,
  confirmLabel = 'Delete',
  cancelLabel = 'Cancel',
  variant = 'danger',
  onConfirm,
  onCancel,
}: ConfirmDialogProps) {
  // Close on Escape key
  useEffect(() => {
    if (!open) return;
    const handleKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onCancel();
    };
    window.addEventListener('keydown', handleKey);
    return () => window.removeEventListener('keydown', handleKey);
  }, [open, onCancel]);

  if (!open) return null;

  return (
    <div
      className="fixed inset-0 z-[60] flex items-center justify-center p-4"
      onClick={onCancel}
    >
      <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" />
      <div
        className="relative w-full max-w-sm rounded-2xl border border-white/20 bg-white/80 shadow-2xl backdrop-blur-xl"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="p-6 text-center">
          <div className={`w-14 h-14 mx-auto rounded-full flex items-center justify-center mb-4 ${
            variant === 'danger' ? 'bg-red-100' : 'bg-amber-100'
          }`}>
            <AlertTriangle className={`w-7 h-7 ${
              variant === 'danger' ? 'text-red-500' : 'text-amber-500'
            }`} />
          </div>

          <h3 className="text-lg font-semibold text-zinc-900 mb-2">{title}</h3>
          <p className="text-sm text-gray-500 mb-6">{message}</p>

          <div className="flex gap-3">
            <Button variant="outline" className="flex-1" onClick={onCancel}>
              {cancelLabel}
            </Button>
            <Button
              variant={variant === 'danger' ? 'destructive' : 'primary'}
              className="flex-1"
              onClick={onConfirm}
            >
              {confirmLabel}
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
}

// Hook for easy usage
export function useConfirmDialog() {
  const [dialog, setDialog] = useState<{
    open: boolean;
    title: string;
    message: string;
    confirmLabel?: string;
    variant?: 'danger' | 'warning';
    onConfirm: () => void;
  } | null>(null);

  const confirm = (options: {
    title: string;
    message: string;
    confirmLabel?: string;
    variant?: 'danger' | 'warning';
  }): Promise<boolean> => {
    return new Promise((resolve) => {
      setDialog({
        open: true,
        ...options,
        onConfirm: () => {
          setDialog(null);
          resolve(true);
        },
      });
    });
  };

  const cancel = () => {
    if (dialog) {
      setDialog(null);
    }
  };

  const ConfirmDialogComponent = dialog ? (
    <ConfirmDialog
      open={dialog.open}
      title={dialog.title}
      message={dialog.message}
      confirmLabel={dialog.confirmLabel}
      variant={dialog.variant}
      onConfirm={dialog.onConfirm}
      onCancel={cancel}
    />
  ) : null;

  return { confirm, ConfirmDialogComponent };
}
