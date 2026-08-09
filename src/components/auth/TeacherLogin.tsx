import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { motion } from 'framer-motion';
import { Loader2, AlertCircle } from 'lucide-react';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';

interface TeacherLoginProps {
  onSignIn: (email: string, password: string) => Promise<unknown>;
  onSignUp: (email: string, password: string, fullName: string, schoolName?: string) => Promise<unknown>;
}

export default function TeacherLogin({ onSignIn, onSignUp }: TeacherLoginProps) {
  const [mode, setMode] = useState<'login' | 'signup'>('login');
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

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setSuccessMessage('');
    setLoading(true);
    try {
      if (mode === 'login') {
        await onSignIn(email, password);
        navigate('/teacher/dashboard');
      } else {
        if (password !== confirmPassword) {
          setError('Passwords do not match');
          setLoading(false);
          return;
        }
        if (!agreedToTerms) {
          setError('You must agree to the Terms and Conditions');
          setLoading(false);
          return;
        }
        await onSignUp(email, password, fullName, schoolName);
        setSuccessMessage('Registration successful! Please sign in with your new credentials.');
        setMode('login');
        setPassword('');
        setConfirmPassword('');
        setAgreedToTerms(false);
      }
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : 'Something went wrong');
    } finally {
      setLoading(false);
    }
  };

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: { staggerChildren: 0.1, delayChildren: 0.2 }
    }
  };

  const itemVariants = {
    hidden: { y: 20, opacity: 0 },
    visible: { y: 0, opacity: 1, transition: { type: 'spring' as const, stiffness: 300, damping: 24 } }
  };

  return (
    <div className="min-h-screen flex flex-col md:flex-row bg-zinc-50 overflow-hidden relative font-sans text-zinc-900">
      {/* Animated Background Orbs */}
      <div className="absolute top-[-10%] left-[-10%] w-[50vw] h-[50vw] rounded-full bg-zinc-900/20 blur-[120px] animate-pulse pointer-events-none" />
      <div className="absolute bottom-[-10%] right-[-10%] w-[50vw] h-[50vw] rounded-full bg-blue-600/20 blur-[120px] animate-pulse pointer-events-none" style={{ animationDelay: '2s' }} />

      {/* Left side: Branding (Desktop) */}
      <div className="hidden md:flex md:w-1/2 p-12 lg:p-20 flex-col justify-between relative z-10 bg-white border-r border-zinc-200">
        <div>
          <motion.div 
            initial={{ scale: 0.8, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ duration: 0.5 }}
            className="flex items-center gap-3 mb-12"
          >
            <button onClick={() => navigate('/')} className="flex items-center gap-3 hover:opacity-80 transition-opacity">
                <img src="/logo.png" alt="Madifor Mastery Logo" className="w-20 h-20 object-contain" />
              <span className="text-2xl font-bold tracking-tight text-zinc-900">Madifor Mastery</span>
            </button>
          </motion.div>
        </div>
        
        <motion.div 
          initial={{ y: 30, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.7, delay: 0.2 }}
        >
          <h1 className="text-5xl lg:text-6xl font-extrabold text-zinc-900 leading-[1.1] mb-6">
            Empower your <br/>
            <span className="text-zinc-400">
              teaching journey
            </span>
          </h1>
          <p className="text-zinc-500 text-lg lg:text-xl max-w-md font-light leading-relaxed">
            Manage your classes, track learner progress, and deliver exceptional educational experiences with our intelligent platform.
          </p>
        </motion.div>

        <div className="text-sm text-zinc-400 font-medium">
          © {new Date().getFullYear()} Madifor Mastery. All rights reserved.
        </div>
      </div>

      {/* Mobile Branding Header */}
      <div className="md:hidden flex flex-col items-center justify-center p-8 relative z-10 pt-16">
        <button onClick={() => navigate('/')} className="flex flex-col items-center hover:opacity-80 transition-opacity">
            <img src="/logo.png" alt="Madifor Mastery Logo" className="w-24 h-24 object-contain" />
          <h1 className="text-3xl font-bold text-zinc-900 text-center tracking-tight">Madifor Mastery</h1>
        </button>
      </div>

      {/* Right side: Form */}
      <div className="flex-1 flex items-center justify-center p-6 sm:p-12 relative z-10">
        <motion.div 
          className="w-full max-w-md bg-white border border-zinc-200 rounded-[2rem] shadow-sm p-8 sm:p-10 my-8 max-h-[90vh] overflow-y-auto custom-scrollbar"
          variants={containerVariants}
          initial="hidden"
          animate="visible"
        >
          <motion.div variants={itemVariants} className="text-center mb-10">
            <h2 className="text-3xl font-bold text-zinc-900 mb-2 tracking-tight">
              {mode === 'login' ? 'Welcome back' : 'Create account'}
            </h2>
            <p className="text-zinc-500">
              {mode === 'login' ? 'Sign in to access your teacher dashboard' : 'Join Madifor Mastery today'}
            </p>
          </motion.div>

          {/* Form wrapper text-gray-900 to ensure Input text is visible if it inherits, but wrapping inputs in divs */}
          <form onSubmit={handleSubmit} className="space-y-5 text-left">
            {mode === 'signup' && (
              <>
                <motion.div variants={itemVariants} className="text-zinc-950">
                  <Input
                    label="Full Name"
                    value={fullName}
                    onChange={e => setFullName(e.target.value)}
                    placeholder="e.g. Kwame Asante"
                    required
                  />
                </motion.div>
                <motion.div variants={itemVariants} className="text-zinc-950">
                  <Input
                    label="School Name"
                    value={schoolName}
                    onChange={e => setSchoolName(e.target.value)}
                    placeholder="e.g. Presby Senior High"
                    required
                  />
                </motion.div>
              </>
            )}
            <motion.div variants={itemVariants} className="text-zinc-950">
              <Input
                label="Email"
                type="email"
                value={email}
                onChange={e => setEmail(e.target.value)}
                placeholder="teacher@school.com"
                required
              />
            </motion.div>
            <motion.div variants={itemVariants} className="text-zinc-950">
              <Input
                label="Password"
                type="password"
                value={password}
                onChange={e => setPassword(e.target.value)}
                placeholder="••••••••"
                required
                minLength={6}
              />
            </motion.div>
            
            {mode === 'signup' && (
              <>
                <motion.div variants={itemVariants} className="text-zinc-950">
                  <Input
                    label="Confirm Password"
                    type="password"
                    value={confirmPassword}
                    onChange={e => setConfirmPassword(e.target.value)}
                    placeholder="••••••••"
                    required
                    minLength={6}
                  />
                </motion.div>

                <motion.div variants={itemVariants} className="pt-2 flex items-start gap-3 text-zinc-950">
                  <input
                    type="checkbox"
                    id="terms"
                    checked={agreedToTerms}
                    onChange={(e) => setAgreedToTerms(e.target.checked)}
                    className="mt-1 w-4 h-4 text-blue-600 bg-zinc-100 border-zinc-300 rounded focus:ring-blue-500"
                  />
                  <label htmlFor="terms" className="text-sm text-zinc-600 leading-snug">
                    I agree to the{' '}
                    <button type="button" onClick={() => setShowTerms(true)} className="text-zinc-900 font-semibold hover:underline">
                      Terms and Conditions
                    </button>
                  </label>
                </motion.div>
              </>
            )}

            {error && (
              <motion.div 
                initial={{ opacity: 0, height: 0 }}
                animate={{ opacity: 1, height: 'auto' }}
                className="flex items-center gap-3 text-sm text-red-600 bg-red-50 border border-red-200 p-4 rounded-xl mt-4"
              >
                <AlertCircle className="w-5 h-5 text-red-500 flex-shrink-0" />
                <p>{error}</p>
              </motion.div>
            )}

            {successMessage && (
              <motion.div 
                initial={{ opacity: 0, height: 0 }}
                animate={{ opacity: 1, height: 'auto' }}
                className="flex items-center gap-3 text-sm text-emerald-700 bg-emerald-50 border border-emerald-200 p-4 rounded-xl mt-4"
              >
                <div className="w-5 h-5 flex items-center justify-center rounded-full bg-emerald-100 text-emerald-600 flex-shrink-0 font-bold">
                  ✓
                </div>
                <p>{successMessage}</p>
              </motion.div>
            )}

            <motion.div variants={itemVariants} className="pt-4">
              <Button type="submit" className="w-full h-12 text-base" size="lg" disabled={loading}>
                {loading ? (
                  <span className="flex items-center justify-center gap-2">
                    <Loader2 className="w-5 h-5 animate-spin" />
                    Please wait...
                  </span>
                ) : (
                  mode === 'login' ? 'Sign In' : 'Create Account'
                )}
              </Button>
            </motion.div>
          </form>

          <motion.div variants={itemVariants} className="mt-8 pt-8 border-t border-zinc-100 space-y-4">
            <p className="text-center text-sm text-zinc-500">
              {mode === 'login' ? "Don't have an account? " : 'Already have an account? '}
              <button
                type="button"
                onClick={() => { setMode(mode === 'login' ? 'signup' : 'login'); setError(''); setSuccessMessage(''); }}
                className="text-zinc-900 font-semibold hover:text-zinc-600 transition-colors hover:underline"
              >
                {mode === 'login' ? 'Sign up' : 'Sign in'}
              </button>
            </p>
            <p className="text-center text-sm text-zinc-500">
              Not a teacher?{' '}
              <button
                type="button"
                onClick={() => navigate('/learner/login')}
                className="text-zinc-900 font-semibold hover:text-zinc-600 transition-colors hover:underline"
              >
                Login as Learner
              </button>
            </p>
            <p className="text-center text-xs text-zinc-400 pt-2">
              Need assistance? Contact Madifor on <a href="tel:0592664865" className="text-zinc-600 hover:underline">059-266-4865</a>
            </p>
          </motion.div>
        </motion.div>
      </div>

      {/* Terms and Conditions Modal */}
      {showTerms && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-zinc-900/40 backdrop-blur-sm animate-in fade-in">
          <div className="bg-white rounded-2xl shadow-xl w-full max-w-lg overflow-hidden flex flex-col max-h-[80vh]">
            <div className="p-6 border-b border-zinc-100 flex justify-between items-center bg-zinc-50">
              <h3 className="text-xl font-bold text-zinc-900">Terms and Conditions</h3>
              <button onClick={() => setShowTerms(false)} className="text-zinc-400 hover:text-zinc-900">
                ✕
              </button>
            </div>
            <div className="p-6 overflow-y-auto flex-1 text-sm text-zinc-600 space-y-4">
              <p><strong>Welcome to Madifor Mastery!</strong></p>
              <p>
                By registering as a teacher on our platform, you agree to be bound by these terms. 
                Please read them carefully before creating your account.
              </p>
              <h4 className="font-semibold text-zinc-900 mt-4">1. Trial Access and Future Pricing</h4>
              <p>
                Your current access to Madifor Mastery is provided as a <strong>free trial</strong>. 
                We are currently offering the platform at no cost while we continue to develop and refine our features. 
                However, please be advised that <strong>you may be asked to pay for access in the future</strong>. 
                We will notify all active teachers at least 30 days in advance before any subscription fees or payment plans are implemented.
              </p>
              <h4 className="font-semibold text-zinc-900 mt-4">2. Account Responsibilities</h4>
              <p>
                You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. 
                You agree to provide accurate, current, and complete information during the registration process, including your correct school affiliation.
              </p>
              <h4 className="font-semibold text-zinc-900 mt-4">3. Data Privacy and Student Information</h4>
              <p>
                As a teacher, you may have access to student performance data. You agree to use this information solely for educational purposes 
                and to protect student privacy in accordance with applicable educational laws and regulations in your jurisdiction.
              </p>
              <h4 className="font-semibold text-zinc-900 mt-4">4. Platform Abuse</h4>
              <p>
                Any abuse of the platform, including but not limited to unauthorized access, uploading malicious content, or exploiting vulnerabilities, 
                will result in immediate termination of your account.
              </p>
            </div>
            <div className="p-6 border-t border-zinc-100 bg-zinc-50">
              <Button onClick={() => setShowTerms(false)} className="w-full">
                Close
              </Button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
