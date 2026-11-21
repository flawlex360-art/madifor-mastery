import { ReactNode, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import Sidebar from './Sidebar';
import TopBar from './TopBar';
import OfflineIndicator from './OfflineIndicator';
import ToastContainer from '@/components/ui/Toast';
import { useUIStore } from '@/stores/uiStore';
import PageTransition from './PageTransition';

interface AppShellProps {
  userName: string;
  userRole: 'teacher' | 'learner';
  onLogout: () => void;
  children: ReactNode;
}

export default function AppShell({ userName, userRole, onLogout, children }: AppShellProps) {
  const sidebarOpen = useUIStore((s) => s.sidebarOpen);
  const setSidebarOpen = useUIStore((s) => s.setSidebarOpen);
  const location = useLocation();

  useEffect(() => {
    setSidebarOpen(false);
  }, [location.pathname, setSidebarOpen]);

  return (
    <div className="flex h-screen bg-slate-50">
      {sidebarOpen && (
        <div
          className="fixed inset-0 bg-navy-950/50 backdrop-blur-[1px] z-30 lg:hidden"
          onClick={() => setSidebarOpen(false)}
          aria-hidden="true"
        />
      )}

      <Sidebar role={userRole} />

      <div className="flex-1 flex flex-col min-w-0 overflow-hidden">
        <TopBar userName={userName} userRole={userRole} onLogout={onLogout} />
        <main className="flex-1 overflow-y-auto p-4 lg:p-6">
          <PageTransition>{children}</PageTransition>
        </main>
      </div>

      {userRole === 'learner' && <OfflineIndicator />}
      <ToastContainer />
    </div>
  );
}
