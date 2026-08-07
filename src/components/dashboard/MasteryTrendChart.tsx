import { Card, CardHeader, CardContent } from '@/components/ui/Card';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Legend } from 'recharts';
import type { TrendDataPoint } from '@/lib/trendUtils';

interface MasteryTrendChartProps {
  data: TrendDataPoint[];
  topicName?: string;
  height?: number;
}

export default function MasteryTrendChart({ data, topicName, height = 250 }: MasteryTrendChartProps) {
  if (data.length === 0) {
    return (
      <Card>
        <CardContent className="p-6 text-center text-gray-500">
          No trend data yet. Complete more assessments to see your progress over time.
        </CardContent>
      </Card>
    );
  }

  const chartData = data.map((d) => ({
    ...d,
    dateLabel: new Date(d.date).toLocaleDateString('en-GB', { day: 'numeric', month: 'short' }),
  }));

  return (
    <Card>
      <CardHeader>
        <h3 className="font-semibold text-zinc-900">
          {topicName ? `Mastery Trend — ${topicName}` : 'Mastery Trend'}
        </h3>
      </CardHeader>
      <CardContent>
        <ResponsiveContainer width="100%" height={height}>
          <LineChart data={chartData} margin={{ top: 5, right: 20, bottom: 5, left: 0 }}>
            <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
            <XAxis
              dataKey="dateLabel"
              tick={{ fontSize: 12, fill: '#6b7280' }}
              tickLine={false}
            />
            <YAxis
              domain={[0, 100]}
              tick={{ fontSize: 12, fill: '#6b7280' }}
              tickLine={false}
              tickFormatter={(v) => `${v}%`}
            />
            <Tooltip
              contentStyle={{
                backgroundColor: '#fff',
                border: '1px solid #e5e7eb',
                borderRadius: '8px',
                fontSize: '13px',
              }}
              formatter={(value: number) => [`${Math.round(value)}%`, 'Mastery']}
            />
            <Legend />
            <Line
              type="monotone"
              dataKey="pct"
              stroke="#2DD4BF"
              strokeWidth={2}
              dot={{ fill: '#2DD4BF', r: 4 }}
              activeDot={{ r: 6 }}
              name="First-Pass %"
            />
            <Line
              type="monotone"
              dataKey={() => 80}
              stroke="#ef4444"
              strokeWidth={1}
              strokeDasharray="5 5"
              dot={false}
              name="Mastery Threshold"
            />
          </LineChart>
        </ResponsiveContainer>
      </CardContent>
    </Card>
  );
}
