import { ASSESSMENT_CONFIG } from '@/config/assessment';

const FORMULA_PREFIX_RE = /^[=+\-@\t\r]/;

/**
 * Escapes CSV fields and prevents spreadsheet formula/DDE injection (=, +, -, @, tab, cr).
 */
export function csvEscape(value: string | number | null | undefined): string {
  let str = value === null || value === undefined ? '' : String(value);
  if (FORMULA_PREFIX_RE.test(str)) {
    str = `'${str}`;
  }
  if (str.includes(',') || str.includes('"') || str.includes('\n') || str.includes('\r')) {
    return `"${str.replace(/"/g, '""')}"`;
  }
  return str;
}

/**
 * Calculates BECE readiness score (0..100%) using weighted retained (70%) + first-pass (30%) mastery.
 * Notice: firstPassIncludingRetained represents topics that achieved at least first-pass mastery
 * (including those that subsequently progressed to retained mastery), so 100% retained = 100% readiness.
 */
export function computeBeceReadiness(
  retainedCount: number,
  firstPassIncludingRetainedCount: number,
  totalTopics: number
): number {
  if (totalTopics <= 0) return 0;
  const retainedPct = Math.min(1, Math.max(0, retainedCount / totalTopics));
  const firstPassPct = Math.min(1, Math.max(0, firstPassIncludingRetainedCount / totalTopics));
  const weighted =
    retainedPct * ASSESSMENT_CONFIG.beceWeights.retained +
    firstPassPct * ASSESSMENT_CONFIG.beceWeights.firstPass;
  return Math.min(100, Math.round(weighted * 100));
}
