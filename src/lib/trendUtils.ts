export interface TrendDataPoint {
  date: string;
  pct: number;
  status: string;
}

export function aggregateTrendData(
  history: { recorded_at: string; first_pass_pct: number; status: string }[]
): TrendDataPoint[] {
  const byDate = new Map<string, TrendDataPoint>();
  for (const entry of history) {
    const dateKey = new Date(entry.recorded_at).toISOString().split('T')[0];
    const existing = byDate.get(dateKey);
    if (!existing || new Date(entry.recorded_at) > new Date(existing.date)) {
      byDate.set(dateKey, {
        date: entry.recorded_at,
        pct: entry.first_pass_pct,
        status: entry.status,
      });
    }
  }
  return Array.from(byDate.values()).sort(
    (a, b) => new Date(a.date).getTime() - new Date(b.date).getTime()
  );
}
