import { describe, expect, it } from 'vitest';
import { csvEscape, computeBeceReadiness } from '@/lib/exportUtils';

describe('csvEscape', () => {
  it('escapes commas, quotes, newlines and prevents spreadsheet formula injection', () => {
    expect(csvEscape('Ama Mensah')).toBe('Ama Mensah');
    expect(csvEscape(null)).toBe('');
    expect(csvEscape(undefined)).toBe('');
    expect(csvEscape('Basic 8, Section A')).toBe('"Basic 8, Section A"');
    expect(csvEscape('He said "Yes"')).toBe('"He said ""Yes"""');
    expect(csvEscape('Line1\nLine2')).toBe('"Line1\nLine2"');

    expect(csvEscape('=SUM(A1:A5)')).toBe("'=SUM(A1:A5)");
    expect(csvEscape('+1+1')).toBe("'+1+1");
    expect(csvEscape('-2*3')).toBe("'-2*3");
    expect(csvEscape('@cmd')).toBe("'@cmd");
    expect(csvEscape('\tcmd')).toBe("'\tcmd");
  });
});

describe('computeBeceReadiness', () => {
  it('computes weighted 70% retained + 30% first-pass readiness and clamps bounds', () => {
    expect(computeBeceReadiness(5, 5, 0)).toBe(0);
    expect(computeBeceReadiness(10, 10, 10)).toBe(100);
    expect(computeBeceReadiness(5, 10, 10)).toBe(65);
    expect(computeBeceReadiness(0, 10, 10)).toBe(30);
    expect(computeBeceReadiness(15, 20, 10)).toBe(100);
    expect(computeBeceReadiness(-3, -2, 10)).toBe(0);
  });
});
