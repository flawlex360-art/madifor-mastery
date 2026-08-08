import { useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import TopBar from '@/components/layout/TopBar';
import DemoSidebar from './DemoSidebar';
import { useUIStore } from '@/stores/uiStore';
import { cn } from '@/lib/utils';
import { DEMO_TEACHER } from './demoData';

export default function DemoAppShell({ children }: { children: React.ReactNode }) {
  const sidebarOpen = useUIStore(s => s.sidebarOpen);
  const setSidebarOpen = useUIStore(s => s.setSidebarOpen);
  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    setSidebarOpen(false);
  }, [location.pathname, setSidebarOpen]);

  const handleLogout = () => {
    navigate('/');
  };

  return (
    <div className="min-h-screen bg-zinc-50 flex">
      <DemoSidebar />

      {/* Mobile Sidebar Overlay */}
      {sidebarOpen && (
        <div 
          className="fixed inset-0 bg-zinc-900/50 backdrop-blur-sm z-30 lg:hidden"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      <div className={cn(
        "flex-1 flex flex-col min-w-0 transition-all duration-300",
        sidebarOpen && "lg:ml-64"
      )}>
        <TopBar 
          userName={DEMO_TEACHER.full_name} 
          userRole="teacher"
          onLogout={handleLogout}
        />
        <main className="flex-1 overflow-auto custom-scrollbar relative">
          <div className="max-w-7xl mx-auto p-4 lg:p-8">
            <div className="animate-in fade-in slide-in-from-bottom-4 duration-500 fill-mode-both">
              {children}
            </div>
          </div>
        </main>
      </div>
    </div>
  );
}
