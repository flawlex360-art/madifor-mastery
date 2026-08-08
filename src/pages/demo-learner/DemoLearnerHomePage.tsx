import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import TopicCard from '@/components/curriculum/TopicCard';
import ReviewBadge from '@/components/learner/ReviewBadge';
import { DEMO_TOPICS, DEMO_QUESTIONS } from '../demo/demoData';
import { Search, ChevronDown, ChevronRight, Clock } from 'lucide-react';

export default function DemoLearnerHomePage() {
  const navigate = useNavigate();
  const [topicSearch, setTopicSearch] = useState('');
  const [expandedStrands, setExpandedStrands] = useState<Set<string>>(new Set(['SCI-B8']));

  // Generate some stable mock mastery data for the demo learner
  const getMockMastery = (topicId: string) => {
    switch(topicId) {
      case 't1': return { pct: 85, status: 'first_pass_mastered' as const };
      case 't2': return { pct: 45, status: 'in_progress' as const };
      case 't3': return { pct: 0, status: 'not_started' as const };
      default: return { pct: 0, status: 'not_started' as const };
    }
  };

  const startAssessment = (topicId: string, topicName: string) => {
    navigate(`/demo-learner/assessment/${topicId}`, { state: { topicName } });
  };

  const filteredTopics = DEMO_TOPICS.filter(
    (t) => t.name.toLowerCase().includes(topicSearch.toLowerCase()) || t.code.toLowerCase().includes(topicSearch.toLowerCase())
  );

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <div className="flex items-center gap-3">
            <h1 className="text-2xl font-bold text-zinc-900">
              Welcome, Abigail!
            </h1>
            <span className="px-3 py-1 text-sm font-bold rounded-full bg-zinc-100 text-zinc-700 border border-zinc-200">
              B8
            </span>
          </div>
          <p className="text-gray-500">
            Choose a topic to start learning (Demo Mode)
          </p>
        </div>
        <div className="flex items-center gap-2">
          <ReviewBadge count={2} onClick={() => {
            alert("In the real app, this would start a spaced-repetition review session!");
          }} />
        </div>
      </div>

      {/* Topic search */}
      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
        <input
          type="text"
          placeholder="Search topics by name or code..."
          value={topicSearch}
          onChange={(e) => setTopicSearch(e.target.value)}
          className="w-full pl-9 pr-3 py-2.5 text-sm border border-zinc-200 rounded-xl bg-white focus:outline-none focus:ring-2 focus:ring-zinc-900/20 focus:border-zinc-900"
        />
      </div>

      {/* Recent topics */}
      {!topicSearch && (
        <div>
          <div className="flex items-center gap-2 mb-2">
            <Clock className="w-4 h-4 text-gray-400" />
            <h2 className="text-sm font-medium text-gray-500">Recently Practiced</h2>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2">
            {[DEMO_TOPICS[0], DEMO_TOPICS[1]].map((topic) => {
              const mastery = getMockMastery(topic.id);
              const qCount = DEMO_QUESTIONS.filter(q => q.topic_id === topic.id).length || 5;
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

      {/* All Topics */}
      <div className="space-y-2">
        {Array.from(new Set(filteredTopics.map(t => t.code.split('.').slice(0, 2).join('.')))).map(strandCode => {
          const strandTopics = filteredTopics.filter(t => t.code.startsWith(strandCode));
          const strandName = 'Science Sub-Strand';
          
          return (
            <div key={strandCode} className="border rounded-xl overflow-hidden">
              <button
                onClick={() => {
                  setExpandedStrands(prev => {
                    const next = new Set(prev);
                    next.has(strandCode) ? next.delete(strandCode) : next.add(strandCode);
                    return next;
                  });
                }}
                className="w-full flex items-center gap-3 px-4 py-3 bg-zinc-50 hover:bg-zinc-100 transition-colors"
              >
                {expandedStrands.has(strandCode) ? (
                  <ChevronDown className="w-5 h-5 text-zinc-600" />
                ) : (
                  <ChevronRight className="w-5 h-5 text-zinc-600" />
                )}
                <div className="text-left">
                  <p className="font-semibold text-zinc-900">{strandName}</p>
                  <p className="text-xs text-gray-500">{strandTopics.length} topics</p>
                </div>
              </button>
              {expandedStrands.has(strandCode) && (
                <div className="p-4 space-y-2">
                  {strandTopics.map(topic => {
                    const mastery = getMockMastery(topic.id);
                    const qCount = DEMO_QUESTIONS.filter(q => q.topic_id === topic.id).length || 5;
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
        })}
      </div>
    </div>
  );
}
