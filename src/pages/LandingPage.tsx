import { useNavigate } from 'react-router-dom';
import { motion, useScroll, useTransform, useMotionValue, useSpring } from 'framer-motion';
import { useRef, useEffect, useState } from 'react';
import {
  BarChart3,
  RotateCcw,
  ArrowRight,
  CheckCircle2,
  Sparkles,
  Target,
  Users,
  Zap,
  Shield,
  Globe,
  Menu,
  X,
} from 'lucide-react';

const fadeUp = {
  hidden: { opacity: 0, y: 20 },
  visible: {
    opacity: 1,
    y: 0,
    transition: { duration: 0.5, ease: [0.22, 1, 0.36, 1] as const },
  },
};

const stagger = {
  hidden: {},
  visible: { transition: { staggerChildren: 0.1 } },
};

const scaleIn = {
  hidden: { opacity: 0, scale: 0.96 },
  visible: {
    opacity: 1,
    scale: 1,
    transition: { duration: 0.5, ease: [0.22, 1, 0.36, 1] as const },
  },
};

function AnimatedStat({
  value,
  label,
  suffix = '',
}: {
  value: string;
  label: string;
  suffix?: string;
}) {
  const numericValue = parseInt(value.replace(/[^0-9]/g, ''), 10);
  const isNumeric = !Number.isNaN(numericValue) && numericValue > 0;

  const ref = useRef<HTMLDivElement>(null);
  const motionValue = useMotionValue(0);
  const springValue = useSpring(motionValue, { damping: 50, stiffness: 110 });
  const [displayValue, setDisplayValue] = useState(isNumeric ? '0' : value);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0]?.isIntersecting) {
          motionValue.set(numericValue);
        }
      },
      { threshold: 0.4 }
    );

    if (ref.current) observer.observe(ref.current);
    return () => observer.disconnect();
  }, [motionValue, numericValue]);

  useEffect(() => {
    if (!isNumeric) return;
    return springValue.on('change', (latest) => {
      setDisplayValue(Intl.NumberFormat('en-US').format(Math.floor(latest)));
    });
  }, [springValue, isNumeric]);

  return (
    <motion.div ref={ref} variants={fadeUp} className="text-center">
      <div className="text-3xl sm:text-4xl font-extrabold text-navy-900 tabular-nums">
        {displayValue}
        {suffix}
      </div>
      <div className="text-xs sm:text-sm text-slate-500 mt-1.5 font-medium tracking-wide uppercase">
        {label}
      </div>
    </motion.div>
  );
}

function BentoCard({
  icon,
  title,
  description,
  accentBg,
}: {
  icon: React.ReactNode;
  title: string;
  description: string;
  accentBg: string;
}) {
  return (
    <motion.div
      variants={fadeUp}
      whileHover={{ y: -3, transition: { duration: 0.2 } }}
      className="group rounded-2xl border border-slate-200 bg-white p-7 shadow-sm transition-all duration-200 hover:border-indigo-200 hover:shadow-md"
    >
      <div
        className={`w-12 h-12 rounded-xl ${accentBg} flex items-center justify-center mb-5 shadow-sm group-hover:scale-105 transition-transform duration-200`}
      >
        {icon}
      </div>
      <h3 className="text-lg font-semibold text-navy-900 mb-2 tracking-tight">{title}</h3>
      <p className="text-slate-600 text-sm leading-relaxed">{description}</p>
    </motion.div>
  );
}

export default function LandingPage() {
  const navigate = useNavigate();
  const [mobileNavOpen, setMobileNavOpen] = useState(false);
  const heroRef = useRef<HTMLDivElement>(null);
  const { scrollYProgress } = useScroll({
    target: heroRef,
    offset: ['start start', 'end start'],
  });
  const heroOpacity = useTransform(scrollYProgress, [0, 1], [1, 0.4]);

  const previewTopics = [
    { name: 'Diversity of Matter', pct: 92, color: 'bg-navy-900' },
    { name: 'Cycles', pct: 85, color: 'bg-indigo-600' },
    { name: 'Systems', pct: 78, color: 'bg-amber-500' },
    { name: 'Forces & Energy', pct: 95, color: 'bg-emerald-600' },
  ];
  const avgPreviewPct = (
    previewTopics.reduce((acc, t) => acc + t.pct, 0) / previewTopics.length
  ).toFixed(1);

  return (
    <div className="min-h-screen bg-slate-50 text-navy-900 selection:bg-indigo-100 overflow-x-clip">
      {/* Navigation */}
      <nav className="sticky top-0 z-50 bg-white/90 backdrop-blur-md border-b border-slate-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            <div className="flex items-center gap-2.5">
              <img
                src="/logo.png"
                alt="Madifor Mastery Logo"
                className="w-9 h-9 object-contain"
              />
              <span className="text-lg font-bold tracking-tight text-navy-900">
                Madifor Mastery
              </span>
            </div>

            <div className="hidden md:flex items-center gap-2">
              <a
                href="tel:+233592664865"
                className="px-3.5 py-2 text-sm font-medium text-slate-600 hover:text-navy-900 transition-colors"
              >
                Contact Support
              </a>
              <button
                type="button"
                onClick={() => navigate('/demo/dashboard')}
                className="px-3.5 py-2 text-sm font-medium text-indigo-600 hover:text-indigo-800 transition-colors"
              >
                Teacher Demo
              </button>
              <button
                type="button"
                onClick={() => navigate('/teacher/login')}
                className="px-4 py-2 text-sm font-medium text-navy-800 hover:bg-slate-100 rounded-lg transition-colors"
              >
                Teacher Login
              </button>
              <button
                type="button"
                onClick={() => navigate('/learner/login')}
                className="px-5 py-2 text-sm font-semibold text-white bg-indigo-600 rounded-lg shadow-sm hover:bg-indigo-700 transition-colors"
              >
                Learner Login
              </button>
            </div>

            <button
              type="button"
              onClick={() => setMobileNavOpen(!mobileNavOpen)}
              className="md:hidden p-2 rounded-lg text-slate-600 hover:bg-slate-100"
              aria-label="Toggle navigation menu"
            >
              {mobileNavOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
            </button>
          </div>

          {mobileNavOpen && (
            <div className="md:hidden border-t border-slate-100 py-3 space-y-1.5">
              <button
                type="button"
                onClick={() => navigate('/learner/login')}
                className="w-full text-left px-3 py-2 text-sm font-semibold text-white bg-indigo-600 rounded-lg"
              >
                Learner Login
              </button>
              <button
                type="button"
                onClick={() => navigate('/teacher/login')}
                className="w-full text-left px-3 py-2 text-sm font-medium text-navy-800 hover:bg-slate-100 rounded-lg"
              >
                Teacher Login
              </button>
              <button
                type="button"
                onClick={() => navigate('/demo/dashboard')}
                className="w-full text-left px-3 py-2 text-sm font-medium text-indigo-600 hover:bg-slate-100 rounded-lg"
              >
                Explore Teacher Demo
              </button>
              <a
                href="tel:+233592664865"
                className="block px-3 py-2 text-sm text-slate-600 hover:bg-slate-100 rounded-lg"
              >
                Support: 059-266-4865
              </a>
            </div>
          )}
        </div>
      </nav>

      {/* Hero Section */}
      <motion.section
        ref={heroRef}
        style={{ opacity: heroOpacity }}
        className="relative pt-16 pb-20 lg:pt-28 lg:pb-28 bg-gradient-to-b from-white via-slate-50 to-slate-50"
      >
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <motion.div
            initial="hidden"
            animate="visible"
            variants={stagger}
            className="max-w-3xl mx-auto"
          >
            <motion.h1
              variants={fadeUp}
              className="text-4xl sm:text-6xl font-extrabold tracking-tight leading-[1.08] mb-6 text-navy-900"
            >
              Pinpoint what each learner misses.{' '}
              <span className="text-indigo-600">Master every topic.</span>
            </motion.h1>

            <motion.p
              variants={fadeUp}
              className="text-base sm:text-xl text-slate-600 mb-9 max-w-2xl mx-auto leading-relaxed"
            >
              Adaptive assessments, immediate feedback with worked explanations, and timed
              retention reviews aligned to the NaCCA B7–B9 Integrated Science curriculum.
            </motion.p>

            {/* Primary CTAs */}
            <motion.div
              variants={fadeUp}
              className="flex flex-col sm:flex-row items-center justify-center gap-3.5"
            >
              <button
                type="button"
                onClick={() => navigate('/learner/login')}
                className="group w-full sm:w-auto inline-flex items-center justify-center gap-2 text-base font-semibold px-7 py-3.5 bg-indigo-600 text-white rounded-xl shadow-md shadow-indigo-600/20 hover:bg-indigo-700 transition-all"
              >
                Learner Login
                <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
              </button>
              <button
                type="button"
                onClick={() => navigate('/teacher/login')}
                className="w-full sm:w-auto inline-flex items-center justify-center gap-2 text-base font-semibold px-7 py-3.5 rounded-xl border border-slate-300 bg-white text-navy-900 hover:bg-slate-100 transition-all"
              >
                Teacher Sign In
              </button>
            </motion.div>

            {/* Direct Demo Links */}
            <motion.div
              variants={fadeUp}
              className="mt-6 flex flex-wrap items-center justify-center gap-x-6 gap-y-2 text-sm text-slate-500"
            >
              <span>Try without an account:</span>
              <button
                type="button"
                onClick={() => navigate('/demo/dashboard')}
                className="font-semibold text-indigo-600 hover:text-indigo-800 hover:underline"
              >
                Interactive Teacher Demo
              </button>
              <button
                type="button"
                onClick={() => navigate('/demo-learner/home')}
                className="font-semibold text-navy-800 hover:text-navy-950 hover:underline"
              >
                Interactive Learner Demo
              </button>
            </motion.div>
          </motion.div>
        </div>
      </motion.section>

      {/* Stats Bar */}
      <section className="border-y border-slate-200 bg-white">
        <div className="max-w-5xl mx-auto px-4 py-12">
          <motion.div
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, margin: '-40px' }}
            variants={stagger}
            className="grid grid-cols-2 md:grid-cols-4 gap-8"
          >
            <AnimatedStat value="8600" suffix="+" label="Curated Questions" />
            <AnimatedStat value="86" label="Curriculum Topics" />
            <AnimatedStat value="5" label="Science Strands" />
            <AnimatedStat value="3" label="Class Levels (B7–B9)" />
          </motion.div>
        </div>
      </section>

      {/* Bento Features Grid */}
      <section className="py-20 lg:py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, margin: '-60px' }}
            variants={stagger}
            className="text-center mb-14"
          >
            <motion.div
              variants={fadeUp}
              className="inline-flex items-center px-3 py-1 rounded-full bg-indigo-50 border border-indigo-100 text-xs font-semibold text-indigo-700 mb-4 uppercase tracking-wider"
            >
              Core Capabilities
            </motion.div>
            <motion.h2
              variants={fadeUp}
              className="text-3xl md:text-4xl font-bold tracking-tight mb-3 text-navy-900"
            >
              Built for deep understanding, not cramming
            </motion.h2>
            <motion.p variants={fadeUp} className="text-slate-600 max-w-2xl mx-auto">
              Combine adaptive questioning, immediate corrective explanations, and longitudinal retention tracking in one classroom-ready platform.
            </motion.p>
          </motion.div>

          <motion.div
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, margin: '-40px' }}
            variants={stagger}
            className="grid md:grid-cols-2 lg:grid-cols-3 gap-5"
          >
            <BentoCard
              icon={<Target className="w-6 h-6 text-white" />}
              title="NaCCA Curriculum Aligned"
              description="Organized across Diversity of Matter, Cycles, Systems, Forces & Energy, and Humans & the Environment for B7 through B9."
              accentBg="bg-navy-900"
            />
            <BentoCard
              icon={<BarChart3 className="w-6 h-6 text-white" />}
              title="Adaptive Question Selection"
              description="Estimates each learner's ability level per topic and calibrates question difficulty using a Rasch psychometric model."
              accentBg="bg-indigo-600"
            />
            <BentoCard
              icon={<RotateCcw className="w-6 h-6 text-white" />}
              title="3-Stage Spaced Retention"
              description="First-pass mastery is verified after 3, 7, and 14 days so teachers know which concepts learners truly remember."
              accentBg="bg-emerald-600"
            />
            <BentoCard
              icon={<Zap className="w-6 h-6 text-white" />}
              title="Progressive Hints & Feedback"
              description="Step-by-step hints support struggling students while clear explanations clarify why an answer is right or wrong."
              accentBg="bg-amber-500"
            />
            <BentoCard
              icon={<Users className="w-6 h-6 text-white" />}
              title="Class & PDF Reporting"
              description="Track class mastery heatmaps, flag recurring misconceptions, and export individual PDF progress reports or CSV sheets."
              accentBg="bg-rose-600"
            />
            <BentoCard
              icon={<Shield className="w-6 h-6 text-white" />}
              title="Offline Assessment Sync"
              description="Queued attempts save locally when connectivity drops and sync automatically per learner once back online."
              accentBg="bg-sky-600"
            />
          </motion.div>
        </div>
      </section>

      {/* Product Preview Section */}
      <section className="py-20 bg-white border-y border-slate-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <motion.div
              initial="hidden"
              whileInView="visible"
              viewport={{ once: true }}
              variants={stagger}
            >
              <motion.div
                variants={fadeUp}
                className="inline-flex items-center px-3 py-1 rounded-full bg-slate-100 text-xs font-semibold text-navy-700 mb-4 uppercase tracking-wider"
              >
                Classroom Ready
              </motion.div>
              <motion.h2
                variants={fadeUp}
                className="text-3xl md:text-4xl font-bold tracking-tight mb-6 text-navy-900"
              >
                Actionable visibility for Science teachers
              </motion.h2>
              <motion.ul variants={stagger} className="space-y-4 mb-8">
                {[
                  { icon: <Globe className="w-5 h-5" />, text: 'Responsive on phones, tablets, and school laptops' },
                  { icon: <Zap className="w-5 h-5" />, text: 'Fast offline-capable quiz flow for variable 3G networks' },
                  { icon: <Sparkles className="w-5 h-5" />, text: 'Distinguishes quick first-pass scores from true retention' },
                  { icon: <CheckCircle2 className="w-5 h-5" />, text: 'Highlights repeated misconceptions and overdue reviews' },
                ].map((item, i) => (
                  <motion.li key={i} variants={fadeUp} className="flex items-center gap-3.5">
                    <div className="w-10 h-10 rounded-xl bg-indigo-50 border border-indigo-100 flex items-center justify-center text-indigo-600 shrink-0">
                      {item.icon}
                    </div>
                    <span className="text-slate-700 font-medium text-sm sm:text-base">{item.text}</span>
                  </motion.li>
                ))}
              </motion.ul>
              <motion.div variants={fadeUp}>
                <button
                  type="button"
                  onClick={() => navigate('/teacher/login?mode=signup')}
                  className="inline-flex items-center gap-2 px-6 py-3 text-sm font-semibold rounded-xl bg-navy-900 text-white hover:bg-navy-800 transition-colors"
                >
                  Create a Teacher Account
                  <ArrowRight className="w-4 h-4" />
                </button>
              </motion.div>
            </motion.div>

            {/* Clean Dashboard Mockup Preview */}
            <motion.div
              initial="hidden"
              whileInView="visible"
              viewport={{ once: true }}
              variants={scaleIn}
            >
              <div className="bg-white border border-slate-200 rounded-2xl shadow-xl overflow-hidden">
                <div className="flex items-center gap-2 px-4 py-3 bg-navy-900 text-white">
                  <div className="w-2.5 h-2.5 rounded-full bg-rose-400" />
                  <div className="w-2.5 h-2.5 rounded-full bg-amber-400" />
                  <div className="w-2.5 h-2.5 rounded-full bg-emerald-400" />
                  <span className="ml-2 text-xs text-slate-300 font-mono">
                    Madifor Mastery — Basic 8 Science Overview (Sample)
                  </span>
                </div>
                <div className="p-6 space-y-6">
                  <div className="grid grid-cols-3 gap-3">
                    <div className="bg-slate-50 border border-slate-100 rounded-xl p-3.5">
                      <div className="text-xl sm:text-2xl font-bold text-navy-900 tabular-nums">32</div>
                      <div className="text-xs text-slate-500 mt-0.5">Learners</div>
                    </div>
                    <div className="bg-slate-50 border border-slate-100 rounded-xl p-3.5">
                      <div className="text-xl sm:text-2xl font-bold text-emerald-600 tabular-nums">
                        {avgPreviewPct}%
                      </div>
                      <div className="text-xs text-slate-500 mt-0.5">Avg. Mastery</div>
                    </div>
                    <div className="bg-slate-50 border border-slate-100 rounded-xl p-3.5">
                      <div className="text-xl sm:text-2xl font-bold text-indigo-600 tabular-nums">12</div>
                      <div className="text-xs text-slate-500 mt-0.5">Topics Active</div>
                    </div>
                  </div>
                  <div className="space-y-3.5">
                    <div className="text-xs font-semibold uppercase tracking-wider text-slate-500">
                      Strand Mastery Sample
                    </div>
                    {previewTopics.map((topic, i) => (
                      <div key={i} className="space-y-1.5">
                        <div className="flex justify-between text-xs">
                          <span className="font-medium text-navy-900">{topic.name}</span>
                          <span className="text-slate-600 font-mono tabular-nums">{topic.pct}%</span>
                        </div>
                        <div className="w-full bg-slate-100 rounded-full h-2 overflow-hidden">
                          <motion.div
                            initial={{ width: 0 }}
                            whileInView={{ width: `${topic.pct}%` }}
                            viewport={{ once: true }}
                            transition={{ duration: 0.9, delay: i * 0.1 }}
                            className={`${topic.color} h-2 rounded-full`}
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

      {/* Bottom Demo CTA */}
      <section className="py-20 bg-slate-50">
        <div className="max-w-4xl mx-auto px-4 text-center">
          <h2 className="text-3xl md:text-4xl font-bold tracking-tight mb-4 text-navy-900">
            Explore Madifor Mastery in action
          </h2>
          <p className="text-slate-600 mb-8 max-w-xl mx-auto">
            Try both views interactively with sample Basic 8 Integrated Science data before creating an account.
          </p>
          <div className="flex flex-col sm:flex-row items-center justify-center gap-3.5">
            <button
              type="button"
              onClick={() => navigate('/demo-learner/home')}
              className="group w-full sm:w-auto inline-flex items-center justify-center gap-2 text-base font-semibold px-7 py-3.5 bg-indigo-600 text-white rounded-xl shadow-sm hover:bg-indigo-700 transition-colors"
            >
              Learner Dashboard Demo
              <ArrowRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
            </button>
            <button
              type="button"
              onClick={() => navigate('/demo/dashboard')}
              className="w-full sm:w-auto inline-flex items-center justify-center gap-2 text-base font-semibold px-7 py-3.5 rounded-xl border border-slate-300 bg-white text-navy-900 hover:bg-slate-100 transition-colors"
            >
              Teacher Dashboard Demo
            </button>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-slate-200 py-10 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col md:flex-row justify-between items-center gap-4">
            <div className="flex items-center gap-2.5">
              <img src="/logo.png" alt="Madifor Mastery Logo" className="w-8 h-8 object-contain" />
              <span className="font-bold text-navy-900">Madifor Mastery</span>
            </div>
            <div className="flex flex-col md:items-end text-center md:text-right gap-1">
              <p className="text-sm text-slate-600 font-medium">
                Need assistance? Call{' '}
                <a href="tel:+233592664865" className="text-indigo-600 hover:underline">
                  059-266-4865
                </a>
              </p>
              <p className="text-xs text-slate-400">
                &copy; {new Date().getFullYear()} Madifor Mastery. All rights reserved.
              </p>
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}
