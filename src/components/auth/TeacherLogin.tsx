import { useState, useEffect } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { Loader2, AlertCircle, CheckCircle2 } from 'lucide-react';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/Dialog';
import { sendTeacherPasswordReset } from '@/api/auth';

interface TeacherLoginProps {
  onSignIn: (email: string, password: string) => Promise<unknown>;
  onSignUp: (
    email: string,
    password: string,
    fullName: string,
    schoolName?: string
  ) => Promise<{ teacher: unknown; pendingConfirmation: boolean }>;
}

export default function TeacherLogin({ onSignIn, onSignUp }: TeacherLoginProps) {
  const [searchParams] = useSearchParams();
  const initialMode = searchParams.get('mode') === 'signup' ? 'signup' : 'login';

  const [mode, setMode] = useState<'login' | 'signup' | 'reset'>(initialMode);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [fullName, setFullName] = useState('');
  const [schoolName, setSchoolName] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [agreedToTerms, setAgreedToTerms] = useState(false);
  const [showTerms, setShowTerms] = useState(false);
  const [error, setError] = useState('');
  const [successMessage, setSuccessMessage] = useState('');
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    const m = searchParams.get('mode');
    if (m === 'signup') setMode('signup');
  }, [searchParams]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setSuccessMessage('');

    const cleanEmail = email.trim();
    if (!cleanEmail) {
      setError('Please enter your email address.');
      return;
    }

    setLoading(true);
    try {
      if (mode === 'reset') {
        await sendTeacherPasswordReset(cleanEmail);
        setSuccessMessage('Password reset instructions have been sent to your email address.');
        setMode('login');
        return;
      }

      if (mode === 'login') {
        await onSignIn(cleanEmail, password);
        navigate('/teacher/dashboard');
      } else {
        if (!fullName.trim()) {
          setError('Please enter your full name.');
          return;
        }
        if (!schoolName.trim()) {
          setError('Please enter your JHS / school name.');
          return;
        }
        if (password !== confirmPassword) {
          setError('Passwords do not match.');
          return;
        }
        if (!agreedToTerms) {
          setError('You must agree to the Terms and Conditions.');
          return;
        }
        const res = await onSignUp(cleanEmail, password, fullName.trim(), schoolName.trim());
        if (res.pendingConfirmation) {
          setSuccessMessage(
            'Account created! Please check your email inbox to verify your address before signing in.'
          );
        } else {
          setSuccessMessage('Registration successful! Taking you to your dashboard...');
        }
        setMode('login');
        setPassword('');
        setConfirmPassword('');
        setAgreedToTerms(false);
      }
    } catch (err) {
      const raw = err instanceof Error ? err.message : '';
      setError(raw || 'Invalid login credentials or email already exists.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex flex-col md:flex-row bg-slate-50 relative font-sans text-navy-900">
      {/* Left Branding Panel */}
      <div className="hidden md:flex md:w-1/2 p-12 lg:p-16 flex-col justify-between bg-navy-900 text-white relative overflow-hidden">
        <div className="absolute -top-24 -right-24 w-96 h-96 rounded-full bg-indigo-500/20 blur-3xl pointer-events-none" />
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
            Educator Portal &middot; NaCCA B7–B9 Science
          </span>
          <h1 className="text-4xl lg:text-5xl font-extrabold leading-tight mb-5">
            Empower every learner to achieve true mastery
          </h1>
          <p className="text-slate-300 text-base lg:text-lg leading-relaxed">
            Manage your JHS classes, pinpoint class-wide misconceptions early, and track BECE readiness with real-time diagnostic insights.
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

      {/* Form Panel */}
      <div className="flex-1 flex items-center justify-center p-6 sm:p-10">
        <div className="w-full max-w-md bg-white border border-slate-200/90 rounded-3xl shadow-sm p-7 sm:p-9">
          <div className="text-center mb-7">
            <h2 className="text-2xl sm:text-3xl font-bold text-navy-900 mb-1.5 tracking-tight">
              {mode === 'login'
                ? 'Welcome back'
                : mode === 'signup'
                  ? 'Create teacher account'
                  : 'Reset password'}
            </h2>
            <p className="text-sm text-slate-500">
              {mode === 'login'
                ? 'Sign in to access your teacher dashboard'
                : mode === 'signup'
                  ? 'Get started with Madifor Mastery in seconds'
                  : 'Enter your email to receive a password reset link'}
            </p>
          </div>

          <form onSubmit={handleSubmit} className="space-y-4">
            {mode === 'signup' && (
              <>
                <Input
                  label="Full Name"
                  value={fullName}
                  onChange={(e) => setFullName(e.target.value)}
                  placeholder="e.g. Kwame Asante"
                  required
                />
                <Input
                  label="School Name"
                  value={schoolName}
                  onChange={(e) => setSchoolName(e.target.value)}
                  placeholder="e.g. Kpando Presby JHS"
                  required
                />
              </>
            )}

            <Input
              label="Email"
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="teacher@school.edu.gh"
              required
            />

            {mode !== 'reset' && (
              <div>
                <Input
                  label="Password"
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="••••••••"
                  required
                  minLength={6}
                />
                {mode === 'login' && (
                  <div className="flex justify-end mt-1.5">
                    <button
                      type="button"
                      onClick={() => {
                        setMode('reset');
                        setError('');
                        setSuccessMessage('');
                      }}
                      className="text-xs font-semibold text-indigo-600 hover:text-indigo-800 hover:underline"
                    >
                      Forgot password?
                    </button>
                  </div>
                )}
              </div>
            )}

            {mode === 'signup' && (
              <>
                <Input
                  label="Confirm Password"
                  type="password"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  placeholder="••••••••"
                  required
                  minLength={6}
                />

                <div className="pt-1 flex items-start gap-3">
                  <input
                    type="checkbox"
                    id="terms"
                    checked={agreedToTerms}
                    onChange={(e) => setAgreedToTerms(e.target.checked)}
                    className="mt-1 w-4 h-4 text-indigo-600 bg-slate-100 border-slate-300 rounded focus:ring-indigo-600"
                  />
                  <label htmlFor="terms" className="text-sm text-slate-600 leading-snug">
                    I agree to the{' '}
                    <button
                      type="button"
                      onClick={() => setShowTerms(true)}
                      className="text-navy-900 font-semibold hover:underline"
                    >
                      Terms and Conditions
                    </button>
                  </label>
                </div>
              </>
            )}

            {error && (
              <div className="flex items-start gap-2.5 text-sm text-red-700 bg-red-50 border border-red-200 p-3.5 rounded-xl">
                <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                <p>{error}</p>
              </div>
            )}

            {successMessage && (
              <div className="flex items-start gap-2.5 text-sm text-green-800 bg-green-50 border border-green-200 p-3.5 rounded-xl">
                <CheckCircle2 className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
                <p>{successMessage}</p>
              </div>
            )}

            <Button type="submit" className="w-full h-12 text-base" size="lg" disabled={loading}>
              {loading ? (
                <span className="flex items-center justify-center gap-2">
                  <Loader2 className="w-5 h-5 animate-spin" />
                  Please wait...
                </span>
              ) : mode === 'login' ? (
                'Sign In'
              ) : mode === 'signup' ? (
                'Create Account'
              ) : (
                'Send Reset Link'
              )}
            </Button>
          </form>

          <div className="mt-7 pt-6 border-t border-slate-100 space-y-3 text-center">
            {mode === 'reset' ? (
              <button
                type="button"
                onClick={() => {
                  setMode('login');
                  setError('');
                }}
                className="text-sm font-semibold text-navy-900 hover:underline"
              >
                Back to Sign In
              </button>
            ) : (
              <p className="text-sm text-slate-500">
                {mode === 'login' ? "Don't have an account? " : 'Already have an account? '}
                <button
                  type="button"
                  onClick={() => {
                    setMode(mode === 'login' ? 'signup' : 'login');
                    setError('');
                    setSuccessMessage('');
                  }}
                  className="text-indigo-700 font-semibold hover:underline"
                >
                  {mode === 'login' ? 'Sign up' : 'Sign in'}
                </button>
              </p>
            )}

            <p className="text-sm text-slate-500">
              Not a teacher?{' '}
              <button
                type="button"
                onClick={() => navigate('/learner/login')}
                className="text-navy-900 font-semibold hover:underline"
              >
                Login as Learner
              </button>
            </p>

            <p className="text-xs text-slate-400 pt-1">
              Need help? Call Madifor on{' '}
              <a href="tel:+233592664865" className="text-slate-600 font-medium hover:underline">
                059-266-4865
              </a>
            </p>
          </div>
        </div>
      </div>

      <Dialog open={showTerms} onOpenChange={setShowTerms}>
        <DialogContent className="max-w-lg">
          <DialogHeader>
            <DialogTitle>Terms and Conditions</DialogTitle>
          </DialogHeader>
          <div className="text-sm text-slate-600 space-y-3 leading-relaxed">
            <p className="font-semibold text-navy-900">Welcome to Madifor Mastery!</p>
            <p>
              By creating a teacher account on Madifor Mastery, you agree to these terms regarding trial access, classroom data privacy, and acceptable platform use.
            </p>
            <h4 className="font-semibold text-navy-900 pt-1">1. Trial Access</h4>
            <p>
              Access is currently provided free for participating schools while features evolve. Active educators will receive at least 30 days advance notice before any future subscription plans take effect.
            </p>
            <h4 className="font-semibold text-navy-900 pt-1">2. Student Data Privacy</h4>
            <p>
              You agree to use learner mastery records strictly for educational support and instruction within your classes and protect student credentials appropriately.
            </p>
            <h4 className="font-semibold text-navy-900 pt-1">3. Acceptable Use</h4>
            <p>
              Unauthorized access attempts, tampering with assessments, or uploading abusive content will result in account suspension.
            </p>
          </div>
          <div className="mt-5 pt-4 border-t border-slate-100">
            <Button onClick={() => setShowTerms(false)} className="w-full">
              Close
            </Button>
          </div>
        </DialogContent>
      </Dialog>
    </div>
  );
}
