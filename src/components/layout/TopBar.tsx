import { Menu, LogOut, ChevronRight, LayoutDashboard, GraduationCap } from 'lucide-react';
import { useLocation } from 'react-router-dom';
import Button from '@/components/ui/Button';
import { useUIStore } from '@/stores/uiStore';
import { useOptionalSelectedClass } from '@/context/SelectedClassContext';

interface TopBarProps {
  userName: string;
  userRole: 'teacher' | 'learner';
  onLogout: () => void;
}

const ROUTE_TITLES: Record<string, string> = {
  dashboard: 'Dashboard',
  curriculum: 'Curriculum',
  questions: 'Question Builder',
  analytics: 'Question Analytics',
  reviews: 'Review Queue',
  trends: 'Learner Trends',
  misconceptions: 'Misconceptions',
  classes: 'Class Management',
  settings: 'Settings',
  admin: 'Super Admin',
  home: 'Home',
  assessment: 'Topic Assessment',
  review: 'Spaced Review',
  progress: 'My Progress',
};

function getBreadcrumbTitle(pathname: string): string {
  const segments = pathname.split('/').filter(Boolean);
  for (let i = segments.length - 1; i >= 0; i--) {
    const seg = segments[i];
    if (ROUTE_TITLES[seg]) return ROUTE_TITLES[seg];
  }
  return 'Home';
}

export default function TopBar({ userName, userRole, onLogout }: TopBarProps) {
  const toggleSidebar = useUIStore((s) => s.toggleSidebar);
  const location = useLocation();
  const classCtx = useOptionalSelectedClass();

  const pageTitle = getBreadcrumbTitle(location.pathname);

  const getInitials = (name: string) => {
    if (!name) return 'U';
    return name
      .split(' ')
      .filter(Boolean)
      .map((n) => n[0])
      .join('')
      .toUpperCase()
      .slice(0, 2);
  };

  return (
    <header className="h-16 bg-white/90 backdrop-blur-md border-b border-slate-200/80 flex items-center justify-between px-4 lg:px-6 sticky top-0 z-20 transition-all">
      <div className="flex items-center gap-3 min-w-0">
        <button
          type="button"
          onClick={toggleSidebar}
          aria-label="Open navigation menu"
          className="lg:hidden p-2 text-slate-600 hover:bg-slate-100 rounded-xl transition-colors"
        >
          <Menu className="w-5 h-5" />
        </button>

        {/* Breadcrumb */}
        <div className="hidden sm:flex items-center gap-2 text-sm min-w-0">
          <div className="w-8 h-8 rounded-lg bg-navy-50 flex items-center justify-center text-navy-900 flex-shrink-0">
            {userRole === 'teacher' ? (
              <LayoutDashboard className="w-4 h-4" />
            ) : (
              <GraduationCap className="w-4 h-4" />
            )}
          </div>
          <span className="font-semibold text-navy-900 capitalize">{userRole}</span>
          <ChevronRight className="w-4 h-4 text-slate-400 flex-shrink-0" />
          <span className="font-medium text-slate-600 truncate">{pageTitle}</span>
        </div>

        {/* Mobile Brand */}
        <span className="sm:hidden text-base font-bold text-navy-900 truncate">Madifor Mastery</span>
      </div>

      <div className="flex items-center gap-3 lg:gap-4">
        {/* Global Teacher Class Switcher (syncs SelectedClassContext across all teacher views) */}
        {userRole === 'teacher' && classCtx && classCtx.classes.length > 0 && (
          <div className="hidden md:flex items-center gap-2">
            <label htmlFor="global-class-select" className="sr-only">
              Active Class
            </label>
            <select
              id="global-class-select"
              value={classCtx.selectedClassId}
              onChange={(e) => classCtx.setSelectedClassId(e.target.value)}
              className="text-xs font-semibold text-navy-900 bg-slate-50 border border-slate-200 rounded-lg px-2.5 py-1.5 focus:outline-none focus:ring-2 focus:ring-indigo-600/20"
            >
              {classCtx.classes.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.name} ({c.class_level})
                </option>
              ))}
            </select>
          </div>
        )}

        {/* User Profile Badge */}
        <div className="flex items-center gap-2.5 bg-slate-50 p-1 pr-3 rounded-full border border-slate-200/80">
          <div className="w-8 h-8 rounded-full bg-navy-900 text-white flex items-center justify-center text-xs font-bold shadow-sm">
            {getInitials(userName)}
          </div>
          <div className="text-left hidden sm:block">
            <p className="text-xs font-bold text-navy-900 leading-tight max-w-[140px] truncate">{userName}</p>
            <p className="text-[11px] text-slate-500 capitalize leading-tight">{userRole}</p>
          </div>
        </div>

        <div className="w-px h-7 bg-slate-200 hidden sm:block" />

        <Button
          variant="ghost"
          size="sm"
          onClick={onLogout}
          aria-label="Logout"
          className="text-slate-600 hover:text-red-600 hover:bg-red-50 rounded-full sm:rounded-xl px-2.5 sm:px-3"
        >
          <span className="hidden sm:inline-block font-semibold">Logout</span>
          <LogOut className="w-4 h-4" />
        </Button>
      </div>
    </header>
  );
}
