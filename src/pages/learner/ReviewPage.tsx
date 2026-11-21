import { useNavigate } from 'react-router-dom';
import { useEffect } from 'react';
import { useAssessmentStore } from '@/stores/assessmentStore';
import { getLearnerSession } from '@/api/auth';
import AssessmentSession from '@/components/assessment/AssessmentSession';
import AssessmentErrorBoundary from '@/components/assessment/AssessmentErrorBoundary';

export default function ReviewPage() {
  const navigate = useNavigate();
  const { startReviewSession, reset } = useAssessmentStore();

  useEffect(() => {
    const session = getLearnerSession();
    if (!session) {
      navigate('/');
      return;
    }
    startReviewSession(session.learner_id);

    return () => {
      useAssessmentStore.getState().reset();
    };
  }, [startReviewSession, navigate]);

  return (
    <AssessmentErrorBoundary onReset={() => { reset(); navigate('/learner/home'); }}>
      <AssessmentSession
        topicName="Spaced Repetition Review"
        onRetry={() => {
          const session = getLearnerSession();
          if (session) startReviewSession(session.learner_id);
        }}
        onHome={() => {
          reset();
          navigate('/learner/home');
        }}
      />
    </AssessmentErrorBoundary>
  );
}
