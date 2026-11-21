import { useState, useEffect } from 'react';
import { useSelectedClass } from '@/context/SelectedClassContext';
import { getMisconceptionPatterns } from '@/api/assessment';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { CheckCircle2 } from 'lucide-react';
import { toast } from '@/stores/toastStore';

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
  const { selectedClassId, loading: classesLoading } = useSelectedClass();
  const [patterns, setPatterns] = useState<Misconception[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (classesLoading) return;
    if (!selectedClassId) {
      setPatterns([]);
      setLoading(false);
      return;
    }

    let active = true;
    setLoading(true);
    getMisconceptionPatterns(selectedClassId)
      .then((data) => {
        if (active) setPatterns(data as unknown as Misconception[]);
      })
      .catch((err) => {
        console.error('Failed to load misconception patterns:', err);
        if (active) toast.error('Could not load misconception patterns.');
      })
      .finally(() => {
        if (active) setLoading(false);
      });

    return () => {
      active = false;
    };
  }, [selectedClassId, classesLoading]);

  const byLearner = new Map<string, Misconception[]>();
  for (const p of patterns) {
    const existing = byLearner.get(p.learner_id) || [];
    existing.push(p);
    byLearner.set(p.learner_id, existing);
  }

  const byTopic = new Map<string, Misconception[]>();
  for (const p of patterns) {
    const existing = byTopic.get(p.topic_code) || [];
    existing.push(p);
    byTopic.set(p.topic_code, existing);
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-navy-900">Misconception Patterns</h1>
        <p className="text-sm text-slate-500">Questions missed 3 or more times by the same learner</p>
      </div>

      {loading || classesLoading ? (
        <Card>
          <CardContent className="p-6 space-y-3">
            {[1, 2, 3].map((n) => (
              <div key={n} className="h-16 bg-slate-100 rounded-lg animate-pulse" />
            ))}
          </CardContent>
        </Card>
      ) : patterns.length === 0 ? (
        <Card>
          <CardContent className="p-10 text-center text-slate-500 text-sm">
            <CheckCircle2 className="w-9 h-9 mx-auto mb-2.5 text-emerald-500" />
            No recurring misconceptions detected yet. Items appear here when a learner misses the same question 3+ times.
          </CardContent>
        </Card>
      ) : (
        <>
          <Card>
            <CardHeader>
              <h2 className="font-semibold text-navy-900">By Learner</h2>
            </CardHeader>
            <CardContent className="p-0">
              <div className="divide-y divide-slate-100">
                {Array.from(byLearner.entries()).map(([learnerId, items]) => (
                  <div key={learnerId} className="px-4 py-3.5">
                    <div className="flex items-center justify-between mb-2.5">
                      <span className="font-semibold text-navy-900">{items[0].learner_name}</span>
                      <span className="text-xs text-slate-500">
                        {items.length} recurring item{items.length !== 1 ? 's' : ''}
                      </span>
                    </div>
                    <div className="space-y-2">
                      {items.map((item, i) => (
                        <div key={`${item.question_id}-${i}`} className="flex items-start gap-2.5 text-sm">
                          <span className="px-2 py-0.5 text-xs bg-rose-50 text-rose-700 rounded-md font-semibold flex-shrink-0 tabular-nums">
                            {item.count}x
                          </span>
                          <div className="flex-1 min-w-0">
                            <p className="text-navy-800 line-clamp-2">{item.stem}</p>
                            <p className="text-xs text-slate-400 mt-0.5">
                              {item.topic_code} — {item.topic_name}
                            </p>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <h2 className="font-semibold text-navy-900">By Topic</h2>
            </CardHeader>
            <CardContent className="p-0">
              <div className="divide-y divide-slate-100">
                {Array.from(byTopic.entries()).map(([topicCode, items]) => (
                  <div key={topicCode} className="px-4 py-3.5">
                    <div className="flex items-center justify-between mb-2.5">
                      <span className="font-semibold text-navy-900">
                        {items[0].topic_code} — {items[0].topic_name}
                      </span>
                      <span className="text-xs text-slate-500">
                        {items.length} recurring miss{items.length !== 1 ? 'es' : ''}
                      </span>
                    </div>
                    <div className="space-y-1.5">
                      {items.map((item, i) => (
                        <div key={`${item.learner_id}-${item.question_id}-${i}`} className="flex items-center gap-2 text-sm">
                          <span className="px-2 py-0.5 text-xs bg-amber-50 text-amber-700 rounded-md font-semibold flex-shrink-0 tabular-nums">
                            {item.count}x
                          </span>
                          <span className="text-slate-600 font-medium truncate max-w-[140px]">
                            {item.learner_name}
                          </span>
                          <span className="text-slate-300">—</span>
                          <span className="text-navy-800 truncate">{item.stem}</span>
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
