import { supabase } from '@/lib/supabase';
import { ASSESSMENT_CONFIG } from '@/config/assessment';
import type { Question } from '@/types/curriculum';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

export async function submitAttempt(params: {
  learner_id: string;
  question_id: string;
  topic_id: string;
  is_correct: boolean;
  learner_answer: unknown;
  time_taken: number;
  hints_used: number;
  attempt_type: string;
  session_id?: string;
  session_question_index?: number;
}) {
  const { error } = await db.rpc('submit_attempt', {
    p_learner_id: params.learner_id,
    p_question_id: params.question_id,
    p_topic_id: params.topic_id,
    p_is_correct: params.is_correct,
    p_learner_answer: params.learner_answer,
    p_time_taken: params.time_taken,
    p_hints_used: params.hints_used,
    p_attempt_type: params.attempt_type,
    p_session_id: params.session_id ?? null,
    p_session_question_index: params.session_question_index ?? null,
  });
  if (error) throw error;
}

export async function getDueReviews(learnerId: string, limit = 4): Promise<Record<string, unknown>[]> {
  const { data, error } = await db.rpc('get_due_reviews', {
    p_learner_id: learnerId,
    p_limit: limit,
  });
  if (error) throw error;
  return (data || []) as Record<string, unknown>[];
}

export async function getTopicMastery(learnerId: string) {
  const { data, error } = await db
    .from('topic_mastery')
    .select('*')
    .eq('learner_id', learnerId);
  if (error) throw error;
  return data || [];
}

export async function getTopicMasteryForTopic(learnerId: string, topicId: string) {
  const { data, error } = await db
    .from('topic_mastery')
    .select('*')
    .eq('learner_id', learnerId)
    .eq('topic_id', topicId)
    .maybeSingle();
  if (error) throw error;
  return data;
}

export async function getQuestionsForAssessment(topicId: string, limit: number): Promise<Question[]> {
  const { data, error } = await db
    .from('questions')
    .select('*')
    .eq('topic_id', topicId)
    .limit(Math.max(limit * 3, 30));
  if (error) throw error;
  return shuffleArray((data || []) as Question[]).slice(0, limit);
}

export async function getInitialQuestionForAssessment(topicId: string): Promise<Question[]> {
  const { data, error } = await db
    .from('questions')
    .select('*')
    .eq('topic_id', topicId)
    .limit(15);
  if (error) throw error;
  return shuffleArray((data || []) as Question[]).slice(0, 1);
}

export async function getRemainingQuestionsForAssessment(topicId: string, limit: number, excludeId: string): Promise<Question[]> {
  const { data, error } = await db
    .from('questions')
    .select('*')
    .eq('topic_id', topicId)
    .neq('id', excludeId)
    .limit(Math.max(limit * 3, 30));
  if (error) throw error;
  return shuffleArray((data || []) as Question[]).slice(0, limit);
}

export async function getReviewQuestions(learnerId: string, limit: number) {
  const reviews = await getDueReviews(learnerId, limit);
  if (!reviews.length) return [];

  const questionIds = reviews.map((r: Record<string, unknown>) => r.question_id);
  const { data: questions, error } = await db
    .from('questions')
    .select('*')
    .in('id', questionIds);
  if (error) throw error;

  return (questions || []).map((q: Record<string, unknown>) => {
    const review = reviews.find((r: Record<string, unknown>) => r.question_id === q.id);
    return { ...q, review_topic_id: review?.topic_id, review_stage: review?.stage };
  });
}

export async function getClassMasteryOverview(classId: string) {
  const { data, error } = await db
    .from('mv_class_mastery')
    .select('*')
    .eq('class_id', classId);
  if (error) throw error;
  return data || [];
}

export async function getLearnerSummary(classId: string) {
  const { data, error } = await db
    .from('mv_learner_summary')
    .select('*')
    .eq('class_id', classId);
  if (error) throw error;
  return data || [];
}

export async function getLearnerTopicMastery(learnerId: string) {
  const { data, error } = await db
    .from('topic_mastery')
    .select('*, topics(name, code, class_level)')
    .eq('learner_id', learnerId)
    .order('last_updated', { ascending: false });
  if (error) throw error;
  return (data || []).map((row: Record<string, unknown>) => ({
    ...row,
    topic_name: (row.topics as Record<string, unknown>)?.name as string,
    topic_code: (row.topics as Record<string, unknown>)?.code as string,
    class_level: (row.topics as Record<string, unknown>)?.class_level as string,
  }));
}

export async function getClassReviewQueue(classId: string) {
  const { data: learners, error: lErr } = await db
    .from('learners')
    .select('id, display_name')
    .eq('class_id', classId);
  if (lErr) throw new Error(lErr.message);
  if (!learners || learners.length === 0) return [];

  const learnerIds = learners.map((l: Record<string, unknown>) => l.id);

  const { data: reviews, error: rErr } = await db
    .from('review_queue')
    .select('learner_id, question_id, topic_id, stage, due_at, topics(name, code)')
    .in('learner_id', learnerIds)
    .not('stage', 'eq', 'retained')
    .order('due_at', { ascending: true });
  if (rErr) throw new Error(rErr.message);

  const learnerMap = new Map(learners.map((l: Record<string, unknown>) => [l.id, l.display_name]));
  const overdueCutoff = Date.now() - ASSESSMENT_CONFIG.overdueReviewDays * 24 * 60 * 60 * 1000;
  const result: Record<string, unknown>[] = [];

  for (const review of reviews || []) {
    const learnerName = learnerMap.get(review.learner_id) || 'Unknown';
    const topicInfo = review.topics as Record<string, unknown> | null;
    const dueMs = review.due_at ? new Date(review.due_at).getTime() : NaN;
    result.push({
      ...review,
      display_name: learnerName,
      topic_name: (topicInfo?.name as string) || 'Unknown',
      topic_code: (topicInfo?.code as string) || '',
      is_overdue: Number.isFinite(dueMs) && dueMs < overdueCutoff,
    });
  }

  return result;
}

export async function getQuestionAnalytics(topicId?: string) {
  let query = db.from('mv_question_analytics').select('*');
  if (topicId) {
    query = query.eq('topic_id', topicId);
  }
  query = query
    .gt('total_attempts', 0)
    .order('success_rate_pct', { ascending: true, nullsFirst: false })
    .limit(100);
  const { data, error } = await query;
  if (error) throw error;
  return data || [];
}

export async function getPsychometricAnalytics(topicId?: string) {
  let query = db.from('question_parameters').select(`
    question_id,
    difficulty,
    discrimination,
    total_attempts,
    questions!inner(id, stem, question_type, topic_id)
  `);

  if (topicId) {
    query = query.eq('questions.topic_id', topicId);
  }

  const { data, error } = await query.order('total_attempts', { ascending: false }).limit(200);
  if (error) throw error;

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  return (data || []).map((row: any) => ({
    question_id: row.question_id,
    difficulty_b: Number(row.difficulty ?? 0),
    discrimination_a: Number(row.discrimination ?? 1),
    total_attempts: Number(row.total_attempts ?? 0),
    stem: row.questions?.stem || 'Unknown Question',
    question_type: row.questions?.question_type || 'multiple_choice',
    topic_id: row.questions?.topic_id || '',
  }));
}

export async function getAdaptiveQuestion(
  learnerId: string,
  topicId: string,
  excludeIds: string[] = []
): Promise<Question | null> {
  const { data, error } = await db.rpc('get_adaptive_question', {
    p_learner_id: learnerId,
    p_topic_id: topicId,
    p_exclude_ids: excludeIds,
  });

  if (error) throw error;
  if (!data || data.length === 0) return null;
  return data[0] as Question;
}

export async function getLearnerPsychometricProfile(learnerId: string) {
  const { data, error } = await db
    .from('learner_abilities')
    .select('subject_id, theta, total_answered')
    .eq('learner_id', learnerId)
    .order('total_answered', { ascending: false });

  if (error) throw error;
  return data || [];
}

export async function getMasteryHistory(learnerId: string, topicId?: string) {
  let query = db
    .from('mastery_history')
    .select('*')
    .eq('learner_id', learnerId)
    .order('recorded_at', { ascending: true });
  if (topicId) {
    query = query.eq('topic_id', topicId);
  }
  const { data, error } = await query;
  if (error) throw error;
  return data || [];
}

export async function getMisconceptionPatterns(classId: string) {
  const { data: learners, error: lErr } = await db
    .from('learners')
    .select('id, display_name')
    .eq('class_id', classId);
  if (lErr) throw new Error(lErr.message);
  if (!learners || learners.length === 0) return [];

  const learnerIds = learners.map((l: Record<string, unknown>) => l.id);

  const { data: attempts, error: aErr } = await db
    .from('attempts')
    .select('learner_id, question_id, attempt_type, questions(stem, topic_id, topics(name, code))')
    .in('learner_id', learnerIds)
    .eq('is_correct', false)
    .neq('attempt_type', 'self_practice')
    .order('created_at', { ascending: false })
    .limit(1000);
  if (aErr) throw new Error(aErr.message);

  const missMap = new Map<
    string,
    { learner_id: string; question_id: string; topic_id: string; stem: string; topic_name: string; topic_code: string; count: number }
  >();
  for (const attempt of attempts || []) {
    const key = `${attempt.learner_id}:${attempt.question_id}`;
    const existing = missMap.get(key);
    const qInfo = attempt.questions as Record<string, unknown> | null;
    const topicInfo = qInfo?.topics as Record<string, unknown> | null;
    if (existing) {
      existing.count++;
    } else {
      missMap.set(key, {
        learner_id: attempt.learner_id,
        question_id: attempt.question_id,
        topic_id: (qInfo?.topic_id as string) || '',
        stem: (qInfo?.stem as string) || 'Unknown',
        topic_name: (topicInfo?.name as string) || 'Unknown',
        topic_code: (topicInfo?.code as string) || '',
        count: 1,
      });
    }
  }

  const learnerNameMap = new Map(learners.map((l: Record<string, unknown>) => [l.id, l.display_name]));
  return Array.from(missMap.values())
    .filter((m) => m.count >= 3)
    .map((m) => ({
      ...m,
      learner_name: learnerNameMap.get(m.learner_id) || 'Unknown',
    }))
    .sort((a, b) => b.count - a.count);
}

export async function getTotalTopicsCount(classLevel?: string): Promise<number> {
  let query = db.from('topics').select('*', { count: 'exact', head: true });
  if (classLevel) {
    query = query.eq('class_level', classLevel);
  }
  const { count, error } = await query;
  if (error) throw error;
  return count || 0;
}

function shuffleArray<T>(array: T[]): T[] {
  const arr = [...array];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}
