import { useState, useEffect, useCallback, useRef } from 'react';
import { useOnlineStatus } from './useOnlineStatus';
import {
  getPendingAttempts,
  removePendingAttempt,
  updatePendingAttempt,
  getPendingAttemptCount,
} from '@/lib/offline';
import { submitAttempt } from '@/api/assessment';
import { getLearnerSession } from '@/api/auth';

const MAX_RETRIES = 3;

export function useOfflineSync() {
  const isOnline = useOnlineStatus();
  const [pendingCount, setPendingCount] = useState(0);
  const [syncing, setSyncing] = useState(false);
  const [failedCount, setFailedCount] = useState(0);
  const syncingRef = useRef(false);

  const activeLearnerId = getLearnerSession()?.learner_id;

  const refreshCount = useCallback(async () => {
    if (!activeLearnerId) {
      setPendingCount(0);
      return 0;
    }
    const all = await getPendingAttempts(activeLearnerId);
    const activePending = all.filter((a) => (a.retries ?? 0) < MAX_RETRIES);
    const permanentFailed = all.length - activePending.length;
    setPendingCount(activePending.length);
    setFailedCount(permanentFailed);
    return activePending.length;
  }, [activeLearnerId]);

  useEffect(() => {
    refreshCount();
  }, [isOnline, refreshCount]);

  const syncPendingAttempts = useCallback(async () => {
    if (!isOnline || syncingRef.current || !activeLearnerId) return 0;

    syncingRef.current = true;
    setSyncing(true);
    let synced = 0;

    try {
      const pending = await getPendingAttempts(activeLearnerId);
      const retryable = pending.filter((a) => (a.retries ?? 0) < MAX_RETRIES);

      for (const attempt of retryable) {
        try {
          await submitAttempt({
            learner_id: attempt.learner_id,
            question_id: attempt.question_id,
            topic_id: attempt.topic_id,
            is_correct: attempt.is_correct,
            learner_answer: attempt.learner_answer,
            time_taken: attempt.time_taken,
            hints_used: attempt.hints_used,
            attempt_type: attempt.attempt_type,
            session_id: attempt.session_id,
            session_question_index: attempt.session_question_index,
          });
          await removePendingAttempt(attempt.id);
          synced++;
        } catch (err) {
          const msg = err instanceof Error ? err.message : 'Sync failed';
          const nextRetries = (attempt.retries ?? 0) + 1;
          await updatePendingAttempt({
            ...attempt,
            retries: nextRetries,
            last_error: msg,
          });
          // Only halt on connectivity/network failure; skip bad payloads cleanly so other items sync
          if (!navigator.onLine || /fetch|network|timeout/i.test(msg)) {
            break;
          }
        }
      }

      await getPendingAttemptCount(activeLearnerId);
      await refreshCount();
    } finally {
      syncingRef.current = false;
      setSyncing(false);
    }

    return synced;
  }, [isOnline, activeLearnerId, refreshCount]);

  // Auto-sync whenever online and pending items exist (includes pendingCount so initial mount triggers too)
  useEffect(() => {
    if (isOnline && pendingCount > 0 && activeLearnerId && !syncingRef.current) {
      syncPendingAttempts();
    }
  }, [isOnline, pendingCount, activeLearnerId, syncPendingAttempts]);

  return {
    pendingCount,
    failedCount,
    syncing,
    syncPendingAttempts,
    refreshCount,
  };
}
