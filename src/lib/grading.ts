import type { Question } from '@/types/curriculum';

const PURE_NUMBER_RE = /^-?\d+(?:\.\d+)?$/;

export function parseOptionsList(rawOptions: unknown): string[] {
  if (Array.isArray(rawOptions)) {
    return rawOptions.map((o) => String(o));
  }
  if (typeof rawOptions === 'string') {
    try {
      const parsed = JSON.parse(rawOptions);
      if (Array.isArray(parsed)) return parsed.map((o) => String(o));
    } catch {
      return [];
    }
  }
  return [];
}

export function resolveCorrectOptionIndex(correctAnswer: unknown, options: string[]): number | null {
  if (typeof correctAnswer === 'number' && Number.isFinite(correctAnswer)) {
    return Math.trunc(correctAnswer);
  }
  if (typeof correctAnswer === 'string') {
    const trimmed = correctAnswer.trim();
    if (/^\d+$/.test(trimmed)) return Number(trimmed);
    const matched = options.findIndex((o) => o.trim().toLowerCase() === trimmed.toLowerCase());
    return matched >= 0 ? matched : null;
  }
  if (Array.isArray(correctAnswer) && correctAnswer.length > 0) {
    const first = String(correctAnswer[0]).trim();
    if (/^\d+$/.test(first)) return Number(first);
    const matched = options.findIndex((o) => o.trim().toLowerCase() === first.toLowerCase());
    return matched >= 0 ? matched : null;
  }
  return null;
}

function normalizeText(str: string): string {
  return str.toLowerCase().trim().replace(/\s+/g, ' ');
}

function extractFillCandidates(correctAnswer: unknown): string[] {
  if (Array.isArray(correctAnswer)) {
    return correctAnswer.map((c) => normalizeText(String(c))).filter(Boolean);
  }
  if (typeof correctAnswer === 'string') {
    // Split on '|' only so formatted numbers like "1,000" stay intact
    return correctAnswer.split('|').map(normalizeText).filter(Boolean);
  }
  if (typeof correctAnswer === 'number' && Number.isFinite(correctAnswer)) {
    return [String(correctAnswer)];
  }
  return [];
}

/**
 * Authoritative client-side grading mirror of PostgreSQL `grade_answer()`.
 */
export function gradeClientAnswer(
  question: Pick<Question, 'question_type' | 'correct_answer' | 'options'>,
  selectedAnswer: number | string | null
): boolean {
  if (selectedAnswer === null || selectedAnswer === undefined) return false;

  if (question.question_type === 'multiple_choice') {
    const options = parseOptionsList(question.options);
    const correctIdx = resolveCorrectOptionIndex(question.correct_answer, options);
    const selectedIdx = typeof selectedAnswer === 'number'
      ? Math.trunc(selectedAnswer)
      : (/^\d+$/.test(String(selectedAnswer).trim()) ? Number(selectedAnswer) : NaN);
    return correctIdx !== null && Number.isFinite(selectedIdx) && selectedIdx === correctIdx;
  }

  if (question.question_type === 'fill_in_blank') {
    const selected = normalizeText(String(selectedAnswer));
    if (!selected) return false;
    const candidates = extractFillCandidates(question.correct_answer);
    for (const cand of candidates) {
      if (selected === cand) return true;
      if (PURE_NUMBER_RE.test(selected) && PURE_NUMBER_RE.test(cand)) {
        if (Math.abs(Number(selected) - Number(cand)) < 1e-6) return true;
      }
    }
    return false;
  }

  const normalizedSelected = normalizeText(String(selectedAnswer));
  if (!normalizedSelected) return false;
  return normalizedSelected === normalizeText(String(question.correct_answer ?? ''));
}

export function formatCorrectAnswerDisplay(
  question: Pick<Question, 'question_type' | 'correct_answer' | 'options'>
): string {
  if (question.question_type === 'multiple_choice') {
    const options = parseOptionsList(question.options);
    const idx = resolveCorrectOptionIndex(question.correct_answer, options);
    if (idx !== null && options[idx] !== undefined) {
      return `${String.fromCharCode(65 + idx)}. ${options[idx]}`;
    }
  }
  if (Array.isArray(question.correct_answer)) {
    return question.correct_answer.join(' or ');
  }
  return String(question.correct_answer ?? '—');
}
