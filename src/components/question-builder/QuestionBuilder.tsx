import { useState, useEffect, useCallback } from 'react';
import {
  getSubjects,
  getCurriculumTree,
  getQuestionsByTopic,
  createQuestion,
  createQuestionsBatch,
  updateQuestion,
  deleteQuestion,
  createTopic,
} from '@/api/curriculum';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Select from '@/components/ui/Select';
import QuestionForm from './QuestionForm';
import QuestionPreview from './QuestionPreview';
import BulkImport from './BulkImport';
import CreateTopicModal from './CreateTopicModal';
import type { Subject, Topic, Question } from '@/types/curriculum';
import { Plus, Trash2, Eye, Pencil, BookOpen, Upload, X, Lock } from 'lucide-react';
import { useAuth } from '@/hooks/useAuth';
import { toast } from '@/stores/toastStore';
import { useConfirmDialog } from '@/components/ui/ConfirmDialog';
import { useSelectedClass } from '@/context/SelectedClassContext';

interface QuestionBuilderProps {
  onQuestionsChange?: () => void;
}

interface TreeSubStrand {
  id: string;
  name: string;
  topics: Topic[];
}

interface TreeStrand {
  id: string;
  name: string;
  sub_strands: TreeSubStrand[];
}

interface CurriculumTreeData {
  strands: TreeStrand[];
}

export default function QuestionBuilder({ onQuestionsChange }: QuestionBuilderProps) {
  const { teacher } = useAuth();
  const { selectedClass } = useSelectedClass();
  const classLevel = selectedClass?.class_level || 'B8';
  const { confirm, ConfirmDialogComponent } = useConfirmDialog();

  const [subjects, setSubjects] = useState<Subject[]>([]);
  const [selectedSubjectId, setSelectedSubjectId] = useState('');
  const [topics, setTopics] = useState<Topic[]>([]);
  const [selectedTopicId, setSelectedTopicId] = useState('');
  const [questions, setQuestions] = useState<Question[]>([]);
  const [loading, setLoading] = useState(true);

  const [showForm, setShowForm] = useState(false);
  const [showBulkImport, setShowBulkImport] = useState(false);
  const [editingQuestion, setEditingQuestion] = useState<Question | null>(null);
  const [previewQuestion, setPreviewQuestion] = useState<Question | null>(null);
  const [showCreateTopic, setShowCreateTopic] = useState(false);
  const [curriculumTree, setCurriculumTree] = useState<CurriculumTreeData | null>(null);

  const loadQuestions = useCallback(async (topicId: string) => {
    try {
      const qs = await getQuestionsByTopic(topicId);
      setQuestions(qs);
    } catch (err) {
      console.error('Failed to load questions:', err);
      toast.error('Failed to load questions for this topic.');
    }
  }, []);

  const loadTopics = useCallback(
    async (subjectId: string, preferredTopicId?: string) => {
      setLoading(true);
      try {
        const tree = (await getCurriculumTree(subjectId)) as CurriculumTreeData;
        setCurriculumTree(tree);
        const allTopics = tree.strands.flatMap((s) =>
          s.sub_strands.flatMap((ss) => ss.topics)
        );
        const filteredTopics = allTopics.filter((t) => t.class_level === classLevel);
        setTopics(filteredTopics);

        const nextTopic =
          (preferredTopicId && filteredTopics.find((t) => t.id === preferredTopicId)) ||
          filteredTopics[0];

        if (nextTopic) {
          setSelectedTopicId(nextTopic.id);
          await loadQuestions(nextTopic.id);
        } else {
          setSelectedTopicId('');
          setQuestions([]);
        }
      } catch (err) {
        console.error('Failed to load topics:', err);
        toast.error('Failed to load curriculum topics.');
      } finally {
        setLoading(false);
      }
    },
    [classLevel, loadQuestions]
  );

  useEffect(() => {
    let active = true;
    getSubjects()
      .then((s) => {
        if (!active) return;
        setSubjects(s);
        if (s.length > 0) {
          setSelectedSubjectId(s[0].id);
          loadTopics(s[0].id);
        } else {
          setLoading(false);
        }
      })
      .catch((err) => {
        console.error('Failed to load subjects:', err);
        if (active) setLoading(false);
      });

    return () => {
      active = false;
    };
  }, [loadTopics]);

  const handleTopicChange = (topicId: string) => {
    if (topicId === 'CREATE_NEW') {
      setShowCreateTopic(true);
      return;
    }
    setSelectedTopicId(topicId);
    loadQuestions(topicId);
    setShowForm(false);
    setEditingQuestion(null);
    setPreviewQuestion(null);
  };

  const handleCreateTopic = async (data: {
    name: string;
    code: string;
    sub_strand_id: string;
    class_level: string;
  }) => {
    try {
      const newTopic = await createTopic(data);
      toast.success('Topic created successfully');
      const targetSubjectId = selectedSubjectId || subjects[0]?.id;
      if (targetSubjectId) {
        await loadTopics(targetSubjectId, newTopic.id);
      }
    } catch (err) {
      toast.error('Failed to create topic');
      console.error(err);
      throw err;
    }
  };

  const handleSave = async (questionData: Record<string, unknown>) => {
    if (!teacher) return;

    try {
      if (editingQuestion) {
        await updateQuestion(editingQuestion.id, questionData);
        toast.success('Question updated successfully');
      } else {
        if (!selectedTopicId) {
          toast.error('Please select a topic first.');
          return;
        }
        await createQuestion({
          ...questionData,
          topic_id: selectedTopicId,
          owner_teacher_id: teacher.id,
        });
        toast.success('Question created successfully');
      }

      setShowForm(false);
      setEditingQuestion(null);
      await loadQuestions(selectedTopicId);
      onQuestionsChange?.();
    } catch (err: unknown) {
      const message = err instanceof Error ? err.message : 'Failed to save question.';
      toast.error(message);
      console.error(err);
    }
  };

  const handleDelete = async (id: string) => {
    const confirmed = await confirm({
      title: 'Delete Question',
      message: 'This question will be permanently removed. This action cannot be undone.',
      confirmLabel: 'Delete',
      variant: 'danger',
    });
    if (!confirmed) return;

    try {
      await deleteQuestion(id);
      toast.success('Question deleted');
      await loadQuestions(selectedTopicId);
      onQuestionsChange?.();
    } catch (err) {
      console.error('Failed to delete question:', err);
      toast.error('Failed to delete question. You can only delete questions you created.');
    }
  };

  const handleEdit = (q: Question) => {
    setEditingQuestion(q);
    setShowForm(true);
    setShowBulkImport(false);
    setPreviewQuestion(null);
  };

  const handlePreview = (q: Question) => {
    setPreviewQuestion(q);
    setShowForm(false);
    setEditingQuestion(null);
  };

  const handleBulkImport = async (batch: Record<string, unknown>[]) => {
    if (!teacher) return;
    await createQuestionsBatch(
      batch.map((q) => ({
        ...q,
        owner_teacher_id: teacher.id,
      }))
    );
    await loadQuestions(selectedTopicId);
    onQuestionsChange?.();
  };

  const canModifyQuestion = (q: Question) =>
    Boolean(teacher?.is_admin || (teacher?.id && q.owner_teacher_id === teacher.id));

  return (
    <div className="space-y-6">
      {/* Topic selector */}
      <div className="flex gap-4 flex-wrap items-end">
        <div className="w-full sm:w-64">
          <Select
            label="Subject"
            value={selectedSubjectId}
            options={subjects.map((s) => ({ value: s.id, label: s.name }))}
            onChange={(e) => {
              setSelectedSubjectId(e.target.value);
              loadTopics(e.target.value);
            }}
          />
        </div>
        <div className="flex-1 min-w-[260px]">
          <Select
            label="Topic"
            value={selectedTopicId}
            options={[
              ...topics.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` })),
              { value: 'CREATE_NEW', label: '+ Create New Topic...' },
            ]}
            onChange={(e) => handleTopicChange(e.target.value)}
          />
        </div>
        <div className="text-xs font-semibold bg-indigo-50 text-indigo-700 px-3 py-2 rounded-lg border border-indigo-100">
          {classLevel === 'B7' ? 'Basic 7 (JHS 1)' : classLevel === 'B8' ? 'Basic 8 (JHS 2)' : 'Basic 9 (JHS 3)'}
        </div>
      </div>

      {/* Action bar */}
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm text-slate-500">
          {loading ? 'Loading questions...' : `${questions.length} question${questions.length !== 1 ? 's' : ''} for this topic`}
        </p>
        <div className="flex items-center gap-2">
          <Button
            variant="outline"
            onClick={() => {
              setShowBulkImport(!showBulkImport);
              setShowForm(false);
              setEditingQuestion(null);
              setPreviewQuestion(null);
            }}
            disabled={topics.length === 0}
          >
            <Upload className="w-4 h-4 mr-2" />
            {showBulkImport ? 'Close Import' : 'Bulk Import'}
          </Button>
          <Button
            onClick={() => {
              setShowForm(!showForm);
              setShowBulkImport(false);
              setEditingQuestion(null);
              setPreviewQuestion(null);
            }}
            disabled={!selectedTopicId}
          >
            <Plus className="w-4 h-4 mr-2" />
            {showForm ? 'Cancel' : 'New Question'}
          </Button>
        </div>
      </div>

      {/* Bulk import */}
      {showBulkImport && (
        <BulkImport
          topics={topics}
          defaultTopicId={selectedTopicId}
          onImport={handleBulkImport}
          onCancel={() => setShowBulkImport(false)}
        />
      )}

      {/* Create Topic Modal */}
      {showCreateTopic && (
        <CreateTopicModal
          isOpen={showCreateTopic}
          onClose={() => setShowCreateTopic(false)}
          curriculumTree={curriculumTree}
          classLevel={classLevel}
          onSave={handleCreateTopic}
        />
      )}

      {/* Question list */}
      <Card>
        <CardHeader>
          <h2 className="font-semibold text-navy-900">Questions</h2>
        </CardHeader>
        <CardContent className="p-0">
          {loading ? (
            <div className="p-6 space-y-3">
              {[1, 2, 3].map((n) => (
                <div key={n} className="h-14 bg-slate-100 rounded-lg animate-pulse" />
              ))}
            </div>
          ) : questions.length === 0 ? (
            <div className="p-10 text-center text-slate-500">
              <BookOpen className="w-8 h-8 mx-auto mb-2 text-slate-300" />
              <p className="text-sm">No questions yet for this topic.</p>
            </div>
          ) : (
            <div className="divide-y divide-slate-100">
              {questions.map((q, i) => {
                const canModify = canModifyQuestion(q);
                return (
                  <div
                    key={q.id}
                    className="px-4 py-3.5 flex items-start gap-3 hover:bg-slate-50/70 transition-colors"
                  >
                    <span className="text-xs font-semibold text-slate-400 mt-1 w-6 tabular-nums">
                      {i + 1}
                    </span>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-navy-900 line-clamp-2">{q.stem}</p>
                      <div className="flex flex-wrap items-center gap-1.5 mt-1.5">
                        <span className="text-xs px-2 py-0.5 rounded-md bg-slate-100 text-slate-600 font-medium">
                          {q.question_type === 'multiple_choice' ? 'MCQ' : 'Fill-in'}
                        </span>
                        <span className="text-xs px-2 py-0.5 rounded-md bg-slate-100 text-slate-600">
                          {q.difficulty}
                        </span>
                        <span className="text-xs px-2 py-0.5 rounded-md bg-slate-100 text-slate-600">
                          {q.blooms_level}
                        </span>
                        {q.visibility === 'shared' && (
                          <span className="text-xs px-2 py-0.5 rounded-md bg-indigo-50 text-indigo-700 font-medium">
                            Shared
                          </span>
                        )}
                        {!canModify && (
                          <span className="inline-flex items-center gap-1 text-xs px-2 py-0.5 rounded-md bg-slate-100 text-slate-500">
                            <Lock className="w-3 h-3" /> Read-only
                          </span>
                        )}
                      </div>
                    </div>
                    <div className="flex items-center gap-1 flex-shrink-0">
                      <Button variant="ghost" size="sm" onClick={() => handlePreview(q)} title="Preview">
                        <Eye className="w-4 h-4 text-slate-500" />
                      </Button>
                      {canModify && (
                        <>
                          <Button variant="ghost" size="sm" onClick={() => handleEdit(q)} title="Edit">
                            <Pencil className="w-4 h-4 text-slate-500" />
                          </Button>
                          <Button variant="ghost" size="sm" onClick={() => handleDelete(q.id)} title="Delete">
                            <Trash2 className="w-4 h-4 text-rose-500" />
                          </Button>
                        </>
                      )}
                    </div>
                  </div>
                );
              })}
            </div>
          )}
        </CardContent>
      </Card>

      {/* Preview modal */}
      {previewQuestion && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center p-4"
          onClick={() => setPreviewQuestion(null)}
        >
          <div className="absolute inset-0 bg-navy-950/50 backdrop-blur-sm" />
          <div
            className="relative w-full max-w-lg max-h-[85vh] overflow-y-auto rounded-2xl border border-slate-200 bg-white shadow-2xl custom-scrollbar"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="sticky top-0 z-10 flex items-center justify-between px-6 py-4 border-b border-slate-100 bg-white rounded-t-2xl">
              <h3 className="text-lg font-semibold text-navy-900">Question Preview</h3>
              <div className="flex items-center gap-2">
                {canModifyQuestion(previewQuestion) && (
                  <Button
                    variant="ghost"
                    size="sm"
                    onClick={() => {
                      const target = previewQuestion;
                      setPreviewQuestion(null);
                      handleEdit(target);
                    }}
                  >
                    <Pencil className="w-4 h-4 mr-1" />
                    Edit
                  </Button>
                )}
                <button
                  type="button"
                  onClick={() => setPreviewQuestion(null)}
                  className="p-1.5 rounded-lg hover:bg-slate-100 transition-colors"
                  aria-label="Close preview"
                >
                  <X className="w-5 h-5 text-slate-500" />
                </button>
              </div>
            </div>
            <div className="p-6">
              <QuestionPreview question={previewQuestion} />
            </div>
          </div>
        </div>
      )}

      {/* Edit/New question modal */}
      {showForm && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center p-4"
          onClick={() => {
            setShowForm(false);
            setEditingQuestion(null);
          }}
        >
          <div className="absolute inset-0 bg-navy-950/50 backdrop-blur-sm" />
          <div
            className="relative w-full max-w-2xl max-h-[90vh] overflow-y-auto rounded-2xl border border-slate-200 bg-white shadow-2xl custom-scrollbar"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="sticky top-0 z-10 flex items-center justify-between px-6 py-4 border-b border-slate-100 bg-white rounded-t-2xl">
              <h3 className="text-lg font-semibold text-navy-900">
                {editingQuestion ? 'Edit Question' : 'New Question'}
              </h3>
              <button
                type="button"
                onClick={() => {
                  setShowForm(false);
                  setEditingQuestion(null);
                }}
                className="p-1.5 rounded-lg hover:bg-slate-100 transition-colors"
                aria-label="Close form"
              >
                <X className="w-5 h-5 text-slate-500" />
              </button>
            </div>
            <div className="p-6">
              <QuestionForm
                initialData={editingQuestion}
                onSave={handleSave}
                onCancel={() => {
                  setShowForm(false);
                  setEditingQuestion(null);
                }}
              />
            </div>
          </div>
        </div>
      )}

      {ConfirmDialogComponent}
    </div>
  );
}
