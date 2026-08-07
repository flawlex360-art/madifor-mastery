import { useState, useEffect } from 'react';
import { getCurriculumTree, getQuestionCountByTopic } from '@/api/curriculum';
import type { CurriculumTree, Topic } from '@/types/curriculum';
import TopicCard from './TopicCard';
import { ChevronDown, ChevronRight } from 'lucide-react';


interface TopicTreeProps {
  subjectId: string;
  onTopicSelect: (topic: Topic) => void;
  masteryMap?: Record<string, { pct: number; status: string }>;
}

export default function TopicTree({ subjectId, onTopicSelect, masteryMap = {} }: TopicTreeProps) {
  const [tree, setTree] = useState<CurriculumTree | null>(null);
  const [questionCounts, setQuestionCounts] = useState<Record<string, number>>({});
  const [expandedStrands, setExpandedStrands] = useState<Set<string>>(new Set());
  const [expandedSubStrands, setExpandedSubStrands] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    (async () => {
      try {
        const data = await getCurriculumTree(subjectId);
        setTree(data);

        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const allTopics = data.strands.flatMap((s: any) =>
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          s.sub_strands.flatMap((ss: any) => ss.topics)
        );
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const counts = await getQuestionCountByTopic(allTopics.map((t: any) => t.id));
        setQuestionCounts(counts);
      } catch (err) {
        console.error('Failed to load curriculum:', err);
      } finally {
        setLoading(false);
      }
    })();
  }, [subjectId]);

  const toggleStrand = (id: string) => {
    setExpandedStrands(prev => {
      const next = new Set(prev);
      next.has(id) ? next.delete(id) : next.add(id);
      return next;
    });
  };

  const toggleSubStrand = (id: string) => {
    setExpandedSubStrands(prev => {
      const next = new Set(prev);
      next.has(id) ? next.delete(id) : next.add(id);
      return next;
    });
  };

  if (loading) {
    return <div className="text-center py-8 text-gray-500">Loading curriculum...</div>;
  }

  if (!tree) {
    return <div className="text-center py-8 text-red-500">Failed to load curriculum</div>;
  }

  return (
    <div className="space-y-2">
      {tree.strands.map(strand => (
        <div key={strand.id} className="border rounded-xl overflow-hidden">
          <button
            onClick={() => toggleStrand(strand.id)}
            className="w-full flex items-center gap-3 px-4 py-3 bg-navy-50 hover:bg-navy-100 transition-colors"
          >
            {expandedStrands.has(strand.id) ? (
              <ChevronDown className="w-5 h-5 text-navy-600" />
            ) : (
              <ChevronRight className="w-5 h-5 text-navy-600" />
            )}
            <div className="text-left">
              <p className="font-semibold text-zinc-900">{strand.name}</p>
              <p className="text-xs text-gray-500">{strand.code}</p>
            </div>
          </button>

          {expandedStrands.has(strand.id) && (
            <div className="border-t">
              {strand.sub_strands.map(ss => (
                <div key={ss.id}>
                  <button
                    onClick={() => toggleSubStrand(ss.id)}
                    className="w-full flex items-center gap-3 px-6 py-2.5 hover:bg-gray-50 transition-colors"
                  >
                    {expandedSubStrands.has(ss.id) ? (
                      <ChevronDown className="w-4 h-4 text-gray-500" />
                    ) : (
                      <ChevronRight className="w-4 h-4 text-gray-500" />
                    )}
                    <div className="text-left">
                      <p className="text-sm font-medium text-navy-700">{ss.name}</p>
                      <p className="text-xs text-gray-400">{ss.code}</p>
                    </div>
                  </button>

                  {expandedSubStrands.has(ss.id) && (
                    <div className="px-6 pb-3 space-y-2">
                      {ss.topics.map(topic => (
                        <TopicCard
                          key={topic.id}
                          name={topic.name}
                          code={topic.code}
                          questionCount={questionCounts[topic.id] || 0}
                          masteryPct={masteryMap[topic.id]?.pct ?? 0}
                          status={(masteryMap[topic.id]?.status as 'not_started' | 'in_progress' | 'first_pass_mastered' | 'retained_mastered') ?? 'not_started'}
                          onClick={() => onTopicSelect(topic)}
                        />
                      ))}
                    </div>
                  )}
                </div>
              ))}
            </div>
          )}
        </div>
      ))}
    </div>
  );
}
