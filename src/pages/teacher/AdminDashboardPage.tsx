import { useState, useEffect } from 'react';
import { 
  Users, UserCheck, ShieldAlert, AlertTriangle, ShieldCheck, RefreshCw, Trash2
} from 'lucide-react';
import { getAllTeachers, getPlatformStats, suspendTeacher, deleteTeacher, AdminTeacherRecord } from '@/api/admin';
import { useAuth } from '@/hooks/useAuth';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/Card';

export default function AdminDashboardPage() {
  const { teacher } = useAuth();
  const [teachers, setTeachers] = useState<AdminTeacherRecord[]>([]);
  const [stats, setStats] = useState({ totalLearners: 0, totalClasses: 0, totalTeachers: 0 });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  
  const [deleteId, setDeleteId] = useState<string | null>(null);
  const [deleteConfirmEmail, setDeleteConfirmEmail] = useState('');

  const loadData = async () => {
    try {
      setLoading(true);
      const [tList, st] = await Promise.all([getAllTeachers(), getPlatformStats()]);
      setTeachers(tList);
      setStats(st);
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : 'Failed to load admin data');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (teacher?.is_admin) {
      loadData();
    }
  }, [teacher]);

  if (!teacher?.is_admin) {
    return (
      <div className="flex items-center justify-center h-[70vh]">
        <div className="text-center">
          <ShieldAlert className="w-16 h-16 text-red-500 mx-auto mb-4" />
          <h2 className="text-2xl font-bold text-zinc-900">Access Denied</h2>
          <p className="text-zinc-500 mt-2">You do not have permission to view this page.</p>
        </div>
      </div>
    );
  }

  const handleToggleSuspend = async (t: AdminTeacherRecord) => {
    try {
      const newStatus = t.status === 'active' ? 'suspended' : 'active';
      await suspendTeacher(t.id, newStatus);
      await loadData();
    } catch (err: unknown) {
      alert(err instanceof Error ? err.message : 'Error updating status');
    }
  };

  const handleDelete = async () => {
    if (!deleteId) return;
    try {
      await deleteTeacher(deleteId);
      setDeleteId(null);
      setDeleteConfirmEmail('');
      await loadData();
    } catch (err: unknown) {
      alert(err instanceof Error ? err.message : 'Error deleting account');
    }
  };

  if (loading) {
    return <div className="p-8 text-center text-zinc-500">Loading admin dashboard...</div>;
  }

  const tToDelete = teachers.find(t => t.id === deleteId);

  return (
    <div className="max-w-6xl mx-auto space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold text-zinc-900 tracking-tight">Super Admin Dashboard</h1>
          <p className="text-zinc-500 mt-1">Platform overview and access control</p>
        </div>
        <button onClick={loadData} className="p-2 text-zinc-400 hover:text-zinc-900 transition-colors">
          <RefreshCw className="w-5 h-5" />
        </button>
      </div>

      {error && (
        <div className="p-4 bg-red-50 text-red-700 rounded-xl border border-red-200">
          {error}
        </div>
      )}

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-zinc-500">Total Teachers</p>
                <p className="text-3xl font-bold text-zinc-900">{stats.totalTeachers}</p>
              </div>
              <div className="w-12 h-12 bg-blue-50 text-blue-600 rounded-xl flex items-center justify-center">
                <UserCheck className="w-6 h-6" />
              </div>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-zinc-500">Active Classes</p>
                <p className="text-3xl font-bold text-zinc-900">{stats.totalClasses}</p>
              </div>
              <div className="w-12 h-12 bg-purple-50 text-purple-600 rounded-xl flex items-center justify-center">
                <Users className="w-6 h-6" />
              </div>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-zinc-500">Total Learners</p>
                <p className="text-3xl font-bold text-zinc-900">{stats.totalLearners}</p>
              </div>
              <div className="w-12 h-12 bg-emerald-50 text-emerald-600 rounded-xl flex items-center justify-center">
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
              <thead className="bg-zinc-50 border-y border-zinc-200 text-zinc-500">
                <tr>
                  <th className="px-6 py-4 font-medium">Name</th>
                  <th className="px-6 py-4 font-medium">Email</th>
                  <th className="px-6 py-4 font-medium">School</th>
                  <th className="px-6 py-4 font-medium">Registered</th>
                  <th className="px-6 py-4 font-medium">Status</th>
                  <th className="px-6 py-4 font-medium">Classes</th>
                  <th className="px-6 py-4 font-medium text-right">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-zinc-100">
                {teachers.map(t => (
                  <tr key={t.id} className="hover:bg-zinc-50/50 transition-colors">
                    <td className="px-6 py-4">
                      <div className="font-medium text-zinc-900">{t.full_name}</div>
                      {t.is_admin && <span className="inline-block mt-1 px-2 py-0.5 bg-blue-100 text-blue-700 text-xs rounded-full">Admin</span>}
                    </td>
                    <td className="px-6 py-4 text-zinc-500">{t.email}</td>
                    <td className="px-6 py-4 text-zinc-700 font-medium">
                      {t.school_name ? t.school_name : <span className="italic text-zinc-400 font-normal">Not provided</span>}
                    </td>
                    <td className="px-6 py-4 text-zinc-500 whitespace-nowrap">
                      {new Date(t.created_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
                      <br />
                      <span className="text-xs text-zinc-400">
                        {new Date(t.created_at).toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit' })}
                      </span>
                    </td>
                    <td className="px-6 py-4">
                      <span className={`inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium ${
                        t.status === 'active' ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-700'
                      }`}>
                        {t.status === 'active' ? 'Active' : 'Suspended'}
                      </span>
                    </td>
                    <td className="px-6 py-4 text-zinc-500">
                      {t.classes?.length || 0}
                    </td>
                    <td className="px-6 py-4 text-right">
                      <div className="flex items-center justify-end gap-2">
                        {t.id === teacher.id ? (
                          <span className="text-xs font-medium text-zinc-400 italic px-2 py-1 bg-zinc-100 rounded-md">
                            Current User
                          </span>
                        ) : (
                          <>
                            <button
                              onClick={() => handleToggleSuspend(t)}
                              className="p-2 text-zinc-400 hover:text-amber-600 transition-colors tooltip-trigger"
                              title={t.status === 'active' ? 'Suspend Account' : 'Activate Account'}
                            >
                              <AlertTriangle className="w-4 h-4" />
                            </button>
                            <button
                              onClick={() => setDeleteId(t.id)}
                              className="p-2 text-zinc-400 hover:text-red-600 transition-colors tooltip-trigger"
                              title="Delete Account permanently"
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
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-zinc-900/40 backdrop-blur-sm animate-in fade-in">
          <div className="bg-white rounded-2xl shadow-xl w-full max-w-md overflow-hidden">
            <div className="p-6">
              <div className="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center text-red-600 mb-4">
                <ShieldAlert className="w-6 h-6" />
              </div>
              <h3 className="text-xl font-bold text-zinc-900 mb-2">Delete Teacher Account?</h3>
              <p className="text-zinc-500 mb-4 text-sm leading-relaxed">
                You are about to permanently delete <strong className="text-zinc-900">{tToDelete.full_name}</strong>. 
                This action is irreversible and will also destroy all their classes and learner accounts.
              </p>
              
              <div className="mb-6">
                <label className="block text-sm font-medium text-zinc-700 mb-2">
                  Type <strong>{tToDelete.email}</strong> to confirm:
                </label>
                <input
                  type="text"
                  value={deleteConfirmEmail}
                  onChange={e => setDeleteConfirmEmail(e.target.value)}
                  className="w-full px-4 py-2 border border-zinc-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500/20 focus:border-red-500 transition-all"
                  placeholder={tToDelete.email}
                />
              </div>

              <div className="flex gap-3">
                <button
                  onClick={() => { setDeleteId(null); setDeleteConfirmEmail(''); }}
                  className="flex-1 px-4 py-2 text-sm font-medium text-zinc-600 bg-zinc-100 rounded-lg hover:bg-zinc-200 transition-colors"
                >
                  Cancel
                </button>
                <button
                  onClick={handleDelete}
                  disabled={deleteConfirmEmail !== tToDelete.email}
                  className="flex-1 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-lg hover:bg-red-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  Delete Account
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
