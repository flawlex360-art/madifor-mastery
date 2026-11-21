import { supabase } from '@/lib/supabase';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

export interface AdminTeacherRecord {
  id: string;
  email: string;
  full_name: string;
  is_admin: boolean;
  status: 'active' | 'suspended';
  school_name?: string | null;
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
  const [learnersRes, classesRes, teachersRes] = await Promise.all([
    db.from('learners').select('*', { count: 'exact', head: true }),
    db.from('classes').select('*', { count: 'exact', head: true }),
    db.from('teachers').select('*', { count: 'exact', head: true }),
  ]);

  if (learnersRes.error) throw new Error(learnersRes.error.message);
  if (classesRes.error) throw new Error(classesRes.error.message);
  if (teachersRes.error) throw new Error(teachersRes.error.message);

  return {
    totalLearners: learnersRes.count || 0,
    totalClasses: classesRes.count || 0,
    totalTeachers: teachersRes.count || 0,
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
