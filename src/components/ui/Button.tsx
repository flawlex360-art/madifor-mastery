import { cn } from '@/lib/utils';
import { ButtonHTMLAttributes, forwardRef } from 'react';

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'outline' | 'ghost' | 'destructive';
  size?: 'sm' | 'md' | 'lg';
}

const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant = 'primary', size = 'md', type = 'button', ...props }, ref) => {
    return (
      <button
        ref={ref}
        type={type}
        className={cn(
          'inline-flex items-center justify-center rounded-xl font-semibold transition-all duration-200 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-600 focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 active:scale-[0.98]',
          {
            'bg-navy-900 text-white hover:bg-navy-800 shadow-sm shadow-navy-900/15': variant === 'primary',
            'bg-slate-100 text-navy-900 hover:bg-slate-200 shadow-sm': variant === 'secondary',
            'border border-slate-200 bg-white text-navy-900 hover:bg-slate-50 hover:border-slate-300': variant === 'outline',
            'text-slate-600 hover:text-navy-900 hover:bg-slate-100': variant === 'ghost',
            'bg-red-600 text-white hover:bg-red-700 shadow-sm shadow-red-600/20': variant === 'destructive',
          },
          {
            'px-3 py-1.5 text-xs gap-1.5': size === 'sm',
            'px-4 py-2.5 text-sm gap-2': size === 'md',
            'px-6 py-3.5 text-base gap-2': size === 'lg',
          },
          className
        )}
        {...props}
      />
    );
  }
);

Button.displayName = 'Button';
export default Button;
