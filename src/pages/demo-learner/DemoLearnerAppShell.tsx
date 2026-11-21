import { useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import DemoLearnerSidebar from './DemoLearnerSidebar';
import { LogOut, Menu, Sparkles } from 'lucide-react';
import { useUIStore } from '@/stores/uiStore';
import PageTransition from '@/components/layout/PageTransition';
import ToastContainer from '@/components/ui/Toast';

interface DemoLearnerAppShellProps {
  children: React.ReactNode;
}

export default function DemoLearnerAppShell({ children }: DemoLearnerAppShellProps) {
  const sidebarOpen = useUIStore((s) => s.sidebarOpen);
  const setSidebarOpen = useUIStore((s) => s.setSidebarOpen);
  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    setSidebarOpen(false);
  }, [location.pathname, setSidebarOpen]);

  return (
    <div className="h-screen bg-slate-50 flex overflow-hidden">
      <DemoLearnerSidebar />

      {sidebarOpen && (
        <div
          className="fixed inset-0 bg-navy-950/50 backdrop-blur-sm z-30 lg:hidden"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      <div className="flex-1 flex flex-col min-w-0 overflow-hidden">
        <header className="h-16 bg-white border-b border-slate-200 flex items-center justify-between px-4 lg:px-6 sticky top-0 z-20">
          <div className="flex items-center gap-3">
            <button
              type="button"
              onClick={() => setSidebarOpen(true)}
              className="lg:hidden p-2 -ml-2 text-slate-600 hover:text-navy-900 rounded-lg hover:bg-slate-100"
              aria-label="Open menu"
            >
              <Menu className="w-5 h-5" />
            </button>
            <div className="flex items-center gap-2">
              <span className="text-sm font-semibold text-navy-900">Abigail Mensah</span>
              <span className="text-xs px-2 py-0.5 rounded-full bg-indigo-50 text-indigo-700 font-medium">
                Demo Learner &middot; B8
              </span>
            </div>
          </div>

          <button
            type="button"
            onClick={() => navigate('/')}
            className="flex items-center gap-1.5 px-3 py-1.5 text-sm font-medium text-rose-600 hover:bg-rose-50 rounded-lg transition-colors"
          >
            <LogOut className="w-4 h-4" />
            <span className="hidden sm:inline">Exit Demo</span>
          </button>
        </header>

        {/* Persistent Demo Environment Banner */}
        <div className="bg-indigo-600 text-white px-4 py-2 text-xs sm:text-sm flex flex-wrap items-center justify-between gap-2 z-10">
          <div className="flex items-center gap-2">
            <Sparkles className="w-4 h-4 text-indigo-200 flex-shrink-0" />
            <span>
              <strong>Learner Demo</strong> — Viewing as Abigail, a Basic 8 (JHS 2) Science student.
            </span>
          </div>
          <button
            type="button"
            onClick={() => navigate('/learner/login')}
            className="px-3 py-1 rounded-md bg-white text-indigo-700 font-semibold text-xs hover:bg-indigo-50 transition-colors whitespace-nowrap"
          >
            Sign In to Your Account
          </button>
        </div>

        <main className="flex-1 overflow-auto custom-scrollbar relative">
          <div className="max-w-5xl mx-auto p-4 lg:p-8 pb-20">
            <PageTransition>{children}</PageTransition>
          </div>
        </main>
      </div>

      <ToastContainer />
    </div>
  );
}
