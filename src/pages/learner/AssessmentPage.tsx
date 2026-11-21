import { useParams, useLocation, useNavigate } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { useAssessmentStore } from '@/stores/assessmentStore';
import { getTopicById } from '@/api/curriculum';
import { getLearnerSession, getPracticeContext } from '@/api/auth';
import AssessmentSession from '@/components/assessment/AssessmentSession';
import AssessmentErrorBoundary from '@/components/assessment/AssessmentErrorBoundary';

export default function AssessmentPage() {
  const { topicId } = useParams<{ topicId: string }>();
  const location = useLocation();
  const navigate = useNavigate();
  const stateTopicName = (location.state as { topicName?: string } | null)?.topicName;
  const [topicName, setTopicName] = useState<string>(stateTopicName || 'Topic Assessment');
  const { startAssessment, reset } = useAssessmentStore();

  useEffect(() => {
    const session = getLearnerSession();
    if (!session || !topicId) {
      navigate('/');
      return;
    }

    if (stateTopicName) {
      setTopicName(stateTopicName);
    } else if (navigator.onLine) {
      getTopicById(topicId)
        .then((t) => {
          if (t?.name) setTopicName(t.name as string);
        })
        .catch(() => {});
    }

    const ctx = getPracticeContext();
    startAssessment(session.learner_id, topicId, !!ctx);

    return () => {
      useAssessmentStore.getState().reset();
    };
  }, [topicId, startAssessment, navigate, stateTopicName]);

  return (
    <AssessmentErrorBoundary onReset={() => { reset(); navigate('/learner/home'); }}>
      <AssessmentSession
        topicName={topicName}
        onRetry={() => {
          const session = getLearnerSession();
          if (session && topicId) {
            const ctx = getPracticeContext();
            startAssessment(session.learner_id, topicId, !!ctx);
          }
        }}
        onHome={() => {
          reset();
          navigate('/learner/home');
        }}
      />
    </AssessmentErrorBoundary>
  );
}
