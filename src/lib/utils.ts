import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function formatPercent(value: number): string {
  return `${Math.round(value)}%`;
}

export function getMasteryColor(pct: number): string {
  if (pct >= 80) return 'text-mastery-green';
  if (pct >= 40) return 'text-mastery-amber';
  return 'text-mastery-red';
}

export function getMasteryBgColor(pct: number): string {
  if (pct >= 80) return 'bg-mastery-green';
  if (pct >= 40) return 'bg-mastery-amber';
  return 'bg-mastery-red';
}

export function generateUUID(): string {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return crypto.randomUUID();
  }
  // Safe fallback for non-HTTPS LAN environments or legacy browsers
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
    const r = (Math.random() * 16) | 0;
    const v = c === 'x' ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
}

export function formatDate(dateStr: string): string {
  const d = new Date(dateStr);
  if (Number.isNaN(d.getTime())) return '—';
  return d.toLocaleDateString('en-GB', {
    day: 'numeric',
    month: 'short',
    year: 'numeric',
  });
}

export function daysFromNow(days: number): string {
  const d = new Date();
  d.setDate(d.getDate() + days);
  return d.toISOString();
}

export function sanitizeFilename(name: string): string {
  return Array.from(name, (ch) =>
    ch.charCodeAt(0) < 32 || '<>:"/\\|?*'.includes(ch) ? '_' : ch
  )
    .join('')
    .replace(/\s+/g, '_');
}
