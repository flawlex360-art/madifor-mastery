import { useToastStore, type ToastType } from '@/stores/toastStore';
import { CheckCircle, XCircle, AlertTriangle, Info, X } from 'lucide-react';

const icons: Record<ToastType, React.ReactNode> = {
  success: <CheckCircle className="w-5 h-5 text-green-500" />,
  error: <XCircle className="w-5 h-5 text-red-500" />,
  warning: <AlertTriangle className="w-5 h-5 text-amber-500" />,
  info: <Info className="w-5 h-5 text-blue-500" />,
};

const styles: Record<ToastType, string> = {
  success: 'border-green-200 bg-green-50',
  error: 'border-red-200 bg-red-50',
  warning: 'border-amber-200 bg-amber-50',
  info: 'border-blue-200 bg-blue-50',
};

export default function ToastContainer() {
  const toasts = useToastStore((s) => s.toasts);
  const removeToast = useToastStore((s) => s.removeToast);

  if (toasts.length === 0) return null;

  return (
    <div className="fixed top-4 right-4 z-[100] flex flex-col gap-2 w-80">
      {toasts.map((toast) => (
        <div
          key={toast.id}
          className={`flex items-start gap-3 p-4 rounded-xl border shadow-lg backdrop-blur-sm animate-slide-in ${styles[toast.type]}`}
        >
          <div className="flex-shrink-0 mt-0.5">{icons[toast.type]}</div>
          <p className="flex-1 text-sm text-zinc-900">{toast.message}</p>
          <button
            onClick={() => removeToast(toast.id)}
            className="flex-shrink-0 p-0.5 rounded hover:bg-black/5 transition-colors"
          >
            <X className="w-4 h-4 text-gray-400" />
          </button>
        </div>
      ))}
    </div>
  );
}
