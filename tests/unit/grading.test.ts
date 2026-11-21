import { describe, expect, it } from 'vitest';
import {
  parseOptionsList,
  resolveCorrectOptionIndex,
  gradeClientAnswer,
  formatCorrectAnswerDisplay,
} from '@/lib/grading';

describe('parseOptionsList', () => {
  it('parses array and JSON string options and rejects invalid strings', () => {
    expect(parseOptionsList(['Solid', 'Liquid', 'Gas'])).toEqual(['Solid', 'Liquid', 'Gas']);
    expect(parseOptionsList('["A", "B", "C", "D"]')).toEqual(['A', 'B', 'C', 'D']);
    expect(parseOptionsList('not valid json')).toEqual([]);
    expect(parseOptionsList(null)).toEqual([]);
  });
});

describe('resolveCorrectOptionIndex', () => {
  const options = ['Solid', 'Liquid', 'Gas', 'Plasma'];

  it('resolves numeric and string indices', () => {
    expect(resolveCorrectOptionIndex(1, options)).toBe(1);
    expect(resolveCorrectOptionIndex('2', options)).toBe(2);
    expect(resolveCorrectOptionIndex(1.9, options)).toBe(1);
  });

  it('matches exact option text or first array element case-insensitively', () => {
    expect(resolveCorrectOptionIndex('liquid', options)).toBe(1);
    expect(resolveCorrectOptionIndex(['GAS'], options)).toBe(2);
    expect(resolveCorrectOptionIndex('Unknown', options)).toBeNull();
  });
});

describe('gradeClientAnswer', () => {
  it('grades multiple choice answers accurately', () => {
    const q = {
      question_type: 'multiple_choice' as const,
      options: ['Solid', 'Liquid', 'Gas', 'Plasma'],
      correct_answer: 1,
    };
    expect(gradeClientAnswer(q, 1)).toBe(true);
    expect(gradeClientAnswer(q, '1')).toBe(true);
    expect(gradeClientAnswer(q, 0)).toBe(false);
    expect(gradeClientAnswer(q, null)).toBe(false);
  });

  it('grades fill-in-the-blank variants with normalized whitespace and numeric tolerance', () => {
    const qPipe = {
      question_type: 'fill_in_blank' as const,
      options: null,
      correct_answer: '1,000|one thousand',
    };
    expect(gradeClientAnswer(qPipe, '1,000')).toBe(true);
    expect(gradeClientAnswer(qPipe, '  One   Thousand ')).toBe(true);
    expect(gradeClientAnswer(qPipe, '1')).toBe(false);
    expect(gradeClientAnswer(qPipe, '')).toBe(false);

    const qNumeric = {
      question_type: 'fill_in_blank' as const,
      options: null,
      correct_answer: ['0.5', 'half'],
    };
    expect(gradeClientAnswer(qNumeric, '0.500')).toBe(true);
    expect(gradeClientAnswer(qNumeric, 'HALF')).toBe(true);
    expect(gradeClientAnswer(qNumeric, '0.6')).toBe(false);
  });
});

describe('formatCorrectAnswerDisplay', () => {
  it('formats MCQ and fill-in answers cleanly', () => {
    expect(
      formatCorrectAnswerDisplay({
        question_type: 'multiple_choice',
        options: ['Solid', 'Liquid', 'Gas', 'Plasma'],
        correct_answer: 1,
      })
    ).toBe('B. Liquid');

    expect(
      formatCorrectAnswerDisplay({
        question_type: 'fill_in_blank',
        options: null,
        correct_answer: ['chlorophyll', 'chloroplast'],
      })
    ).toBe('chlorophyll or chloroplast');

    expect(
      formatCorrectAnswerDisplay({
        question_type: 'fill_in_blank',
        options: null,
        correct_answer: 'Newton',
      })
    ).toBe('Newton');
  });
});
