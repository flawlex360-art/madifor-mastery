import { useState, useEffect, useMemo, useRef, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAssessmentStore } from '@/stores/assessmentStore';
import {
  getLearnerSession,
  refreshLearnerSession,
  getPracticeContext,
  setPracticeContext,
  clearPracticeContext,
} from '@/api/auth';
import { getLearnerHomepageData } from '@/api/curriculum';
import TopicCard from '@/components/curriculum/TopicCard';
import ReviewBadge from '@/components/learner/ReviewBadge';
import PracticeLevelModal from '@/components/learner/PracticeLevelModal';
import PracticeModeBanner from '@/components/learner/PracticeModeBanner';
import PsychometricProfile from '@/components/learner/PsychometricProfile';
import Button from '@/components/ui/Button';
import type { Topic } from '@/types/curriculum';
import { ChevronDown, ChevronRight, BookOpen, Search, Clock, AlertCircle, RefreshCw } from 'lucide-react';

interface HomepageTopic extends Topic {
  strand_id?: string;
  strand_name?: string;
  strand_code?: string;
  sub_strand_name?: string;
  question_count?: number;
}

export default function HomePage() {
  const navigate = useNavigate();
  const [session, setSession] = useState(getLearnerSession);
  const [topics, setTopics] = useState<HomepageTopic[]>([]);
  const [questionCounts, setQuestionCounts] = useState<Record<string, number>>({});
  const [masteryMap, setMasteryMap] = useState<Record<string, { pct: number; status: string }>>({});
  const [dueReviewCount, setDueReviewCount] = useState(0);
  const [expandedStrands, setExpandedStrands] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [practiceCtx, setPracticeCtx] = useState(getPracticeContext);
  const [showLevelModal, setShowLevelModal] = useState(false);
  const [topicSearch, setTopicSearch] = useState('');
  const [recentTopicIds, setRecentTopicIds] = useState<string[]>([]);
  const { prefetchTopic } = useAssessmentStore();
  const requestSeqRef = useRef(0);

  const loadData = useCallback(async (overrideLevel?: string | null) => {
    const reqId = ++requestSeqRef.current;
    const currentSession = getLearnerSession();
    if (!currentSession) return;

    const ctx = overrideLevel === undefined ? getPracticeContext() : overrideLevel ? { practice_class_level: overrideLevel } : null;
    const targetLevel = ctx?.practice_class_level ?? currentSession.class_level ?? 'B7';
    setLoadError(null);

    const cacheKey = `flawlex_home_${currentSession.learner_id}_${targetLevel}`;
    const cached = sessionStorage.getItem(cacheKey);
    if (cached) {
      try {
        const parsed = JSON.parse(cached);
        setTopics(parsed.topics || []);
        setQuestionCounts(parsed.questionCounts || {});
        setMasteryMap(parsed.masteryMap || {});
        setDueReviewCount(parsed.dueReviewCount || 0);
        setLoading(false);
      } catch {
        setLoading(true);
      }
    } else {
      setLoading(true);
    }

    try {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const data: any = await getLearnerHomepageData(currentSession.learner_id, targetLevel);
      if (reqId !== requestSeqRef.current) return;

      const newTopics: HomepageTopic[] = data?.topics || [];
      const newQuestionCounts: Record<string, number> = {};
      for (const t of newTopics) {
        newQuestionCounts[t.id] = t.question_count || 0;
      }

      const newMasteryMap: Record<string, { pct: number; status: string }> = {};
      for (const m of data?.mastery || []) {
        newMasteryMap[m.topic_id] = { pct: Number(m.pct ?? 0), status: m.status };
      }

      const newReviewCount = Number(data?.dueReviewCount || 0);

      setTopics(newTopics);
      setQuestionCounts(newQuestionCounts);
      setMasteryMap(newMasteryMap);
      setDueReviewCount(newReviewCount);

      if (newTopics.length > 0) {
        const firstKey = newTopics[0].strand_code || newTopics[0].strand_name || 'all';
        setExpandedStrands((prev) => (prev.size === 0 ? new Set([firstKey]) : prev));
      }

      sessionStorage.setItem(
        cacheKey,
        JSON.stringify({
          topics: newTopics,
          questionCounts: newQuestionCounts,
          masteryMap: newMasteryMap,
          dueReviewCount: newReviewCount,
        })
      );

      const stored = localStorage.getItem(`flawlex_recent_topics_${currentSession.learner_id}`);
      if (stored) {
        try {
          const ids = JSON.parse(stored) as string[];
          if (Array.isArray(ids)) {
            setRecentTopicIds(ids.filter((id) => newTopics.some((t) => t.id === id)));
          }
        } catch {
          // Ignore corrupted recent topics storage
        }
      }
    } catch (err) {
      if (reqId !== requestSeqRef.current) return;
      if (!cached) {
        setLoadError(err instanceof Error ? err.message : 'Unable to load topics. Check your connection.');
      }
    } finally {
      if (reqId === requestSeqRef.current) {
        setLoading(false);
      }
    }
  }, []);

  useEffect(() => {
    const init = async () => {
      const s = getLearnerSession();
      if (!s) {
        navigate('/');
        return;
      }
      const refreshed = await refreshLearnerSession().catch(() => s);
      if (refreshed) {
        setSession(refreshed);
        loadData();
      } else if (!navigator.onLine) {
        loadData();
      } else {
        navigate('/learner/login');
      }
    };
    init();
  }, [navigate, loadData]);

  const startAssessment = (topic: HomepageTopic) => {
    if ((questionCounts[topic.id] || 0) <= 0) return;
    if (session) {
      let recent: string[] = [];
      try {
        const stored = localStorage.getItem(`flawlex_recent_topics_${session.learner_id}`);
        const parsed = stored ? JSON.parse(stored) : [];
        if (Array.isArray(parsed)) recent = parsed;
      } catch {
        recent = [];
      }
      recent = [topic.id, ...recent.filter((id) => id !== topic.id)].slice(0, 5);
      localStorage.setItem(`flawlex_recent_topics_${session.learner_id}`, JSON.stringify(recent));
    }
    navigate(`/learner/assessment/${topic.id}`, { state: { topicName: topic.name } });
  };

  const filteredTopics = useMemo(() => {
    if (!topicSearch.trim()) return topics;
    const q = topicSearch.toLowerCase().trim();
    return topics.filter(
      (t) =>
        t.name.toLowerCase().includes(q) ||
        t.code.toLowerCase().includes(q) ||
        (t.strand_name || '').toLowerCase().includes(q)
    );
  }, [topics, topicSearch]);

  const strandGroups = useMemo(() => {
    const groups = new Map<string, { key: string; name: string; topics: HomepageTopic[] }>();
    for (const t of filteredTopics) {
      const fallbackPrefix = t.code?.includes('.') ? t.code.split('.').slice(0, 2).join('.') : 'Other';
      const key = t.strand_code || t.strand_name || fallbackPrefix;
      const name = t.strand_name || fallbackPrefix;
      const existing = groups.get(key);
      if (existing) {
        existing.topics.push(t);
      } else {
        groups.set(key, { key, name, topics: [t] });
      }
    }
    return Array.from(groups.values());
  }, [filteredTopics]);

  const recentTopics = useMemo(() => {
    if (recentTopicIds.length === 0) return [];
    return recentTopicIds
      .map((id) => topics.find((t) => t.id === id))
      .filter((t): t is HomepageTopic => Boolean(t));
  }, [topics, recentTopicIds]);

  // Background prefetch deduplicated IDs once on topic load
  useEffect(() => {
    if (topics.length === 0) return;
    const idsToPrefetch = Array.from(
      new Set([...recentTopics.map((t) => t.id), ...topics.slice(0, 3).map((t) => t.id)])
    );
    idsToPrefetch.forEach((id) => prefetchTopic(id));
  }, [topics, recentTopics, prefetchTopic]);

  const handlePracticeLevelSelect = (level: string) => {
    setPracticeContext({ practice_class_level: level });
    setPracticeCtx({ practice_class_level: level });
    setShowLevelModal(false);
    setExpandedStrands(new Set());
    loadData(level);
  };

  const handleExitPractice = () => {
    clearPracticeContext();
    setPracticeCtx(null);
    setExpandedStrands(new Set());
    loadData(null);
  };

  if (!session) return null;

  return (
    <div className="space-y-6">
      {practiceCtx && (
        <PracticeModeBanner
          practiceLevel={practiceCtx.practice_class_level}
          onExit={handleExitPractice}
        />
      )}

      {!practiceCtx && session.learner_id && (
        <PsychometricProfile learnerId={session.learner_id} />
      )}

      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4 border-b border-slate-200/80 pb-5">
        <div>
          <div className="flex items-center gap-3 flex-wrap">
            <h1 className="text-2xl font-bold text-navy-900">
              {practiceCtx
                ? `Practicing ${practiceCtx.practice_class_level}`
                : `Welcome back, ${session.display_name}!`}
            </h1>
            {session.class_level && !practiceCtx && (
              <span className="px-3 py-1 text-xs font-bold rounded-full bg-indigo-50 text-indigo-700 border border-indigo-200">
                {session.class_level}
              </span>
            )}
          </div>
          <p className="text-sm text-slate-500 mt-1">
            {practiceCtx ? 'Select any topic for ungraded practice' : 'Choose a topic below to start or continue mastering Science'}
          </p>
        </div>

        <div className="flex items-center gap-2.5 flex-wrap">
          {!practiceCtx && (
            <ReviewBadge
              count={dueReviewCount}
              onClick={() => {
                if (dueReviewCount > 0) navigate('/learner/review');
              }}
            />
          )}
          {practiceCtx ? (
            <Button variant="outline" size="sm" onClick={handleExitPractice}>
              Back to My Class
            </Button>
          ) : (
            <Button variant="outline" size="sm" onClick={() => setShowLevelModal(true)}>
              <BookOpen className="w-4 h-4 mr-1.5 text-indigo-600" />
              Practice Other Levels
            </Button>
          )}
        </div>
      </div>

      {/* Topic search */}
      <div className="relative">
        <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
        <input
          type="text"
          aria-label="Search topics"
          placeholder="Search topics by name, strand, or code..."
          value={topicSearch}
          onChange={(e) => setTopicSearch(e.target.value)}
          className="w-full pl-10 pr-4 py-2.5 text-sm border border-slate-200 rounded-xl bg-white text-navy-900 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-600/20 focus:border-indigo-600"
        />
      </div>

      {/* Recently Practiced */}
      {!topicSearch && recentTopics.length > 0 && (
        <div>
          <div className="flex items-center gap-2 mb-3">
            <Clock className="w-4 h-4 text-slate-400" />
            <h2 className="text-xs font-bold uppercase tracking-wider text-slate-500">Recently Practiced</h2>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
            {recentTopics.map((topic) => (
              <TopicCard
                key={`recent-${topic.id}`}
                name={topic.name}
                code={topic.code}
                questionCount={questionCounts[topic.id] || 0}
                masteryPct={masteryMap[topic.id]?.pct ?? 0}
                status={
                  (masteryMap[topic.id]?.status as
                    | 'not_started'
                    | 'in_progress'
                    | 'first_pass_mastered'
                    | 'retained_mastered') ?? 'not_started'
                }
                onClick={() => startAssessment(topic)}
                onHover={() => prefetchTopic(topic.id)}
              />
            ))}
          </div>
        </div>
      )}

      {/* Strand Accordions */}
      {loading ? (
        <div className="text-center py-12 text-slate-500 text-sm">Loading curriculum topics...</div>
      ) : loadError ? (
        <div className="text-center py-10 bg-red-50 border border-red-200 rounded-2xl p-6">
          <AlertCircle className="w-8 h-8 text-red-500 mx-auto mb-2" />
          <p className="text-sm font-medium text-red-800 mb-3">{loadError}</p>
          <Button variant="outline" size="sm" onClick={() => loadData()}>
            <RefreshCw className="w-4 h-4 mr-1.5" />
            Retry
          </Button>
        </div>
      ) : strandGroups.length === 0 ? (
        <div className="text-center py-10 text-slate-400 text-sm">
          {topicSearch ? 'No topics match your search.' : 'No topics available for this level.'}
        </div>
      ) : (
        <div className="space-y-3">
          {strandGroups.map((group) => {
            const isExpanded = Boolean(topicSearch.trim()) || expandedStrands.has(group.key);
            return (
              <div key={group.key} className="border border-slate-200/90 rounded-2xl overflow-hidden bg-white shadow-sm">
                <button
                  type="button"
                  onClick={() => {
                    setExpandedStrands((prev) => {
                      const next = new Set(prev);
                      if (next.has(group.key)) {
                        next.delete(group.key);
                      } else {
                        next.add(group.key);
                      }
                      return next;
                    });
                  }}
                  className="w-full flex items-center justify-between gap-3 px-5 py-4 bg-slate-50/70 hover:bg-slate-100/70 transition-colors"
                >
                  <div className="flex items-center gap-3 text-left min-w-0">
                    {isExpanded ? (
                      <ChevronDown className="w-5 h-5 text-navy-700 flex-shrink-0" />
                    ) : (
                      <ChevronRight className="w-5 h-5 text-navy-700 flex-shrink-0" />
                    )}
                    <div className="min-w-0">
                      <p className="font-bold text-navy-900 truncate">{group.name}</p>
                      <p className="text-xs text-slate-500">
                        {group.topics.length} {group.topics.length === 1 ? 'topic' : 'topics'}
                      </p>
                    </div>
                  </div>
                </button>

                {isExpanded && (
                  <div className="p-4 grid grid-cols-1 md:grid-cols-2 gap-3 border-t border-slate-100">
                    {group.topics.map((topic) => (
                      <TopicCard
                        key={topic.id}
                        name={topic.name}
                        code={topic.code}
                        questionCount={questionCounts[topic.id] || 0}
                        masteryPct={masteryMap[topic.id]?.pct ?? 0}
                        status={
                          (masteryMap[topic.id]?.status as
                            | 'not_started'
                            | 'in_progress'
                            | 'first_pass_mastered'
                            | 'retained_mastered') ?? 'not_started'
                        }
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
