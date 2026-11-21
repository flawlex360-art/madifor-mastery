import { describe, expect, it } from 'vitest';
import { aggregateTrendData } from '@/lib/trendUtils';

describe('aggregateTrendData', () => {
  it('returns empty array for empty input and skips invalid dates', () => {
    expect(aggregateTrendData([])).toEqual([]);
    expect(
      aggregateTrendData([{ recorded_at: 'invalid-date', first_pass_pct: 80, status: 'first_pass_mastered' }])
    ).toEqual([]);
  });

  it('averages multiple topics updated on the same UTC calendar day and sorts chronologically', () => {
    const result = aggregateTrendData([
      { recorded_at: '2026-10-03T16:00:00Z', first_pass_pct: 90, status: 'retained_mastered' },
      { recorded_at: '2026-10-01T08:00:00Z', first_pass_pct: 60, status: 'in_progress' },
      { recorded_at: '2026-10-01T14:00:00Z', first_pass_pct: 80, status: 'first_pass_mastered' },
    ]);

    expect(result).toHaveLength(2);
    expect(result[0]).toEqual({
      date: '2026-10-01T14:00:00Z',
      pct: 70,
      status: 'first_pass_mastered',
    });
    expect(result[1]).toEqual({
      date: '2026-10-03T16:00:00Z',
      pct: 90,
      status: 'retained_mastered',
    });
  });
});
