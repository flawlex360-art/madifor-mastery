import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import { registerSW } from 'virtual:pwa-register';
import RootErrorBoundary from './components/ui/RootErrorBoundary';
import App from './App';
import './index.css';

// Register service worker without interrupting mid-assessment learners with blocking confirm() dialogs
registerSW({
  onOfflineReady() {
    // Offline shell ready
  },
});

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <RootErrorBoundary>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </RootErrorBoundary>
  </React.StrictMode>
);
