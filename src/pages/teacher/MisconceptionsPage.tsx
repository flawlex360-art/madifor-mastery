import { useState, useEffect } from 'react';
import { useSelectedClass } from '@/context/SelectedClassContext';
import { getMisconceptionPatterns } from '@/api/assessment';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { AlertCircle } from 'lucide-react';

interface Misconception {
  learner_id: string;
  learner_name: string;
  question_id: string;
  stem: string;
  topic_name: string;
  topic_code: string;
  count: number;
}

export default function MisconceptionsPage() {
  const { selectedClassId } = useSelectedClass();
  const [patterns, setPatterns] = useState<Misconception[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!selectedClassId) return;
    setLoading(true);
    getMisconceptionPatterns(selectedClassId)
      .then((data) => setPatterns(data as unknown as Misconception[]))
      .finally(() => setLoading(false));
  }, [selectedClassId]);

  // Group by learner
  const byLearner = new Map<string, Misconception[]>();
  for (const p of patterns) {
    const existing = byLearner.get(p.learner_id) || [];
    existing.push(p);
    byLearner.set(p.learner_id, existing);
  }

  // Group by topic
  const byTopic = new Map<string, Misconception[]>();
  for (const p of patterns) {
    const existing = byTopic.get(p.topic_code) || [];
    existing.push(p);
    byTopic.set(p.topic_code, existing);
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-zinc-900">Misconception Patterns</h1>
        <p className="text-gray-500">Questions missed 3+ times by the same learner</p>
      </div>

      {loading ? (
        <div className="text-center py-8 text-gray-500">Loading...</div>
      ) : patterns.length === 0 ? (
        <Card>
          <CardContent className="p-8 text-center text-gray-500">
            <AlertCircle className="w-8 h-8 mx-auto mb-2 text-green-400" />
            No misconception patterns detected yet. This requires learners to miss the same question 3+ times.
          </CardContent>
        </Card>
      ) : (
        <>
          {/* By Learner */}
          <Card>
            <CardHeader>
              <h2 className="font-semibold text-zinc-900">By Learner</h2>
            </CardHeader>
            <CardContent className="p-0">
              <div className="divide-y">
                {Array.from(byLearner.entries()).map(([learnerId, items]) => (
                  <div key={learnerId} className="px-4 py-3">
                    <div className="flex items-center justify-between mb-2">
                      <span className="font-medium text-zinc-900">{items[0].learner_name}</span>
                      <span className="text-xs text-gray-500">
                        {items.length} recurring misconception{items.length !== 1 ? 's' : ''}
                      </span>
                    </div>
                    <div className="space-y-1.5">
                      {items.map((item, i) => (
                        <div key={i} className="flex items-start gap-2 text-sm">
                          <span className="px-1.5 py-0.5 text-xs bg-red-100 text-red-700 rounded font-medium flex-shrink-0">
                            {item.count}x
                          </span>
                          <div className="flex-1 min-w-0">
                            <p className="text-navy-700 line-clamp-2">{item.stem}</p>
                            <p className="text-xs text-gray-400">{item.topic_code} — {item.topic_name}</p>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* By Topic */}
          <Card>
            <CardHeader>
              <h2 className="font-semibold text-zinc-900">By Topic</h2>
            </CardHeader>
            <CardContent className="p-0">
              <div className="divide-y">
                {Array.from(byTopic.entries()).map(([topicCode, items]) => (
                  <div key={topicCode} className="px-4 py-3">
                    <div className="flex items-center justify-between mb-2">
                      <span className="font-medium text-zinc-900">
                        {items[0].topic_code} — {items[0].topic_name}
                      </span>
                      <span className="text-xs text-gray-500">
                        {items.length} misconception{items.length !== 1 ? 's' : ''}
                      </span>
                    </div>
                    <div className="space-y-1">
                      {items.map((item, i) => (
                        <div key={i} className="flex items-center gap-2 text-sm">
                          <span className="px-1.5 py-0.5 text-xs bg-amber-100 text-amber-700 rounded font-medium">
                            {item.count}x
                          </span>
                          <span className="text-gray-600 truncate">{item.learner_name}</span>
                          <span className="text-gray-400">—</span>
                          <span className="text-navy-700 truncate">{item.stem}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </>
      )}
    </div>
  );
}
