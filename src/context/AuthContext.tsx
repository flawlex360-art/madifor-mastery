import { createContext, useContext, useState, useEffect, useCallback, type ReactNode } from 'react';
import { supabase } from '@/lib/supabase';
import type { Teacher } from '@/types/auth';
import { getCurrentTeacher, teacherSignIn, teacherSignUp, teacherSignOut } from '@/api/auth';
import type { User } from '@supabase/supabase-js';

interface AuthContextValue {
  user: User | null;
  teacher: Teacher | null;
  loading: boolean;
  isTeacher: boolean;
  signIn: (email: string, password: string) => Promise<Teacher>;
  signUp: (
    email: string,
    password: string,
    fullName: string,
    schoolName?: string
  ) => Promise<{ teacher: Teacher | null; pendingConfirmation: boolean }>;
  signOut: () => Promise<void>;
  refreshTeacher: () => Promise<void>;
}

const AuthContext = createContext<AuthContextValue | null>(null);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [teacher, setTeacher] = useState<Teacher | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let mounted = true;

    supabase.auth
      .getSession()
      .then(({ data: { session } }) => {
        if (!mounted) return;
        setUser(session?.user ?? null);
        if (!session?.user) {
          setTeacher(null);
          setLoading(false);
        }
      })
      .catch(() => {
        if (mounted) {
          setUser(null);
          setTeacher(null);
          setLoading(false);
        }
      });

    // Keep callback strictly synchronous to avoid deadlocking GoTrue internal locks
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      if (!mounted) return;
      const nextUser = session?.user ?? null;
      setUser((prev) => {
        if (!nextUser) {
          setTeacher(null);
          setLoading(false);
        } else if (nextUser.id !== prev?.id) {
          setLoading(true);
        }
        return nextUser;
      });
    });

    return () => {
      mounted = false;
      subscription.unsubscribe();
    };
  }, []);

  const loadTeacherProfile = useCallback(async (userId: string | undefined) => {
    if (!userId) {
      setTeacher(null);
      setLoading(false);
      return;
    }

    try {
      const profile = await getCurrentTeacher();
      setTeacher(profile);
    } catch {
      setTeacher(null);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    let cancelled = false;

    if (!user?.id) {
      setTeacher(null);
      setLoading(false);
      return;
    }

    setLoading(true);
    getCurrentTeacher()
      .then((profile) => {
        if (!cancelled) setTeacher(profile);
      })
      .catch(() => {
        if (!cancelled) setTeacher(null);
      })
      .finally(() => {
        if (!cancelled) setLoading(false);
      });

    return () => {
      cancelled = true;
    };
  }, [user?.id]);

  const refreshTeacher = useCallback(async () => {
    await loadTeacherProfile(user?.id);
  }, [loadTeacherProfile, user?.id]);

  const signIn = useCallback(async (email: string, password: string) => {
    const loggedInTeacher = await teacherSignIn(email, password);
    setTeacher(loggedInTeacher);
    return loggedInTeacher;
  }, []);

  const signUp = useCallback(async (email: string, password: string, fullName: string, schoolName?: string) => {
    const result = await teacherSignUp(email, password, fullName, schoolName);
    if (result.teacher) {
      setTeacher(result.teacher);
    }
    return result;
  }, []);

  const signOut = useCallback(async () => {
    await teacherSignOut();
    setUser(null);
    setTeacher(null);
    setLoading(false);
  }, []);

  return (
    <AuthContext.Provider
      value={{
        user,
        teacher,
        loading,
        isTeacher: !!teacher,
        signIn,
        signUp,
        signOut,
        refreshTeacher,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuthContext() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used inside AuthProvider');
  return ctx;
}
