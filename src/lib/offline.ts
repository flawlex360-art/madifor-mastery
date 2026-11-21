import { openDB, type IDBPDatabase } from 'idb';

const DB_NAME = 'madifor-mastery';
const DB_VERSION = 3;

export const STORES = {
  PENDING_ATTEMPTS: 'pending_attempts',
  CACHED_QUESTIONS: 'cached_questions',
  CACHED_CURRICULUM: 'cached_curriculum',
  ASSESSMENT_STATE: 'assessment_state',
} as const;

interface MadiforDB {
  [STORES.PENDING_ATTEMPTS]: {
    key: string;
    value: PendingAttempt;
    indexes: { by_session: string; by_learner: string };
  };
  [STORES.CACHED_QUESTIONS]: {
    key: string;
    value: CachedQuestion;
    indexes: { by_topic: string };
  };
  [STORES.CACHED_CURRICULUM]: {
    key: string;
    value: CachedCurriculum;
  };
  [STORES.ASSESSMENT_STATE]: {
    key: string;
    value: SavedAssessmentState;
  };
}

export interface PendingAttempt {
  id: string;
  learner_id: string;
  question_id: string;
  topic_id: string;
  is_correct: boolean;
  learner_answer: unknown;
  time_taken: number;
  hints_used: number;
  attempt_type: string;
  session_id: string;
  session_question_index: number;
  created_at: string;
  retries?: number;
  last_error?: string;
}

export interface CachedQuestion {
  id: string;
  topic_id: string;
  owner_teacher_id?: string | null;
  question_type: string;
  stem: string;
  options: unknown;
  correct_answer: unknown;
  explanation: string;
  hints: string[] | null;
  difficulty: string;
  blooms_level: string;
  diagram_url?: string | null;
  visibility: string;
  cached_at?: number;
}

export interface CachedCurriculum {
  id: string;
  type: 'subject' | 'strand' | 'sub_strand' | 'topic';
  data: Record<string, unknown>;
  cached_at: string;
}

export interface SavedAssessmentState {
  id: string;
  session_id: string;
  learner_id: string;
  topic_id: string | null;
  questions: Record<string, unknown>[];
  answers: [string, Record<string, unknown>][];
  current_index: number;
  practice_mode: boolean;
  is_review_mode?: boolean;
  saved_at: string;
}

let dbPromise: Promise<IDBPDatabase<MadiforDB>> | null = null;

function getDB(): Promise<IDBPDatabase<MadiforDB>> {
  if (!dbPromise) {
    dbPromise = openDB<MadiforDB>(DB_NAME, DB_VERSION, {
      async upgrade(db, oldVersion, _newVersion, tx) {
        if (!db.objectStoreNames.contains(STORES.PENDING_ATTEMPTS)) {
          const store = db.createObjectStore(STORES.PENDING_ATTEMPTS, { keyPath: 'id' });
          store.createIndex('by_session', 'session_id');
          store.createIndex('by_learner', 'learner_id');
        } else {
          const store = tx.objectStore(STORES.PENDING_ATTEMPTS);
          if (!store.indexNames.contains('by_learner')) {
            store.createIndex('by_learner', 'learner_id');
          }
        }

        if (!db.objectStoreNames.contains(STORES.CACHED_QUESTIONS)) {
          const store = db.createObjectStore(STORES.CACHED_QUESTIONS, { keyPath: 'id' });
          store.createIndex('by_topic', 'topic_id');
        }

        if (!db.objectStoreNames.contains(STORES.CACHED_CURRICULUM)) {
          db.createObjectStore(STORES.CACHED_CURRICULUM, { keyPath: 'id' });
        }

        if (!db.objectStoreNames.contains(STORES.ASSESSMENT_STATE)) {
          db.createObjectStore(STORES.ASSESSMENT_STATE, { keyPath: 'id' });
        }

        if (oldVersion > 0 && oldVersion < DB_VERSION) {
          try {
            await tx.objectStore(STORES.CACHED_QUESTIONS).clear();
            await tx.objectStore(STORES.ASSESSMENT_STATE).clear();
          } catch (e) {
            console.warn('Could not clear legacy cache stores:', e);
          }
        }
      },
    }).catch((err) => {
      dbPromise = null;
      throw err;
    });
  }
  return dbPromise;
}

// ============================================================
// Pending Attempts (offline queue — scoped per learner_id)
// ============================================================

export async function savePendingAttempt(attempt: PendingAttempt): Promise<void> {
  const db = await getDB();
  await db.put(STORES.PENDING_ATTEMPTS, { retries: 0, ...attempt });
}

export async function updatePendingAttempt(attempt: PendingAttempt): Promise<void> {
  const db = await getDB();
  await db.put(STORES.PENDING_ATTEMPTS, attempt);
}

export async function getPendingAttempts(learnerId?: string): Promise<PendingAttempt[]> {
  const db = await getDB();
  if (learnerId) {
    return db.getAllFromIndex(STORES.PENDING_ATTEMPTS, 'by_learner', learnerId);
  }
  return db.getAll(STORES.PENDING_ATTEMPTS);
}

export async function getPendingAttemptsBySession(sessionId: string): Promise<PendingAttempt[]> {
  const db = await getDB();
  return db.getAllFromIndex(STORES.PENDING_ATTEMPTS, 'by_session', sessionId);
}

export async function removePendingAttempt(id: string): Promise<void> {
  const db = await getDB();
  await db.delete(STORES.PENDING_ATTEMPTS, id);
}

export async function clearPendingAttempts(): Promise<void> {
  const db = await getDB();
  await db.clear(STORES.PENDING_ATTEMPTS);
}

export async function getPendingAttemptCount(learnerId?: string): Promise<number> {
  const db = await getDB();
  if (learnerId) {
    return db.countFromIndex(STORES.PENDING_ATTEMPTS, 'by_learner', learnerId);
  }
  return db.count(STORES.PENDING_ATTEMPTS);
}

// ============================================================
// Cached Questions (offline assessment)
// ============================================================

const MAX_CACHED_QUESTIONS = 500;

export async function cacheQuestions(questions: CachedQuestion[]): Promise<void> {
  const db = await getDB();
  const now = Date.now();
  const tx = db.transaction(STORES.CACHED_QUESTIONS, 'readwrite');
  for (const q of questions) {
    await tx.store.put({ ...q, cached_at: now });
  }
  await tx.done;

  const allItems = await db.getAll(STORES.CACHED_QUESTIONS);
  if (allItems.length > MAX_CACHED_QUESTIONS) {
    const excess = allItems.length - MAX_CACHED_QUESTIONS;
    allItems.sort((a, b) => (a.cached_at ?? 0) - (b.cached_at ?? 0));
    const toDelete = allItems.slice(0, excess);
    const cleanupTx = db.transaction(STORES.CACHED_QUESTIONS, 'readwrite');
    for (const item of toDelete) {
      await cleanupTx.store.delete(item.id);
    }
    await cleanupTx.done;
  }
}

export async function getCachedQuestionsByTopic(topicId: string): Promise<CachedQuestion[]> {
  const db = await getDB();
  return db.getAllFromIndex(STORES.CACHED_QUESTIONS, 'by_topic', topicId);
}

export async function getCachedQuestionCount(): Promise<number> {
  const db = await getDB();
  return db.count(STORES.CACHED_QUESTIONS);
}

export async function clearCachedQuestions(): Promise<void> {
  const db = await getDB();
  await db.clear(STORES.CACHED_QUESTIONS);
}

// ============================================================
// Assessment State (browser refresh recovery)
// ============================================================

export async function saveAssessmentState(state: SavedAssessmentState): Promise<void> {
  const db = await getDB();
  await db.put(STORES.ASSESSMENT_STATE, state);
}

export async function getAssessmentState(id: string): Promise<SavedAssessmentState | undefined> {
  const db = await getDB();
  return db.get(STORES.ASSESSMENT_STATE, id);
}

export async function clearAssessmentState(id: string): Promise<void> {
  const db = await getDB();
  await db.delete(STORES.ASSESSMENT_STATE, id);
}

export async function clearSessionRecoveryAndQuestionCache(): Promise<void> {
  try {
    const db = await getDB();
    await db.clear(STORES.ASSESSMENT_STATE);
    await db.clear(STORES.CACHED_QUESTIONS);
    // Clean legacy DB if present on device
    if (typeof indexedDB !== 'undefined' && typeof indexedDB.deleteDatabase === 'function') {
      indexedDB.deleteDatabase('flawlex-mastery');
    }
  } catch {
    // Ignore storage errors during logout cleanup
  }
}

export function isOnline(): boolean {
  return navigator.onLine;
}

export function generateOfflineId(): string {
  return `offline_${Date.now()}_${Math.random().toString(36).slice(2, 9)}`;
}
