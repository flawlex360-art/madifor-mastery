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
    getLearnerPsychometricProfile(learnerId).then(setProfiles);
  }, [learnerId]);

  if (profiles.length === 0) return null;

  // For now, just show the first subject (usually Science)
  // Theta usually ranges from -3.0 to +3.0 in standard IRT.
  // We use a logistic function to map theta to a 0-100% predictive score.
  // Predict Score = 100 / (1 + e^(-theta))
  
  const profile = profiles[0];
  if (profile.total_answered < 10) return null; // Wait until they've answered enough to show a prediction

  const predictedScore = 100 / (1 + Math.exp(-profile.theta));
  
  // Categorize
  let rank = "Beginner";
  let color = "text-gray-600";
  let bg = "bg-gray-100";
  let border = "border-gray-200";

  if (predictedScore >= 80) {
    rank = "Master";
    color = "text-purple-700";
    bg = "bg-purple-50";
    border = "border-purple-200";
  } else if (predictedScore >= 60) {
    rank = "Proficient";
    color = "text-green-700";
    bg = "bg-green-50";
    border = "border-green-200";
  } else if (predictedScore >= 40) {
    rank = "Developing";
    color = "text-blue-700";
    bg = "bg-blue-50";
    border = "border-blue-200";
  }

  return (
    <Card className={`mb-6 border-2 shadow-sm ${border} overflow-hidden`}>
      <div className={`p-4 ${bg} flex flex-col sm:flex-row items-center justify-between gap-4`}>
        <div className="flex items-center gap-4">
          <div className={`w-12 h-12 rounded-full flex items-center justify-center bg-white shadow-sm text-purple-600`}>
            <BrainCircuit className="w-6 h-6" />
          </div>
          <div>
            <h3 className="font-bold text-gray-900 flex items-center gap-2">
              Flawlex AI Prediction
              <span className={`text-xs px-2 py-0.5 rounded-full bg-white border ${border} ${color} font-bold`}>
                {rank}
              </span>
            </h3>
            <p className="text-sm text-gray-600">
              Based on {profile.total_answered} adaptive questions, we predict your exam score will be:
            </p>
          </div>
        </div>
        
        <div className="flex items-center gap-6">
          <div className="text-center">
            <div className={`text-3xl font-extrabold ${color}`}>
              {Math.round(predictedScore)}%
            </div>
            <div className="text-xs font-semibold text-gray-500 uppercase tracking-wider mt-1">
              Predicted Score
            </div>
          </div>
          
          <div className="hidden sm:block h-10 w-px bg-gray-200" />
          
          <div className="hidden sm:block text-center">
            <div className="text-xl font-bold text-gray-700 font-mono">
              {profile.theta > 0 ? '+' : ''}{profile.theta.toFixed(2)}
            </div>
            <div className="text-xs font-semibold text-gray-500 uppercase tracking-wider mt-1">
              Raw Ability (θ)
            </div>
          </div>
        </div>
      </div>
    </Card>
  );
}
