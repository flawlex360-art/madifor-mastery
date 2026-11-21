export interface TrendDataPoint {
  date: string;
  pct: number;
  status: string;
}

/**
 * Aggregates mastery history points by UTC calendar day.
 * When multiple topics update on the same day (aggregate view), averages their percentages
 * rather than overwriting earlier points with the last timestamp.
 */
export function aggregateTrendData(
  history: { recorded_at: string; first_pass_pct: number; status: string }[]
): TrendDataPoint[] {
  const byDate = new Map<string, { sum: number; count: number; latestDate: string; status: string }>();

  for (const entry of history) {
    const parsed = new Date(entry.recorded_at);
    if (Number.isNaN(parsed.getTime())) continue;

    const dateKey = parsed.toISOString().split('T')[0];
    const pct = Number.isFinite(Number(entry.first_pass_pct)) ? Number(entry.first_pass_pct) : 0;
    const existing = byDate.get(dateKey);

    if (!existing) {
      byDate.set(dateKey, {
        sum: pct,
        count: 1,
        latestDate: entry.recorded_at,
        status: entry.status,
      });
    } else {
      existing.sum += pct;
      existing.count += 1;
      if (parsed > new Date(existing.latestDate)) {
        existing.latestDate = entry.recorded_at;
        existing.status = entry.status;
      }
    }
  }

  return Array.from(byDate.values())
    .map((bucket) => ({
      date: bucket.latestDate,
      pct: Math.round((bucket.sum / bucket.count) * 100) / 100,
      status: bucket.status,
    }))
    .sort((a, b) => new Date(a.date).getTime() - new Date(b.date).getTime());
}
