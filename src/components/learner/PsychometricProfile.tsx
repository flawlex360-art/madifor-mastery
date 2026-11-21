import { useState, useEffect } from 'react';
import { getLearnerPsychometricProfile } from '@/api/assessment';
import { Card } from '@/components/ui/Card';
import { BrainCircuit } from 'lucide-react';

interface PsychoProfile {
  subject_id: string;
  theta: number;
  total_answered: number;
}

export default function PsychometricProfile({ learnerId }: { learnerId: string }) {
  const [profiles, setProfiles] = useState<PsychoProfile[]>([]);

  useEffect(() => {
    let cancelled = false;
    getLearnerPsychometricProfile(learnerId)
      .then((res) => {
        if (!cancelled) setProfiles(res as PsychoProfile[]);
      })
      .catch(() => {
        if (!cancelled) setProfiles([]);
      });
    return () => {
      cancelled = true;
    };
  }, [learnerId]);

  if (profiles.length === 0) return null;

  // Ordered by total_answered DESC in API
  const profile = profiles[0];
  if (!profile || profile.total_answered < 10) return null;

  const predictedScore = 100 / (1 + Math.exp(-profile.theta));

  let rank = 'Beginner';
  let color = 'text-slate-700';
  let bg = 'bg-slate-50';
  let border = 'border-slate-200';
  let iconBg = 'text-navy-700';

  if (predictedScore >= 80) {
    rank = 'Master';
    color = 'text-green-700';
    bg = 'bg-green-50/70';
    border = 'border-green-200';
    iconBg = 'text-green-600';
  } else if (predictedScore >= 60) {
    rank = 'Proficient';
    color = 'text-indigo-700';
    bg = 'bg-indigo-50/70';
    border = 'border-indigo-200';
    iconBg = 'text-indigo-600';
  } else if (predictedScore >= 40) {
    rank = 'Developing';
    color = 'text-amber-700';
    bg = 'bg-amber-50/70';
    border = 'border-amber-200';
    iconBg = 'text-amber-600';
  }

  return (
    <Card className={`border ${border} shadow-sm overflow-hidden`}>
      <div className={`p-5 ${bg} flex flex-col sm:flex-row items-center justify-between gap-4`}>
        <div className="flex items-center gap-4">
          <div className={`w-12 h-12 rounded-2xl flex items-center justify-center bg-white shadow-sm ${iconBg}`}>
            <BrainCircuit className="w-6 h-6" />
          </div>
          <div>
            <h3 className="font-bold text-navy-900 flex items-center gap-2 flex-wrap">
              Madifor Mastery Readiness
              <span className={`text-xs px-2.5 py-0.5 rounded-full bg-white border ${border} ${color} font-bold`}>
                {rank}
              </span>
            </h3>
            <p className="text-sm text-slate-600 mt-0.5">
              Estimated exam readiness based on {profile.total_answered} calibrated responses:
            </p>
          </div>
        </div>

        <div className="flex items-center gap-6">
          <div className="text-center">
            <div className={`text-3xl font-extrabold ${color}`}>{Math.round(predictedScore)}%</div>
            <div className="text-[11px] font-semibold text-slate-500 uppercase tracking-wider mt-0.5">
              Estimated Score
            </div>
          </div>

          <div className="hidden sm:block h-10 w-px bg-slate-200" />

          <div className="hidden sm:block text-center">
            <div className="text-xl font-bold text-navy-900 font-mono">
              {profile.theta > 0 ? '+' : ''}
              {profile.theta.toFixed(2)}
            </div>
            <div className="text-[11px] font-semibold text-slate-500 uppercase tracking-wider mt-0.5">
              Ability (θ)
            </div>
          </div>
        </div>
      </div>
    </Card>
  );
}
