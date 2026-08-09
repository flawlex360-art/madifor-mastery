import { NavLink } from 'react-router-dom';
import { LayoutDashboard, BookOpen, Users, Settings, RotateCcw, TrendingUp, AlertCircle, Map } from 'lucide-react';
import { cn } from '@/lib/utils';
import { useUIStore } from '@/stores/uiStore';

interface SidebarLink {
  to: string;
  label: string;
  icon: React.ReactNode;
}

// In Demo, some go to /demo/..., others go to /teacher/... (which will redirect to login)
const demoLinks: SidebarLink[] = [
  { to: '/demo/dashboard', label: 'Dashboard', icon: <LayoutDashboard className="w-5 h-5" /> },
  { to: '/demo/curriculum', label: 'Curriculum', icon: <Map className="w-5 h-5" /> },
  { to: '/demo/questions', label: 'Questions', icon: <BookOpen className="w-5 h-5" /> },
  { to: '/demo/analytics', label: 'Analytics', icon: <BarChart3 className="w-5 h-5" /> },
  { to: '/demo/reviews', label: 'Review Queue', icon: <RotateCcw className="w-5 h-5" /> },
  { to: '/demo/trends', label: 'Trends', icon: <TrendingUp className="w-5 h-5" /> },
  { to: '/demo/misconceptions', label: 'Misconceptions', icon: <AlertCircle className="w-5 h-5" /> },
];

import { BarChart3 } from 'lucide-react'; // Fix missing import

const demoBottomLinks: SidebarLink[] = [
  { to: '/demo/classes', label: 'Classes', icon: <Users className="w-5 h-5" /> },
  { to: '/demo/settings', label: 'Settings', icon: <Settings className="w-5 h-5" /> },
];

function SidebarLinks({ links, onClick, label }: { links: SidebarLink[], onClick?: () => void, label?: string }) {
  return (
    <div className="mb-2">
      {label && (
        <div className="px-5 text-xs font-bold text-zinc-400 mb-3 uppercase tracking-wider">
          {label}
        </div>
      )}
      <div className="space-y-1.5">
        {links.map(link => (
          <NavLink
            key={link.to}
            to={link.to}
            onClick={onClick}
            className={({ isActive }) =>
              cn(
                'group relative flex items-center gap-3 px-4 py-3 mx-3 rounded-xl text-sm font-medium transition-all duration-300 overflow-hidden',
                isActive
                  ? 'bg-zinc-100 text-zinc-900 shadow-sm before:absolute before:left-0 before:top-1/2 before:-translate-y-1/2 before:w-1 before:h-8 before:bg-zinc-900 before:rounded-r-full'
                  : 'text-zinc-500 hover:bg-zinc-50 hover:text-zinc-900'
              )
            }
          >
            {({ isActive }) => (
              <>
                <div className={cn("transition-transform duration-300", isActive ? "scale-110" : "group-hover:scale-110")}>
                  {link.icon}
                </div>
                <span>{link.label}</span>
              </>
            )}
          </NavLink>
        ))}
      </div>
    </div>
  );
}

export default function DemoSidebar() {
  const sidebarOpen = useUIStore(s => s.sidebarOpen);
  const setSidebarOpen = useUIStore(s => s.setSidebarOpen);

  return (
    <aside
      className={cn(
        'fixed lg:static inset-y-0 left-0 z-40 w-64 bg-white text-zinc-900 transition-transform duration-300 ease-in-out lg:transition-none border-r border-zinc-200 shadow-2xl lg:shadow-none',
        sidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'
      )}
    >
      <div className="h-16 flex items-center px-6 border-b border-zinc-200 bg-white">
        <img src="/logo.png" alt="Madifor Mastery Logo" className="w-8 h-8 object-contain mr-2" />
        <span className="text-xl font-bold text-zinc-900 tracking-tight">Madifor Mastery</span>
      </div>
      <nav className="py-6 flex flex-col h-[calc(100%-4rem)] overflow-y-auto custom-scrollbar">
        <SidebarLinks links={demoLinks} onClick={() => setSidebarOpen(false)} label="Main" />
        <div className="flex-1" />
        <div className="border-t border-zinc-200 pt-6 mt-4">
          <SidebarLinks links={demoBottomLinks} onClick={() => setSidebarOpen(false)} label="Management" />
        </div>
      </nav>
    </aside>
  );
}
