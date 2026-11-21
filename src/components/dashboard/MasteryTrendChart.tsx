import { Card, CardHeader, CardContent } from '@/components/ui/Card';
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Legend,
  ReferenceLine,
} from 'recharts';
import type { TrendDataPoint } from '@/lib/trendUtils';

interface MasteryTrendChartProps {
  data: TrendDataPoint[];
  topicName?: string;
  height?: number;
}

function formatTrendDate(dateStr: string): string {
  if (/^\d{4}-\d{2}-\d{2}$/.test(dateStr)) {
    const [y, m, d] = dateStr.split('-').map(Number);
    return new Date(y, m - 1, d).toLocaleDateString('en-GB', { day: 'numeric', month: 'short' });
  }
  const date = new Date(dateStr);
  if (Number.isNaN(date.getTime())) return dateStr;
  return date.toLocaleDateString('en-GB', { day: 'numeric', month: 'short' });
}

export default function MasteryTrendChart({ data, topicName, height = 250 }: MasteryTrendChartProps) {
  if (data.length === 0) {
    return (
      <Card>
        <CardContent className="p-6 text-center text-slate-500 text-sm">
          No trend data yet. Complete more assessments to see progress over time.
        </CardContent>
      </Card>
    );
  }

  const chartData = data.map((d) => ({
    ...d,
    dateLabel: formatTrendDate(d.date),
  }));

  return (
    <Card>
      <CardHeader>
        <h3 className="font-semibold text-navy-900">
          {topicName ? `Mastery Trend — ${topicName}` : 'Mastery Trend'}
        </h3>
      </CardHeader>
      <CardContent>
        <ResponsiveContainer width="100%" height={height}>
          <LineChart data={chartData} margin={{ top: 10, right: 20, bottom: 5, left: 0 }}>
            <CartesianGrid strokeDasharray="3 3" stroke="#e2e8f0" />
            <XAxis
              dataKey="dateLabel"
              tick={{ fontSize: 12, fill: '#64748b' }}
              tickLine={false}
            />
            <YAxis
              domain={[0, 100]}
              tick={{ fontSize: 12, fill: '#64748b' }}
              tickLine={false}
              tickFormatter={(v) => `${v}%`}
            />
            <Tooltip
              contentStyle={{
                backgroundColor: '#fff',
                border: '1px solid #e2e8f0',
                borderRadius: '10px',
                fontSize: '13px',
              }}
              formatter={(value: number | string) => [`${Math.round(Number(value))}%`, 'Mastery']}
            />
            <Legend />
            <ReferenceLine
              y={80}
              stroke="#16a34a"
              strokeDasharray="5 5"
              label={{
                value: '80% Mastery Target',
                position: 'insideTopRight',
                fill: '#16a34a',
                fontSize: 11,
              }}
            />
            <Line
              type="monotone"
              dataKey="pct"
              stroke="#4f46e5"
              strokeWidth={2.5}
              dot={{ fill: '#4f46e5', r: 4 }}
              activeDot={{ r: 6 }}
              name="First-Pass %"
            />
          </LineChart>
        </ResponsiveContainer>
      </CardContent>
    </Card>
  );
}
