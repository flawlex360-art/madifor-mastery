import { useState, useEffect, useRef } from 'react';
import { createPortal } from 'react-dom';
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
  useEffect(() => {
    if (!open) return;
    const handleKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onCancel();
    };
    window.addEventListener('keydown', handleKey);
    return () => window.removeEventListener('keydown', handleKey);
  }, [open, onCancel]);

  if (!open || typeof document === 'undefined') return null;

  return createPortal(
    <div
      role="alertdialog"
      aria-modal="true"
      className="fixed inset-0 z-[60] flex items-center justify-center p-4"
      onClick={onCancel}
    >
      <div className="absolute inset-0 bg-navy-950/50 backdrop-blur-sm" />
      <div
        className="relative w-full max-w-sm rounded-2xl border border-slate-200 bg-white shadow-2xl"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="p-6 text-center">
          <div
            className={`w-14 h-14 mx-auto rounded-full flex items-center justify-center mb-4 ${
              variant === 'danger' ? 'bg-red-100' : 'bg-amber-100'
            }`}
          >
            <AlertTriangle
              className={`w-7 h-7 ${variant === 'danger' ? 'text-red-600' : 'text-amber-600'}`}
            />
          </div>

          <h3 className="text-lg font-bold text-navy-900 mb-2">{title}</h3>
          <p className="text-sm text-slate-600 mb-6">{message}</p>

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
    </div>,
    document.body
  );
}

export function useConfirmDialog() {
  const resolverRef = useRef<((value: boolean) => void) | null>(null);
  const [dialog, setDialog] = useState<{
    open: boolean;
    title: string;
    message: string;
    confirmLabel?: string;
    variant?: 'danger' | 'warning';
  } | null>(null);

  const confirm = (options: {
    title: string;
    message: string;
    confirmLabel?: string;
    variant?: 'danger' | 'warning';
  }): Promise<boolean> => {
    if (resolverRef.current) {
      resolverRef.current(false);
    }
    return new Promise((resolve) => {
      resolverRef.current = resolve;
      setDialog({ open: true, ...options });
    });
  };

  const handleConfirm = () => {
    setDialog(null);
    const resolve = resolverRef.current;
    resolverRef.current = null;
    if (resolve) resolve(true);
  };

  const cancel = () => {
    setDialog(null);
    const resolve = resolverRef.current;
    resolverRef.current = null;
    if (resolve) resolve(false);
  };

  const ConfirmDialogComponent = dialog ? (
    <ConfirmDialog
      open={dialog.open}
      title={dialog.title}
      message={dialog.message}
      confirmLabel={dialog.confirmLabel}
      variant={dialog.variant}
      onConfirm={handleConfirm}
      onCancel={cancel}
    />
  ) : null;

  return { confirm, ConfirmDialogComponent };
}
