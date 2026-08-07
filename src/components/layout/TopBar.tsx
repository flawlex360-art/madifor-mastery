import { Menu, LogOut, ChevronRight, LayoutDashboard } from 'lucide-react';
import { useLocation } from 'react-router-dom';
import Button from '@/components/ui/Button';
import { useUIStore } from '@/stores/uiStore';

interface TopBarProps {
  userName: string;
  userRole: 'teacher' | 'learner';
  onLogout: () => void;
}

export default function TopBar({ userName, userRole, onLogout }: TopBarProps) {
  const toggleSidebar = useUIStore(s => s.toggleSidebar);
  const location = useLocation();
  
  // Basic breadcrumb generation based on route
  const pathSegments = location.pathname.split('/').filter(Boolean);
  const currentPage = pathSegments[pathSegments.length - 1] || 'Home';
  const pageTitle = currentPage.charAt(0).toUpperCase() + currentPage.slice(1).replace(/-/g, ' ');

  const getInitials = (name: string) => {
    if (!name) return 'U';
    return name.split(' ').map(n => n[0]).join('').toUpperCase().slice(0, 2);
  };

  return (
    <header className="h-16 bg-white/80 backdrop-blur-md border-b border-gray-100 shadow-[0_4px_20px_-10px_rgba(0,0,0,0.05)] flex items-center justify-between px-4 lg:px-6 sticky top-0 z-30 transition-all">
      <div className="flex items-center gap-4">
        <button onClick={toggleSidebar} className="lg:hidden p-2 text-gray-500 hover:bg-gray-100 rounded-lg transition-colors">
          <Menu className="w-5 h-5" />
        </button>
        
        {/* Breadcrumb Area */}
        <div className="hidden sm:flex items-center gap-2 text-sm">
          <div className="w-8 h-8 rounded-lg bg-zinc-100 flex items-center justify-center text-zinc-900">
            <LayoutDashboard className="w-4 h-4" />
          </div>
          <span className="font-semibold text-zinc-800 capitalize">{userRole}</span>
          <ChevronRight className="w-4 h-4 text-zinc-400" />
          <span className="font-medium text-zinc-600 capitalize">{pageTitle}</span>
        </div>
        
        {/* Mobile Brand */}
        <span className="sm:hidden text-lg font-bold text-zinc-900">Madifor Mastery</span>
      </div>

      <div className="flex items-center gap-4 lg:gap-6">
        {/* User Profile Area */}
        <div className="flex items-center gap-3 bg-zinc-50/50 p-1.5 pr-4 rounded-full border border-zinc-100 hover:bg-zinc-50 transition-colors cursor-pointer">
          <div className="w-8 h-8 rounded-full bg-zinc-900 text-white flex items-center justify-center text-xs font-bold shadow-sm">
            {getInitials(userName)}
          </div>
          <div className="text-right hidden sm:block">
            <p className="text-sm font-semibold text-zinc-900 leading-tight">{userName}</p>
            <p className="text-xs text-gray-500 capitalize leading-tight">{userRole}</p>
          </div>
        </div>

        <div className="w-px h-8 bg-gray-200 hidden sm:block" />

        <Button 
          variant="ghost" 
          size="sm" 
          onClick={onLogout}
          className="text-gray-500 hover:text-red-600 hover:bg-red-50 rounded-full sm:rounded-lg transition-colors px-2 sm:px-3"
        >
          <span className="hidden sm:inline-block font-medium mr-2">Logout</span>
          <LogOut className="w-4 h-4" />
        </Button>
      </div>
    </header>
  );
}
