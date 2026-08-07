import { useState, useEffect } from 'react';
import { useAuth } from '@/hooks/useAuth';
import { getTeacherClasses, createClass, getClassLearners, addLearner, removeLearner, updateLearner, migrateLearner } from '@/api/auth';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Select from '@/components/ui/Select';
import DeleteLearnerDialog from '@/components/teacher/DeleteLearnerDialog';
import EditLearnerDialog from '@/components/teacher/EditLearnerDialog';
import MigrateLearnerDialog from '@/components/teacher/MigrateLearnerDialog';
import type { Class, Learner } from '@/types/auth';
import { Plus, Users, Trash2, Mail, Pencil, ArrowRightLeft, Eye, EyeOff, Key, ChevronRight } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';

export default function ClassManagementPage() {
  const { teacher } = useAuth();
  const [classes, setClasses] = useState<Class[]>([]);
  const [selectedClass, setSelectedClass] = useState<Class | null>(null);
  const [learners, setLearners] = useState<Learner[]>([]);
  const [showNewClass, setShowNewClass] = useState(false);
  const [showAddLearner, setShowAddLearner] = useState(false);
  const [addLearnerError, setAddLearnerError] = useState('');
  const [addLearnerSuccess, setAddLearnerSuccess] = useState('');

  // New learner form
  const [learnerName, setLearnerName] = useState('');
  const [learnerEmail, setLearnerEmail] = useState('');
  const [learnerPassword, setLearnerPassword] = useState('');

  // New class form
  const [newName, setNewName] = useState('');
  const [newLevel, setNewLevel] = useState<'B7' | 'B8' | 'B9'>('B8');

  // Password visibility per learner
  const [visiblePasswords, setVisiblePasswords] = useState<Set<string>>(new Set());

  // Dialog states
  const [deleteTarget, setDeleteTarget] = useState<Learner | null>(null);
  const [editTarget, setEditTarget] = useState<Learner | null>(null);
  const [migrateTarget, setMigrateTarget] = useState<Learner | null>(null);
  const [dialogLoading, setDialogLoading] = useState(false);

  // Auto-detect level from class name
  const handleClassNameChange = (name: string) => {
    setNewName(name);
    const match = name.match(/[789]/);
    if (match) {
      setNewLevel(`B${match[0]}` as 'B7' | 'B8' | 'B9');
    }
  };

  useEffect(() => {
    if (teacher) loadClasses();
  }, [teacher]);

  const loadClasses = async () => {
    const cls = await getTeacherClasses(teacher!.id);
    setClasses(cls);
    if (cls.length > 0 && !selectedClass) selectClass(cls[0]);
  };

  const selectClass = async (cls: Class) => {
    setSelectedClass(cls);
    const ls = await getClassLearners(cls.id);
    setLearners(ls);
  };

  const handleCreateClass = async (e: React.FormEvent) => {
    e.preventDefault();
    await createClass(teacher!.id, newName, newLevel);
    setNewName('');
    setShowNewClass(false);
    loadClasses();
  };

  const handleAddLearner = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedClass) return;
    setAddLearnerError('');
    setAddLearnerSuccess('');

    try {
      await addLearner(selectedClass.id, learnerName, learnerEmail.trim(), learnerPassword);
      setAddLearnerSuccess(`Account created for ${learnerName} (${learnerEmail.trim()})`);
      setLearnerName('');
      setLearnerEmail('');
      setLearnerPassword('');
      selectClass(selectedClass);
    } catch (err: unknown) {
      setAddLearnerError(err instanceof Error ? err.message : 'Failed to create account');
    }
  };

  // Toggle password visibility for a learner
  const togglePasswordVisibility = (learnerId: string) => {
    setVisiblePasswords(prev => {
      const next = new Set(prev);
      if (next.has(learnerId)) {
        next.delete(learnerId);
      } else {
        next.add(learnerId);
      }
      return next;
    });
  };

  // Delete handler
  const handleDeleteConfirm = async () => {
    if (!deleteTarget || !selectedClass) return;
    setDialogLoading(true);
    try {
      await removeLearner(deleteTarget.id);
      setDeleteTarget(null);
      selectClass(selectedClass);
    } catch (err) {
      console.error('Failed to delete learner:', err);
    } finally {
      setDialogLoading(false);
    }
  };

  // Edit handler
  const handleEditSave = async (updates: { display_name: string; email: string; password?: string }) => {
    if (!editTarget || !selectedClass) return;
    setDialogLoading(true);
    try {
      await updateLearner(editTarget.id, updates);
      setEditTarget(null);
      selectClass(selectedClass);
    } catch (err) {
      console.error('Failed to update learner:', err);
    } finally {
      setDialogLoading(false);
    }
  };

  // Migrate handler
  const handleMigrateConfirm = async (newClassId: string) => {
    if (!migrateTarget || !selectedClass) return;
    setDialogLoading(true);
    try {
      await migrateLearner(migrateTarget.id, newClassId);
      setMigrateTarget(null);
      selectClass(selectedClass);
    } catch (err) {
      console.error('Failed to migrate learner:', err);
    } finally {
      setDialogLoading(false);
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-zinc-900">Classes</h1>
          <p className="text-gray-500">Manage your classes and learner accounts</p>
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
            <form onSubmit={handleCreateClass} className="flex gap-4 items-end">
              <Input
                label="Class Name"
                value={newName}
                onChange={e => handleClassNameChange(e.target.value)}
                placeholder="e.g. Basic 8A"
                required
              />
              <Select
                label="Level"
                value={newLevel}
                options={[
                  { value: 'B7', label: 'Basic 7' },
                  { value: 'B8', label: 'Basic 8' },
                  { value: 'B9', label: 'Basic 9' },
                ]}
                onChange={e => setNewLevel(e.target.value as 'B7' | 'B8' | 'B9')}
              />
              <Button type="submit">Create</Button>
            </form>
          </CardContent>
        </Card>
      )}

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Class list */}
        <div className="space-y-2">
          {classes.map(cls => (
            <button
              key={cls.id}
              onClick={() => selectClass(cls)}
              className={`w-full text-left p-4 rounded-xl border transition-all duration-200 group ${
                selectedClass?.id === cls.id
                  ? 'border-zinc-900 bg-zinc-900 text-white shadow-lg shadow-zinc-900/10'
                  : 'border-zinc-200 hover:border-zinc-300 hover:shadow-sm bg-white'
              }`}
            >
              <div className="flex items-center justify-between">
                <div>
                  <p className={`font-semibold ${selectedClass?.id === cls.id ? 'text-white' : 'text-zinc-900'}`}>{cls.name}</p>
                  <p className={`text-xs mt-0.5 ${selectedClass?.id === cls.id ? 'text-zinc-300' : 'text-gray-500'}`}>{cls.class_level}</p>
                </div>
                <ChevronRight className={`w-4 h-4 transition-transform ${
                  selectedClass?.id === cls.id ? 'text-zinc-300' : 'text-zinc-400 group-hover:translate-x-0.5'
                }`} />
              </div>
            </button>
          ))}
          {classes.length === 0 && (
            <p className="text-sm text-gray-500 text-center py-4">No classes yet</p>
          )}
        </div>

        {/* Class details */}
        {selectedClass && (
          <div className="lg:col-span-2 space-y-4">
            <Card>
              <CardHeader>
                <div className="flex items-center justify-between">
                  <div>
                    <h2 className="text-lg font-bold text-zinc-900">{selectedClass.name}</h2>
                    <p className="text-xs text-zinc-500 mt-0.5">{selectedClass.class_level} • Code: {selectedClass.class_code}</p>
                  </div>
                  <Button size="sm" onClick={() => { setShowAddLearner(!showAddLearner); setAddLearnerError(''); setAddLearnerSuccess(''); }}>
                    <Plus className="w-4 h-4 mr-1" />
                    Add Learner
                  </Button>
                </div>
              </CardHeader>
              <CardContent>
                <div className="flex items-center mb-4">
                  <p className="text-sm text-gray-500">
                    <Users className="w-4 h-4 inline mr-1" />
                    {learners.length} learner{learners.length !== 1 ? 's' : ''}
                  </p>
                </div>

                {showAddLearner && (
                  <motion.div
                    initial={{ opacity: 0, height: 0 }}
                    animate={{ opacity: 1, height: 'auto' }}
                    exit={{ opacity: 0, height: 0 }}
                    className="overflow-hidden"
                  >
                    <form onSubmit={handleAddLearner} className="space-y-3 mb-6 p-5 bg-zinc-50 rounded-xl border border-zinc-200">
                      <p className="text-sm font-semibold text-zinc-900">Create learner account</p>
                      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                        <Input
                          label="Full Name"
                          value={learnerName}
                          onChange={e => setLearnerName(e.target.value)}
                          placeholder="e.g. Ama Mensah"
                          required
                        />
                        <Input
                          label="Email"
                          type="email"
                          value={learnerEmail}
                          onChange={e => setLearnerEmail(e.target.value)}
                          placeholder="learner@school.com"
                          required
                        />
                      </div>
                      <Input
                        label="Password"
                        type="password"
                        value={learnerPassword}
                        onChange={e => setLearnerPassword(e.target.value)}
                        placeholder="Minimum 6 characters"
                        minLength={6}
                        required
                      />
                      {addLearnerError && (
                        <p className="text-sm text-red-500 bg-red-50 p-3 rounded-lg">{addLearnerError}</p>
                      )}
                      {addLearnerSuccess && (
                        <p className="text-sm text-green-600 bg-green-50 p-3 rounded-lg">{addLearnerSuccess}</p>
                      )}
                      <div className="flex gap-2">
                        <Button type="submit" size="sm">Create Account</Button>
                        <Button type="button" variant="ghost" size="sm" onClick={() => setShowAddLearner(false)}>Cancel</Button>
                      </div>
                    </form>
                  </motion.div>
                )}

                {learners.length === 0 ? (
                  <div className="text-center py-12">
                    <Users className="w-12 h-12 text-zinc-300 mx-auto mb-3" />
                    <p className="text-sm text-gray-500">
                      No learners yet. Click "Add Learner" to create accounts for your students.
                    </p>
                  </div>
                ) : (
                  <div className="space-y-2">
                    <AnimatePresence>
                      {learners.map((l, index) => (
                        <motion.div
                          key={l.id}
                          initial={{ opacity: 0, y: 10 }}
                          animate={{ opacity: 1, y: 0 }}
                          exit={{ opacity: 0, x: -20 }}
                          transition={{ delay: index * 0.03 }}
                          className="group p-4 rounded-xl border border-zinc-100 hover:border-zinc-200 bg-white hover:shadow-sm transition-all duration-200"
                        >
                          <div className="flex items-start justify-between gap-4">
                            {/* Learner info */}
                            <div className="flex-1 min-w-0">
                              <p className="font-semibold text-zinc-900 truncate">{l.display_name}</p>
                              <div className="flex flex-col sm:flex-row sm:items-center gap-1 sm:gap-4 mt-1.5">
                                {/* Email */}
                                <span className="flex items-center gap-1.5 text-xs text-zinc-500">
                                  <Mail className="w-3.5 h-3.5 flex-shrink-0" />
                                  <span className="truncate">{l.email || 'No email'}</span>
                                </span>
                                {/* Password */}
                                <span className="flex items-center gap-1.5 text-xs text-zinc-500">
                                  <Key className="w-3.5 h-3.5 flex-shrink-0" />
                                  <span className="font-mono">
                                    {l.login_password
                                      ? visiblePasswords.has(l.id)
                                        ? l.login_password
                                        : '••••••••'
                                      : 'Not set'}
                                  </span>
                                  {l.login_password && (
                                    <button
                                      onClick={() => togglePasswordVisibility(l.id)}
                                      className="p-0.5 text-zinc-400 hover:text-zinc-700 transition-colors"
                                      title={visiblePasswords.has(l.id) ? 'Hide password' : 'Show password'}
                                    >
                                      {visiblePasswords.has(l.id) ? <EyeOff className="w-3.5 h-3.5" /> : <Eye className="w-3.5 h-3.5" />}
                                    </button>
                                  )}
                                </span>
                              </div>
                            </div>

                            {/* Action buttons */}
                            <div className="flex items-center gap-1 opacity-60 group-hover:opacity-100 transition-opacity">
                              <button
                                onClick={() => setEditTarget(l)}
                                className="p-2 text-zinc-400 hover:text-zinc-900 hover:bg-zinc-100 rounded-lg transition-colors"
                                title="Edit learner"
                              >
                                <Pencil className="w-4 h-4" />
                              </button>
                              <button
                                onClick={() => setMigrateTarget(l)}
                                className="p-2 text-zinc-400 hover:text-blue-600 hover:bg-blue-50 rounded-lg transition-colors"
                                title="Migrate to another class"
                              >
                                <ArrowRightLeft className="w-4 h-4" />
                              </button>
                              <button
                                onClick={() => setDeleteTarget(l)}
                                className="p-2 text-zinc-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors"
                                title="Delete learner"
                              >
                                <Trash2 className="w-4 h-4" />
                              </button>
                            </div>
                          </div>
                        </motion.div>
                      ))}
                    </AnimatePresence>
                  </div>
                )}
              </CardContent>
            </Card>
          </div>
        )}
      </div>

      {/* Dialogs */}
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
