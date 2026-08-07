import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import { registerSW } from 'virtual:pwa-register';
import App from './App';
import './index.css';

// Register service worker for PWA
const updateSW = registerSW({
  onNeedRefresh() {
    // Could show a toast asking user to refresh
    if (confirm('New version available. Reload to update?')) {
      updateSW(true);
    }
  },
  onOfflineReady() {
    console.log('Madifor Mastery is ready for offline use');
  },
});

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </React.StrictMode>
);
