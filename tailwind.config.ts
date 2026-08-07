import type { Config } from 'tailwindcss';
import tailwindAnimate from 'tailwindcss-animate';

export default {
  darkMode: ['class'],
  content: ['./index.html', './src/**/*.{ts,tsx}'],
  theme: {
    extend: {
      colors: {
        mastery: {
          red: '#ef4444',
          amber: '#f59e0b',
          green: '#22c55e',
        },
      },
      fontFamily: {
        sans: ['Outfit', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [tailwindAnimate],
} satisfies Config;
