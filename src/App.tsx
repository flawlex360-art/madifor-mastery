import { useState, useEffect, useCallback } from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';
import { getLearnerSession, clearLearnerSession } from '@/api/auth';
import AppShell from '@/components/layout/AppShell';
import { SelectedClassProvider } from '@/context/SelectedClassContext';
import TeacherLogin from '@/components/auth/TeacherLogin';
import LearnerLogin from '@/components/auth/LearnerLogin';
import DashboardPage from '@/pages/teacher/DashboardPage';
import QuestionBuilderPage from '@/pages/teacher/QuestionBuilderPage';
import CurriculumPage from '@/pages/teacher/CurriculumPage';
import ClassManagementPage from '@/pages/teacher/ClassManagementPage';
import SettingsPage from '@/pages/teacher/SettingsPage';
import QuestionAnalyticsPage from '@/pages/teacher/QuestionAnalyticsPage';
import ReviewQueuePage from '@/pages/teacher/ReviewQueuePage';
import LearnerTrendsPage from '@/pages/teacher/LearnerTrendsPage';
import MisconceptionsPage from '@/pages/teacher/MisconceptionsPage';
import SchoolOnboardingPage from '@/pages/teacher/SchoolOnboardingPage';
import LandingPage from '@/pages/LandingPage';
import HomePage from '@/pages/learner/HomePage';
import AssessmentPage from '@/pages/learner/AssessmentPage';
import ProgressPage from '@/pages/learner/ProgressPage';
import { useNavigate } from 'react-router-dom';

function TeacherRoutes() {
  const { teacher, signIn, signUp, signOut, loading } = useAuth();
  const navigate = useNavigate();

  if (loading) {
    return <div className="min-h-screen flex items-center justify-center bg-gray-50 text-gray-500">Loading...</div>;
  }

  if (!teacher) {
    return <TeacherLogin onSignIn={signIn} onSignUp={signUp} />;
  }

  return (
    <SelectedClassProvider>
      <AppShell
        userName={teacher.full_name}
        userRole="teacher"
        onLogout={async () => { await signOut(); navigate('/'); }}
      >
        <Routes>
          <Route path="dashboard" element={<DashboardPage />} />
          <Route path="curriculum" element={<CurriculumPage />} />
          <Route path="questions" element={<QuestionBuilderPage />} />
          <Route path="analytics" element={<QuestionAnalyticsPage />} />
          <Route path="reviews" element={<ReviewQueuePage />} />
          <Route path="trends" element={<LearnerTrendsPage />} />
          <Route path="misconceptions" element={<MisconceptionsPage />} />
          <Route path="school" element={<SchoolOnboardingPage />} />
          <Route path="classes" element={<ClassManagementPage />} />
          <Route path="settings" element={<SettingsPage />} />
          <Route path="*" element={<Navigate to="dashboard" replace />} />
        </Routes>
      </AppShell>
    </SelectedClassProvider>
  );
}

function LearnerRoutes() {
  const [session, setSession] = useState(getLearnerSession());
  const navigate = useNavigate();

  // H-8: Listen for session changes (other tabs, logout)
  const handleStorageChange = useCallback((e: StorageEvent) => {
    if (e.key === 'flawlex_learner_session') {
      setSession(getLearnerSession());
    }
  }, []);

  useEffect(() => {
    window.addEventListener('storage', handleStorageChange);
    return () => window.removeEventListener('storage', handleStorageChange);
  }, [handleStorageChange]);

  if (!session) {
    return <LearnerLogin onSignIn={() => setSession(getLearnerSession())} />;
  }

  return (
    <AppShell
      userName={session.display_name}
      userRole="learner"
      onLogout={() => { clearLearnerSession(); setSession(null); navigate('/'); }}
    >
      <Routes>
        <Route path="home" element={<HomePage />} />
        <Route path="assessment/:topicId" element={<AssessmentPage />} />
        <Route path="progress" element={<ProgressPage />} />
        <Route path="*" element={<Navigate to="home" replace />} />
      </Routes>
    </AppShell>
  );
}

import DemoAppShell from '@/pages/demo/DemoAppShell';
import DemoDashboardPage from '@/pages/demo/DemoDashboardPage';
import DemoClassManagementPage from '@/pages/demo/DemoClassManagementPage';
import DemoSettingsPage from '@/pages/demo/DemoSettingsPage';
import DemoCurriculumPage from '@/pages/demo/DemoCurriculumPage';
import DemoQuestionBuilderPage from '@/pages/demo/DemoQuestionBuilderPage';
import DemoAnalyticsPage from '@/pages/demo/DemoAnalyticsPage';
import DemoReviewQueuePage from '@/pages/demo/DemoReviewQueuePage';
import DemoTrendsPage from '@/pages/demo/DemoTrendsPage';
import DemoMisconceptionsPage from '@/pages/demo/DemoMisconceptionsPage';

function DemoRoutes() {
  return (
    <SelectedClassProvider>
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
    </SelectedClassProvider>
  );
}
import DemoLearnerRoutes from '@/pages/demo-learner/DemoLearnerRoutes';

function App() {
  return (
    <Routes>
      <Route path="/" element={<LandingPage />} />
      <Route path="/teacher/*" element={<TeacherRoutes />} />
      <Route path="/learner/*" element={<LearnerRoutes />} />
      <Route path="/demo/*" element={<DemoRoutes />} />
      <Route path="/demo-learner/*" element={<DemoLearnerRoutes />} />
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  );
}

export default App;
