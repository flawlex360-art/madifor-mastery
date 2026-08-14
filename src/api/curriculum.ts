import { supabase } from '@/lib/supabase';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

export async function getSubjects() {
  const { data, error } = await db.from('subjects').select('*').order('name');
  if (error) throw error;
  return data;
}

export async function getCurriculumTree(subjectId: string) {
  const { data: subject, error: sErr } = await db.from('subjects').select('*').eq('id', subjectId).single();
  if (sErr) throw sErr;

  const { data: strands, error: stErr } = await db.from('strands').select('*').eq('subject_id', subjectId).order('sort_order');
  if (stErr) throw stErr;

  const strandIds = (strands || []).map((s: Record<string, unknown>) => s.id);
  const { data: subStrands, error: ssErr } = await db.from('sub_strands').select('*').in('strand_id', strandIds).order('sort_order');
  if (ssErr) throw ssErr;

  const subStrandIds = (subStrands || []).map((ss: Record<string, unknown>) => ss.id);
  const { data: topics, error: tErr } = await db.from('topics').select('*').in('sub_strand_id', subStrandIds).order('sort_order');
  if (tErr) throw tErr;

  return {
    subject,
    strands: (strands || []).map((strand: Record<string, unknown>) => ({
      ...strand,
      sub_strands: (subStrands || [])
        .filter((ss: Record<string, unknown>) => ss.strand_id === strand.id)
        .map((ss: Record<string, unknown>) => ({
          ...ss,
          topics: (topics || []).filter((t: Record<string, unknown>) => t.sub_strand_id === ss.id),
        })),
    })),
  };
}

export async function getQuestionCountByTopic(topicIds: string[]): Promise<Record<string, number>> {
  // M-5: Fetch only topic_id, count client-side (Supabase doesn't support GROUP BY in REST)
  // But limit the select to just topic_id to minimize data transfer
  const { data, error } = await db.from('questions').select('topic_id').in('topic_id', topicIds);
  if (error) throw error;
  const counts: Record<string, number> = {};
  for (const row of (data || [])) {
    counts[row.topic_id] = (counts[row.topic_id] || 0) + 1;
  }
  return counts;
}

export async function getQuestionsByTopic(topicId: string) {
  const { data, error } = await db.from('questions').select('*').eq('topic_id', topicId).order('created_at');
  if (error) throw error;
  return data || [];
}

export async function createQuestion(question: Record<string, unknown>) {
  const { data, error } = await db.from('questions').insert(question).select().single();
  if (error) throw error;
  return data;
}

export async function updateQuestion(id: string, updates: Record<string, unknown>) {
  const { data, error } = await db.from('questions').update({ ...updates, updated_at: new Date().toISOString() }).eq('id', id).select().single();
  if (error) throw error;
  return data;
}

export async function deleteQuestion(id: string) {
  const { error } = await db.from('questions').delete().eq('id', id);
  if (error) throw error;
}

export async function createTopic(topic: { sub_strand_id: string; name: string; code: string; class_level: string }) {
  // get max sort order
  const { data } = await db.from('topics').select('sort_order').eq('sub_strand_id', topic.sub_strand_id).order('sort_order', { ascending: false }).limit(1);
  const nextOrder = data && data.length > 0 ? (data[0].sort_order || 0) + 1 : 1;

  const { data: newTopic, error } = await db
    .from('topics')
    .insert([{ ...topic, sort_order: nextOrder }])
    .select()
    .single();
  
  if (error) throw error;
  return newTopic;
}

export async function updateQuestionTopic(questionIds: string[], topicId: string) {
  const { error } = await db.from('questions').update({ topic_id: topicId, updated_at: new Date().toISOString() }).in('id', questionIds);
  if (error) throw error;
}

export async function getQuestionsByTopicIds(topicIds: string[]) {
  const { data, error } = await db.from('questions').select('*').in('topic_id', topicIds).order('created_at', { ascending: false });
  if (error) throw error;
  return data || [];
}

export async function getRandomQuestions(topicId: string, limit: number) {
  const { data, error } = await db.from('questions').select('*').eq('topic_id', topicId).limit(limit * 3);
  if (error) throw error;
  // M-4: Use Fisher-Yates shuffle (unbiased) instead of sort(() => Math.random() - 0.5)
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
