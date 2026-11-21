import { useEffect } from 'react';
import { NavLink, Link } from 'react-router-dom';
import {
  LayoutDashboard,
  BookOpen,
  Users,
  Settings,
  Home,
  GraduationCap,
  BarChart3,
  RotateCcw,
  TrendingUp,
  AlertCircle,
  Map as MapIcon,
  ShieldAlert,
  X,
} from 'lucide-react';
import { cn } from '@/lib/utils';
import { useUIStore } from '@/stores/uiStore';
import { useAuth } from '@/hooks/useAuth';

interface SidebarLink {
  to: string;
  label: string;
  icon: React.ReactNode;
}

const teacherLinks: SidebarLink[] = [
  { to: '/teacher/dashboard', label: 'Dashboard', icon: <LayoutDashboard className="w-5 h-5" /> },
  { to: '/teacher/curriculum', label: 'Curriculum', icon: <MapIcon className="w-5 h-5" /> },
  { to: '/teacher/questions', label: 'Questions', icon: <BookOpen className="w-5 h-5" /> },
  { to: '/teacher/analytics', label: 'Analytics', icon: <BarChart3 className="w-5 h-5" /> },
  { to: '/teacher/reviews', label: 'Review Queue', icon: <RotateCcw className="w-5 h-5" /> },
  { to: '/teacher/trends', label: 'Trends', icon: <TrendingUp className="w-5 h-5" /> },
  { to: '/teacher/misconceptions', label: 'Misconceptions', icon: <AlertCircle className="w-5 h-5" /> },
];

const teacherBottomLinks: SidebarLink[] = [
  { to: '/teacher/classes', label: 'Classes', icon: <Users className="w-5 h-5" /> },
  { to: '/teacher/settings', label: 'Settings', icon: <Settings className="w-5 h-5" /> },
];

const learnerLinks: SidebarLink[] = [
  { to: '/learner/home', label: 'Home', icon: <Home className="w-5 h-5" /> },
  { to: '/learner/review', label: 'Reviews', icon: <RotateCcw className="w-5 h-5" /> },
  { to: '/learner/progress', label: 'My Progress', icon: <GraduationCap className="w-5 h-5" /> },
];

interface SidebarProps {
  role: 'teacher' | 'learner';
}

function SidebarLinks({ links, onClick, label }: { links: SidebarLink[]; onClick?: () => void; label?: string }) {
  return (
    <div className="mb-3">
      {label && (
        <div className="px-5 text-[11px] font-bold text-slate-400 mb-2 uppercase tracking-wider">
          {label}
        </div>
      )}
      <div className="space-y-1">
        {links.map((link) => (
          <NavLink
            key={link.to}
            to={link.to}
            onClick={onClick}
            className={({ isActive }) =>
              cn(
                'group relative flex items-center gap-3 px-4 py-2.5 mx-3 rounded-xl text-sm font-medium transition-all duration-200 overflow-hidden',
                isActive
                  ? 'bg-navy-900 text-white shadow-sm shadow-navy-900/15'
                  : 'text-slate-600 hover:bg-navy-50/70 hover:text-navy-900'
              )
            }
          >
            <div className="transition-transform duration-200 group-hover:scale-105">{link.icon}</div>
            <span>{link.label}</span>
          </NavLink>
        ))}
      </div>
    </div>
  );
}

export default function Sidebar({ role }: SidebarProps) {
  const sidebarOpen = useUIStore((s) => s.sidebarOpen);
  const setSidebarOpen = useUIStore((s) => s.setSidebarOpen);
  const { teacher } = useAuth();

  useEffect(() => {
    if (!sidebarOpen) return;
    const handleEsc = (e: KeyboardEvent) => {
      if (e.key === 'Escape') setSidebarOpen(false);
    };
    window.addEventListener('keydown', handleEsc);
    return () => window.removeEventListener('keydown', handleEsc);
  }, [sidebarOpen, setSidebarOpen]);

  const homePath = role === 'teacher' ? '/teacher/dashboard' : '/learner/home';

  return (
    <aside
      aria-label="Primary Sidebar"
      className={cn(
        'fixed lg:static inset-y-0 left-0 z-40 w-64 bg-white text-navy-900 transition-transform duration-300 ease-in-out lg:transition-none border-r border-slate-200/90 shadow-2xl lg:shadow-none flex-shrink-0',
        sidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'
      )}
    >
      <div className="h-16 flex items-center justify-between px-5 border-b border-slate-200/80 bg-white">
        <Link to={homePath} onClick={() => setSidebarOpen(false)} className="flex items-center gap-2.5 group">
          <img src="/logo.png" alt="Madifor Mastery Logo" className="w-8 h-8 object-contain" />
          <span className="text-lg font-bold text-navy-900 tracking-tight group-hover:text-indigo-700 transition-colors">
            Madifor Mastery
          </span>
        </Link>
        <button
          type="button"
          onClick={() => setSidebarOpen(false)}
          aria-label="Close navigation menu"
          className="lg:hidden p-1.5 rounded-lg text-slate-400 hover:text-navy-900 hover:bg-slate-100"
        >
          <X className="w-5 h-5" />
        </button>
      </div>

      <nav aria-label="Main navigation" className="py-5 flex flex-col h-[calc(100%-4rem)] overflow-y-auto custom-scrollbar">
        {role === 'teacher' ? (
          <>
            <SidebarLinks links={teacherLinks} onClick={() => setSidebarOpen(false)} label="Main" />
            <div className="flex-1" />
            <div className="border-t border-slate-200/80 pt-5 mt-3">
              <SidebarLinks links={teacherBottomLinks} onClick={() => setSidebarOpen(false)} label="Management" />
              {teacher?.is_admin && (
                <div className="mt-2">
                  <SidebarLinks
                    links={[
                      {
                        to: '/teacher/admin',
                        label: 'Admin Panel',
                        icon: <ShieldAlert className="w-5 h-5 text-red-500" />,
                      },
                    ]}
                    onClick={() => setSidebarOpen(false)}
                    label="Super Admin"
                  />
                </div>
              )}
            </div>
          </>
        ) : (
          <>
            <SidebarLinks links={learnerLinks} onClick={() => setSidebarOpen(false)} label="Learning" />
            <div className="flex-1" />
          </>
        )}
      </nav>
    </aside>
  );
}
