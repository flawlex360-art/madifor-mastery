import { supabase } from '@/lib/supabase';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

// Get the class level for a topic
export async function getTopicClassLevel(topicId: string): Promise<string | null> {
  const { data, error } = await db
    .from('topics')
    .select('class_level')
    .eq('id', topicId)
    .single();
  if (error) return null;
  return data?.class_level ?? null;
}

// Create a self-practice session with class level tracking
export async function createVoluntaryPracticeSession(params: {
  learner_id: string;
  topic_id: string;
  practice_class_level: string;
}): Promise<string> {
  const { data, error } = await db
    .from('self_practice_sessions')
    .insert({
      learner_id: params.learner_id,
      topic_id: params.topic_id,
      practice_class_level: params.practice_class_level,
    })
    .select('id')
    .single();
  if (error) throw new Error(error.message);
  return data.id;
}

// Update session with final counts
export async function endVoluntaryPracticeSession(
  sessionId: string,
  questionsAttempted: number,
  questionsCorrect: number
): Promise<void> {
  const { error } = await db
    .from('self_practice_sessions')
    .update({
      questions_attempted: questionsAttempted,
      questions_correct: questionsCorrect,
      ended_at: new Date().toISOString(),
    })
    .eq('id', sessionId);
  if (error) throw new Error(error.message);
}

// Get voluntary practice stats for a class's learners (teacher view)
export async function getClassVoluntaryPractice(classId: string) {
  // Get learners in this class with their home class level
  const { data: learners, error: lErr } = await db
    .from('learners')
    .select('id, display_name, class_id, classes(class_level)')
    .eq('class_id', classId);
  if (lErr) throw new Error(lErr.message);
  if (!learners || learners.length === 0) return [];

  const learnerIds = learners.map((l: Record<string, unknown>) => l.id);

  // Get voluntary practice sessions (last 30 days) where practice level differs from home level
  const { data: sessions, error: sErr } = await db
    .from('self_practice_sessions')
    .select('learner_id, topic_id, practice_class_level, questions_attempted, questions_correct, started_at')
    .in('learner_id', learnerIds)
    .not('practice_class_level', 'is', null)
    .gte('started_at', new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString());
  if (sErr) throw new Error(sErr.message);

  // Aggregate by learner
  const result = learners.map((learner: Record<string, unknown>) => {
    const homeLevel = (learner.classes as Record<string, unknown>)?.class_level as string;
    const learnerSessions = (sessions || []).filter(
      (s: Record<string, unknown>) => s.learner_id === learner.id && s.practice_class_level !== homeLevel
    );
    const uniqueTopics = new Set(learnerSessions.map((s: Record<string, unknown>) => s.topic_id));
    const totalAttempted = learnerSessions.reduce(
      (sum: number, s: Record<string, unknown>) => sum + ((s.questions_attempted as number) || 0), 0
    );
    const totalCorrect = learnerSessions.reduce(
      (sum: number, s: Record<string, unknown>) => sum + ((s.questions_correct as number) || 0), 0
    );

    return {
      learner_id: learner.id,
      display_name: learner.display_name,
      home_class_level: homeLevel,
      voluntary_practice_sessions: learnerSessions.length,
      voluntary_practice_topics: uniqueTopics.size,
      voluntary_practice_attempted: totalAttempted,
      voluntary_practice_correct: totalCorrect,
    };
  });

  return result;
}
