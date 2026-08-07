import { cn } from '@/lib/utils';
import { ButtonHTMLAttributes, forwardRef } from 'react';

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'outline' | 'ghost' | 'destructive';
  size?: 'sm' | 'md' | 'lg';
}

const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant = 'primary', size = 'md', ...props }, ref) => {
    return (
      <button
        ref={ref}
        className={cn(
          'inline-flex items-center justify-center rounded-xl font-semibold transition-all duration-200 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-zinc-900 focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 active:scale-[0.97]',
          {
            'bg-zinc-900 text-white hover:bg-zinc-800 shadow-sm shadow-zinc-900/10': variant === 'primary',
            'bg-zinc-100 text-zinc-900 hover:bg-zinc-200 shadow-sm': variant === 'secondary',
            'border border-zinc-200 text-zinc-900 hover:bg-zinc-50': variant === 'outline',
            'text-zinc-600 hover:text-zinc-900 hover:bg-zinc-100': variant === 'ghost',
            'bg-red-500 text-white hover:bg-red-600 shadow-sm shadow-red-500/20': variant === 'destructive',
          },
          {
            'px-3 py-1.5 text-xs gap-1.5': size === 'sm',
            'px-5 py-2.5 text-sm gap-2': size === 'md',
            'px-7 py-3.5 text-base gap-2': size === 'lg',
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
