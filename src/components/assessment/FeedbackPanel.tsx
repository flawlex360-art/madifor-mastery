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
}

export default function FeedbackPanel({
  isCorrect, explanation, hints, hintsRevealed, onRevealHint, onNext, isLast,
}: FeedbackPanelProps) {
  return (
    <div className="mt-6 space-y-4">
      <div className={`p-4 rounded-lg ${isCorrect ? 'bg-green-50 border border-green-200' : 'bg-red-50 border border-red-200'}`}>
        <div className="flex items-center gap-2 mb-2">
          {isCorrect ? (
            <CheckCircle className="w-5 h-5 text-green-600" />
          ) : (
            <XCircle className="w-5 h-5 text-red-600" />
          )}
          <span className={`font-semibold ${isCorrect ? 'text-green-800' : 'text-red-800'}`}>
            {isCorrect ? 'Correct!' : 'Not quite right'}
          </span>
        </div>
        <p className={`text-sm ${isCorrect ? 'text-green-700' : 'text-red-700'}`}>
          {explanation}
        </p>
      </div>

      {!isCorrect && hintsRevealed < hints.length && (
        <div className="space-y-2">
          {hints.slice(0, hintsRevealed).map((hint, i) => (
            <div key={i} className="flex items-start gap-2 p-3 bg-amber-50 border border-amber-200 rounded-lg">
              <Lightbulb className="w-4 h-4 text-amber-600 mt-0.5 flex-shrink-0" />
              <p className="text-sm text-amber-800">{hint}</p>
            </div>
          ))}
          <Button variant="outline" size="sm" onClick={onRevealHint}>
            <Lightbulb className="w-4 h-4 mr-2" />
            Show Hint ({hintsRevealed + 1}/{hints.length})
          </Button>
        </div>
      )}

      <Button onClick={onNext} className="w-full" size="lg">
        {isLast ? 'Finish Assessment' : 'Next Question'}
      </Button>
    </div>
  );
}
