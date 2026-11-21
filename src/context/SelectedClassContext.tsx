import { createContext, useContext, useState, useEffect, useCallback, type ReactNode } from 'react';
import { getTeacherClasses } from '@/api/auth';
import { useAuth } from '@/hooks/useAuth';
import type { Class } from '@/types/auth';

interface SelectedClassContextType {
  classes: Class[];
  selectedClassId: string;
  selectedClass: Class | null;
  loading: boolean;
  error: string | null;
  setSelectedClassId: (id: string) => void;
  refreshClasses: () => Promise<void>;
}

const SelectedClassContext = createContext<SelectedClassContextType | null>(null);

export function SelectedClassProvider({ children }: { children: ReactNode }) {
  const { teacher, loading: authLoading } = useAuth();
  const [classes, setClasses] = useState<Class[]>([]);
  const [selectedClassId, setSelectedClassId] = useState<string>('');
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  const selectedClass = classes.find((c) => c.id === selectedClassId) || null;

  const refreshClasses = useCallback(async () => {
    if (!teacher) {
      setClasses([]);
      setSelectedClassId('');
      setError(null);
      setLoading(false);
      return;
    }

    setLoading(true);
    setError(null);
    try {
      const cls = await getTeacherClasses(teacher.id);
      setClasses(cls);
      setSelectedClassId((prevId) => {
        if (cls.length === 0) return '';
        if (prevId && cls.some((c) => c.id === prevId)) return prevId;
        return cls[0].id;
      });
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load classes');
    } finally {
      setLoading(false);
    }
  }, [teacher]);

  useEffect(() => {
    if (authLoading) return;
    if (teacher) {
      refreshClasses();
    } else {
      setClasses([]);
      setSelectedClassId('');
      setError(null);
      setLoading(false);
    }
  }, [teacher, authLoading, refreshClasses]);

  return (
    <SelectedClassContext.Provider
      value={{ classes, selectedClassId, selectedClass, loading, error, setSelectedClassId, refreshClasses }}
    >
      {children}
    </SelectedClassContext.Provider>
  );
}

export function useSelectedClass() {
  const ctx = useContext(SelectedClassContext);
  if (!ctx) throw new Error('useSelectedClass must be used inside SelectedClassProvider');
  return ctx;
}

export function useOptionalSelectedClass() {
  return useContext(SelectedClassContext);
}
