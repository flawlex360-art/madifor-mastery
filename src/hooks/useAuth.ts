import { useState, useEffect, useCallback } from 'react';
import { supabase } from '@/lib/supabase';
import type { Teacher } from '@/types/auth';
import { getCurrentTeacher, teacherSignIn, teacherSignUp, teacherSignOut } from '@/api/auth';
import type { User } from '@supabase/supabase-js';

interface AuthState {
  user: User | null;
  teacher: Teacher | null;
  loading: boolean;
}

export function useAuth() {
  const [state, setState] = useState<AuthState>({ user: null, teacher: null, loading: true });

  useEffect(() => {
    // Get initial session
    supabase.auth.getSession().then(async ({ data: { session } }) => {
      if (session?.user) {
        const teacher = await getCurrentTeacher();
        setState({ user: session.user, teacher, loading: false });
      } else {
        setState({ user: null, teacher: null, loading: false });
      }
    });

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (_event, session) => {
      if (session?.user) {
        const teacher = await getCurrentTeacher();
        setState({ user: session.user, teacher, loading: false });
      } else {
        setState({ user: null, teacher: null, loading: false });
      }
    });

    return () => subscription.unsubscribe();
  }, []);

  const signIn = useCallback(async (email: string, password: string) => {
    const teacher = await teacherSignIn(email, password);
    return teacher;
  }, []);

  const signUp = useCallback(async (email: string, password: string, fullName: string) => {
    const teacher = await teacherSignUp(email, password, fullName);
    return teacher;
  }, []);

  const signOut = useCallback(async () => {
    await teacherSignOut();
    setState({ user: null, teacher: null, loading: false });
  }, []);

  return { ...state, signIn, signUp, signOut, isTeacher: !!state.teacher };
}
