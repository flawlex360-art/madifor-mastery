import { useState, useEffect } from 'react';
import { getPsychometricAnalytics } from '@/api/assessment';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { AlertCircle, TrendingUp, TrendingDown, Target } from 'lucide-react';

interface PsychoData {
  question_id: string;
  difficulty_b: number;
  discrimination_a: number;
  total_attempts: number;
  stem: string;
  question_type: string;
}

export default function PsychometricsTab({ topicId }: { topicId?: string }) {
  const [data, setData] = useState<PsychoData[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true);
    getPsychometricAnalytics(topicId)
      .then(setData)
      .finally(() => setLoading(false));
  }, [topicId]);

  if (loading) {
    return <div className="text-center py-8 text-gray-500">Loading Psychometric Analytics...</div>;
  }

  if (data.length === 0) {
    return (
      <Card>
        <CardContent className="p-8 text-center text-gray-500">
          Not enough attempts to calibrate questions yet. Wait for learners to answer more questions.
        </CardContent>
      </Card>
    );
  }

  const flaggedQuestions = data.filter(q => q.total_attempts >= 5 && (q.difficulty_b > 2.0 || q.discrimination_a < 0.2));

  return (
    <div className="space-y-6">
      {flaggedQuestions.length > 0 && (
        <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-6">
          <div className="flex items-center gap-2 text-red-800 font-semibold mb-2">
            <AlertCircle className="w-5 h-5" />
            Flagged Questions Detected ({flaggedQuestions.length})
          </div>
          <p className="text-sm text-red-700 mb-4">
            The IRT algorithm has flagged these questions because they are either extremely difficult or have poor discrimination (meaning strong students miss them while weak students guess them right). Consider reviewing them for errors.
          </p>
          <div className="space-y-3">
            {flaggedQuestions.map(q => (
              <div key={q.question_id} className="bg-white border border-red-100 rounded p-3 text-sm">
                <p className="font-medium text-gray-900 mb-1">{q.stem}</p>
                <div className="flex gap-4 text-xs text-gray-600">
                  <span className="flex items-center gap-1">
                    <Target className="w-3 h-3" />
                    Diff (b): <span className="font-semibold text-red-600">{q.difficulty_b.toFixed(2)}</span>
                  </span>
                  <span className="flex items-center gap-1">
                    <TrendingDown className="w-3 h-3" />
                    Discrim (a): <span className="font-semibold text-red-600">{q.discrimination_a.toFixed(2)}</span>
                  </span>
                  <span>Attempts: {q.total_attempts}</span>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      <Card>
        <CardHeader>
          <h2 className="font-semibold text-zinc-900 flex items-center gap-2">
            <TrendingUp className="w-5 h-5 text-purple-600" />
            Item Response Theory (Rasch Model) Parameters
          </h2>
          <p className="text-xs text-gray-500 mt-1">
            Difficulty (b) is centered at 0.0. Higher is harder (e.g. &gt;1.5). Lower is easier (e.g. &lt;-1.5).
          </p>
        </CardHeader>
        <CardContent className="p-0">
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b bg-gray-50">
                  <th className="text-left px-4 py-3 font-medium text-gray-600">Question</th>
                  <th className="text-center px-4 py-3 font-medium text-gray-600">Difficulty (b)</th>
                  <th className="text-center px-4 py-3 font-medium text-gray-600">Discrimination (a)</th>
                  <th className="text-center px-4 py-3 font-medium text-gray-600">Calibration Attempts</th>
                </tr>
              </thead>
              <tbody>
                {data.sort((a, b) => b.difficulty_b - a.difficulty_b).map((q) => (
                  <tr key={q.question_id} className="border-b hover:bg-gray-50">
                    <td className="px-4 py-3 max-w-xs">
                      <p className="text-sm text-zinc-900 line-clamp-2">{q.stem}</p>
                    </td>
                    <td className="px-4 py-3 text-center">
                      <span className={`font-mono px-2 py-1 rounded text-xs font-semibold ${
                        q.difficulty_b > 1.5 ? 'bg-red-100 text-red-700' :
                        q.difficulty_b < -1.5 ? 'bg-green-100 text-green-700' :
                        'bg-blue-50 text-blue-700'
                      }`}>
                        {q.difficulty_b > 0 ? '+' : ''}{q.difficulty_b.toFixed(3)}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-center text-gray-700 font-mono text-xs">
                      {q.discrimination_a.toFixed(2)}
                    </td>
                    <td className="px-4 py-3 text-center text-gray-500">
                      {q.total_attempts}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
