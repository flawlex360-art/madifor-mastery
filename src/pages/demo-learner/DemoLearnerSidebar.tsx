import { NavLink } from 'react-router-dom';
import { Home, LineChart } from 'lucide-react';
import { cn } from '@/lib/utils';

export default function DemoLearnerSidebar() {
  const links = [
    { to: '/demo-learner/home', label: 'Home', icon: <Home className="w-5 h-5" /> },
    { to: '/demo-learner/progress', label: 'My Progress', icon: <LineChart className="w-5 h-5" /> },
  ];

  return (
    <aside className="hidden lg:flex fixed inset-y-0 left-0 z-40 w-64 bg-white text-zinc-900 border-r border-zinc-200 flex-col">
      <div className="h-16 flex items-center px-6 border-b border-zinc-200 shrink-0">
        <div className="flex items-center gap-2.5">
          <img src="/logo.png" alt="Madifor Mastery Logo" className="w-8 h-8 object-contain" />
          <span className="text-lg font-bold tracking-tight">Madifor Mastery</span>
        </div>
      </div>

      <nav className="flex-1 py-6 overflow-y-auto custom-scrollbar px-3 space-y-1">
        {links.map((link) => (
          <NavLink
            key={link.to}
            to={link.to}
            className={({ isActive }) =>
              cn(
                'flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-all duration-200',
                isActive
                  ? 'bg-purple-50 text-purple-700'
                  : 'text-zinc-600 hover:bg-zinc-50 hover:text-zinc-900'
              )
            }
          >
            {({ isActive }) => (
              <>
                <div className={cn('transition-colors', isActive ? 'text-purple-700' : 'text-zinc-400')}>
                  {link.icon}
                </div>
                {link.label}
              </>
            )}
          </NavLink>
        ))}
      </nav>
    </aside>
  );
}
