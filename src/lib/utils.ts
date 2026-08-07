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
  return crypto.randomUUID();
}

export function formatDate(dateStr: string): string {
  return new Date(dateStr).toLocaleDateString('en-GB', {
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
