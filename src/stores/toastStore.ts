import { create } from 'zustand';

export type ToastType = 'success' | 'error' | 'warning' | 'info';

export interface Toast {
  id: string;
  type: ToastType;
  message: string;
  duration?: number;
}

const activeTimers = new Map<string, ReturnType<typeof setTimeout>>();

interface ToastState {
  toasts: Toast[];
  addToast: (type: ToastType, message: string, duration?: number) => void;
  removeToast: (id: string) => void;
  clearAll: () => void;
}

export const useToastStore = create<ToastState>((set) => ({
  toasts: [],
  addToast: (type, message, duration = 4000) => {
    const id = `toast-${Date.now()}-${Math.random().toString(36).slice(2, 7)}`;
    set((state) => ({
      toasts: [...state.toasts, { id, type, message, duration }],
    }));
    if (duration > 0) {
      const timer = setTimeout(() => {
        activeTimers.delete(id);
        set((state) => ({
          toasts: state.toasts.filter((t) => t.id !== id),
        }));
      }, duration);
      activeTimers.set(id, timer);
    }
  },
  removeToast: (id) => {
    const timer = activeTimers.get(id);
    if (timer) {
      clearTimeout(timer);
      activeTimers.delete(id);
    }
    set((state) => ({
      toasts: state.toasts.filter((t) => t.id !== id),
    }));
  },
  clearAll: () => {
    activeTimers.forEach((timer) => clearTimeout(timer));
    activeTimers.clear();
    set({ toasts: [] });
  },
}));

export const toast = {
  success: (message: string, duration?: number) => useToastStore.getState().addToast('success', message, duration),
  error: (message: string, duration?: number) => useToastStore.getState().addToast('error', message, duration),
  warning: (message: string, duration?: number) => useToastStore.getState().addToast('warning', message, duration),
  info: (message: string, duration?: number) => useToastStore.getState().addToast('info', message, duration),
};
