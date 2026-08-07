import { openDB, type IDBPDatabase } from 'idb';

const DB_NAME = 'flawlex-mastery';
const DB_VERSION = 1;

// Store names
export const STORES = {
  PENDING_ATTEMPTS: 'pending_attempts',
  CACHED_QUESTIONS: 'cached_questions',
  CACHED_CURRICULUM: 'cached_curriculum',
  ASSESSMENT_STATE: 'assessment_state',
} as const;

interface FlawlexDB {
  [STORES.PENDING_ATTEMPTS]: {
    key: string;
    value: PendingAttempt;
    indexes: { by_session: string };
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
}

export interface CachedQuestion {
  id: string;
  topic_id: string;
  question_type: string;
  stem: string;
  options: unknown;
  correct_answer: unknown;
  explanation: string;
  hints: string[] | null;
  difficulty: string;
  blooms_level: string;
  visibility: string;
}

export interface CachedCurriculum {
  id: string;
  type: 'subject' | 'strand' | 'sub_strand' | 'topic';
  data: Record<string, unknown>;
  cached_at: string;
}

export interface SavedAssessmentState {
  id: string; // learner_id + topic_id
  session_id: string;
  learner_id: string;
  topic_id: string;
  questions: Record<string, unknown>[];
  answers: [string, Record<string, unknown>][];
  current_index: number;
  practice_mode: boolean;
  saved_at: string;
}

let dbPromise: Promise<IDBPDatabase<FlawlexDB>> | null = null;

function getDB(): Promise<IDBPDatabase<FlawlexDB>> {
  if (!dbPromise) {
    dbPromise = openDB<FlawlexDB>(DB_NAME, DB_VERSION, {
      upgrade(db) {
        // Pending attempts
        if (!db.objectStoreNames.contains(STORES.PENDING_ATTEMPTS)) {
          const store = db.createObjectStore(STORES.PENDING_ATTEMPTS, { keyPath: 'id' });
          store.createIndex('by_session', 'session_id');
        }

        // Cached questions
        if (!db.objectStoreNames.contains(STORES.CACHED_QUESTIONS)) {
          const store = db.createObjectStore(STORES.CACHED_QUESTIONS, { keyPath: 'id' });
          store.createIndex('by_topic', 'topic_id');
        }

        // Cached curriculum
        if (!db.objectStoreNames.contains(STORES.CACHED_CURRICULUM)) {
          db.createObjectStore(STORES.CACHED_CURRICULUM, { keyPath: 'id' });
        }

        // Assessment state (for browser refresh recovery)
        if (!db.objectStoreNames.contains(STORES.ASSESSMENT_STATE)) {
          db.createObjectStore(STORES.ASSESSMENT_STATE, { keyPath: 'id' });
        }
      },
    });
  }
  return dbPromise;
}

// ============================================================
// Pending Attempts (offline queue)
// ============================================================

export async function savePendingAttempt(attempt: PendingAttempt): Promise<void> {
  const db = await getDB();
  await db.put(STORES.PENDING_ATTEMPTS, attempt);
}

export async function getPendingAttempts(): Promise<PendingAttempt[]> {
  const db = await getDB();
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

export async function getPendingAttemptCount(): Promise<number> {
  const db = await getDB();
  return db.count(STORES.PENDING_ATTEMPTS);
}

// ============================================================
// Cached Questions (offline assessment)
// ============================================================

const MAX_CACHED_QUESTIONS = 500; // H-6: Cap cache size for low-end devices

export async function cacheQuestions(questions: CachedQuestion[]): Promise<void> {
  const db = await getDB();
  const tx = db.transaction(STORES.CACHED_QUESTIONS, 'readwrite');
  for (const q of questions) {
    await tx.store.put(q);
  }
  await tx.done;

  // H-6: Enforce cache size limit — remove oldest entries if over cap
  const count = await db.count(STORES.CACHED_QUESTIONS);
  if (count > MAX_CACHED_QUESTIONS) {
    const excess = count - MAX_CACHED_QUESTIONS;
    const allKeys = await db.getAllKeys(STORES.CACHED_QUESTIONS);
    const keysToDelete = allKeys.slice(0, excess);
    const cleanupTx = db.transaction(STORES.CACHED_QUESTIONS, 'readwrite');
    for (const key of keysToDelete) {
      await cleanupTx.store.delete(key);
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

// ============================================================
// Utilities
// ============================================================

export function isOnline(): boolean {
  return navigator.onLine;
}

export function generateOfflineId(): string {
  return `offline_${Date.now()}_${Math.random().toString(36).slice(2, 9)}`;
}
