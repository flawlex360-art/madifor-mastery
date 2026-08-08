import { useState } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Select from '@/components/ui/Select';
import DeleteLearnerDialog from '@/components/teacher/DeleteLearnerDialog';
import EditLearnerDialog from '@/components/teacher/EditLearnerDialog';
import MigrateLearnerDialog from '@/components/teacher/MigrateLearnerDialog';
import { Plus, Users, Trash2, Mail, Pencil, ArrowRightLeft, Eye, EyeOff, Key, ChevronRight, AlertCircle } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { DEMO_CLASSES, DEMO_LEARNERS } from './demoData';
import type { Class, Learner } from '@/types/auth';

export default function DemoClassManagementPage() {
  const [classes] = useState<Class[]>(DEMO_CLASSES as any);
  const [selectedClass, setSelectedClass] = useState<Class | null>(classes[0] || null);
  const [learners, setLearners] = useState<Learner[]>(
    DEMO_LEARNERS.filter(l => l.class_id === classes[0]?.id) as any
  );
  
  const [showNewClass, setShowNewClass] = useState(false);
  const [showAddLearner, setShowAddLearner] = useState(false);
  const [demoError, setDemoError] = useState('');

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

  const selectClass = (cls: Class) => {
    setSelectedClass(cls);
    setLearners(DEMO_LEARNERS.filter(l => l.class_id === cls.id) as any);
    setDemoError('');
  };

  const handleCreateClass = (e: React.FormEvent) => {
    e.preventDefault();
    setDemoError('Editing is disabled in the demo environment.');
  };

  const handleAddLearner = (e: React.FormEvent) => {
    e.preventDefault();
    setDemoError('Editing is disabled in the demo environment.');
  };

  const togglePasswordVisibility = (learnerId: string) => {
    setVisiblePasswords(prev => {
      const next = new Set(prev);
      if (next.has(learnerId)) next.delete(learnerId);
      else next.add(learnerId);
      return next;
    });
  };

  const handleAction = () => {
    setDemoError('Editing is disabled in the demo environment.');
    // Keep dialog open but show error if we want, or just close it.
    // Let's close dialogs and show the error at the top.
    setDeleteTarget(null);
    setEditTarget(null);
    setMigrateTarget(null);
  };

  return (
    <div className="space-y-6">
      <div className="mb-4 bg-teal-50 border border-teal-200 rounded-lg p-4 text-teal-800 text-sm">
        <strong className="font-bold">👋 Welcome to the Demo Environment!</strong> You can view classes and learners, but creating or modifying data is disabled.
      </div>

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

      {demoError && (
        <div className="bg-amber-50 text-amber-800 p-4 rounded-lg flex items-center gap-3 border border-amber-200">
          <AlertCircle className="w-5 h-5 text-amber-600" />
          <span className="font-medium">{demoError}</span>
        </div>
      )}

      {/* New class form */}
      {showNewClass && (
        <Card>
          <CardContent className="p-6">
            <form onSubmit={handleCreateClass} className="flex gap-4 items-end">
              <Input
                label="Class Name"
                value={newName}
                onChange={e => setNewName(e.target.value)}
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
                onChange={e => setNewLevel(e.target.value as any)}
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
                  <Button size="sm" onClick={() => { setShowAddLearner(!showAddLearner); setDemoError(''); }}>
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
                      <div className="flex gap-2">
                        <Button type="submit" size="sm">Create Account</Button>
                        <Button type="button" variant="ghost" size="sm" onClick={() => setShowAddLearner(false)}>Cancel</Button>
                      </div>
                    </form>
                  </motion.div>
                )}

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
                          <div className="flex-1 min-w-0">
                            <p className="font-semibold text-zinc-900 truncate">{l.display_name}</p>
                            <div className="flex flex-col sm:flex-row sm:items-center gap-1 sm:gap-4 mt-1.5">
                              <span className="flex items-center gap-1.5 text-xs text-zinc-500">
                                <Mail className="w-3.5 h-3.5 flex-shrink-0" />
                                <span className="truncate">{l.email || 'No email'}</span>
                              </span>
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
                                  >
                                    {visiblePasswords.has(l.id) ? <EyeOff className="w-3.5 h-3.5" /> : <Eye className="w-3.5 h-3.5" />}
                                  </button>
                                )}
                              </span>
                            </div>
                          </div>

                          <div className="flex items-center gap-1 opacity-60 group-hover:opacity-100 transition-opacity">
                            <button
                              onClick={() => setEditTarget(l)}
                              className="p-2 text-zinc-400 hover:text-zinc-900 hover:bg-zinc-100 rounded-lg transition-colors"
                            >
                              <Pencil className="w-4 h-4" />
                            </button>
                            <button
                              onClick={() => setMigrateTarget(l)}
                              className="p-2 text-zinc-400 hover:text-blue-600 hover:bg-blue-50 rounded-lg transition-colors"
                            >
                              <ArrowRightLeft className="w-4 h-4" />
                            </button>
                            <button
                              onClick={() => setDeleteTarget(l)}
                              className="p-2 text-zinc-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors"
                            >
                              <Trash2 className="w-4 h-4" />
                            </button>
                          </div>
                        </div>
                      </motion.div>
                    ))}
                  </AnimatePresence>
                </div>
              </CardContent>
            </Card>
          </div>
        )}
      </div>

      <DeleteLearnerDialog
        open={!!deleteTarget}
        learner={deleteTarget}
        onConfirm={handleAction}
        onCancel={() => setDeleteTarget(null)}
        loading={false}
      />

      <EditLearnerDialog
        open={!!editTarget}
        learner={editTarget}
        onSave={handleAction as any}
        onCancel={() => setEditTarget(null)}
        loading={false}
      />

      <MigrateLearnerDialog
        open={!!migrateTarget}
        learner={migrateTarget}
        currentClass={selectedClass}
        allClasses={classes}
        onConfirm={handleAction}
        onCancel={() => setMigrateTarget(null)}
        loading={false}
      />
    </div>
  );
}
