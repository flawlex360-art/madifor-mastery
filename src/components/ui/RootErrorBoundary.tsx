import { Component, type ErrorInfo, type ReactNode } from 'react';

interface RootErrorBoundaryProps {
  children: ReactNode;
}

interface RootErrorBoundaryState {
  hasError: boolean;
  message: string;
}

export default class RootErrorBoundary extends Component<
  RootErrorBoundaryProps,
  RootErrorBoundaryState
> {
  state: RootErrorBoundaryState = {
    hasError: false,
    message: '',
  };

  static getDerivedStateFromError(error: Error): RootErrorBoundaryState {
    return {
      hasError: true,
      message: error.message || 'An unexpected rendering error occurred.',
    };
  }

  componentDidCatch(error: Error, info: ErrorInfo) {
    console.error('Uncaught application error:', error, info.componentStack);
  }

  handleReload = () => {
    window.location.reload();
  };

  render() {
    if (this.state.hasError) {
      return (
        <div className="min-h-screen bg-slate-50 flex items-center justify-center p-4">
          <div className="max-w-md w-full bg-white border border-slate-200 rounded-2xl p-8 text-center shadow-sm">
            <div className="w-12 h-12 rounded-xl bg-rose-50 text-rose-600 flex items-center justify-center mx-auto mb-4 font-bold text-xl">
              !
            </div>
            <h1 className="text-xl font-bold text-navy-900 mb-2">
              Unable to load Madifor Mastery
            </h1>
            <p className="text-sm text-slate-600 mb-4 leading-relaxed">
              Something went wrong while starting the application. Please refresh the page to try again.
            </p>
            {this.state.message && (
              <p className="text-xs font-mono text-rose-700 bg-rose-50 border border-rose-200 rounded-lg p-3 mb-5 break-words text-left">
                {this.state.message}
              </p>
            )}
            <button
              type="button"
              onClick={this.handleReload}
              className="w-full px-5 py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white text-sm font-semibold rounded-xl transition-colors"
            >
              Reload Page
            </button>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}
