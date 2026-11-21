import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Loader2, AlertCircle } from 'lucide-react';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import { learnerSignIn } from '@/api/auth';

export default function LearnerLogin({ onSignIn }: { onSignIn?: () => void }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      await learnerSignIn(email.trim(), password);
      if (onSignIn) onSignIn();
      navigate('/learner/home');
    } catch (err) {
      const raw = err instanceof Error ? err.message : '';
      setError(raw || 'Invalid login credentials. Please check your email and password.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex flex-col md:flex-row bg-slate-50 relative font-sans text-navy-900">
      {/* Left Branding Panel */}
      <div className="hidden md:flex md:w-1/2 p-12 lg:p-16 flex-col justify-between bg-navy-900 text-white relative overflow-hidden">
        <div className="absolute -bottom-24 -left-24 w-96 h-96 rounded-full bg-indigo-500/20 blur-3xl pointer-events-none" />
        <div className="relative z-10">
          <button
            type="button"
            onClick={() => navigate('/')}
            className="flex items-center gap-3 hover:opacity-90 transition-opacity"
          >
            <img src="/logo.png" alt="Madifor Mastery Logo" className="w-12 h-12 object-contain bg-white rounded-xl p-1" />
            <span className="text-xl font-bold tracking-tight">Madifor Mastery</span>
          </button>
        </div>

        <div className="relative z-10 max-w-md">
          <span className="inline-block px-3 py-1 rounded-full bg-indigo-500/20 border border-indigo-400/30 text-indigo-200 text-xs font-semibold mb-4">
            Learner Portal &middot; JHS Science
          </span>
          <h1 className="text-4xl lg:text-5xl font-extrabold leading-tight mb-5">
            Master every science topic at your own pace
          </h1>
          <p className="text-slate-300 text-base lg:text-lg leading-relaxed">
            Build lasting knowledge with instant explanations, spaced memory reviews, and adaptive practice even offline.
          </p>
        </div>

        <div className="relative z-10 text-xs text-slate-400">
          © {new Date().getFullYear()} Madifor Mastery. All rights reserved.
        </div>
      </div>

      {/* Mobile Header */}
      <div className="md:hidden flex flex-col items-center justify-center pt-10 pb-4 px-6">
        <button
          type="button"
          onClick={() => navigate('/')}
          className="flex items-center gap-2.5 hover:opacity-80 transition-opacity"
        >
          <img src="/logo.png" alt="Madifor Mastery Logo" className="w-12 h-12 object-contain" />
          <span className="text-2xl font-bold text-navy-900 tracking-tight">Madifor Mastery</span>
        </button>
      </div>

      {/* Login Card */}
      <div className="flex-1 flex items-center justify-center p-6 sm:p-10">
        <div className="w-full max-w-md bg-white border border-slate-200/90 rounded-3xl shadow-sm p-7 sm:p-9">
          <div className="text-center mb-7">
            <h2 className="text-2xl sm:text-3xl font-bold text-navy-900 mb-1.5 tracking-tight">Ready to learn?</h2>
            <p className="text-sm text-slate-500">Sign in to your student account</p>
          </div>

          <form onSubmit={handleSubmit} className="space-y-4">
            <Input
              label="Email"
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="student@school.edu.gh"
              required
            />
            <Input
              label="Password"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Enter your password"
              required
            />

            {error && (
              <div className="flex items-start gap-2.5 text-sm text-red-700 bg-red-50 border border-red-200 p-3.5 rounded-xl">
                <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                <p>{error}</p>
              </div>
            )}

            <Button type="submit" className="w-full h-12 text-base" size="lg" disabled={loading}>
              {loading ? (
                <span className="flex items-center justify-center gap-2">
                  <Loader2 className="w-5 h-5 animate-spin" />
                  Signing in...
                </span>
              ) : (
                'Sign In'
              )}
            </Button>
          </form>

          <div className="mt-7 pt-6 border-t border-slate-100 space-y-3 text-center">
            <p className="text-xs text-slate-500 font-medium bg-slate-50 py-2 px-3 rounded-lg">
              Need an account? Ask your teacher for your student email and password.
            </p>
            <p className="text-sm text-slate-500">
              Not a learner?{' '}
              <button
                type="button"
                onClick={() => navigate('/teacher/login')}
                className="text-indigo-700 font-semibold hover:underline"
              >
                Login as Teacher
              </button>
            </p>
            <p className="text-xs text-slate-400 pt-1">
              Need assistance? Call Madifor on{' '}
              <a href="tel:+233592664865" className="text-slate-600 font-medium hover:underline">
                059-266-4865
              </a>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
