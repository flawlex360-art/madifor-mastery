import { ReactNode, useEffect } from 'react';
import { createPortal } from 'react-dom';
import { cn } from '@/lib/utils';

interface DialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  disableClose?: boolean;
  children: ReactNode;
}

let openDialogCount = 0;

export function Dialog({ open, onOpenChange, disableClose = false, children }: DialogProps) {
  useEffect(() => {
    if (!open) return;

    openDialogCount += 1;
    const prevOverflow = document.body.style.overflow;
    document.body.style.overflow = 'hidden';

    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === 'Escape' && !disableClose) {
        onOpenChange(false);
      }
    };
    document.addEventListener('keydown', handleEscape);

    return () => {
      document.removeEventListener('keydown', handleEscape);
      openDialogCount = Math.max(0, openDialogCount - 1);
      if (openDialogCount === 0) {
        document.body.style.overflow = prevOverflow || '';
      }
    };
  }, [open, onOpenChange, disableClose]);

  if (!open || typeof document === 'undefined') return null;

  return createPortal(
    <div
      className="fixed inset-0 z-50 flex items-center justify-center p-4"
      role="dialog"
      aria-modal="true"
    >
      <div
        className="fixed inset-0 bg-navy-950/50 backdrop-blur-sm transition-opacity"
        onClick={() => {
          if (!disableClose) onOpenChange(false);
        }}
      />
      {children}
    </div>,
    document.body
  );
}

interface DialogContentProps {
  children: ReactNode;
  className?: string;
}

export function DialogContent({ children, className }: DialogContentProps) {
  return (
    <div
      onClick={(e) => e.stopPropagation()}
      className={cn(
        'relative z-10 bg-white border border-slate-200 rounded-2xl shadow-2xl w-full max-w-lg max-h-[90vh] overflow-y-auto p-6 animate-in fade-in zoom-in-95 duration-200',
        className
      )}
    >
      {children}
    </div>
  );
}

export function DialogHeader({ children, className }: { children: ReactNode; className?: string }) {
  return <div className={cn('flex flex-col space-y-1.5 mb-4', className)}>{children}</div>;
}

export function DialogTitle({ children, className }: { children: ReactNode; className?: string }) {
  return <h3 className={cn('text-lg font-bold leading-snug tracking-tight text-navy-900', className)}>{children}</h3>;
}

export function DialogFooter({ children, className }: { children: ReactNode; className?: string }) {
  return <div className={cn('flex items-center justify-end gap-2 mt-6 pt-4 border-t border-slate-100', className)}>{children}</div>;
}
