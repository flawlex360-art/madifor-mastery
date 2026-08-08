import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { AlertCircle, Brain, Users } from 'lucide-react';
import { getDemoMisconceptions } from './demoData';

export default function DemoMisconceptionsPage() {
  const misconceptions = getDemoMisconceptions();

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-zinc-900">AI Misconception Analysis</h1>
        <p className="text-gray-500">Automatically detect and remediate common learning blockers</p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {misconceptions.map((m) => (
          <Card key={m.id} className="border-l-4 border-l-amber-400">
            <CardHeader className="pb-2">
              <div className="flex justify-between items-start">
                <div>
                  <span className="text-xs font-semibold text-gray-500 uppercase tracking-wider">{m.topic_name}</span>
                  <h3 className="text-lg font-bold text-zinc-900 mt-1">{m.misconception}</h3>
                </div>
                <div className="flex items-center gap-1 bg-amber-50 text-amber-700 px-2 py-1 rounded-lg text-sm font-medium">
                  <AlertCircle className="w-4 h-4" />
                  {m.occurrences}x
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <div className="flex items-center gap-2 text-sm text-gray-600 mb-2">
                  <Users className="w-4 h-4" />
                  <span className="font-medium">Affected Learners:</span>
                </div>
                <div className="flex flex-wrap gap-2">
                  {m.affected_learners.map((l, i) => (
                    <span key={i} className="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
                      {l}
                    </span>
                  ))}
                </div>
              </div>
              
              <div className="bg-blue-50/50 border border-blue-100 rounded-xl p-4 mt-4">
                <div className="flex items-center gap-2 text-blue-700 font-semibold mb-2">
                  <Brain className="w-4 h-4" />
                  AI Remediation Strategy
                </div>
                <p className="text-sm text-zinc-800 leading-relaxed">
                  {m.ai_remediation}
                </p>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}
