import { ReactNode } from 'react';
import { useLocation } from 'react-router-dom';

interface PageTransitionProps {
  children: ReactNode;
}

/**
 * Single-mount transition wrapper (never double-mounts React Router <Routes> or breaks position: fixed modals).
 */
export default function PageTransition({ children }: PageTransitionProps) {
  const location = useLocation();
  return (
    <div key={location.pathname} className="min-h-full flex flex-col animate-in fade-in duration-150">
      {children}
    </div>
  );
}
