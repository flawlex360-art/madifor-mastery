import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { cn } from '@/lib/utils';
import DemoLearnerSidebar from './DemoLearnerSidebar';
import { LogOut, Menu } from 'lucide-react';

interface DemoLearnerAppShellProps {
  children: React.ReactNode;
}

export default function DemoLearnerAppShell({ children }: DemoLearnerAppShellProps) {
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const navigate = useNavigate();

  return (
    <div className="h-screen bg-zinc-50 flex overflow-hidden">
      <DemoLearnerSidebar />

      {/* Mobile Sidebar Overlay */}
      {sidebarOpen && (
        <div 
          className="fixed inset-0 bg-zinc-900/50 backdrop-blur-sm z-30 lg:hidden"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      <div className={cn(
        "flex-1 flex flex-col min-w-0 transition-all duration-300 overflow-hidden",
        sidebarOpen && "lg:ml-64"
      )}>
        {/* Top Bar */}
        <header className="h-16 bg-white border-b border-zinc-200 flex items-center justify-between px-4 lg:px-6 sticky top-0 z-20 shadow-sm">
          <div className="flex items-center gap-3">
            <button
              onClick={() => setSidebarOpen(true)}
              className="lg:hidden p-2 -ml-2 text-zinc-500 hover:text-zinc-900 rounded-lg hover:bg-zinc-100"
            >
              <Menu className="w-5 h-5" />
            </button>
            <div className="hidden lg:flex items-center gap-2">
              <span className="text-sm font-medium text-zinc-900">Abigail Mensah (Demo Learner)</span>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <button 
              onClick={() => navigate('/')}
              className="flex items-center gap-2 px-3 py-1.5 text-sm font-medium text-red-600 hover:bg-red-50 rounded-lg transition-colors"
            >
              <LogOut className="w-4 h-4" />
              <span className="hidden sm:inline">Exit Demo</span>
            </button>
          </div>
        </header>

        <main className="flex-1 overflow-auto custom-scrollbar relative">
          <div className="p-4 lg:p-6 pb-24">
            {/* Demo Banner */}
            <div className="mb-6 bg-purple-50 border border-purple-200 rounded-xl p-4 flex items-start sm:items-center justify-between flex-col sm:flex-row gap-4 shadow-sm">
              <div>
                <h3 className="text-purple-800 font-semibold flex items-center gap-2">
                  <span className="w-2 h-2 rounded-full bg-purple-500 animate-pulse" />
                  Welcome to the Learner Demo
                </h3>
                <p className="text-purple-600 text-sm mt-1">
                  You are viewing this dashboard as Abigail, a JHS 3 student.
                </p>
              </div>
              <button 
                onClick={() => navigate('/learner/login')}
                className="whitespace-nowrap px-4 py-2 bg-purple-600 hover:bg-purple-700 text-white text-sm font-medium rounded-lg shadow-sm transition-colors"
              >
                Sign Up for Real
              </button>
            </div>

            {children}
          </div>
        </main>
      </div>
    </div>
  );
}
