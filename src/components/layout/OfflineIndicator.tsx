import { Wifi, WifiOff, RefreshCw, CloudOff, AlertTriangle } from 'lucide-react';
import { useOnlineStatus } from '@/hooks/useOnlineStatus';
import { useOfflineSync } from '@/hooks/useOfflineSync';

export default function OfflineIndicator() {
  const isOnline = useOnlineStatus();
  const { pendingCount, failedCount, syncing, syncPendingAttempts } = useOfflineSync();

  if (isOnline && pendingCount === 0 && failedCount === 0) return null;

  return (
    <div
      className={`fixed bottom-4 right-4 z-40 flex items-center gap-2 px-4 py-2.5 rounded-xl shadow-lg border transition-all ${
        !isOnline
          ? 'bg-red-50 border-red-200 text-red-800'
          : failedCount > 0 && pendingCount === 0
            ? 'bg-red-50 border-red-200 text-red-800'
            : 'bg-amber-50 border-amber-200 text-amber-800'
      }`}
    >
      {isOnline ? (
        pendingCount > 0 ? (
          <>
            <Wifi className="w-4 h-4" />
            <span className="text-sm font-medium">
              {syncing
                ? 'Syncing...'
                : `${pendingCount} pending attempt${pendingCount !== 1 ? 's' : ''}`}
            </span>
            {!syncing && (
              <button
                type="button"
                onClick={() => syncPendingAttempts()}
                aria-label="Sync pending attempts now"
                className="p-1 hover:bg-amber-100 rounded transition-colors"
                title="Sync now"
              >
                <RefreshCw className="w-3.5 h-3.5" />
              </button>
            )}
          </>
        ) : (
          <>
            <AlertTriangle className="w-4 h-4" />
            <span className="text-sm font-medium">
              {failedCount} queued answer{failedCount !== 1 ? 's' : ''} failed to sync
            </span>
          </>
        )
      ) : (
        <>
          <WifiOff className="w-4 h-4" />
          <span className="text-sm font-medium">
            Offline
            {pendingCount > 0 && ` — ${pendingCount} saved locally`}
          </span>
          <CloudOff className="w-3.5 h-3.5 opacity-60" />
        </>
      )}
    </div>
  );
}
