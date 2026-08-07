import { Wifi, WifiOff, RefreshCw, CloudOff } from 'lucide-react';
import { useOnlineStatus } from '@/hooks/useOnlineStatus';
import { useOfflineSync } from '@/hooks/useOfflineSync';

export default function OfflineIndicator() {
  const isOnline = useOnlineStatus();
  const { pendingCount, syncing, syncPendingAttempts } = useOfflineSync();

  // Don't show anything if online and nothing pending
  if (isOnline && pendingCount === 0) return null;

  return (
    <div className={`fixed bottom-4 right-4 z-50 flex items-center gap-2 px-4 py-2.5 rounded-xl shadow-lg border transition-all ${
      isOnline
        ? 'bg-amber-50 border-amber-200 text-amber-800'
        : 'bg-red-50 border-red-200 text-red-800'
    }`}>
      {isOnline ? (
        <>
          <Wifi className="w-4 h-4" />
          <span className="text-sm font-medium">
            {syncing
              ? 'Syncing...'
              : `${pendingCount} pending attempt${pendingCount !== 1 ? 's' : ''}`}
          </span>
          {!syncing && (
            <button
              onClick={syncPendingAttempts}
              className="p-1 hover:bg-amber-100 rounded transition-colors"
              title="Sync now"
            >
              <RefreshCw className="w-3.5 h-3.5" />
            </button>
          )}
        </>
      ) : (
        <>
          <WifiOff className="w-4 h-4" />
          <span className="text-sm font-medium">
            Offline
            {pendingCount > 0 && ` — ${pendingCount} pending`}
          </span>
          <CloudOff className="w-3.5 h-3.5 opacity-50" />
        </>
      )}
    </div>
  );
}
