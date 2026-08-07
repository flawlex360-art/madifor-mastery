import { Component, type ReactNode } from 'react';
import Button from '@/components/ui/Button';

interface Props {
  children: ReactNode;
  onReset?: () => void;
}

interface State {
  hasError: boolean;
  error: Error | null;
}

export default class AssessmentErrorBoundary extends Component<Props, State> {
  constructor(props: Props) {
    super(props);
    this.state = { hasError: false, error: null };
  }

  static getDerivedStateFromError(error: Error): State {
    return { hasError: true, error };
  }

  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    console.error('Assessment error:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <div className="max-w-md mx-auto py-12 text-center">
          <div className="w-16 h-16 mx-auto mb-4 rounded-full bg-red-100 flex items-center justify-center">
            <span className="text-2xl">!</span>
          </div>
          <h2 className="text-xl font-bold text-zinc-900 mb-2">Something went wrong</h2>
          <p className="text-gray-500 mb-6">
            The assessment encountered an error. Your progress up to this point has been saved.
          </p>
          <div className="flex gap-3 justify-center">
            <Button
              onClick={() => {
                this.setState({ hasError: false, error: null });
                this.props.onReset?.();
              }}
            >
              Try Again
            </Button>
            <Button variant="outline" onClick={() => window.location.href = '/learner/home'}>
              Go Home
            </Button>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}
