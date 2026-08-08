import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { motion } from 'framer-motion';
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
      if (onSignIn) {
        onSignIn();
      }
      navigate('/learner/home');
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
      <div className="absolute top-[-10%] left-[-10%] w-[50vw] h-[50vw] rounded-full bg-purple-600/20 blur-[120px] animate-pulse pointer-events-none" />
      <div className="absolute bottom-[-10%] right-[-10%] w-[50vw] h-[50vw] rounded-full bg-fuchsia-600/20 blur-[120px] animate-pulse pointer-events-none" style={{ animationDelay: '2s' }} />

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
            Unlock your <br/>
            <span className="text-zinc-400">
              potential
            </span>
          </h1>
          <p className="text-zinc-500 text-lg lg:text-xl max-w-md font-light leading-relaxed">
            Dive into interactive lessons, track your progress, and master new skills with personalized guidance.
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
          className="w-full max-w-md bg-white border border-zinc-200 rounded-[2rem] shadow-sm p-8 sm:p-10"
          variants={containerVariants}
          initial="hidden"
          animate="visible"
        >
          <motion.div variants={itemVariants} className="text-center mb-10">
            <h2 className="text-3xl font-bold text-zinc-900 mb-2 tracking-tight">Ready to learn?</h2>
            <p className="text-zinc-500">Sign in to your learner account</p>
          </motion.div>

          {/* Wrapper to ensure input fields render with dark text if they default to inheriting color */}
          <form onSubmit={handleSubmit} className="space-y-5 text-left text-zinc-950">
            <motion.div variants={itemVariants}>
              <Input
                label="Email"
                type="email"
                value={email}
                onChange={e => setEmail(e.target.value)}
                placeholder="your.email@school.com"
                required
              />
            </motion.div>
            <motion.div variants={itemVariants}>
              <Input
                label="Password"
                type="password"
                value={password}
                onChange={e => setPassword(e.target.value)}
                placeholder="Enter your password"
                required
              />
            </motion.div>

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

            <motion.div variants={itemVariants} className="pt-4">
              <Button type="submit" className="w-full h-12 text-base" size="lg" disabled={loading}>
                {loading ? (
                  <span className="flex items-center justify-center gap-2">
                    <Loader2 className="w-5 h-5 animate-spin" />
                    Please wait...
                  </span>
                ) : (
                  'Sign In'
                )}
              </Button>
            </motion.div>
          </form>

          <motion.div variants={itemVariants} className="mt-8 pt-8 border-t border-zinc-100 space-y-4">
            <p className="text-center text-xs text-zinc-500 font-medium">
              Ask your teacher for your email and password.
            </p>
            <p className="text-center text-sm text-zinc-500">
              Not a learner?{' '}
              <button
                type="button"
                onClick={() => navigate('/teacher/login')}
                className="text-zinc-900 font-semibold hover:text-zinc-600 transition-colors hover:underline"
              >
                Login as Teacher
              </button>
            </p>
            <p className="text-center text-xs text-zinc-400 pt-2">
              Need assistance? Contact Madifor on <a href="tel:0592664865" className="text-zinc-600 hover:underline">059-266-4865</a>
            </p>
          </motion.div>
        </motion.div>
      </div>
    </div>
  );
}
