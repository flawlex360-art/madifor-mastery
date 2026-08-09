import { useState, useEffect, useMemo } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAssessmentStore } from '@/stores/assessmentStore';
import { getLearnerSession, refreshLearnerSession, getPracticeContext, setPracticeContext, clearPracticeContext } from '@/api/auth';
import { getSubjects, getCurriculumTree, getQuestionCountByTopic } from '@/api/curriculum';
import { getTopicMastery, getDueReviews } from '@/api/assessment';
import TopicCard from '@/components/curriculum/TopicCard';
import ReviewBadge from '@/components/learner/ReviewBadge';
import PracticeLevelModal from '@/components/learner/PracticeLevelModal';
import PracticeModeBanner from '@/components/learner/PracticeModeBanner';
import type { Topic } from '@/types/curriculum';
import { ChevronDown, ChevronRight, BookOpen, Search, Clock } from 'lucide-react';

export default function HomePage() {
  const navigate = useNavigate();
  const [session, setSession] = useState(getLearnerSession());
  const [topics, setTopics] = useState<Topic[]>([]);
  const [questionCounts, setQuestionCounts] = useState<Record<string, number>>({});
  const [masteryMap, setMasteryMap] = useState<Record<string, { pct: number; status: string }>>({});
  const [dueReviewCount, setDueReviewCount] = useState(0);
  const [expandedStrands, setExpandedStrands] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);
  const [practiceCtx, setPracticeCtx] = useState(getPracticeContext());
  const [showLevelModal, setShowLevelModal] = useState(false);
  const [topicSearch, setTopicSearch] = useState('');
  const [recentTopicIds, setRecentTopicIds] = useState<string[]>([]);
  const { prefetchTopic } = useAssessmentStore();

  useEffect(() => {
    const init = async () => {
      const s = getLearnerSession();
      if (!s) { navigate('/'); return; }
      // Refresh session from DB if class_level is missing (stale session)
      const refreshed = await refreshLearnerSession();
      if (refreshed) setSession(refreshed);
      loadData();
    };
    init();
  }, []);

  const loadData = async () => {
    try {
      const session = getLearnerSession();
      if (!session) return;

      const ctx = getPracticeContext();

      const subjects = await getSubjects();
      if (subjects.length === 0) return;

      const tree = await getCurriculumTree(subjects[0].id);
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const allTopics: Topic[] = tree.strands.flatMap((s: any) =>
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        s.sub_strands.flatMap((ss: any) => ss.topics)
      );

      // Only show topics for the learner's class level (or practice level)
      const targetLevel = ctx?.practice_class_level ?? session.class_level;
      const filteredTopics = targetLevel
        ? allTopics.filter((t: Topic) => t.class_level === targetLevel)
        : allTopics;
      setTopics(filteredTopics);

      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const counts = await getQuestionCountByTopic(filteredTopics.map((t: any) => t.id));
      setQuestionCounts(counts);

      // Get mastery data
      const mastery = await getTopicMastery(session.learner_id);
      const map: Record<string, { pct: number; status: string }> = {};
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      for (const m of mastery as any[]) {
        map[m.topic_id] = { pct: Math.round(m.first_pass_pct), status: m.status };
      }
      setMasteryMap(map);

      // Get due reviews
      const reviews = await getDueReviews(session.learner_id, 100);
      setDueReviewCount(reviews.length);

      // Load recent topics from localStorage
      const stored = localStorage.getItem(`flawlex_recent_topics_${session.learner_id}`);
      if (stored) {
        try {
          const ids = JSON.parse(stored) as string[];
          setRecentTopicIds(ids.filter((id) => filteredTopics.some((t: Topic) => t.id === id)));
        } catch { /* ignore */ }
      }
    } catch (err) {
      console.error('Failed to load data:', err);
    } finally {
      setLoading(false);
    }
  };

  const startAssessment = (topic: Topic) => {
    // Track recent topics
    if (session) {
      const stored = localStorage.getItem(`flawlex_recent_topics_${session.learner_id}`);
      let recent: string[] = stored ? JSON.parse(stored) : [];
      recent = [topic.id, ...recent.filter((id) => id !== topic.id)].slice(0, 5);
      localStorage.setItem(`flawlex_recent_topics_${session.learner_id}`, JSON.stringify(recent));
    }
    navigate(`/learner/assessment/${topic.id}`, { state: { topicName: topic.name } });
  };

  // Filter topics by search
  const filteredTopics = useMemo(() => {
    if (!topicSearch.trim()) return topics;
    const q = topicSearch.toLowerCase().trim();
    return topics.filter(
      (t) => t.name.toLowerCase().includes(q) || t.code.toLowerCase().includes(q)
    );
  }, [topics, topicSearch]);

  // Recent topics (not filtered by search)
  const recentTopics = useMemo(() => {
    if (recentTopicIds.length === 0) return [];
    return recentTopicIds
      .map((id) => topics.find((t) => t.id === id))
      .filter(Boolean) as Topic[];
  }, [topics, recentTopicIds]);

  // Background Prefetching
  useEffect(() => {
    if (topics.length > 0) {
      // Prefetch recent topics
      recentTopics.forEach(t => prefetchTopic(t.id));
      // Prefetch top 3 topics
      topics.slice(0, 3).forEach(t => prefetchTopic(t.id));
    }
  }, [topics, recentTopics, prefetchTopic]);

  const handlePracticeLevelSelect = (level: string) => {
    setPracticeContext({ practice_class_level: level });
    setPracticeCtx({ practice_class_level: level });
    setShowLevelModal(false);
    setLoading(true);
    loadData();
  };

  const handleExitPractice = () => {
    clearPracticeContext();
    setPracticeCtx(null);
    setLoading(true);
    loadData();
  };

  if (!session) return null;

  return (
    <div className="space-y-6">
      {/* Practice mode banner */}
      {practiceCtx && (
        <PracticeModeBanner
          practiceLevel={practiceCtx.practice_class_level}
          onExit={handleExitPractice}
        />
      )}

      <div className="flex items-center justify-between">
        <div>
          <div className="flex items-center gap-3">
            <h1 className="text-2xl font-bold text-zinc-900">
              {practiceCtx ? `Practicing ${practiceCtx.practice_class_level}` : `Welcome, ${session.display_name}!`}
            </h1>
            {session.class_level && !practiceCtx && (
              <span className="px-3 py-1 text-sm font-bold rounded-full bg-zinc-100 text-zinc-700 border border-zinc-200">
                {session.class_level}
              </span>
            )}
          </div>
          <p className="text-gray-500">
            {practiceCtx ? 'These topics are for practice only' : 'Choose a topic to start learning'}
          </p>
        </div>
        <div className="flex items-center gap-2">
          {!practiceCtx && (
            <ReviewBadge count={dueReviewCount} onClick={() => {
              if (dueReviewCount > 0) navigate('/learner/review');
            }} />
          )}
          {practiceCtx ? (
            <button
              onClick={handleExitPractice}
              className="flex items-center gap-1.5 px-3 py-1.5 text-sm text-amber-600 border border-amber-300 rounded-lg hover:bg-amber-50 transition-colors"
            >
              Back to My Class
            </button>
          ) : (
            <button
              onClick={() => setShowLevelModal(true)}
              className="flex items-center gap-1.5 px-3 py-1.5 text-sm text-purple-600 border border-purple-300 rounded-lg hover:bg-purple-50 transition-colors"
            >
              <BookOpen className="w-4 h-4" />
              Practice Other Levels
            </button>
          )}
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
      {!topicSearch && recentTopics.length > 0 && (
        <div>
          <div className="flex items-center gap-2 mb-2">
            <Clock className="w-4 h-4 text-gray-400" />
            <h2 className="text-sm font-medium text-gray-500">Recently Practiced</h2>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2">
            {recentTopics.map((topic) => (
              <TopicCard
                key={`recent-${topic.id}`}
                name={topic.name}
                code={topic.code}
                questionCount={questionCounts[topic.id] || 0}
                masteryPct={masteryMap[topic.id]?.pct ?? 0}
                status={(masteryMap[topic.id]?.status as 'not_started' | 'in_progress' | 'first_pass_mastered' | 'retained_mastered') ?? 'not_started'}
                onClick={() => startAssessment(topic)}
                onHover={() => prefetchTopic(topic.id)}
              />
            ))}
          </div>
        </div>
      )}

      {loading ? (
        <div className="text-center py-8 text-gray-500">Loading...</div>
      ) : filteredTopics.length === 0 ? (
        <div className="text-center py-8 text-gray-400">
          {topicSearch ? 'No topics match your search.' : 'No topics available.'}
        </div>
      ) : (
        <div className="space-y-2">
          {Array.from(new Set(filteredTopics.map(t => t.code.split('.').slice(0, 2).join('.')))).map(strandCode => {
            const strandTopics = filteredTopics.filter(t => t.code.startsWith(strandCode + '.'));
            const strandName = strandTopics.length > 0 ? strandTopics[0].code.split('.').slice(0, 2).join('.') : strandCode;
            
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
                    {strandTopics.map(topic => (
                      <TopicCard
                        key={topic.id}
                        name={topic.name}
                        code={topic.code}
                        questionCount={questionCounts[topic.id] || 0}
                        masteryPct={masteryMap[topic.id]?.pct ?? 0}
                        status={(masteryMap[topic.id]?.status as 'not_started' | 'in_progress' | 'first_pass_mastered' | 'retained_mastered') ?? 'not_started'}
                        onClick={() => startAssessment(topic)}
                        onHover={() => prefetchTopic(topic.id)}
                      />
                    ))}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      )}

      {/* Level selection modal */}
      {showLevelModal && (
        <PracticeLevelModal
          homeClassLevel={session.class_level}
          onSelect={handlePracticeLevelSelect}
          onClose={() => setShowLevelModal(false)}
        />
      )}
    </div>
  );
}
