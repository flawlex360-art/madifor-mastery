import { NavLink } from 'react-router-dom';
import {
  LayoutDashboard,
  BookOpen,
  Users,
  Settings,
  RotateCcw,
  TrendingUp,
  AlertCircle,
  Map,
  BarChart3,
} from 'lucide-react';
import { cn } from '@/lib/utils';
import { useUIStore } from '@/stores/uiStore';

interface SidebarLink {
  to: string;
  label: string;
  icon: React.ReactNode;
}

const demoLinks: SidebarLink[] = [
  { to: '/demo/dashboard', label: 'Dashboard', icon: <LayoutDashboard className="w-5 h-5" /> },
  { to: '/demo/curriculum', label: 'Curriculum', icon: <Map className="w-5 h-5" /> },
  { to: '/demo/questions', label: 'Questions', icon: <BookOpen className="w-5 h-5" /> },
  { to: '/demo/analytics', label: 'Analytics', icon: <BarChart3 className="w-5 h-5" /> },
  { to: '/demo/reviews', label: 'Review Queue', icon: <RotateCcw className="w-5 h-5" /> },
  { to: '/demo/trends', label: 'Trends', icon: <TrendingUp className="w-5 h-5" /> },
  { to: '/demo/misconceptions', label: 'Misconceptions', icon: <AlertCircle className="w-5 h-5" /> },
];

const demoBottomLinks: SidebarLink[] = [
  { to: '/demo/classes', label: 'Classes', icon: <Users className="w-5 h-5" /> },
  { to: '/demo/settings', label: 'Settings', icon: <Settings className="w-5 h-5" /> },
];

function SidebarLinks({
  links,
  onClick,
  label,
}: {
  links: SidebarLink[];
  onClick?: () => void;
  label?: string;
}) {
  return (
    <div className="mb-2">
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
                'group flex items-center gap-3 px-4 py-2.5 mx-3 rounded-xl text-sm font-medium transition-colors',
                isActive
                  ? 'bg-indigo-600 text-white shadow-sm'
                  : 'text-slate-300 hover:bg-navy-800 hover:text-white'
              )
            }
          >
            {link.icon}
            <span>{link.label}</span>
          </NavLink>
        ))}
      </div>
    </div>
  );
}

export default function DemoSidebar() {
  const sidebarOpen = useUIStore((s) => s.sidebarOpen);
  const setSidebarOpen = useUIStore((s) => s.setSidebarOpen);

  return (
    <aside
      className={cn(
        'fixed lg:static inset-y-0 left-0 z-40 w-64 bg-navy-900 text-white transition-transform duration-300 ease-in-out lg:transition-none border-r border-navy-800 flex flex-col shrink-0',
        sidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'
      )}
    >
      <div className="h-16 flex items-center px-5 border-b border-navy-800 shrink-0">
        <img src="/logo.png" alt="Madifor Mastery Logo" className="w-8 h-8 object-contain mr-2.5" />
        <div>
          <span className="text-base font-bold tracking-tight block leading-tight">
            Madifor Mastery
          </span>
          <span className="text-[11px] text-indigo-300 font-medium">Teacher Demo</span>
        </div>
      </div>

      <nav className="py-5 flex-1 flex flex-col overflow-y-auto custom-scrollbar">
        <SidebarLinks links={demoLinks} onClick={() => setSidebarOpen(false)} label="Analytics & Content" />
        <div className="flex-1" />
        <div className="border-t border-navy-800 pt-4 mt-4">
          <SidebarLinks links={demoBottomLinks} onClick={() => setSidebarOpen(false)} label="Management" />
        </div>
      </nav>
    </aside>
  );
}
