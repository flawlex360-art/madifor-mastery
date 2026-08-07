import { useParams, useLocation, useNavigate } from 'react-router-dom';
import { useEffect } from 'react';
import { useAssessmentStore } from '@/stores/assessmentStore';
import { getLearnerSession, getPracticeContext } from '@/api/auth';
import AssessmentSession from '@/components/assessment/AssessmentSession';
import AssessmentErrorBoundary from '@/components/assessment/AssessmentErrorBoundary';

export default function AssessmentPage() {
  const { topicId } = useParams<{ topicId: string }>();
  const location = useLocation();
  const navigate = useNavigate();
  const topicName = (location.state as { topicName?: string })?.topicName || 'Topic';
  const { startAssessment, status, reset } = useAssessmentStore();

  useEffect(() => {
    const session = getLearnerSession();
    if (!session || !topicId) {
      navigate('/');
      return;
    }
    if (status === 'idle') {
      const ctx = getPracticeContext();
      startAssessment(session.learner_id, topicId, !!ctx);
    }
  }, [topicId, status, startAssessment, navigate]);

  return (
    <AssessmentErrorBoundary onReset={() => { reset(); navigate('/learner/home'); }}>
      <AssessmentSession
        topicName={topicName}
        onHome={() => { reset(); navigate('/learner/home'); }}
      />
    </AssessmentErrorBoundary>
  );
}
