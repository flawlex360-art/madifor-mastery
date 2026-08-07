import { useState, useEffect, useCallback } from 'react';
import { useOnlineStatus } from './useOnlineStatus';
import {
  getPendingAttempts,
  removePendingAttempt,
  getPendingAttemptCount,
} from '@/lib/offline';
import { submitAttempt } from '@/api/assessment';

export function useOfflineSync() {
  const isOnline = useOnlineStatus();
  const [pendingCount, setPendingCount] = useState(0);
  const [syncing, setSyncing] = useState(false);

  // Check pending count on mount and when online status changes
  useEffect(() => {
    getPendingAttemptCount().then(setPendingCount);
  }, [isOnline]);

  const syncPendingAttempts = useCallback(async () => {
    if (!isOnline || syncing) return;

    const pending = await getPendingAttempts();
    if (pending.length === 0) return;

    setSyncing(true);
    let synced = 0;

    for (const attempt of pending) {
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
      } catch {
        // If a single attempt fails, stop and retry later
        break;
      }
    }

    const remaining = await getPendingAttemptCount();
    setPendingCount(remaining);
    setSyncing(false);

    return synced;
  }, [isOnline, syncing]);

  // Auto-sync when coming back online
  useEffect(() => {
    if (isOnline && pendingCount > 0) {
      syncPendingAttempts();
    }
  }, [isOnline]);

  return {
    pendingCount,
    syncing,
    syncPendingAttempts,
    refreshCount: () => getPendingAttemptCount().then(setPendingCount),
  };
}
