import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import TopicCard from '@/components/curriculum/TopicCard';
import ReviewBadge from '@/components/learner/ReviewBadge';
import { DEMO_TOPICS, DEMO_QUESTIONS } from '../demo/demoData';
import { Search, ChevronDown, ChevronRight, Clock } from 'lucide-react';
import { toast } from '@/stores/toastStore';

const STRAND_GROUPS = Array.from(new Set(DEMO_TOPICS.map((t) => t.strand)));

export default function DemoLearnerHomePage() {
  const navigate = useNavigate();
  const [topicSearch, setTopicSearch] = useState('');
  const [expandedStrands, setExpandedStrands] = useState<Set<string>>(new Set(STRAND_GROUPS));

  const getMockMastery = (topicId: string) => {
    switch (topicId) {
      case 't1':
        return { pct: 85, status: 'first_pass_mastered' as const };
      case 't2':
        return { pct: 52, status: 'in_progress' as const };
      case 't3':
        return { pct: 88, status: 'retained_mastered' as const };
      default:
        return { pct: 0, status: 'not_started' as const };
    }
  };

  const startAssessment = (topicId: string, topicName: string) => {
    navigate(`/demo-learner/assessment/${topicId}`, { state: { topicName } });
  };

  const qLower = topicSearch.trim().toLowerCase();
  const filteredTopics = DEMO_TOPICS.filter(
    (t) =>
      !qLower ||
      t.name.toLowerCase().includes(qLower) ||
      t.code.toLowerCase().includes(qLower) ||
      t.strand.toLowerCase().includes(qLower)
  );

  const visibleStrands = Array.from(new Set(filteredTopics.map((t) => t.strand)));

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <div className="flex items-center gap-2.5">
            <h1 className="text-2xl font-bold text-navy-900">Welcome, Abigail</h1>
            <span className="px-2.5 py-0.5 text-xs font-bold rounded-full bg-indigo-50 text-indigo-700 border border-indigo-200">
              B8 (JHS 2)
            </span>
          </div>
          <p className="text-sm text-slate-500 mt-0.5">
            Select a topic below to try a 5-question sample Science quiz
          </p>
        </div>

        <ReviewBadge
          count={2}
          onClick={() =>
            toast.info('In a signed-in learner account, this launches your due spaced-repetition reviews.')
          }
        />
      </div>

      {/* Topic search */}
      <div className="relative">
        <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
        <input
          type="text"
          placeholder="Search topics by name, strand, or code..."
          value={topicSearch}
          onChange={(e) => setTopicSearch(e.target.value)}
          className="w-full pl-10 pr-4 py-2.5 text-sm border border-slate-200 rounded-xl bg-white text-navy-900 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500"
        />
      </div>

      {/* Recently practiced */}
      {!topicSearch && (
        <div>
          <div className="flex items-center gap-2 mb-2.5">
            <Clock className="w-4 h-4 text-slate-400" />
            <h2 className="text-xs font-semibold uppercase tracking-wider text-slate-500">
              Recently Practiced
            </h2>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
            {[DEMO_TOPICS[0], DEMO_TOPICS[1]].map((topic) => {
              const mastery = getMockMastery(topic.id);
              const qCount = DEMO_QUESTIONS.filter((q) => q.topic_id === topic.id).length;
              return (
                <TopicCard
                  key={`recent-${topic.id}`}
                  name={topic.name}
                  code={topic.code}
                  questionCount={qCount}
                  masteryPct={mastery.pct}
                  status={mastery.status}
                  onClick={() => startAssessment(topic.id, topic.name)}
                />
              );
            })}
          </div>
        </div>
      )}

      {/* Topics grouped by strand */}
      <div className="space-y-3">
        {visibleStrands.length === 0 ? (
          <div className="bg-white border border-slate-200 rounded-xl p-8 text-center text-sm text-slate-500">
            No topics match &ldquo;{topicSearch}&rdquo;.
          </div>
        ) : (
          visibleStrands.map((strandName) => {
            const strandTopics = filteredTopics.filter((t) => t.strand === strandName);
            const isExpanded = expandedStrands.has(strandName) || Boolean(topicSearch);

            return (
              <div key={strandName} className="bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm">
                <button
                  type="button"
                  onClick={() => {
                    setExpandedStrands((prev) => {
                      const next = new Set(prev);
                      if (next.has(strandName)) next.delete(strandName);
                      else next.add(strandName);
                      return next;
                    });
                  }}
                  className="w-full flex items-center gap-3 px-4 py-3.5 bg-slate-50/70 hover:bg-slate-100/70 transition-colors"
                >
                  {isExpanded ? (
                    <ChevronDown className="w-5 h-5 text-slate-500" />
                  ) : (
                    <ChevronRight className="w-5 h-5 text-slate-500" />
                  )}
                  <div className="text-left">
                    <p className="font-semibold text-navy-900">{strandName}</p>
                    <p className="text-xs text-slate-500">
                      {strandTopics.length} topic{strandTopics.length !== 1 ? 's' : ''}
                    </p>
                  </div>
                </button>

                {isExpanded && (
                  <div className="p-4 grid grid-cols-1 md:grid-cols-2 gap-3 border-t border-slate-100">
                    {strandTopics.map((topic) => {
                      const mastery = getMockMastery(topic.id);
                      const qCount = DEMO_QUESTIONS.filter((q) => q.topic_id === topic.id).length;
                      return (
                        <TopicCard
                          key={topic.id}
                          name={topic.name}
                          code={topic.code}
                          questionCount={qCount}
                          masteryPct={mastery.pct}
                          status={mastery.status}
                          onClick={() => startAssessment(topic.id, topic.name)}
                        />
                      );
                    })}
                  </div>
                )}
              </div>
            );
          })
        )}
      </div>
    </div>
  );
}
