import { supabase } from '@/lib/supabase';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

// ============================================================
// TEACHER AUTH
// ============================================================

export async function teacherSignUp(email: string, password: string, fullName: string) {
  const { data: authData, error: authError } = await supabase.auth.signUp({ email, password });
  if (authError) throw new Error(authError.message);
  if (!authData.user) throw new Error('Signup failed');

  const { data: teacher, error: tError } = await db
    .from('teachers')
    .insert({ id: authData.user.id, full_name: fullName, email })
    .select()
    .single();
  if (tError) throw new Error(tError.message);
  return teacher;
}

export async function teacherSignIn(email: string, password: string) {
  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({ email, password });
  if (authError) throw new Error(authError.message);
  if (!authData.user) throw new Error('Login failed');

  const { data: teacher, error: tError } = await db
    .from('teachers')
    .select('*')
    .eq('id', authData.user.id)
    .single();
  if (tError) throw new Error(`Profile not found. Did registration complete? (${tError.message})`);
  return teacher;
}

export async function teacherSignOut() {
  await supabase.auth.signOut();
}

export async function getCurrentTeacher() {
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return null;

  const { data: teacher } = await db
    .from('teachers')
    .select('*')
    .eq('id', user.id)
    .single();
  return teacher;
}

// ============================================================
// LEARNER AUTH (email/password via Supabase Auth)
// ============================================================

export async function learnerSignIn(email: string, password: string) {
  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({ email, password });
  if (authError) throw new Error(authError.message);
  if (!authData.user) throw new Error('Login failed');

  // Get learner profile
  const { data: learner, error: lError } = await db
    .from('learners')
    .select('*, classes(id, name, class_level, class_code)')
    .eq('id', authData.user.id)
    .single();
  if (lError) throw new Error(`Learner profile not found. (${lError.message})`);

  const cls = learner.classes;
  const session = {
    learner_id: learner.id,
    class_id: learner.class_id,
    display_name: learner.display_name,
    class_code: cls?.class_code || '',
    class_level: cls?.class_level || '',
    email: authData.user.email,
  };
  localStorage.setItem('flawlex_learner_session', JSON.stringify(session));
  return session;
}

export async function learnerSignOut() {
  await supabase.auth.signOut();
  localStorage.removeItem('flawlex_learner_session');
}

// Create a learner account (called by teacher)
export async function createLearnerAccount(
  classId: string,
  displayName: string,
  email: string,
  password: string
) {
  // Create auth user via server-side function (needs service role)
  const { data: learnerId, error } = await db.rpc('create_learner_account', {
    p_class_id: classId,
    p_display_name: displayName,
    p_email: email,
    p_password: password,
  });
  if (error) throw new Error(error.message);
  return learnerId;
}



// Get current learner session from localStorage
export function getLearnerSession() {
  const raw = localStorage.getItem('flawlex_learner_session');
  if (!raw) return null;
  try { return JSON.parse(raw); } catch { return null; }
}

// Refresh session from DB
export async function refreshLearnerSession() {
  const session = getLearnerSession();
  if (!session) return null;

  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return session;

  const { data: learner } = await db
    .from('learners')
    .select('*, classes(class_level)')
    .eq('id', user.id)
    .single();

  if (learner?.classes?.class_level && learner.classes.class_level !== session.class_level) {
    const refreshed = { ...session, class_level: learner.classes.class_level };
    localStorage.setItem('flawlex_learner_session', JSON.stringify(refreshed));
    return refreshed;
  }
  return session;
}

export function clearLearnerSession() {
  localStorage.removeItem('flawlex_learner_session');
  localStorage.removeItem('flawlex_practice_context');
}

// ============================================================
// CLASS & LEARNER MANAGEMENT
// ============================================================

export async function getTeacherClasses(teacherId: string) {
  const { data, error } = await db
    .from('classes')
    .select('*')
    .eq('teacher_id', teacherId)
    .order('created_at', { ascending: false });
  if (error) throw new Error(error.message);
  return data || [];
}

export async function createClass(teacherId: string, name: string, classLevel: string) {
  const { data, error } = await db
    .from('classes')
    .insert({ teacher_id: teacherId, name, class_level: classLevel })
    .select()
    .single();
  if (error) throw new Error(error.message);
  return data;
}

export async function getClassByCode(classCode: string) {
  const { data } = await db
    .from('classes')
    .select('*')
    .eq('class_code', classCode)
    .single();
  return data;
}

export async function getClassLearners(classId: string) {
  const { data, error } = await db
    .from('learners')
    .select('*')
    .eq('class_id', classId)
    .order('display_name');
  if (error) throw new Error(error.message);
  return data || [];
}

// Add learner (creates auth account + learner record)
export async function addLearner(
  classId: string,
  displayName: string,
  email: string,
  password: string
) {
  const { data: learnerId, error } = await db.rpc('create_learner_account', {
    p_class_id: classId,
    p_display_name: displayName,
    p_email: email,
    p_password: password,
  });
  if (error) throw new Error(error.message);

  // Fetch the created learner
  const { data: learner } = await db
    .from('learners')
    .select('*')
    .eq('id', learnerId)
    .single();
  return learner;
}

export async function removeLearner(learnerId: string) {
  const { error } = await db.rpc('delete_learner_account', { p_learner_id: learnerId });
  if (error) throw new Error(error.message);
}

// Update learner details (name, email, password)
export async function updateLearner(
  learnerId: string,
  updates: { display_name?: string; email?: string; password?: string }
) {
  const { error } = await db.rpc('update_learner_credentials', {
    p_learner_id: learnerId,
    p_display_name: updates.display_name || null,
    p_email: updates.email || null,
    p_password: updates.password || null,
  });
  if (error) throw new Error(error.message);
}

// Migrate learner to a different class (moves profile + all progress data)
export async function migrateLearner(learnerId: string, newClassId: string) {
  const { error } = await db
    .from('learners')
    .update({ class_id: newClassId })
    .eq('id', learnerId);
  if (error) throw new Error(error.message);
}

// ============================================================
// PRACTICE CONTEXT
// ============================================================

export function getPracticeContext() {
  const raw = localStorage.getItem('flawlex_practice_context');
  if (!raw) return null;
  try { return JSON.parse(raw); } catch { return null; }
}

export function setPracticeContext(ctx: { practice_class_level: string }) {
  localStorage.setItem('flawlex_practice_context', JSON.stringify(ctx));
}

export function clearPracticeContext() {
  localStorage.removeItem('flawlex_practice_context');
}
