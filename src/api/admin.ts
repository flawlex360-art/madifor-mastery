import { supabase } from '@/lib/supabase';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

export interface AdminTeacherRecord {
  id: string;
  email: string;
  full_name: string;
  is_admin: boolean;
  status: 'active' | 'suspended';
  school_name?: string;
  created_at: string;
  classes?: { id: string }[];
}

export async function getAllTeachers(): Promise<AdminTeacherRecord[]> {
  const { data, error } = await db
    .from('teachers')
    .select('*, classes(id)')
    .order('created_at', { ascending: false });

  if (error) throw new Error(error.message);
  return data || [];
}

export async function getPlatformStats() {
  // To get the count of learners, we can query the learners table
  const { count: learnersCount, error: lError } = await db
    .from('learners')
    .select('*', { count: 'exact', head: true });
  if (lError) throw new Error(lError.message);

  const { count: classesCount, error: cError } = await db
    .from('classes')
    .select('*', { count: 'exact', head: true });
  if (cError) throw new Error(cError.message);

  const { count: teachersCount, error: tError } = await db
    .from('teachers')
    .select('*', { count: 'exact', head: true });
  if (tError) throw new Error(tError.message);

  return {
    totalLearners: learnersCount || 0,
    totalClasses: classesCount || 0,
    totalTeachers: teachersCount || 0,
  };
}

export async function suspendTeacher(teacherId: string, status: 'active' | 'suspended') {
  const { error } = await db.rpc('suspend_teacher_account', {
    p_teacher_id: teacherId,
    p_status: status,
  });
  if (error) throw new Error(error.message);
}

export async function deleteTeacher(teacherId: string) {
  const { error } = await db.rpc('delete_teacher_account', {
    p_teacher_id: teacherId,
  });
  if (error) throw new Error(error.message);
}
