import { Routes, Route, Navigate } from 'react-router-dom';
import DemoLearnerAppShell from './DemoLearnerAppShell';
import DemoLearnerHomePage from './DemoLearnerHomePage';
import DemoLearnerAssessmentPage from './DemoLearnerAssessmentPage';
import DemoLearnerProgressPage from './DemoLearnerProgressPage';

export default function DemoLearnerRoutes() {
  return (
    <DemoLearnerAppShell>
      <Routes>
        <Route path="home" element={<DemoLearnerHomePage />} />
        <Route path="assessment/:topicId" element={<DemoLearnerAssessmentPage />} />
        <Route path="progress" element={<DemoLearnerProgressPage />} />
        <Route path="*" element={<Navigate to="home" replace />} />
      </Routes>
    </DemoLearnerAppShell>
  );
}
