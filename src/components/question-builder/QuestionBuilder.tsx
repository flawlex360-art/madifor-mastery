import { useState, useEffect } from 'react';
import { getSubjects, getCurriculumTree, getQuestionsByTopic, createQuestion, updateQuestion, deleteQuestion, createTopic } from '@/api/curriculum';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Select from '@/components/ui/Select';
import QuestionForm from './QuestionForm';
import QuestionPreview from './QuestionPreview';
import BulkImport from './BulkImport';
import CreateTopicModal from './CreateTopicModal';
import type { Subject, Topic, Question } from '@/types/curriculum';
import { Plus, Trash2, Eye, Pencil, BookOpen, Upload, X } from 'lucide-react';
import { useAuth } from '@/hooks/useAuth';
import { toast } from '@/stores/toastStore';
import { useConfirmDialog } from '@/components/ui/ConfirmDialog';
import { useSelectedClass } from '@/context/SelectedClassContext';

interface QuestionBuilderProps {
  onQuestionsChange?: () => void;
}

export default function QuestionBuilder({ onQuestionsChange }: QuestionBuilderProps) {
  const { teacher } = useAuth();
  const { selectedClass } = useSelectedClass();
  const classLevel = selectedClass?.class_level || 'B8';
  const { confirm, ConfirmDialogComponent } = useConfirmDialog();
  const [subjects, setSubjects] = useState<Subject[]>([]);
  const [topics, setTopics] = useState<Topic[]>([]);
  const [selectedTopicId, setSelectedTopicId] = useState('');
  const [questions, setQuestions] = useState<Question[]>([]);
  const [_loading, setLoading] = useState(true);

  // UI state
  const [showForm, setShowForm] = useState(false);
  const [showBulkImport, setShowBulkImport] = useState(false);
  const [editingQuestion, setEditingQuestion] = useState<Question | null>(null);
  const [previewQuestion, setPreviewQuestion] = useState<Question | null>(null);
  const [showCreateTopic, setShowCreateTopic] = useState(false);
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const [curriculumTree, setCurriculumTree] = useState<any>(null);

  useEffect(() => {
    getSubjects().then((s) => {
      setSubjects(s);
      if (s.length > 0) loadTopics(s[0].id);
    });
  }, [classLevel]);

  const loadTopics = async (subjectId: string) => {
    setLoading(true);
    try {
      const tree = await getCurriculumTree(subjectId);
      setCurriculumTree(tree);
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const allTopics = tree.strands.flatMap((s: any) =>
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        s.sub_strands.flatMap((ss: any) => ss.topics)
      );
      // Filter topics to match the selected class's level
      const filteredTopics = (allTopics as Topic[]).filter((t) => t.class_level === classLevel);
      setTopics(filteredTopics);
      if (filteredTopics.length > 0) {
        setSelectedTopicId(filteredTopics[0].id);
        loadQuestions(filteredTopics[0].id);
      } else {
        setSelectedTopicId('');
        setQuestions([]);
      }
    } finally {
      setLoading(false);
    }
  };

  const loadQuestions = async (topicId: string) => {
    const qs = await getQuestionsByTopic(topicId);
    setQuestions(qs);
  };

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

  const handleCreateTopic = async (data: { name: string; code: string; sub_strand_id: string; class_level: string }) => {
    try {
      const newTopic = await createTopic(data);
      toast.success('Topic created successfully');
      
      // Reload topics and select the new one
      if (subjects.length > 0) {
        const currentSubject = subjects.find(_s => 
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          curriculumTree?.strands?.some((strand: any) => 
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            strand.sub_strands?.some((ss: any) => ss.id === data.sub_strand_id)
          )
        );
        
        // Just reload the current subject tree
        if (currentSubject) {
           await loadTopics(currentSubject.id);
        } else {
           await loadTopics(subjects[0].id);
        }
        setSelectedTopicId(newTopic.id);
        loadQuestions(newTopic.id);
      }
    } catch (err) {
      toast.error('Failed to create topic');
      console.error(err);
    }
  };

  const handleSave = async (questionData: Record<string, unknown>) => {
    if (!teacher) return;

    try {
      if (editingQuestion) {
        await updateQuestion(editingQuestion.id, questionData);
        toast.success('Question updated successfully');
      } else {
        await createQuestion({
          ...questionData,
          topic_id: selectedTopicId,
          owner_teacher_id: teacher.id,
        });
        toast.success('Question created successfully');
      }

      setShowForm(false);
      setEditingQuestion(null);
      loadQuestions(selectedTopicId);
      onQuestionsChange?.();
    } catch (err: any) {
      toast.error(err?.message || 'Failed to save question. Please try again.');
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
      loadQuestions(selectedTopicId);
      onQuestionsChange?.();
    } catch (err) {
      toast.error('Failed to delete question. Please try again.');
    }
  };

  const handleEdit = (q: Question) => {
    setEditingQuestion(q);
    setShowForm(true);
    setPreviewQuestion(null);
  };

  const handlePreview = (q: Question) => {
    setPreviewQuestion(q);
    setShowForm(false);
    setEditingQuestion(null);
  };

  const handleBulkImport = async (questions: Record<string, unknown>[]) => {
    for (const q of questions) {
      if (!teacher) return;
      await createQuestion({
        ...q,
        owner_teacher_id: teacher.id,
      });
    }
    loadQuestions(selectedTopicId);
    onQuestionsChange?.();
  };

  return (
    <div className="space-y-6">
      {/* Topic selector */}
      <div className="flex gap-4 flex-wrap items-end">
        <div className="w-64">
          <Select
            label="Subject"
            options={subjects.map((s) => ({ value: s.id, label: s.name }))}
            onChange={(e) => loadTopics(e.target.value)}
          />
        </div>
        <div className="flex-1 min-w-[280px]">
          <Select
            label="Topic"
            value={selectedTopicId}
            options={[
              ...topics.map((t) => ({ value: t.id, label: `${t.code} — ${t.name}` })),
              { value: 'CREATE_NEW', label: '+ Create New Topic...' }
            ]}
            onChange={(e) => handleTopicChange(e.target.value)}
          />
        </div>
        <div className="text-xs font-medium bg-teal-50 text-teal-700 px-3 py-1.5 rounded-full border border-teal-100 mb-0.5">
          Showing {classLevel === 'B7' ? 'Basic 7' : classLevel === 'B8' ? 'Basic 8' : 'Basic 9'} topics
        </div>
      </div>

      {/* Action bar */}
      <div className="flex items-center justify-between">
        <p className="text-sm text-gray-500">
          {questions.length} question{questions.length !== 1 ? 's' : ''} for this topic
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
          >
            <Upload className="w-4 h-4 mr-2" />
            {showBulkImport ? 'Cancel' : 'Bulk Import'}
          </Button>
          <Button
            onClick={() => {
              setShowForm(!showForm);
              setEditingQuestion(null);
              setPreviewQuestion(null);
            }}
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
          <h2 className="font-semibold text-zinc-900">Questions</h2>
        </CardHeader>
        <CardContent className="p-0">
          {questions.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              <BookOpen className="w-8 h-8 mx-auto mb-2 text-gray-400" />
              No questions yet for this topic.
            </div>
          ) : (
            <div className="divide-y">
              {questions.map((q, i) => (
                <div
                  key={q.id}
                  className="px-4 py-3 flex items-start gap-3 hover:bg-gray-50/50"
                >
                  <span className="text-xs font-medium text-gray-400 mt-1 w-6">{i + 1}</span>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-zinc-900 line-clamp-2">{q.stem}</p>
                    <div className="flex items-center gap-2 mt-1">
                      <span className="text-xs px-1.5 py-0.5 rounded bg-gray-100 text-gray-600">
                        {q.question_type === 'multiple_choice' ? 'MCQ' : q.question_type === 'fill_in_blank' ? 'Fill-in' : q.question_type}
                      </span>
                      <span className="text-xs px-1.5 py-0.5 rounded bg-gray-100 text-gray-600">
                        {q.difficulty}
                      </span>
                      <span className="text-xs px-1.5 py-0.5 rounded bg-gray-100 text-gray-600">
                        {q.blooms_level}
                      </span>
                      {q.visibility === 'shared' && (
                        <span className="text-xs px-1.5 py-0.5 rounded bg-teal-100 text-teal-700">shared</span>
                      )}
                    </div>
                  </div>
                  <div className="flex items-center gap-1 flex-shrink-0">
                    <Button variant="ghost" size="sm" onClick={() => handlePreview(q)} title="Preview">
                      <Eye className="w-4 h-4 text-gray-400" />
                    </Button>
                    <Button variant="ghost" size="sm" onClick={() => handleEdit(q)} title="Edit">
                      <Pencil className="w-4 h-4 text-gray-400" />
                    </Button>
                    <Button variant="ghost" size="sm" onClick={() => handleDelete(q.id)} title="Delete">
                      <Trash2 className="w-4 h-4 text-red-400" />
                    </Button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>

      {/* Preview modal with glassmorphism */}
      {previewQuestion && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center p-4"
          onClick={() => setPreviewQuestion(null)}
        >
          <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" />
          <div
            className="relative w-full max-w-lg max-h-[85vh] overflow-y-auto rounded-2xl border border-white/20 bg-white/80 shadow-2xl backdrop-blur-xl"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="sticky top-0 z-10 flex items-center justify-between px-6 py-4 border-b border-white/30 bg-white/60 backdrop-blur-lg rounded-t-2xl">
              <h3 className="text-lg font-semibold text-zinc-900">Question Preview</h3>
              <div className="flex items-center gap-2">
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => {
                    setPreviewQuestion(null);
                    handleEdit(previewQuestion);
                  }}
                >
                  <Pencil className="w-4 h-4 mr-1" />
                  Edit
                </Button>
                <button
                  onClick={() => setPreviewQuestion(null)}
                  className="p-1.5 rounded-lg hover:bg-gray-200/50 transition-colors"
                >
                  <X className="w-5 h-5 text-gray-500" />
                </button>
              </div>
            </div>
            <div className="p-6">
              <QuestionPreview question={previewQuestion} />
            </div>
          </div>
        </div>
      )}

      {/* Edit/New question modal with glassmorphism */}
      {showForm && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center p-4"
          onClick={() => { setShowForm(false); setEditingQuestion(null); }}
        >
          <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" />
          <div
            className="relative w-full max-w-2xl max-h-[90vh] overflow-y-auto rounded-2xl border border-white/20 bg-white/80 shadow-2xl backdrop-blur-xl"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="sticky top-0 z-10 flex items-center justify-between px-6 py-4 border-b border-white/30 bg-white/60 backdrop-blur-lg rounded-t-2xl">
              <h3 className="text-lg font-semibold text-zinc-900">
                {editingQuestion ? 'Edit Question' : 'New Question'}
              </h3>
              <button
                onClick={() => { setShowForm(false); setEditingQuestion(null); }}
                className="p-1.5 rounded-lg hover:bg-gray-200/50 transition-colors"
              >
                <X className="w-5 h-5 text-gray-500" />
              </button>
            </div>
            <div className="p-6">
              <QuestionForm
                initialData={editingQuestion}
                onSave={handleSave}
                onCancel={() => { setShowForm(false); setEditingQuestion(null); }}
              />
            </div>
          </div>
        </div>
      )}

      {/* Confirm dialog */}
      {ConfirmDialogComponent}
    </div>
  );
}
