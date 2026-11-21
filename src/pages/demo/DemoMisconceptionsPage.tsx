import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { getDemoMisconceptions } from './demoData';

export default function DemoMisconceptionsPage() {
  const patterns = getDemoMisconceptions();

  const byLearner = new Map<string, typeof patterns>();
  for (const p of patterns) {
    const existing = byLearner.get(p.learner_id) || [];
    existing.push(p);
    byLearner.set(p.learner_id, existing);
  }

  const byTopic = new Map<string, typeof patterns>();
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
    </div>
  );
}
