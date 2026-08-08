import { useNavigate } from 'react-router-dom';
import { motion, useScroll, useTransform, useMotionValue, useSpring } from 'framer-motion';
import { useRef, useEffect, useState } from 'react';
import { 
  BarChart3, RotateCcw, ArrowRight, 
  CheckCircle2, Sparkles, Target, Users, Zap, Shield, Globe
} from 'lucide-react';

// ─── Animation Variants ──────────────────────────────────────
const fadeUp = {
  hidden: { opacity: 0, y: 30, filter: 'blur(10px)' },
  visible: { opacity: 1, y: 0, filter: 'blur(0px)', transition: { duration: 0.7, ease: [0.25, 0.4, 0.25, 1] as const } }
};

const stagger = {
  hidden: {},
  visible: { transition: { staggerChildren: 0.15 } }
};

const scaleIn = {
  hidden: { opacity: 0, scale: 0.9 },
  visible: { opacity: 1, scale: 1, transition: { duration: 0.6, ease: [0.25, 0.4, 0.25, 1] as const } }
};

// ─── Floating Orb Component ──────────────────────────────────
function FloatingOrb({ className }: { className: string }) {
  return (
    <div className={`absolute rounded-full pointer-events-none ${className}`}>
      <div className="w-full h-full rounded-full animate-pulse" />
    </div>
  );
}

// ─── Animated Counter ────────────────────────────────────────
function AnimatedStat({ value, label, suffix = '' }: { value: string; label: string; suffix?: string }) {
  const numericValue = parseInt(value.replace(/[^0-9]/g, ''));
  const isNumeric = !isNaN(numericValue) && numericValue > 0;
  
  const ref = useRef<HTMLDivElement>(null);
  const motionValue = useMotionValue(0);
  const springValue = useSpring(motionValue, {
    damping: 50,
    stiffness: 100,
  });

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0].isIntersecting) {
          motionValue.set(numericValue);
        }
      },
      { threshold: 0.5 }
    );

    if (ref.current) observer.observe(ref.current);
    return () => observer.disconnect();
  }, [motionValue, numericValue]);

  // Handle formatting
  const [displayValue, setDisplayValue] = useState(isNumeric ? "0" : value);
  
  useEffect(() => {
    if (!isNumeric) return;
    return springValue.on("change", (latest) => {
      setDisplayValue(Intl.NumberFormat('en-US').format(Math.floor(latest)));
    });
  }, [springValue, isNumeric]);

  return (
    <motion.div ref={ref} variants={fadeUp} className="text-center">
      <div className="text-4xl md:text-5xl font-black text-transparent bg-clip-text bg-gradient-to-b from-zinc-900 to-zinc-500">
        {displayValue}{suffix}
      </div>
      <div className="text-sm text-zinc-500 mt-2 font-medium tracking-wide uppercase">{label}</div>
    </motion.div>
  );
}

// ─── Bento Feature Card ──────────────────────────────────────
function BentoCard({ icon, title, description, className = '', gradient }: {
  icon: React.ReactNode;
  title: string;
  description: string;
  className?: string;
  gradient: string;
}) {
  return (
    <motion.div
      variants={fadeUp}
      whileHover={{ y: -4, transition: { duration: 0.2 } }}
      className={`group relative overflow-hidden rounded-2xl border border-zinc-200 bg-white p-8 shadow-sm transition-all duration-300 hover:border-zinc-300 hover:shadow-md ${className}`}
    >
      {/* Hover glow */}
      <div className={`absolute -top-24 -right-24 w-48 h-48 rounded-full blur-3xl opacity-0 group-hover:opacity-10 transition-opacity duration-500 ${gradient}`} />
      
      <div className={`w-12 h-12 rounded-xl bg-gradient-to-br ${gradient} flex items-center justify-center mb-6 shadow-lg group-hover:scale-110 transition-transform duration-300`}>
        {icon}
      </div>
      <h3 className="text-lg font-semibold text-zinc-900 mb-2 tracking-tight">{title}</h3>
      <p className="text-zinc-500 text-sm leading-relaxed">{description}</p>
    </motion.div>
  );
}

// ─── Main Landing Page ───────────────────────────────────────
export default function LandingPage() {
  const navigate = useNavigate();
  const heroRef = useRef<HTMLDivElement>(null);
  const { scrollYProgress } = useScroll({
    target: heroRef,
    offset: ['start start', 'end start']
  });
  const heroOpacity = useTransform(scrollYProgress, [0, 1], [1, 0]);
  const heroScale = useTransform(scrollYProgress, [0, 1], [1, 0.95]);

  return (
    <div className="min-h-screen bg-zinc-50 text-zinc-900 selection:bg-zinc-900/10 overflow-x-hidden">
      
      {/* ── Navigation ─────────────────────────────────── */}
      <nav className="fixed w-full z-50 top-0">
        <div className="absolute inset-0 bg-white/70 backdrop-blur-xl border-b border-zinc-200" />
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            <div className="flex items-center gap-2.5">
              <img src="/logo.png" alt="Madifor Mastery Logo" className="w-10 h-10 object-contain drop-shadow-sm" />
              <span className="text-lg font-bold tracking-tight text-zinc-900">Madifor Mastery</span>
            </div>
            <div className="flex items-center gap-3">
              <a
                href="tel:0592664865"
                className="hidden sm:inline-flex items-center px-4 py-2 text-sm font-medium text-zinc-500 hover:text-zinc-900 transition-colors"
              >
                Contact Now
              </a>
              <button
                onClick={() => navigate('/teacher/login')}
                className="hidden md:inline-flex items-center px-4 py-2 text-sm font-medium text-zinc-500 hover:text-zinc-900 transition-colors"
              >
                Teacher Login
              </button>
              <button
                onClick={() => navigate('/learner/login')}
                className="relative inline-flex items-center px-5 py-2.5 text-sm font-semibold text-white bg-zinc-900 rounded-full shadow-md hover:bg-zinc-800 transition-all duration-200 active:scale-[0.97]"
              >
                Get Started
              </button>
            </div>
          </div>
        </div>
      </nav>

      {/* ── Hero Section ───────────────────────────────── */}
      <motion.section 
        ref={heroRef}
        style={{ opacity: heroOpacity, scale: heroScale }}
        className="relative pt-32 pb-24 lg:pt-48 lg:pb-36"
      >
        {/* Ambient background */}
        <FloatingOrb className="top-20 left-1/4 w-[600px] h-[600px] bg-zinc-200 blur-[150px]" />
        <FloatingOrb className="top-40 right-1/4 w-[500px] h-[500px] bg-zinc-300/50 blur-[130px]" />
        
        {/* Grid pattern overlay */}
        <div className="absolute inset-0 bg-[linear-gradient(to_right,rgba(0,0,0,0.03)_1px,transparent_1px),linear-gradient(to_bottom,rgba(0,0,0,0.03)_1px,transparent_1px)] bg-[size:60px_60px] [mask-image:radial-gradient(ellipse_at_center,black_20%,transparent_70%)]" />
        
        <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <motion.div
            initial="hidden"
            animate="visible"
            variants={stagger}
            className="max-w-4xl mx-auto"
          >
            {/* Badge */}
            <motion.div variants={fadeUp} className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-white border border-zinc-200 text-sm font-medium text-zinc-600 mb-8 shadow-sm">
              <Sparkles className="w-4 h-4 text-zinc-900" />
              <span>BECE Science Assessment Platform</span>
            </motion.div>
            
            {/* Headline */}
            <motion.h1 variants={fadeUp} className="text-5xl sm:text-6xl md:text-8xl font-black tracking-tight leading-[0.9] mb-8 text-zinc-900">
              Master every
              <br />
              <span className="text-zinc-400">
                topic.
              </span>
            </motion.h1>
            
            {/* Subheadline */}
            <motion.p variants={fadeUp} className="text-lg md:text-xl text-zinc-500 mb-12 max-w-2xl mx-auto leading-relaxed font-light">
              Pinpoint exact knowledge gaps down to the sub-strand level. 
              Targeted practice that turns weaknesses into strengths.
            </motion.p>
            
            {/* CTAs */}
            <motion.div variants={fadeUp} className="flex flex-col sm:flex-row items-center justify-center gap-4">
              <button 
                onClick={() => navigate('/demo-learner/home')}
                className="group w-full sm:w-auto inline-flex items-center justify-center gap-2 text-base font-semibold px-8 py-4 bg-zinc-900 text-white rounded-full shadow-lg shadow-zinc-900/10 hover:bg-zinc-800 transition-all duration-200 active:scale-[0.97]"
              >
                Learner Dashboard Demo
                <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
              </button>
              <button 
                onClick={() => navigate('/teacher/login')}
                className="w-full sm:w-auto inline-flex items-center justify-center gap-2 text-base font-semibold px-8 py-4 rounded-full border border-zinc-200 text-zinc-900 hover:bg-zinc-100 transition-all duration-200 active:scale-[0.97]"
              >
                I'm a Teacher
              </button>
            </motion.div>
          </motion.div>
        </div>
      </motion.section>

      {/* ── Stats Bar ──────────────────────────────────── */}
      <section className="relative border-y border-zinc-200 bg-white">
        <div className="max-w-5xl mx-auto px-4 py-16">
          <motion.div 
            initial="hidden" 
            whileInView="visible" 
            viewport={{ once: true, margin: "-50px" }}
            variants={stagger}
            className="grid grid-cols-2 md:grid-cols-4 gap-8"
          >
            <AnimatedStat value="1800" suffix="+" label="Questions" />
            <AnimatedStat value="40" suffix="+" label="Topics Covered" />
            <AnimatedStat value="98" suffix="%" label="Mastery Rate" />
            <AnimatedStat value="3" label="Class Levels" />
          </motion.div>
        </div>
      </section>

      {/* ── Bento Features Grid ────────────────────────── */}
      <section className="py-24 lg:py-32 relative">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div 
            initial="hidden" 
            whileInView="visible" 
            viewport={{ once: true, margin: "-100px" }}
            variants={stagger}
            className="text-center mb-16"
          >
            <motion.div variants={fadeUp} className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white border border-zinc-200 text-xs font-medium text-zinc-500 mb-6 uppercase tracking-wider shadow-sm">
              Features
            </motion.div>
            <motion.h2 variants={fadeUp} className="text-3xl md:text-5xl font-bold tracking-tight mb-4 text-zinc-900">
              Everything you need to <span className="text-zinc-500">excel.</span>
            </motion.h2>
            <motion.p variants={fadeUp} className="text-zinc-500 max-w-2xl mx-auto text-lg">
              Built on cognitive science to ensure deep understanding, not just memorization.
            </motion.p>
          </motion.div>

          <motion.div 
            initial="hidden" 
            whileInView="visible" 
            viewport={{ once: true, margin: "-50px" }}
            variants={stagger}
            className="grid md:grid-cols-2 lg:grid-cols-3 gap-4"
          >
            <BentoCard
              icon={<Target className="w-6 h-6 text-white" />}
              title="Curriculum Aligned"
              description="Every question maps directly to the official BECE Science syllabus — strand by strand, topic by topic."
              gradient="from-zinc-900 to-emerald-600"
              className="lg:col-span-1"
            />
            <BentoCard
              icon={<BarChart3 className="w-6 h-6 text-white" />}
              title="Granular Analytics"
              description="Identify exact misconceptions at the sub-strand level. Know precisely where each learner struggles."
              gradient="from-blue-500 to-indigo-600"
              className="lg:col-span-1"
            />
            <BentoCard
              icon={<RotateCcw className="w-6 h-6 text-white" />}
              title="Spaced Repetition"
              description="Smart review queues surface older topics at optimal intervals to prevent forgetting."
              gradient="from-purple-500 to-violet-600"
              className="lg:col-span-1"
            />
            <BentoCard
              icon={<Zap className="w-6 h-6 text-white" />}
              title="Instant Feedback"
              description="Learners get immediate explanations for every answer. No waiting, no ambiguity."
              gradient="from-amber-500 to-orange-600"
              className="lg:col-span-1"
            />
            <BentoCard
              icon={<Users className="w-6 h-6 text-white" />}
              title="Class Management"
              description="Create classes, add learners, and track progress across your entire school from one dashboard."
              gradient="from-pink-500 to-rose-600"
              className="lg:col-span-1"
            />
            <BentoCard
              icon={<Shield className="w-6 h-6 text-white" />}
              title="Works Offline"
              description="Smart caching ensures smooth operation even on spotty 3G connections and low-end devices."
              gradient="from-emerald-500 to-teal-600"
              className="lg:col-span-1"
            />
          </motion.div>
        </div>
      </section>

      {/* ── Product Preview / Trust Section ─────────────── */}
      <section className="py-24 lg:py-32 relative overflow-hidden">
        <FloatingOrb className="top-0 right-0 w-[500px] h-[500px] bg-zinc-900/[0.05] blur-[120px]" />
        
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid lg:grid-cols-2 gap-16 items-center">
            {/* Left: Copy */}
            <motion.div 
              initial="hidden" 
              whileInView="visible" 
              viewport={{ once: true }}
              variants={stagger}
            >
              <motion.div variants={fadeUp} className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white border border-zinc-200 text-xs font-medium text-zinc-500 mb-6 uppercase tracking-wider shadow-sm">
                Built for Africa
              </motion.div>
              <motion.h2 variants={fadeUp} className="text-3xl md:text-4xl font-bold tracking-tight mb-6 text-zinc-900">
                Designed for <span className="text-zinc-500">real classrooms.</span>
              </motion.h2>
              <motion.ul variants={stagger} className="space-y-5 mb-10">
                {[
                  { icon: <Globe className="w-5 h-5" />, text: "Works smoothly on low-end smartphones" },
                  { icon: <Zap className="w-5 h-5" />, text: "Optimized for 3G networks with smart caching" },
                  { icon: <Sparkles className="w-5 h-5" />, text: "Simple enough for first-time smartphone users" },
                  { icon: <CheckCircle2 className="w-5 h-5" />, text: "Instantly actionable data for teachers" },
                ].map((item, i) => (
                  <motion.li key={i} variants={fadeUp} className="flex items-center gap-4">
                    <div className="w-10 h-10 rounded-xl bg-white border border-zinc-200 shadow-sm flex items-center justify-center text-zinc-900 shrink-0">
                      {item.icon}
                    </div>
                    <span className="text-zinc-600 font-medium">{item.text}</span>
                  </motion.li>
                ))}
              </motion.ul>
              <motion.div variants={fadeUp}>
                <button 
                  onClick={() => navigate('/teacher/login')}
                  className="inline-flex items-center gap-2 px-6 py-3 text-sm font-semibold rounded-full border border-zinc-900/40 text-zinc-900 hover:bg-zinc-900/10 transition-all duration-200 active:scale-[0.97]"
                >
                  Create a Teacher Account
                  <ArrowRight className="w-4 h-4" />
                </button>
              </motion.div>
            </motion.div>
            
            {/* Right: Dashboard Preview */}
            <motion.div 
              initial="hidden"
              whileInView="visible"
              viewport={{ once: true }}
              variants={scaleIn}
              className="relative"
            >
              <div className="absolute inset-0 bg-gradient-to-tr from-zinc-100 to-zinc-200 blur-3xl rounded-3xl" />
              <div className="relative bg-white border border-zinc-200 rounded-2xl p-1 shadow-2xl shadow-zinc-900/10">
                {/* Window chrome */}
                <div className="flex items-center gap-1.5 px-4 py-3 border-b border-zinc-100">
                  <div className="w-3 h-3 rounded-full bg-red-400/80" />
                  <div className="w-3 h-3 rounded-full bg-yellow-400/80" />
                  <div className="w-3 h-3 rounded-full bg-green-400/80" />
                  <span className="ml-3 text-xs text-zinc-400 font-mono">Madifor Mastery — Dashboard</span>
                </div>
                {/* Dashboard content */}
                <div className="p-6 space-y-6">
                  {/* Stats row */}
                  <div className="grid grid-cols-3 gap-3">
                    {[
                      { label: 'Active Learners', value: '127', color: 'text-zinc-900' },
                      { label: 'Avg. Mastery', value: '84%', color: 'text-emerald-500' },
                      { label: 'Topics Completed', value: '38', color: 'text-blue-500' },
                    ].map((stat, i) => (
                      <div key={i} className="bg-zinc-50 border border-zinc-100 rounded-xl p-4">
                        <div className={`text-2xl font-bold ${stat.color}`}>{stat.value}</div>
                        <div className="text-xs text-zinc-500 mt-1">{stat.label}</div>
                      </div>
                    ))}
                  </div>
                  {/* Progress bars */}
                  <div className="space-y-4">
                    <div className="text-sm font-medium text-zinc-700">Topic Mastery</div>
                    {[
                      { name: 'Diversity of Matter', pct: 92, color: 'from-zinc-900 to-zinc-700' },
                      { name: 'Cycles', pct: 85, color: 'from-blue-500 to-indigo-600' },
                      { name: 'Systems', pct: 78, color: 'from-purple-500 to-violet-600' },
                      { name: 'Forces & Energy', pct: 95, color: 'from-amber-500 to-orange-600' },
                    ].map((topic, i) => (
                      <div key={i} className="space-y-1.5">
                        <div className="flex justify-between text-xs">
                          <span className="text-zinc-600">{topic.name}</span>
                          <span className="text-zinc-500 font-mono">{topic.pct}%</span>
                        </div>
                        <div className="w-full bg-zinc-100 rounded-full h-2">
                          <motion.div 
                            initial={{ width: 0 }}
                            whileInView={{ width: `${topic.pct}%` }}
                            viewport={{ once: true }}
                            transition={{ duration: 1.2, delay: i * 0.15, ease: [0.25, 0.4, 0.25, 1] }}
                            className={`bg-gradient-to-r ${topic.color} h-2 rounded-full`} 
                          />
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </motion.div>
          </div>
        </div>
      </section>

      {/* ── CTA Section ────────────────────────────────── */}
      <section className="py-24 relative bg-zinc-50 border-t border-zinc-200">
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,rgba(0,0,0,0.02)_0%,transparent_70%)]" />
        <div className="max-w-4xl mx-auto px-4 text-center relative z-10">
          <motion.div 
            initial="hidden" 
            whileInView="visible" 
            viewport={{ once: true }}
            variants={stagger}
          >
            <motion.h2 variants={fadeUp} className="text-3xl md:text-5xl font-bold tracking-tight mb-6 text-zinc-900">
              Ready to transform your classroom?
            </motion.h2>
            <motion.p variants={fadeUp} className="text-lg text-zinc-500 mb-10 max-w-xl mx-auto">
              Join teachers across Ghana who are using data-driven assessment to close learning gaps.
            </motion.p>
            <motion.div variants={fadeUp} className="flex flex-col sm:flex-row items-center justify-center gap-4">
              <button 
                onClick={() => navigate('/demo-learner/home')}
                className="group w-full sm:w-auto inline-flex items-center justify-center gap-2 text-base font-semibold px-8 py-4 bg-zinc-900 text-white rounded-full shadow-lg shadow-zinc-900/10 hover:bg-zinc-800 transition-all duration-200 active:scale-[0.97]"
              >
                Learner Dashboard Demo
                <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
              </button>
              <button 
                onClick={() => navigate('/demo/dashboard')}
                className="w-full sm:w-auto inline-flex items-center justify-center gap-2 text-base font-medium px-8 py-4 rounded-full border border-zinc-200 text-zinc-900 hover:bg-white transition-all duration-200 bg-zinc-50"
              >
                Teacher Dashboard Demo
              </button>
            </motion.div>
          </motion.div>
        </div>
      </section>

      {/* ── Footer ─────────────────────────────────────── */}
      <footer className="border-t border-zinc-200 py-12 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col md:flex-row justify-between items-center gap-4">
            <div className="flex items-center gap-2.5">
              <img src="/logo.png" alt="Madifor Mastery Logo" className="w-8 h-8 object-contain" />
              <span className="font-bold text-zinc-900">Madifor Mastery</span>
            </div>
            <div className="flex flex-col md:items-end text-center md:text-right gap-1">
              <p className="text-sm text-zinc-600 font-medium">
                Need assistance? Contact Madifor on <a href="tel:0592664865" className="text-zinc-900 hover:underline">059-266-4865</a>
              </p>
              <p className="text-sm text-zinc-500">© {new Date().getFullYear()} Madifor Mastery. All rights reserved.</p>
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}
