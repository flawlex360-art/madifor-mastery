import { ReactNode } from 'react';
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
  const sidebarOpen = useUIStore(s => s.sidebarOpen);
  const setSidebarOpen = useUIStore(s => s.setSidebarOpen);

  return (
    <div className="flex h-screen bg-gray-50">
      {sidebarOpen && (
        <div
          className="fixed inset-0 bg-black/50 z-30 lg:hidden"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      <Sidebar role={userRole} />

      <div className="flex-1 flex flex-col overflow-hidden">
        <TopBar userName={userName} userRole={userRole} onLogout={onLogout} />
        <main className="flex-1 overflow-y-auto p-4 lg:p-6">
          <PageTransition>
            {children}
          </PageTransition>
        </main>
      </div>

      <OfflineIndicator />
      <ToastContainer />
    </div>
  );
}
