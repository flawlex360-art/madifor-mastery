import { useState } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Select from '@/components/ui/Select';
import DeleteLearnerDialog from '@/components/teacher/DeleteLearnerDialog';
import EditLearnerDialog from '@/components/teacher/EditLearnerDialog';
import MigrateLearnerDialog from '@/components/teacher/MigrateLearnerDialog';
import { Plus, Users, Trash2, Mail, Pencil, ArrowRightLeft, ChevronRight, Hash } from 'lucide-react';
import { DEMO_CLASSES, DEMO_LEARNERS } from './demoData';
import type { Class, Learner } from '@/types/auth';
import { toast } from '@/stores/toastStore';

export default function DemoClassManagementPage() {
  const [classes] = useState<Class[]>(DEMO_CLASSES);
  const [selectedClass, setSelectedClass] = useState<Class | null>(classes[0] || null);
  const [learners, setLearners] = useState<Learner[]>(
    DEMO_LEARNERS.filter((l) => l.class_id === classes[0]?.id)
  );

  const [showNewClass, setShowNewClass] = useState(false);
  const [showAddLearner, setShowAddLearner] = useState(false);
  const [learnerName, setLearnerName] = useState('');
  const [learnerEmail, setLearnerEmail] = useState('');
  const [learnerPassword, setLearnerPassword] = useState('');
  const [newName, setNewName] = useState('');
  const [newLevel, setNewLevel] = useState<'B7' | 'B8' | 'B9'>('B8');

  const [deleteTarget, setDeleteTarget] = useState<Learner | null>(null);
  const [editTarget, setEditTarget] = useState<Learner | null>(null);
  const [migrateTarget, setMigrateTarget] = useState<Learner | null>(null);

  const selectClass = (cls: Class) => {
    setSelectedClass(cls);
    setLearners(DEMO_LEARNERS.filter((l) => l.class_id === cls.id));
  };

  const handleReadOnlySubmit = (e: React.FormEvent) => {
    e.preventDefault();
    toast.info('Demo mode is read-only. Sign up for a teacher account to add or edit records.');
  };

  const handleDialogReadOnly = () => {
    toast.info('Demo mode is read-only. Create a free teacher account to modify learners.');
    setDeleteTarget(null);
    setEditTarget(null);
    setMigrateTarget(null);
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <h1 className="text-2xl font-bold text-navy-900">Classes</h1>
          <p className="text-sm text-slate-500">Preview class rosters and learner management workflows</p>
        </div>
        <Button onClick={() => setShowNewClass(!showNewClass)}>
          <Plus className="w-4 h-4 mr-2" />
          New Class
        </Button>
      </div>

      {showNewClass && (
        <Card>
          <CardContent className="p-6">
            <form onSubmit={handleReadOnlySubmit} className="flex flex-col sm:flex-row gap-4 sm:items-end">
              <div className="flex-1">
                <Input
                  label="Class Name"
                  value={newName}
                  onChange={(e) => setNewName(e.target.value)}
                  placeholder="e.g. Basic 8C"
                  required
                />
              </div>
              <div className="w-full sm:w-40">
                <Select
                  label="Level"
                  value={newLevel}
                  options={[
                    { value: 'B7', label: 'Basic 7' },
                    { value: 'B8', label: 'Basic 8' },
                    { value: 'B9', label: 'Basic 9' },
                  ]}
                  onChange={(e) => setNewLevel(e.target.value as 'B7' | 'B8' | 'B9')}
                />
              </div>
              <Button type="submit">Create</Button>
            </form>
          </CardContent>
        </Card>
      )}

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="space-y-2.5">
          {classes.map((cls) => {
            const isSelected = selectedClass?.id === cls.id;
            return (
              <button
                key={cls.id}
                type="button"
                onClick={() => selectClass(cls)}
                className={`w-full text-left p-4 rounded-xl border transition-all duration-200 group ${
                  isSelected
                    ? 'border-navy-900 bg-navy-900 text-white shadow-md'
                    : 'border-slate-200 hover:border-indigo-300 bg-white'
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
        </div>

        {selectedClass && (
          <div className="lg:col-span-2 space-y-4">
            <Card>
              <CardHeader>
                <div className="flex flex-wrap items-center justify-between gap-3">
                  <div>
                    <h2 className="text-lg font-bold text-navy-900">{selectedClass.name}</h2>
                    <p className="text-xs text-slate-500 mt-0.5">
                      {selectedClass.class_level} &middot; Code:{' '}
                      <span className="font-mono font-semibold text-indigo-700">{selectedClass.class_code}</span>
                    </p>
                  </div>
                  <Button size="sm" onClick={() => setShowAddLearner(!showAddLearner)}>
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
                    Encrypted learner credentials (demo preview)
                  </p>
                </div>

                {showAddLearner && (
                  <form
                    onSubmit={handleReadOnlySubmit}
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
                      label="Password"
                      type="password"
                      value={learnerPassword}
                      onChange={(e) => setLearnerPassword(e.target.value)}
                      placeholder="Minimum 6 characters"
                      minLength={6}
                      required
                    />
                    <div className="flex gap-2">
                      <Button type="submit" size="sm">Create Account</Button>
                      <Button type="button" variant="ghost" size="sm" onClick={() => setShowAddLearner(false)}>
                        Cancel
                      </Button>
                    </div>
                  </form>
                )}

                <div className="space-y-2">
                  {learners.map((l) => (
                    <div
                      key={l.id}
                      className="group p-4 rounded-xl border border-slate-200 hover:border-slate-300 bg-white transition-colors"
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
                            aria-label={`Edit ${l.display_name}`}
                          >
                            <Pencil className="w-4 h-4" />
                          </button>
                          <button
                            type="button"
                            onClick={() => setMigrateTarget(l)}
                            className="p-2 text-slate-400 hover:text-indigo-600 hover:bg-indigo-50 rounded-lg transition-colors"
                            aria-label={`Transfer ${l.display_name}`}
                          >
                            <ArrowRightLeft className="w-4 h-4" />
                          </button>
                          <button
                            type="button"
                            onClick={() => setDeleteTarget(l)}
                            className="p-2 text-slate-400 hover:text-rose-600 hover:bg-rose-50 rounded-lg transition-colors"
                            aria-label={`Delete ${l.display_name}`}
                          >
                            <Trash2 className="w-4 h-4" />
                          </button>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          </div>
        )}
      </div>

      <DeleteLearnerDialog
        open={!!deleteTarget}
        learner={deleteTarget}
        onConfirm={handleDialogReadOnly}
        onCancel={() => setDeleteTarget(null)}
        loading={false}
      />

      <EditLearnerDialog
        open={!!editTarget}
        learner={editTarget}
        onSave={handleDialogReadOnly}
        onCancel={() => setEditTarget(null)}
        loading={false}
      />

      <MigrateLearnerDialog
        open={!!migrateTarget}
        learner={migrateTarget}
        currentClass={selectedClass}
        allClasses={classes}
        onConfirm={handleDialogReadOnly}
        onCancel={() => setMigrateTarget(null)}
        loading={false}
      />
    </div>
  );
}
