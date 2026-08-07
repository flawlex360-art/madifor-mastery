import { Card, CardContent } from '@/components/ui/Card';
import { Users, TrendingUp, AlertTriangle, BookOpen, Sparkles } from 'lucide-react';

interface KpiCardsProps {
  totalLearners: number;
  avgMastery: number;
  learnersAtRisk: number;
  topicsAttempted: number;
  voluntaryPracticeSessions: number;
}

export default function KpiCards({
  totalLearners, avgMastery, learnersAtRisk, topicsAttempted, voluntaryPracticeSessions,
}: KpiCardsProps) {
  const cards = [
    {
      icon: <Users className="w-6 h-6 text-blue-600" />,
      bg: 'bg-blue-100',
      value: totalLearners,
      label: 'Learners',
    },
    {
      icon: <TrendingUp className="w-6 h-6 text-green-600" />,
      bg: 'bg-green-100',
      value: `${avgMastery}%`,
      label: 'Avg Mastery',
    },
    {
      icon: <AlertTriangle className="w-6 h-6 text-red-600" />,
      bg: 'bg-red-100',
      value: learnersAtRisk,
      label: 'At Risk',
    },
    {
      icon: <BookOpen className="w-6 h-6 text-purple-600" />,
      bg: 'bg-purple-100',
      value: topicsAttempted,
      label: 'Topics Attempted',
    },
    {
      icon: <Sparkles className="w-6 h-6 text-amber-600" />,
      bg: 'bg-amber-100',
      value: voluntaryPracticeSessions,
      label: 'Voluntary Practice',
    },
  ];

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
      {cards.map((card) => (
        <Card key={card.label}>
          <CardContent className="p-4 flex items-center gap-4">
            <div className={`w-12 h-12 rounded-lg ${card.bg} flex items-center justify-center`}>
              {card.icon}
            </div>
            <div>
              <p className="text-2xl font-bold text-zinc-900">{card.value}</p>
              <p className="text-sm text-gray-500">{card.label}</p>
            </div>
          </CardContent>
        </Card>
      ))}
    </div>
  );
}
