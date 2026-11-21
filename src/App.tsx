import { lazy, Suspense, useState, useEffect, useCallback } from 'react';
import { Routes, Route, Navigate, useNavigate } from 'react-router-dom';
import { AuthProvider, useAuthContext } from '@/context/AuthContext';
import { SelectedClassProvider } from '@/context/SelectedClassContext';
import { getLearnerSession, learnerSignOut, refreshLearnerSession } from '@/api/auth';
import AppShell from '@/components/layout/AppShell';
import TeacherLogin from '@/components/auth/TeacherLogin';
import LearnerLogin from '@/components/auth/LearnerLogin';
import type { LearnerSession } from '@/types/auth';

const LandingPage = lazy(() => import('@/pages/LandingPage'));
const DashboardPage = lazy(() => import('@/pages/teacher/DashboardPage'));
const QuestionBuilderPage = lazy(() => import('@/pages/teacher/QuestionBuilderPage'));
const CurriculumPage = lazy(() => import('@/pages/teacher/CurriculumPage'));
const ClassManagementPage = lazy(() => import('@/pages/teacher/ClassManagementPage'));
const SettingsPage = lazy(() => import('@/pages/teacher/SettingsPage'));
const QuestionAnalyticsPage = lazy(() => import('@/pages/teacher/QuestionAnalyticsPage'));
const ReviewQueuePage = lazy(() => import('@/pages/teacher/ReviewQueuePage'));
const LearnerTrendsPage = lazy(() => import('@/pages/teacher/LearnerTrendsPage'));
const MisconceptionsPage = lazy(() => import('@/pages/teacher/MisconceptionsPage'));
const AdminDashboardPage = lazy(() => import('@/pages/teacher/AdminDashboardPage'));

const HomePage = lazy(() => import('@/pages/learner/HomePage'));
const AssessmentPage = lazy(() => import('@/pages/learner/AssessmentPage'));
const ReviewPage = lazy(() => import('@/pages/learner/ReviewPage'));
const ProgressPage = lazy(() => import('@/pages/learner/ProgressPage'));

const DemoAppShell = lazy(() => import('@/pages/demo/DemoAppShell'));
const DemoDashboardPage = lazy(() => import('@/pages/demo/DemoDashboardPage'));
const DemoClassManagementPage = lazy(() => import('@/pages/demo/DemoClassManagementPage'));
const DemoSettingsPage = lazy(() => import('@/pages/demo/DemoSettingsPage'));
const DemoCurriculumPage = lazy(() => import('@/pages/demo/DemoCurriculumPage'));
const DemoQuestionBuilderPage = lazy(() => import('@/pages/demo/DemoQuestionBuilderPage'));
const DemoAnalyticsPage = lazy(() => import('@/pages/demo/DemoAnalyticsPage'));
const DemoReviewQueuePage = lazy(() => import('@/pages/demo/DemoReviewQueuePage'));
const DemoTrendsPage = lazy(() => import('@/pages/demo/DemoTrendsPage'));
const DemoMisconceptionsPage = lazy(() => import('@/pages/demo/DemoMisconceptionsPage'));
const DemoLearnerRoutes = lazy(() => import('@/pages/demo-learner/DemoLearnerRoutes'));

function PageFallback() {
  return (
    <div className="min-h-[60vh] flex items-center justify-center">
      <div className="flex items-center gap-3 text-slate-500 text-sm font-medium">
        <div className="w-5 h-5 border-2 border-navy-900 border-t-transparent rounded-full animate-spin" />
        <span>Loading Madifor Mastery...</span>
      </div>
    </div>
  );
}

function TeacherRoutes() {
  const { teacher, signIn, signUp, signOut, loading } = useAuthContext();
  const navigate = useNavigate();

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-50">
        <PageFallback />
      </div>
    );
  }

  if (!teacher) {
    return <TeacherLogin onSignIn={signIn} onSignUp={signUp} />;
  }

  if (teacher.status === 'suspended') {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center bg-slate-50 p-4">
        <div className="bg-white border border-slate-200 rounded-2xl p-8 max-w-md w-full text-center shadow-sm">
          <h1 className="text-2xl font-bold text-navy-900 mb-2">Account Suspended</h1>
          <p className="text-slate-600 text-sm mb-6 leading-relaxed">
            Your teacher account has been temporarily suspended by an administrator. Contact support on 059-266-4865 if you believe this is an error.
          </p>
          <button
            type="button"
            onClick={async () => {
              await signOut();
              navigate('/');
            }}
            className="w-full px-6 py-2.5 bg-navy-900 text-white rounded-xl font-semibold hover:bg-navy-800 transition-colors"
          >
            Sign Out
          </button>
        </div>
      </div>
    );
  }

  return (
    <SelectedClassProvider>
      <AppShell
        userName={teacher.full_name}
        userRole="teacher"
        onLogout={async () => {
          await signOut();
          navigate('/');
        }}
      >
        <Suspense fallback={<PageFallback />}>
          <Routes>
            <Route path="dashboard" element={<DashboardPage />} />
            <Route path="curriculum" element={<CurriculumPage />} />
            <Route path="questions" element={<QuestionBuilderPage />} />
            <Route path="analytics" element={<QuestionAnalyticsPage />} />
            <Route path="reviews" element={<ReviewQueuePage />} />
            <Route path="trends" element={<LearnerTrendsPage />} />
            <Route path="misconceptions" element={<MisconceptionsPage />} />
            <Route path="classes" element={<ClassManagementPage />} />
            <Route path="settings" element={<SettingsPage />} />
            <Route
              path="admin"
              element={teacher.is_admin ? <AdminDashboardPage /> : <Navigate to="/teacher/dashboard" replace />}
            />
            <Route path="*" element={<Navigate to="dashboard" replace />} />
          </Routes>
        </Suspense>
      </AppShell>
    </SelectedClassProvider>
  );
}

function LearnerRoutes() {
  const [session, setSession] = useState<LearnerSession | null>(getLearnerSession);
  const [verifying, setVerifying] = useState(true);
  const navigate = useNavigate();

  const verifySession = useCallback(async () => {
    try {
      const verified = await refreshLearnerSession();
      setSession(verified);
    } catch {
      // Keep local session only if offline; invalid/mismatched auth already returns null
      if (navigator.onLine) {
        setSession(null);
      }
    } finally {
      setVerifying(false);
    }
  }, []);

  useEffect(() => {
    verifySession();
  }, [verifySession]);

  const handleStorageChange = useCallback((e: StorageEvent) => {
    if (e.key === 'flawlex_learner_session') {
      setSession(getLearnerSession());
    }
  }, []);

  useEffect(() => {
    window.addEventListener('storage', handleStorageChange);
    return () => window.removeEventListener('storage', handleStorageChange);
  }, [handleStorageChange]);

  if (verifying && session) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-slate-50">
        <PageFallback />
      </div>
    );
  }

  if (!session) {
    return <LearnerLogin onSignIn={() => setSession(getLearnerSession())} />;
  }

  return (
    <AppShell
      userName={session.display_name}
      userRole="learner"
      onLogout={async () => {
        await learnerSignOut();
        setSession(null);
        navigate('/');
      }}
    >
      <Suspense fallback={<PageFallback />}>
        <Routes>
          <Route path="home" element={<HomePage />} />
          <Route path="assessment/:topicId" element={<AssessmentPage />} />
          <Route path="review" element={<ReviewPage />} />
          <Route path="progress" element={<ProgressPage />} />
          <Route path="*" element={<Navigate to="home" replace />} />
        </Routes>
      </Suspense>
    </AppShell>
  );
}

function DemoRoutes() {
  return (
    <Suspense fallback={<PageFallback />}>
      <DemoAppShell>
        <Routes>
          <Route path="dashboard" element={<DemoDashboardPage />} />
          <Route path="curriculum" element={<DemoCurriculumPage />} />
          <Route path="questions" element={<DemoQuestionBuilderPage />} />
          <Route path="analytics" element={<DemoAnalyticsPage />} />
          <Route path="reviews" element={<DemoReviewQueuePage />} />
          <Route path="trends" element={<DemoTrendsPage />} />
          <Route path="misconceptions" element={<DemoMisconceptionsPage />} />
          <Route path="classes" element={<DemoClassManagementPage />} />
          <Route path="settings" element={<DemoSettingsPage />} />
          <Route path="*" element={<Navigate to="dashboard" replace />} />
        </Routes>
      </DemoAppShell>
    </Suspense>
  );
}

function App() {
  return (
    <AuthProvider>
      <Suspense fallback={<PageFallback />}>
        <Routes>
          <Route path="/" element={<LandingPage />} />
          <Route path="/teacher/*" element={<TeacherRoutes />} />
          <Route path="/learner/*" element={<LearnerRoutes />} />
          <Route path="/demo/*" element={<DemoRoutes />} />
          <Route path="/demo-learner/*" element={<DemoLearnerRoutes />} />
          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </Suspense>
    </AuthProvider>
  );
}

export default App;
