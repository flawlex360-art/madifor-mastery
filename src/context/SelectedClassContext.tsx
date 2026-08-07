import { createContext, useContext, useState, useEffect, type ReactNode } from 'react';
import { getTeacherClasses } from '@/api/auth';
import { useAuth } from '@/hooks/useAuth';
import type { Class } from '@/types/auth';

interface SelectedClassContextType {
  classes: Class[];
  selectedClassId: string;
  selectedClass: Class | null;
  setSelectedClassId: (id: string) => void;
  refreshClasses: () => Promise<void>;
}

const SelectedClassContext = createContext<SelectedClassContextType | null>(null);

export function SelectedClassProvider({ children }: { children: ReactNode }) {
  const { teacher } = useAuth();
  const [classes, setClasses] = useState<Class[]>([]);
  const [selectedClassId, setSelectedClassId] = useState<string>('');

  const selectedClass = classes.find((c) => c.id === selectedClassId) || null;

  const refreshClasses = async () => {
    if (!teacher) return;
    const cls = await getTeacherClasses(teacher.id);
    setClasses(cls);
    // If no class is selected yet, or current selection no longer exists, pick the first
    if (cls.length > 0 && (!selectedClassId || !cls.find((c: Class) => c.id === selectedClassId))) {
      setSelectedClassId(cls[0].id);
    }
  };

  useEffect(() => {
    if (teacher) refreshClasses();
  }, [teacher]);

  return (
    <SelectedClassContext.Provider
      value={{ classes, selectedClassId, selectedClass, setSelectedClassId, refreshClasses }}
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
