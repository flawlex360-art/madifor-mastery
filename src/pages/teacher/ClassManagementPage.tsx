import { useState, useEffect, useCallback } from 'react';
import { useAuth } from '@/hooks/useAuth';
import { useSelectedClass } from '@/context/SelectedClassContext';
import {
  createClass,
  getClassLearners,
  addLearner,
  removeLearner,
  updateLearner,
  migrateLearner,
} from '@/api/auth';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Select from '@/components/ui/Select';
import DeleteLearnerDialog from '@/components/teacher/DeleteLearnerDialog';
import EditLearnerDialog from '@/components/teacher/EditLearnerDialog';
import MigrateLearnerDialog from '@/components/teacher/MigrateLearnerDialog';
import type { Learner } from '@/types/auth';
import { Plus, Users, Trash2, Mail, Pencil, ArrowRightLeft, ChevronRight, Hash } from 'lucide-react';
import { toast } from '@/stores/toastStore';

export default function ClassManagementPage() {
  const { teacher } = useAuth();
  const {
    classes,
    selectedClassId,
    selectedClass,
    setSelectedClassId,
    refreshClasses,
  } = useSelectedClass();

  const [learners, setLearners] = useState<Learner[]>([]);
  const [learnersLoading, setLearnersLoading] = useState(false);
  const [showNewClass, setShowNewClass] = useState(false);
  const [showAddLearner, setShowAddLearner] = useState(false);
  const [creatingClass, setCreatingClass] = useState(false);
  const [addingLearner, setAddingLearner] = useState(false);
  const [addLearnerError, setAddLearnerError] = useState('');
  const [addLearnerSuccess, setAddLearnerSuccess] = useState('');

  // New learner form
  const [learnerName, setLearnerName] = useState('');
  const [learnerEmail, setLearnerEmail] = useState('');
  const [learnerPassword, setLearnerPassword] = useState('');

  // New class form
  const [newName, setNewName] = useState('');
  const [newLevel, setNewLevel] = useState<'B7' | 'B8' | 'B9'>('B8');

  // Dialog states
  const [deleteTarget, setDeleteTarget] = useState<Learner | null>(null);
  const [editTarget, setEditTarget] = useState<Learner | null>(null);
  const [migrateTarget, setMigrateTarget] = useState<Learner | null>(null);
  const [dialogLoading, setDialogLoading] = useState(false);

  const handleClassNameChange = (name: string) => {
    setNewName(name);
    const basicMatch = name.match(/\b(?:Basic|B)\s*([789])/i);
    const jhsMatch = name.match(/\bJHS\s*([123])/i);
    if (basicMatch) {
      setNewLevel(`B${basicMatch[1]}` as 'B7' | 'B8' | 'B9');
    } else if (jhsMatch) {
      const levelNum = Number(jhsMatch[1]) + 6;
      setNewLevel(`B${levelNum}` as 'B7' | 'B8' | 'B9');
    }
  };

  const loadLearners = useCallback(async (classId: string) => {
    setLearnersLoading(true);
    try {
      const ls = await getClassLearners(classId);
      setLearners(ls);
    } catch (err) {
      console.error('Failed to load learners:', err);
      toast.error('Failed to load class roster.');
    } finally {
      setLearnersLoading(false);
    }
  }, []);

  useEffect(() => {
    if (selectedClassId) {
      loadLearners(selectedClassId);
    } else {
      setLearners([]);
    }
  }, [selectedClassId, loadLearners]);

  const handleCreateClass = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!teacher || !newName.trim()) return;
    setCreatingClass(true);
    try {
      const created = await createClass(teacher.id, newName.trim(), newLevel, teacher.school_id);
      setNewName('');
      setShowNewClass(false);
      await refreshClasses();
      setSelectedClassId(created.id);
      toast.success(`Class "${created.name}" created.`);
    } catch (err) {
      console.error('Failed to create class:', err);
      toast.error(err instanceof Error ? err.message : 'Failed to create class.');
    } finally {
      setCreatingClass(false);
    }
  };

  const handleAddLearner = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedClass) return;
    setAddLearnerError('');
    setAddLearnerSuccess('');
    setAddingLearner(true);

    try {
      await addLearner(
        selectedClass.id,
        learnerName.trim(),
        learnerEmail.trim(),
        learnerPassword
      );
      setAddLearnerSuccess(`Account created for ${learnerName.trim()} (${learnerEmail.trim()})`);
      toast.success(`Added learner "${learnerName.trim()}".`);
      setLearnerName('');
      setLearnerEmail('');
      setLearnerPassword('');
      await loadLearners(selectedClass.id);
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Failed to create account';
      setAddLearnerError(msg);
      toast.error(msg);
    } finally {
      setAddingLearner(false);
    }
  };

  const handleDeleteConfirm = async () => {
    if (!deleteTarget || !selectedClass) return;
    setDialogLoading(true);
    try {
      await removeLearner(deleteTarget.id);
      toast.success(`Removed "${deleteTarget.display_name}".`);
      setDeleteTarget(null);
      await loadLearners(selectedClass.id);
    } catch (err) {
      console.error('Failed to delete learner:', err);
      toast.error(err instanceof Error ? err.message : 'Failed to delete learner.');
    } finally {
      setDialogLoading(false);
    }
  };

  const handleEditSave = async (updates: { display_name: string; email: string; password?: string }) => {
    if (!editTarget || !selectedClass) return;
    setDialogLoading(true);
    try {
      await updateLearner(editTarget.id, updates);
      toast.success(`Updated "${updates.display_name}".`);
      setEditTarget(null);
      await loadLearners(selectedClass.id);
    } catch (err) {
      console.error('Failed to update learner:', err);
      toast.error(err instanceof Error ? err.message : 'Failed to update learner.');
    } finally {
      setDialogLoading(false);
    }
  };

  const handleMigrateConfirm = async (newClassId: string) => {
    if (!migrateTarget || !selectedClass) return;
    setDialogLoading(true);
    try {
      await migrateLearner(migrateTarget.id, newClassId);
      toast.success(`Transferred "${migrateTarget.display_name}" to new class.`);
      setMigrateTarget(null);
      await loadLearners(selectedClass.id);
    } catch (err) {
      console.error('Failed to migrate learner:', err);
      toast.error(err instanceof Error ? err.message : 'Failed to transfer learner.');
    } finally {
      setDialogLoading(false);
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <h1 className="text-2xl font-bold text-navy-900">Classes</h1>
          <p className="text-sm text-slate-500">Manage your classes, rosters, and learner credentials</p>
        </div>
        <Button onClick={() => setShowNewClass(!showNewClass)}>
          <Plus className="w-4 h-4 mr-2" />
          New Class
        </Button>
      </div>

      {/* New class form */}
      {showNewClass && (
        <Card>
          <CardContent className="p-6">
            <form onSubmit={handleCreateClass} className="flex flex-col sm:flex-row gap-4 sm:items-end">
              <div className="flex-1">
                <Input
                  label="Class Name"
                  value={newName}
                  onChange={(e) => handleClassNameChange(e.target.value)}
                  placeholder="e.g. Basic 8A"
                  required
                />
              </div>
              <div className="w-full sm:w-44">
                <Select
                  label="Level"
                  value={newLevel}
                  options={[
                    { value: 'B7', label: 'Basic 7 (JHS 1)' },
                    { value: 'B8', label: 'Basic 8 (JHS 2)' },
                    { value: 'B9', label: 'Basic 9 (JHS 3)' },
                  ]}
                  onChange={(e) => setNewLevel(e.target.value as 'B7' | 'B8' | 'B9')}
                />
              </div>
              <div className="flex gap-2">
                <Button type="submit" disabled={creatingClass}>
                  {creatingClass ? 'Creating...' : 'Create'}
                </Button>
                <Button type="button" variant="outline" onClick={() => setShowNewClass(false)}>
                  Cancel
                </Button>
              </div>
            </form>
          </CardContent>
        </Card>
      )}

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Class list */}
        <div className="space-y-2.5">
          {classes.map((cls) => {
            const isSelected = selectedClass?.id === cls.id;
            return (
              <button
                key={cls.id}
                type="button"
                onClick={() => setSelectedClassId(cls.id)}
                className={`w-full text-left p-4 rounded-xl border transition-all duration-200 group ${
                  isSelected
                    ? 'border-navy-900 bg-navy-900 text-white shadow-md shadow-navy-900/10'
                    : 'border-slate-200 hover:border-indigo-300 hover:bg-white bg-white'
                }`}
              >
                <div className="flex items-center justify-between">
                  <div>
                    <p className={`font-semibold ${isSelected ? 'text-white' : 'text-navy-900'}`}>
                      {cls.name}
                    </p>
                    <p className={`text-xs mt-0.5 ${isSelected ? 'text-indigo-200' : 'text-slate-500'}`}>
                      {cls.class_level} &middot; Code: {cls.class_code}
                    </p>
                  </div>
                  <ChevronRight
                    className={`w-4 h-4 transition-transform ${
                      isSelected ? 'text-indigo-200' : 'text-slate-400 group-hover:translate-x-0.5'
                    }`}
                  />
                </div>
              </button>
            );
          })}
          {classes.length === 0 && (
            <div className="bg-white rounded-xl border border-slate-200 p-6 text-center text-sm text-slate-500">
              No classes yet. Click &ldquo;New Class&rdquo; above to begin.
            </div>
          )}
        </div>

        {/* Class details */}
        {selectedClass && (
          <div className="lg:col-span-2 space-y-4">
            <Card>
              <CardHeader>
                <div className="flex flex-wrap items-center justify-between gap-3">
                  <div>
                    <h2 className="text-lg font-bold text-navy-900">{selectedClass.name}</h2>
                    <p className="text-xs text-slate-500 mt-0.5">
                      {selectedClass.class_level} &middot; Class Code:{' '}
                      <span className="font-mono font-semibold text-indigo-700">{selectedClass.class_code}</span>
                    </p>
                  </div>
                  <Button
                    size="sm"
                    onClick={() => {
                      setShowAddLearner(!showAddLearner);
                      setAddLearnerError('');
                      setAddLearnerSuccess('');
                    }}
                  >
                    <Plus className="w-4 h-4 mr-1.5" />
                    Add Learner
                  </Button>
                </div>
              </CardHeader>
              <CardContent>
                <div className="flex items-center justify-between mb-4">
                  <p className="text-sm text-slate-500 flex items-center gap-1.5">
                    <Users className="w-4 h-4 text-slate-400" />
                    {learners.length} learner{learners.length !== 1 ? 's' : ''}
                  </p>
                  <p className="text-xs text-slate-400">
                    Passwords are encrypted; reset via the Edit icon.
                  </p>
                </div>

                {showAddLearner && (
                  <form
                    onSubmit={handleAddLearner}
                    className="space-y-3 mb-6 p-5 bg-slate-50 rounded-xl border border-slate-200"
                  >
                    <p className="text-sm font-semibold text-navy-900">Create Learner Account</p>
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                      <Input
                        label="Full Name"
                        value={learnerName}
                        onChange={(e) => setLearnerName(e.target.value)}
                        placeholder="e.g. Ama Mensah"
                        required
                      />
                      <Input
                        label="Email"
                        type="email"
                        value={learnerEmail}
                        onChange={(e) => setLearnerEmail(e.target.value)}
                        placeholder="learner@school.edu"
                        required
                      />
                    </div>
                    <Input
                      label="Initial Password"
                      type="password"
                      value={learnerPassword}
                      onChange={(e) => setLearnerPassword(e.target.value)}
                      placeholder="Minimum 6 characters"
                      minLength={6}
                      required
                    />
                    {addLearnerError && (
                      <p className="text-sm text-rose-700 bg-rose-50 border border-rose-200 p-3 rounded-lg">
                        {addLearnerError}
                      </p>
                    )}
                    {addLearnerSuccess && (
                      <p className="text-sm text-emerald-700 bg-emerald-50 border border-emerald-200 p-3 rounded-lg">
                        {addLearnerSuccess}
                      </p>
                    )}
                    <div className="flex gap-2">
                      <Button type="submit" size="sm" disabled={addingLearner}>
                        {addingLearner ? 'Creating...' : 'Create Account'}
                      </Button>
                      <Button type="button" variant="ghost" size="sm" onClick={() => setShowAddLearner(false)}>
                        Cancel
                      </Button>
                    </div>
                  </form>
                )}

                {learnersLoading ? (
                  <div className="space-y-2.5">
                    {[1, 2, 3].map((n) => (
                      <div key={n} className="h-16 bg-slate-100 rounded-xl animate-pulse" />
                    ))}
                  </div>
                ) : learners.length === 0 ? (
                  <div className="text-center py-12">
                    <Users className="w-12 h-12 text-slate-300 mx-auto mb-3" />
                    <p className="text-sm text-slate-500">
                      No learners enrolled yet. Click &ldquo;Add Learner&rdquo; to create student logins.
                    </p>
                  </div>
                ) : (
                  <div className="space-y-2">
                    {learners.map((l) => (
                      <div
                        key={l.id}
                        className="group p-4 rounded-xl border border-slate-200 hover:border-slate-300 bg-white transition-all duration-150"
                      >
                        <div className="flex items-start justify-between gap-4">
                          <div className="flex-1 min-w-0">
                            <p className="font-semibold text-navy-900 truncate">{l.display_name}</p>
                            <div className="flex flex-wrap items-center gap-x-4 gap-y-1 mt-1.5 text-xs text-slate-500">
                              <span className="flex items-center gap-1.5">
                                <Mail className="w-3.5 h-3.5 text-slate-400 flex-shrink-0" />
                                <span className="truncate">{l.email || 'No email'}</span>
                              </span>
                              {l.learner_code && (
                                <span className="flex items-center gap-1 font-mono text-slate-500">
                                  <Hash className="w-3 h-3 text-slate-400" />
                                  {l.learner_code}
                                </span>
                              )}
                            </div>
                          </div>

                          <div className="flex items-center gap-1 flex-shrink-0">
                            <button
                              type="button"
                              onClick={() => setEditTarget(l)}
                              className="p-2 text-slate-400 hover:text-indigo-600 hover:bg-indigo-50 rounded-lg transition-colors"
                              title="Edit profile or reset password"
                              aria-label={`Edit ${l.display_name}`}
                            >
                              <Pencil className="w-4 h-4" />
                            </button>
                            <button
                              type="button"
                              onClick={() => setMigrateTarget(l)}
                              className="p-2 text-slate-400 hover:text-indigo-600 hover:bg-indigo-50 rounded-lg transition-colors"
                              title="Transfer to another class"
                              aria-label={`Transfer ${l.display_name}`}
                            >
                              <ArrowRightLeft className="w-4 h-4" />
                            </button>
                            <button
                              type="button"
                              onClick={() => setDeleteTarget(l)}
                              className="p-2 text-slate-400 hover:text-rose-600 hover:bg-rose-50 rounded-lg transition-colors"
                              title="Delete learner"
                              aria-label={`Delete ${l.display_name}`}
                            >
                              <Trash2 className="w-4 h-4" />
                            </button>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </CardContent>
            </Card>
          </div>
        )}
      </div>

      <DeleteLearnerDialog
        open={!!deleteTarget}
        learner={deleteTarget}
        onConfirm={handleDeleteConfirm}
        onCancel={() => setDeleteTarget(null)}
        loading={dialogLoading}
      />

      <EditLearnerDialog
        open={!!editTarget}
        learner={editTarget}
        onSave={handleEditSave}
        onCancel={() => setEditTarget(null)}
        loading={dialogLoading}
      />

      <MigrateLearnerDialog
        open={!!migrateTarget}
        learner={migrateTarget}
        currentClass={selectedClass}
        allClasses={classes}
        onConfirm={handleMigrateConfirm}
        onCancel={() => setMigrateTarget(null)}
        loading={dialogLoading}
      />
    </div>
  );
}
