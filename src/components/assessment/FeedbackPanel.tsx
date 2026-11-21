import { CheckCircle, XCircle, Lightbulb } from 'lucide-react';
import Button from '@/components/ui/Button';

interface FeedbackPanelProps {
  isCorrect: boolean;
  explanation: string;
  hints: string[];
  hintsRevealed: number;
  onRevealHint: () => void;
  onNext: () => void;
  isLast: boolean;
  isLoadingNext?: boolean;
}

export default function FeedbackPanel({
  isCorrect,
  explanation,
  hints,
  hintsRevealed,
  onRevealHint,
  onNext,
  isLast,
  isLoadingNext,
}: FeedbackPanelProps) {
  return (
    <div className="mt-6 space-y-4">
      <div
        className={`p-4 rounded-xl border ${
          isCorrect ? 'bg-green-50 border-green-200' : 'bg-red-50 border-red-200'
        }`}
      >
        <div className="flex items-center gap-2 mb-2">
          {isCorrect ? (
            <CheckCircle className="w-5 h-5 text-green-600" />
          ) : (
            <XCircle className="w-5 h-5 text-red-600" />
          )}
          <span className={`font-bold ${isCorrect ? 'text-green-800' : 'text-red-800'}`}>
            {isCorrect ? 'Correct!' : 'Not quite right'}
          </span>
        </div>
        <p className={`text-sm leading-relaxed ${isCorrect ? 'text-green-800' : 'text-red-800'}`}>
          {explanation}
        </p>
      </div>

      {/* Keep revealed hints visible even after reaching hintsRevealed === hints.length */}
      {!isCorrect && hints.length > 0 && (
        <div className="space-y-2">
          {hintsRevealed > 0 &&
            hints.slice(0, hintsRevealed).map((hint, i) => (
              <div
                key={i}
                className="flex items-start gap-2.5 p-3 bg-amber-50 border border-amber-200 rounded-xl"
              >
                <Lightbulb className="w-4 h-4 text-amber-600 mt-0.5 flex-shrink-0" />
                <p className="text-sm text-amber-900">{hint}</p>
              </div>
            ))}
          {hintsRevealed < hints.length && (
            <Button variant="outline" size="sm" onClick={onRevealHint}>
              <Lightbulb className="w-4 h-4 mr-1.5 text-amber-500" />
              Show Hint ({hintsRevealed + 1}/{hints.length})
            </Button>
          )}
        </div>
      )}

      <Button onClick={onNext} className="w-full" size="lg" disabled={isLoadingNext}>
        {isLoadingNext ? 'Loading next question...' : isLast ? 'Finish Assessment' : 'Next Question'}
      </Button>
    </div>
  );
}
