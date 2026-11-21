import { useState, useEffect, useCallback } from 'react';
import {
  Users,
  UserCheck,
  ShieldAlert,
  AlertTriangle,
  ShieldCheck,
  RefreshCw,
  Trash2,
} from 'lucide-react';
import {
  getAllTeachers,
  getPlatformStats,
  suspendTeacher,
  deleteTeacher,
  AdminTeacherRecord,
} from '@/api/admin';
import { useAuth } from '@/hooks/useAuth';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/Card';
import { useConfirmDialog } from '@/components/ui/ConfirmDialog';
import { toast } from '@/stores/toastStore';

export default function AdminDashboardPage() {
  const { teacher, loading: authLoading } = useAuth();
  const { confirm, ConfirmDialogComponent } = useConfirmDialog();

  const [teachers, setTeachers] = useState<AdminTeacherRecord[]>([]);
  const [stats, setStats] = useState({ totalLearners: 0, totalClasses: 0, totalTeachers: 0 });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  const [deleteId, setDeleteId] = useState<string | null>(null);
  const [deleteConfirmEmail, setDeleteConfirmEmail] = useState('');
  const [actionBusy, setActionBusy] = useState(false);

  const loadData = useCallback(async () => {
    try {
      setLoading(true);
      setError('');
      const [tList, st] = await Promise.all([getAllTeachers(), getPlatformStats()]);
      setTeachers(tList);
      setStats(st);
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : 'Failed to load admin data');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    if (authLoading) return;
    if (teacher?.is_admin) {
      loadData();
    } else {
      setLoading(false);
    }
  }, [teacher, authLoading, loadData]);

  if (authLoading || loading) {
    return (
      <div className="max-w-6xl mx-auto space-y-6">
        <div className="h-12 w-64 bg-slate-200 rounded-xl animate-pulse" />
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          {[1, 2, 3].map((n) => (
            <div key={n} className="h-28 bg-white border border-slate-200 rounded-xl animate-pulse" />
          ))}
        </div>
        <div className="h-64 bg-white border border-slate-200 rounded-xl animate-pulse" />
      </div>
    );
  }

  if (!teacher?.is_admin) {
    return (
      <div className="flex items-center justify-center h-[65vh]">
        <div className="text-center">
          <ShieldAlert className="w-16 h-16 text-rose-500 mx-auto mb-4" />
          <h2 className="text-2xl font-bold text-navy-900">Access Denied</h2>
          <p className="text-slate-500 mt-2">Administrator privileges are required to view this page.</p>
        </div>
      </div>
    );
  }

  const handleToggleSuspend = async (t: AdminTeacherRecord) => {
    const newStatus = t.status === 'active' ? 'suspended' : 'active';
    const confirmed = await confirm({
      title: newStatus === 'suspended' ? 'Suspend Teacher Account?' : 'Reactivate Teacher Account?',
      message:
        newStatus === 'suspended'
          ? `${t.full_name} will immediately lose access to their dashboard until reactivated.`
          : `${t.full_name} will regain full access to their classes and dashboard.`,
      confirmLabel: newStatus === 'suspended' ? 'Suspend' : 'Activate',
      variant: newStatus === 'suspended' ? 'danger' : 'warning',
    });
    if (!confirmed) return;

    setActionBusy(true);
    try {
      await suspendTeacher(t.id, newStatus);
      toast.success(
        newStatus === 'suspended'
          ? `Suspended ${t.full_name}.`
          : `Reactivated ${t.full_name}.`
      );
      await loadData();
    } catch (err: unknown) {
      toast.error(err instanceof Error ? err.message : 'Error updating teacher status');
    } finally {
      setActionBusy(false);
    }
  };

  const handleDelete = async () => {
    if (!deleteId || actionBusy) return;
    setActionBusy(true);
    try {
      await deleteTeacher(deleteId);
      toast.success('Teacher account deleted.');
      setDeleteId(null);
      setDeleteConfirmEmail('');
      await loadData();
    } catch (err: unknown) {
      toast.error(err instanceof Error ? err.message : 'Error deleting account');
    } finally {
      setActionBusy(false);
    }
  };

  const tToDelete = teachers.find((t) => t.id === deleteId);

  return (
    <div className="max-w-6xl mx-auto space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl sm:text-3xl font-bold text-navy-900 tracking-tight">
            Admin Console
          </h1>
          <p className="text-sm text-slate-500 mt-1">Platform overview and educator access control</p>
        </div>
        <button
          type="button"
          onClick={loadData}
          disabled={actionBusy}
          className="p-2.5 text-slate-500 hover:text-navy-900 hover:bg-slate-100 rounded-xl transition-colors"
          aria-label="Refresh admin data"
        >
          <RefreshCw className="w-5 h-5" />
        </button>
      </div>

      {error && (
        <div className="p-4 bg-rose-50 text-rose-700 rounded-xl border border-rose-200 text-sm">
          {error}
        </div>
      )}

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-slate-500">Total Teachers</p>
                <p className="text-3xl font-bold text-navy-900 tabular-nums mt-1">{stats.totalTeachers}</p>
              </div>
              <div className="w-12 h-12 bg-indigo-50 text-indigo-600 rounded-xl flex items-center justify-center flex-shrink-0">
                <UserCheck className="w-6 h-6" />
              </div>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-slate-500">Active Classes</p>
                <p className="text-3xl font-bold text-navy-900 tabular-nums mt-1">{stats.totalClasses}</p>
              </div>
              <div className="w-12 h-12 bg-slate-100 text-navy-700 rounded-xl flex items-center justify-center flex-shrink-0">
                <Users className="w-6 h-6" />
              </div>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-slate-500">Total Learners</p>
                <p className="text-3xl font-bold text-navy-900 tabular-nums mt-1">{stats.totalLearners}</p>
              </div>
              <div className="w-12 h-12 bg-emerald-50 text-emerald-600 rounded-xl flex items-center justify-center flex-shrink-0">
                <ShieldCheck className="w-6 h-6" />
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Teachers List */}
      <Card>
        <CardHeader>
          <CardTitle>Registered Teachers</CardTitle>
        </CardHeader>
        <CardContent className="p-0">
          <div className="overflow-x-auto">
            <table className="w-full text-sm text-left">
              <thead className="bg-slate-50 border-y border-slate-200 text-slate-500 text-xs uppercase tracking-wider">
                <tr>
                  <th className="px-6 py-3.5 font-semibold">Name</th>
                  <th className="px-6 py-3.5 font-semibold">Email</th>
                  <th className="px-6 py-3.5 font-semibold">School</th>
                  <th className="px-6 py-3.5 font-semibold">Registered</th>
                  <th className="px-6 py-3.5 font-semibold">Status</th>
                  <th className="px-6 py-3.5 font-semibold">Classes</th>
                  <th className="px-6 py-3.5 font-semibold text-right">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {teachers.map((t) => (
                  <tr key={t.id} className="hover:bg-slate-50/70 transition-colors">
                    <td className="px-6 py-4">
                      <div className="font-semibold text-navy-900">{t.full_name}</div>
                      {t.is_admin && (
                        <span className="inline-block mt-1 px-2 py-0.5 bg-indigo-50 text-indigo-700 text-xs font-medium rounded-full">
                          Admin
                        </span>
                      )}
                    </td>
                    <td className="px-6 py-4 text-slate-500">{t.email}</td>
                    <td className="px-6 py-4 text-navy-800 font-medium">
                      {t.school_name ? (
                        t.school_name
                      ) : (
                        <span className="italic text-slate-400 font-normal">Not provided</span>
                      )}
                    </td>
                    <td className="px-6 py-4 text-slate-500 whitespace-nowrap">
                      {new Date(t.created_at).toLocaleDateString('en-GB', {
                        month: 'short',
                        day: 'numeric',
                        year: 'numeric',
                      })}
                      <br />
                      <span className="text-xs text-slate-400">
                        {new Date(t.created_at).toLocaleTimeString('en-GB', {
                          hour: '2-digit',
                          minute: '2-digit',
                        })}
                      </span>
                    </td>
                    <td className="px-6 py-4">
                      <span
                        className={`inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium ${
                          t.status === 'active'
                            ? 'bg-emerald-50 text-emerald-700'
                            : 'bg-rose-50 text-rose-700'
                        }`}
                      >
                        {t.status === 'active' ? 'Active' : 'Suspended'}
                      </span>
                    </td>
                    <td className="px-6 py-4 text-slate-600 tabular-nums">{t.classes?.length || 0}</td>
                    <td className="px-6 py-4 text-right">
                      <div className="flex items-center justify-end gap-1.5">
                        {t.id === teacher.id ? (
                          <span className="text-xs font-medium text-slate-500 italic px-2.5 py-1 bg-slate-100 rounded-lg">
                            Current User
                          </span>
                        ) : (
                          <>
                            <button
                              type="button"
                              disabled={actionBusy}
                              onClick={() => handleToggleSuspend(t)}
                              className="p-2 text-slate-400 hover:text-amber-600 hover:bg-amber-50 rounded-lg transition-colors disabled:opacity-50"
                              title={t.status === 'active' ? 'Suspend Account' : 'Activate Account'}
                              aria-label={t.status === 'active' ? `Suspend ${t.full_name}` : `Activate ${t.full_name}`}
                            >
                              <AlertTriangle className="w-4 h-4" />
                            </button>
                            <button
                              type="button"
                              disabled={actionBusy}
                              onClick={() => setDeleteId(t.id)}
                              className="p-2 text-slate-400 hover:text-rose-600 hover:bg-rose-50 rounded-lg transition-colors disabled:opacity-50"
                              title="Delete Account permanently"
                              aria-label={`Delete ${t.full_name}`}
                            >
                              <Trash2 className="w-4 h-4" />
                            </button>
                          </>
                        )}
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      {/* Delete Confirmation Modal */}
      {deleteId && tToDelete && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-navy-950/50 backdrop-blur-sm">
          <div className="bg-white rounded-2xl shadow-xl border border-slate-200 w-full max-w-md overflow-hidden">
            <div className="p-6">
              <div className="w-12 h-12 bg-rose-100 rounded-full flex items-center justify-center text-rose-600 mb-4">
                <ShieldAlert className="w-6 h-6" />
              </div>
              <h3 className="text-xl font-bold text-navy-900 mb-2">Delete Teacher Account?</h3>
              <p className="text-slate-600 mb-4 text-sm leading-relaxed">
                You are about to permanently delete <strong className="text-navy-900">{tToDelete.full_name}</strong>.
                This action is irreversible and removes all their classes and enrolled learners.
              </p>

              <div className="mb-6">
                <label className="block text-sm font-medium text-navy-800 mb-2">
                  Type <strong>{tToDelete.email}</strong> to confirm:
                </label>
                <input
                  type="text"
                  value={deleteConfirmEmail}
                  onChange={(e) => setDeleteConfirmEmail(e.target.value)}
                  className="w-full px-4 py-2 border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-rose-500/20 focus:border-rose-500 text-sm"
                  placeholder={tToDelete.email}
                />
              </div>

              <div className="flex gap-3">
                <button
                  type="button"
                  disabled={actionBusy}
                  onClick={() => {
                    setDeleteId(null);
                    setDeleteConfirmEmail('');
                  }}
                  className="flex-1 px-4 py-2 text-sm font-medium text-slate-600 bg-slate-100 rounded-lg hover:bg-slate-200 transition-colors disabled:opacity-50"
                >
                  Cancel
                </button>
                <button
                  type="button"
                  onClick={handleDelete}
                  disabled={actionBusy || deleteConfirmEmail !== tToDelete.email}
                  className="flex-1 px-4 py-2 text-sm font-medium text-white bg-rose-600 rounded-lg hover:bg-rose-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {actionBusy ? 'Deleting...' : 'Delete Account'}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {ConfirmDialogComponent}
    </div>
  );
}
