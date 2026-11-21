import { NavLink } from 'react-router-dom';
import { Home, LineChart } from 'lucide-react';
import { cn } from '@/lib/utils';
import { useUIStore } from '@/stores/uiStore';

export default function DemoLearnerSidebar() {
  const sidebarOpen = useUIStore((s) => s.sidebarOpen);
  const setSidebarOpen = useUIStore((s) => s.setSidebarOpen);

  const links = [
    { to: '/demo-learner/home', label: 'Home', icon: <Home className="w-5 h-5" /> },
    { to: '/demo-learner/progress', label: 'My Progress', icon: <LineChart className="w-5 h-5" /> },
  ];

  return (
    <aside
      className={cn(
        'fixed lg:static inset-y-0 left-0 z-40 w-64 bg-navy-900 text-white border-r border-navy-800 flex flex-col transition-transform duration-300 ease-in-out lg:transition-none shrink-0',
        sidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'
      )}
    >
      <div className="h-16 flex items-center px-5 border-b border-navy-800 shrink-0">
        <img src="/logo.png" alt="Madifor Mastery Logo" className="w-8 h-8 object-contain mr-2.5" />
        <div>
          <span className="text-base font-bold tracking-tight block leading-tight">
            Madifor Mastery
          </span>
          <span className="text-[11px] text-indigo-300 font-medium">Learner Demo</span>
        </div>
      </div>

      <nav className="flex-1 py-5 overflow-y-auto custom-scrollbar px-3 space-y-1">
        {links.map((link) => (
          <NavLink
            key={link.to}
            to={link.to}
            onClick={() => setSidebarOpen(false)}
            className={({ isActive }) =>
              cn(
                'flex items-center gap-3 px-4 py-2.5 rounded-xl text-sm font-medium transition-colors',
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
      </nav>
    </aside>
  );
}
