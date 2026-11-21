import { supabase } from '@/lib/supabase';
import { clearSessionRecoveryAndQuestionCache } from '@/lib/offline';
import type { LearnerSession, Teacher, Class, Learner } from '@/types/auth';

const LEARNER_SESSION_KEY = 'flawlex_learner_session';
const PRACTICE_CONTEXT_KEY = 'flawlex_practice_context';

function clearBrowserCachesOnSignOut() {
  localStorage.removeItem(LEARNER_SESSION_KEY);
  localStorage.removeItem(PRACTICE_CONTEXT_KEY);
  try {
    for (let i = sessionStorage.length - 1; i >= 0; i--) {
      const k = sessionStorage.key(i);
      if (k && (k.startsWith('flawlex_') || k.startsWith('madifor_'))) {
        sessionStorage.removeItem(k);
      }
    }
  } catch {
    // Ignore sessionStorage restriction
  }
  if (typeof caches !== 'undefined') {
    caches.keys().then((names) => {
      names.forEach((n) => {
        if (n.includes('supabase')) caches.delete(n);
      });
    }).catch(() => {});
  }
}

// ============================================================
// TEACHER AUTH
// ============================================================

export async function teacherSignUp(
  email: string,
  password: string,
  fullName: string,
  schoolName?: string
): Promise<{ teacher: Teacher | null; pendingConfirmation: boolean }> {
  const cleanEmail = email.trim().toLowerCase();
  const cleanName = fullName.trim();
  const cleanSchool = schoolName?.trim() || null;

  clearBrowserCachesOnSignOut();

  const { data: authData, error: authError } = await supabase.auth.signUp({
    email: cleanEmail,
    password,
    options: {
      data: {
        full_name: cleanName,
        school_name: cleanSchool,
      },
    },
  });

  if (authError) throw new Error(authError.message);
  if (!authData.user) throw new Error('Signup failed. Please try again.');

  // If Supabase requires email confirmation before issuing a session, avoid anon RLS failure
  if (!authData.session) {
    return { teacher: null, pendingConfirmation: true };
  }

  const { data: teacher, error: tError } = await supabase
    .from('teachers')
    .insert({
      id: authData.user.id,
      full_name: cleanName,
      email: cleanEmail,
      school_name: cleanSchool,
    })
    .select('*')
    .single();

  if (tError) throw new Error(tError.message);
  return { teacher: teacher as Teacher, pendingConfirmation: false };
}

export async function teacherSignIn(email: string, password: string): Promise<Teacher> {
  const cleanEmail = email.trim().toLowerCase();
  clearBrowserCachesOnSignOut();

  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
    email: cleanEmail,
    password,
  });
  if (authError) throw new Error(authError.message);
  if (!authData.user) throw new Error('Login failed');

  const { data: teacher, error: tError } = await supabase
    .from('teachers')
    .select('*')
    .eq('id', authData.user.id)
    .maybeSingle();

  if (tError || !teacher) {
    await supabase.auth.signOut();
    throw new Error('Teacher profile not found. Please verify you are logging into the Teacher portal.');
  }

  return teacher as Teacher;
}

export async function sendTeacherPasswordReset(email: string) {
  const cleanEmail = email.trim().toLowerCase();
  const { error } = await supabase.auth.resetPasswordForEmail(cleanEmail, {
    redirectTo: `${window.location.origin}/teacher/settings`,
  });
  if (error) throw new Error(error.message);
}

export async function teacherSignOut() {
  clearBrowserCachesOnSignOut();
  await clearSessionRecoveryAndQuestionCache();
  await supabase.auth.signOut();
}

export async function getCurrentTeacher(): Promise<Teacher | null> {
  const { data: { user }, error: userErr } = await supabase.auth.getUser();
  if (userErr || !user) return null;

  const { data: teacher, error } = await supabase
    .from('teachers')
    .select('*')
    .eq('id', user.id)
    .maybeSingle();

  if (error) throw new Error(error.message);
  return (teacher as Teacher | null) ?? null;
}

// ============================================================
// LEARNER AUTH (email/password via Supabase Auth)
// ============================================================

export async function learnerSignIn(email: string, password: string): Promise<LearnerSession> {
  const cleanEmail = email.trim().toLowerCase();
  clearBrowserCachesOnSignOut();

  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
    email: cleanEmail,
    password,
  });
  if (authError) throw new Error(authError.message);
  if (!authData.user) throw new Error('Login failed');

  const { data: learner, error: lError } = await supabase
    .from('learners')
    .select('*, classes(id, name, class_level, class_code)')
    .eq('id', authData.user.id)
    .maybeSingle();

  if (lError || !learner) {
    await supabase.auth.signOut();
    throw new Error('Learner profile not found. Please verify you are using the Learner portal.');
  }

  const cls = (learner as unknown as { classes?: { class_code?: string; class_level?: 'B7' | 'B8' | 'B9' } | null }).classes;
  const session: LearnerSession = {
    learner_id: learner.id,
    class_id: learner.class_id,
    display_name: learner.display_name,
    class_code: cls?.class_code || '',
    class_level: cls?.class_level || 'B7',
    email: authData.user.email || undefined,
  };
  localStorage.setItem(LEARNER_SESSION_KEY, JSON.stringify(session));
  return session;
}

export async function learnerSignOut() {
  clearBrowserCachesOnSignOut();
  await clearSessionRecoveryAndQuestionCache();
  await supabase.auth.signOut();
}

export function getLearnerSession(): LearnerSession | null {
  const raw = localStorage.getItem(LEARNER_SESSION_KEY);
  if (!raw) return null;
  try {
    const parsed = JSON.parse(raw) as LearnerSession;
    if (!parsed?.learner_id) return null;
    return parsed;
  } catch {
    return null;
  }
}

export async function refreshLearnerSession(): Promise<LearnerSession | null> {
  const session = getLearnerSession();
  const { data: { user } } = await supabase.auth.getUser();

  if (!user) {
    if (session) clearLearnerSession();
    return null;
  }

  if (session && user.id !== session.learner_id) {
    clearLearnerSession();
    return null;
  }

  const { data: learner, error } = await supabase
    .from('learners')
    .select('*, classes(id, name, class_level, class_code)')
    .eq('id', user.id)
    .maybeSingle();

  if (error || !learner) {
    clearLearnerSession();
    return null;
  }

  const cls = (learner as unknown as { classes?: { class_code?: string; class_level?: 'B7' | 'B8' | 'B9' } | null }).classes;
  const refreshed: LearnerSession = {
    learner_id: learner.id,
    class_id: learner.class_id,
    display_name: learner.display_name,
    class_code: cls?.class_code || '',
    class_level: cls?.class_level || 'B7',
    email: user.email || learner.email || undefined,
  };
  localStorage.setItem(LEARNER_SESSION_KEY, JSON.stringify(refreshed));
  return refreshed;
}

export function clearLearnerSession() {
  clearBrowserCachesOnSignOut();
}

// ============================================================
// CLASS & LEARNER MANAGEMENT
// ============================================================

export async function getTeacherClasses(teacherId: string): Promise<Class[]> {
  const { data, error } = await supabase
    .from('classes')
    .select('*')
    .eq('teacher_id', teacherId)
    .order('created_at', { ascending: false });
  if (error) throw new Error(error.message);
  return (data || []) as Class[];
}

export async function createClass(
  teacherId: string,
  name: string,
  classLevel: 'B7' | 'B8' | 'B9',
  schoolId?: string | null
): Promise<Class> {
  const { data, error } = await supabase
    .from('classes')
    .insert({
      teacher_id: teacherId,
      name: name.trim(),
      class_level: classLevel,
      school_id: schoolId ?? null,
    })
    .select('*')
    .single();
  if (error) throw new Error(error.message);
  return data as Class;
}

export async function getClassLearners(classId: string): Promise<Learner[]> {
  const { data, error } = await supabase
    .from('learners')
    .select('id, class_id, school_id, display_name, learner_code, email, created_at')
    .eq('class_id', classId)
    .order('display_name');
  if (error) throw new Error(error.message);
  return (data || []) as Learner[];
}

export async function addLearner(
  classId: string,
  displayName: string,
  email: string,
  password: string
): Promise<Learner> {
  const { data: learnerId, error } = await supabase.rpc('create_learner_account', {
    p_class_id: classId,
    p_display_name: displayName.trim(),
    p_email: email.trim().toLowerCase(),
    p_password: password,
  });
  if (error) throw new Error(error.message);

  const { data: learner, error: fetchErr } = await supabase
    .from('learners')
    .select('id, class_id, school_id, display_name, learner_code, email, created_at')
    .eq('id', learnerId as string)
    .single();
  if (fetchErr) throw new Error(fetchErr.message);
  return learner as Learner;
}

export async function removeLearner(learnerId: string) {
  const { error } = await supabase.rpc('delete_learner_account', { p_learner_id: learnerId });
  if (error) throw new Error(error.message);
}

export async function updateLearner(
  learnerId: string,
  updates: { display_name?: string; email?: string; password?: string }
) {
  const { error } = await supabase.rpc('update_learner_credentials', {
    p_learner_id: learnerId,
    p_display_name: updates.display_name?.trim() || null,
    p_email: updates.email?.trim().toLowerCase() || null,
    p_password: updates.password?.trim() ? updates.password : null,
  });
  if (error) throw new Error(error.message);
}

export async function migrateLearner(learnerId: string, newClassId: string) {
  const { error } = await supabase
    .from('learners')
    .update({ class_id: newClassId })
    .eq('id', learnerId);
  if (error) throw new Error(error.message);
}

// ============================================================
// PRACTICE CONTEXT
// ============================================================

export function getPracticeContext() {
  const raw = localStorage.getItem(PRACTICE_CONTEXT_KEY);
  if (!raw) return null;
  try {
    return JSON.parse(raw);
  } catch {
    return null;
  }
}

export function setPracticeContext(ctx: { practice_class_level: string }) {
  localStorage.setItem(PRACTICE_CONTEXT_KEY, JSON.stringify(ctx));
}

export function clearPracticeContext() {
  localStorage.removeItem(PRACTICE_CONTEXT_KEY);
}
