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
  totalLearners,
  avgMastery,
  learnersAtRisk,
  topicsAttempted,
  voluntaryPracticeSessions,
}: KpiCardsProps) {
  const cards = [
    {
      icon: <Users className="w-5 h-5 text-indigo-600" />,
      bg: 'bg-indigo-50',
      value: totalLearners,
      label: 'Learners',
    },
    {
      icon: <TrendingUp className="w-5 h-5 text-emerald-600" />,
      bg: 'bg-emerald-50',
      value: `${Math.round(avgMastery)}%`,
      label: 'Avg Mastery',
    },
    {
      icon: <AlertTriangle className="w-5 h-5 text-rose-600" />,
      bg: 'bg-rose-50',
      value: learnersAtRisk,
      label: 'At Risk',
    },
    {
      icon: <BookOpen className="w-5 h-5 text-navy-700" />,
      bg: 'bg-slate-100',
      value: topicsAttempted,
      label: 'Topics Attempted',
    },
    {
      icon: <Sparkles className="w-5 h-5 text-amber-600" />,
      bg: 'bg-amber-50',
      value: voluntaryPracticeSessions,
      label: 'Voluntary Practice',
    },
  ];

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
      {cards.map((card) => (
        <Card key={card.label} className="hover:border-slate-300 transition-colors">
          <CardContent className="p-4 flex items-center gap-3.5">
            <div className={`w-11 h-11 rounded-xl flex-shrink-0 ${card.bg} flex items-center justify-center`}>
              {card.icon}
            </div>
            <div className="min-w-0">
              <p className="text-2xl font-bold text-navy-900 tabular-nums leading-tight">{card.value}</p>
              <p className="text-xs font-medium text-slate-500 mt-0.5 truncate">{card.label}</p>
            </div>
          </CardContent>
        </Card>
      ))}
    </div>
  );
}
