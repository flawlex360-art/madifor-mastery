import { useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import TopBar from '@/components/layout/TopBar';
import DemoSidebar from './DemoSidebar';
import { useUIStore } from '@/stores/uiStore';
import { DEMO_TEACHER } from './demoData';
import PageTransition from '@/components/layout/PageTransition';
import ToastContainer from '@/components/ui/Toast';
import { Sparkles } from 'lucide-react';

export default function DemoAppShell({ children }: { children: React.ReactNode }) {
  const sidebarOpen = useUIStore((s) => s.sidebarOpen);
  const setSidebarOpen = useUIStore((s) => s.setSidebarOpen);
  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    setSidebarOpen(false);
  }, [location.pathname, setSidebarOpen]);

  const handleLogout = () => {
    navigate('/');
  };

  return (
    <div className="h-screen bg-slate-50 flex overflow-hidden">
      <DemoSidebar />

      {sidebarOpen && (
        <div
          className="fixed inset-0 bg-navy-950/50 backdrop-blur-sm z-30 lg:hidden"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      <div className="flex-1 flex flex-col min-w-0 overflow-hidden">
        <TopBar
          userName={DEMO_TEACHER.full_name}
          userRole="teacher"
          onLogout={handleLogout}
        />

        {/* Persistent Demo Environment Strip */}
        <div className="bg-indigo-600 text-white px-4 py-2 text-xs sm:text-sm flex flex-wrap items-center justify-between gap-2 z-10">
          <div className="flex items-center gap-2">
            <Sparkles className="w-4 h-4 text-indigo-200 flex-shrink-0" />
            <span>
              <strong>Interactive Teacher Demo</strong> — Exploring sample Basic 8 Integrated Science data (read-only).
            </span>
          </div>
          <button
            type="button"
            onClick={() => navigate('/teacher/login?mode=signup')}
            className="px-3 py-1 rounded-md bg-white text-indigo-700 font-semibold text-xs hover:bg-indigo-50 transition-colors whitespace-nowrap"
          >
            Create Real Account
          </button>
        </div>

        <main className="flex-1 overflow-auto custom-scrollbar relative">
          <div className="max-w-7xl mx-auto p-4 lg:p-8">
            <PageTransition>{children}</PageTransition>
          </div>
        </main>
      </div>

      <ToastContainer />
    </div>
  );
}
