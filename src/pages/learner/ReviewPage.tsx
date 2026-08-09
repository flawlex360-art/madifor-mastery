import { useNavigate } from 'react-router-dom';
import { useEffect } from 'react';
import { useAssessmentStore } from '@/stores/assessmentStore';
import { getLearnerSession } from '@/api/auth';
import AssessmentSession from '@/components/assessment/AssessmentSession';
import AssessmentErrorBoundary from '@/components/assessment/AssessmentErrorBoundary';

export default function ReviewPage() {
  const navigate = useNavigate();
  const { startReviewSession, status, reset } = useAssessmentStore();

  useEffect(() => {
    const session = getLearnerSession();
    if (!session) {
      navigate('/');
      return;
    }
    if (status === 'idle') {
      startReviewSession(session.learner_id);
    }
  }, [status, startReviewSession, navigate]);

  return (
    <AssessmentErrorBoundary onReset={() => { reset(); navigate('/learner/home'); }}>
      <AssessmentSession
        topicName="Review Session"
        onHome={() => { reset(); navigate('/learner/home'); }}
      />
    </AssessmentErrorBoundary>
  );
}
