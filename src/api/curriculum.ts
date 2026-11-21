import { supabase } from '@/lib/supabase';
import type { Question } from '@/types/curriculum';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

export async function getSubjects() {
  const { data, error } = await db.from('subjects').select('*').order('name');
  if (error) throw error;
  return data || [];
}

export async function getCurriculumTree(subjectId: string) {
  const { data: subject, error: sErr } = await db.from('subjects').select('*').eq('id', subjectId).single();
  if (sErr) throw sErr;

  const { data: strands, error: stErr } = await db.from('strands').select('*').eq('subject_id', subjectId).order('sort_order');
  if (stErr) throw stErr;

  const strandIds = (strands || []).map((s: Record<string, unknown>) => s.id as string);
  if (strandIds.length === 0) {
    return { subject, strands: [] };
  }

  const { data: subStrands, error: ssErr } = await db.from('sub_strands').select('*').in('strand_id', strandIds).order('sort_order');
  if (ssErr) throw ssErr;

  const subStrandIds = (subStrands || []).map((ss: Record<string, unknown>) => ss.id as string);
  const topics = subStrandIds.length > 0
    ? await (async () => {
        const { data, error: tErr } = await db.from('topics').select('*').in('sub_strand_id', subStrandIds).order('sort_order');
        if (tErr) throw tErr;
        return data || [];
      })()
    : [];

  return {
    subject,
    strands: (strands || []).map((strand: Record<string, unknown>) => ({
      ...strand,
      sub_strands: (subStrands || [])
        .filter((ss: Record<string, unknown>) => ss.strand_id === strand.id)
        .map((ss: Record<string, unknown>) => ({
          ...ss,
          topics: topics.filter((t: Record<string, unknown>) => t.sub_strand_id === ss.id),
        })),
    })),
  };
}

export async function getQuestionCountByTopic(topicIds: string[]): Promise<Record<string, number>> {
  if (topicIds.length === 0) return {};
  const counts: Record<string, number> = {};
  const pageSize = 1000;

  for (let from = 0, hasMore = true; hasMore; from += pageSize) {
    const { data, error } = await db
      .from('questions')
      .select('topic_id')
      .in('topic_id', topicIds)
      .range(from, from + pageSize - 1);
    if (error) throw error;
    const rows = data || [];
    for (const row of rows) {
      counts[row.topic_id] = (counts[row.topic_id] || 0) + 1;
    }
    hasMore = rows.length === pageSize;
  }

  return counts;
}

export async function getQuestionsByTopic(topicId: string) {
  const { data, error } = await db.from('questions').select('*').eq('topic_id', topicId).order('created_at');
  if (error) throw error;
  return data || [];
}

export async function getTopicById(topicId: string) {
  const { data, error } = await db.from('topics').select('*').eq('id', topicId).maybeSingle();
  if (error) throw error;
  return data;
}

export async function createQuestion(question: Record<string, unknown>) {
  const { data, error } = await db.from('questions').insert(question).select().single();
  if (error) throw error;
  return data;
}

export async function createQuestionsBatch(questions: Record<string, unknown>[]) {
  const { data, error } = await db.from('questions').insert(questions).select();
  if (error) throw error;
  return data || [];
}

export async function updateQuestion(id: string, updates: Record<string, unknown>) {
  const { data, error } = await db
    .from('questions')
    .update({ ...updates, updated_at: new Date().toISOString() })
    .eq('id', id)
    .select()
    .maybeSingle();
  if (error) throw error;
  if (!data) throw new Error('You do not have permission to edit this shared question.');
  return data;
}

export async function deleteQuestion(id: string) {
  const { data, error } = await db.from('questions').delete().eq('id', id).select('id');
  if (error) throw error;
  if (!data || data.length === 0) {
    throw new Error('You can only delete questions you created.');
  }
}

export async function createTopic(topic: { sub_strand_id: string; name: string; code: string; class_level: string }) {
  const { data: orderData, error: orderErr } = await db
    .from('topics')
    .select('sort_order')
    .eq('sub_strand_id', topic.sub_strand_id)
    .order('sort_order', { ascending: false })
    .limit(1);
  if (orderErr) throw orderErr;

  const nextOrder = orderData && orderData.length > 0 ? (orderData[0].sort_order || 0) + 1 : 1;

  const { data: newTopic, error } = await db
    .from('topics')
    .insert([{ ...topic, sort_order: nextOrder }])
    .select()
    .single();

  if (error) throw error;
  return newTopic;
}

export async function updateQuestionTopic(questionIds: string[], topicId: string): Promise<number> {
  if (questionIds.length === 0) return 0;
  const { data, error } = await db
    .from('questions')
    .update({ topic_id: topicId, updated_at: new Date().toISOString() })
    .in('id', questionIds)
    .select('id');
  if (error) throw error;
  const updatedCount = data?.length || 0;
  if (updatedCount === 0) {
    throw new Error('You can only move questions you created (built-in shared questions are read-only).');
  }
  return updatedCount;
}

export async function getQuestionsByTopicIds(topicIds: string[]): Promise<Question[]> {
  if (topicIds.length === 0) return [];
  const allRows: Question[] = [];
  const pageSize = 1000;

  for (let from = 0, hasMore = true; hasMore; from += pageSize) {
    const { data, error } = await db
      .from('questions')
      .select('*')
      .in('topic_id', topicIds)
      .order('created_at', { ascending: false })
      .range(from, from + pageSize - 1);
    if (error) throw error;
    const rows = (data || []) as Question[];
    allRows.push(...rows);
    hasMore = rows.length === pageSize;
  }

  return allRows;
}

export async function getRandomQuestions(topicId: string, limit: number) {
  const { data, error } = await db.from('questions').select('*').eq('topic_id', topicId).limit(limit * 3);
  if (error) throw error;
  const arr = [...(data || [])];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr.slice(0, limit);
}

export async function getLearnerHomepageData(learnerId: string, classLevel: string) {
  const { data, error } = await db.rpc('get_learner_homepage_data', {
    p_learner_id: learnerId,
    p_class_level: classLevel,
  });
  if (error) throw error;
  return data;
}
