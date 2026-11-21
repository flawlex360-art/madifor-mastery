import { useState, useEffect, useCallback, useMemo } from 'react';
import { getSubjects, getCurriculumTree, getQuestionsByTopic, updateQuestionTopic } from '@/api/curriculum';
import { Card } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import type { Subject, Topic, Question } from '@/types/curriculum';
import { useSelectedClass } from '@/context/SelectedClassContext';
import { useAuth } from '@/hooks/useAuth';
import { Folder, FolderOpen, FileText, ChevronRight, ChevronDown, ArrowRightLeft, Loader2 } from 'lucide-react';
import LinkQuestionsModal from '@/components/curriculum/LinkQuestionsModal';
import { toast } from '@/stores/toastStore';
import Select from '@/components/ui/Select';

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

export default function CurriculumPage() {
  const { teacher } = useAuth();
  const { selectedClass } = useSelectedClass();
  const classLevel = selectedClass?.class_level || 'B8';

  const [subjects, setSubjects] = useState<Subject[]>([]);
  const [selectedSubjectId, setSelectedSubjectId] = useState('');
  const [curriculumTree, setCurriculumTree] = useState<CurriculumTreeData | null>(null);
  const [loading, setLoading] = useState(true);

  const [expandedNodes, setExpandedNodes] = useState<Set<string>>(new Set());
  const [selectedTopic, setSelectedTopic] = useState<Topic | null>(null);

  const [topicQuestions, setTopicQuestions] = useState<Question[]>([]);
  const [questionsLoading, setQuestionsLoading] = useState(false);
  const [showLinkModal, setShowLinkModal] = useState(false);

  const loadTree = useCallback(async (subjectId: string) => {
    setLoading(true);
    setSelectedTopic(null);
    setTopicQuestions([]);
    try {
      const tree = (await getCurriculumTree(subjectId)) as CurriculumTreeData;
      setCurriculumTree(tree);
      const newExpanded = new Set<string>();
      tree.strands.forEach((s) => newExpanded.add(s.id));
      setExpandedNodes(newExpanded);
    } catch (err) {
      console.error('Failed to load curriculum tree:', err);
      toast.error('Failed to load curriculum structure.');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    let active = true;
    getSubjects()
      .then((s) => {
        if (!active) return;
        setSubjects(s);
        if (s.length > 0) {
          setSelectedSubjectId(s[0].id);
          loadTree(s[0].id);
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
  }, [loadTree]);

  // Clear selected topic if class level changes and topic no longer belongs to it
  useEffect(() => {
    if (selectedTopic && selectedTopic.class_level !== classLevel) {
      setSelectedTopic(null);
      setTopicQuestions([]);
    }
  }, [classLevel, selectedTopic]);

  const handleSubjectChange = (subjectId: string) => {
    setSelectedSubjectId(subjectId);
    loadTree(subjectId);
  };

  const toggleNode = (id: string) => {
    setExpandedNodes((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  };

  const handleSelectTopic = async (topic: Topic) => {
    setSelectedTopic(topic);
    setQuestionsLoading(true);
    try {
      const qs = await getQuestionsByTopic(topic.id);
      setTopicQuestions(qs);
    } catch (err) {
      console.error('Failed to load topic questions:', err);
      toast.error('Failed to load questions for this topic.');
    } finally {
      setQuestionsLoading(false);
    }
  };

  const handleMoveQuestions = async (questionIds: string[]) => {
    if (!selectedTopic) return;
    try {
      const count = await updateQuestionTopic(questionIds, selectedTopic.id);
      toast.success(`Moved ${count} question${count !== 1 ? 's' : ''} to ${selectedTopic.name}`);
      const qs = await getQuestionsByTopic(selectedTopic.id);
      setTopicQuestions(qs);
    } catch (err) {
      console.error('Failed to move questions:', err);
      toast.error(err instanceof Error ? err.message : 'Failed to move selected questions');
      throw err;
    }
  };

  const allTopicIdsInSubject = useMemo(
    () =>
      curriculumTree
        ? curriculumTree.strands.flatMap((s) =>
            s.sub_strands.flatMap((ss) => ss.topics.map((t) => t.id))
          )
        : [],
    [curriculumTree]
  );

  const filteredStrands = useMemo(
    () =>
      curriculumTree?.strands
        ?.map((strand) => {
          const filteredSubStrands =
            strand.sub_strands
              ?.map((ss) => {
                const filteredTopics = ss.topics?.filter((t) => t.class_level === classLevel) || [];
                return { ...ss, topics: filteredTopics };
              })
              .filter((ss) => ss.topics.length > 0) || [];
          return { ...strand, sub_strands: filteredSubStrands };
        })
        .filter((strand) => strand.sub_strands.length > 0) || [],
    [curriculumTree, classLevel]
  );

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-navy-900">Curriculum Explorer</h1>
          <p className="text-sm text-slate-500 mt-1">
            Browse NaCCA strands and organize topic questions ({classLevel})
          </p>
        </div>
        <div className="w-full sm:w-64">
          <Select
            options={subjects.map((s) => ({ value: s.id, label: s.name }))}
            value={selectedSubjectId}
            onChange={(e) => handleSubjectChange(e.target.value)}
          />
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Left Column: Tree Explorer */}
        <Card className="lg:col-span-1 lg:h-[calc(100vh-210px)] max-h-[540px] lg:max-h-none overflow-hidden flex flex-col">
          <div className="p-4 border-b border-slate-100 bg-slate-50/70">
            <h2 className="font-semibold text-navy-900">Curriculum Tree</h2>
          </div>
          <div className="flex-1 overflow-y-auto p-3.5 custom-scrollbar">
            {loading ? (
              <div className="flex justify-center items-center py-12">
                <Loader2 className="w-6 h-6 animate-spin text-indigo-600" />
              </div>
            ) : filteredStrands.length === 0 ? (
              <div className="text-center text-slate-500 py-10 text-sm">
                No strands found for {classLevel}.
              </div>
            ) : (
              <div className="space-y-1">
                {filteredStrands.map((strand) => (
                  <div key={strand.id} className="text-sm">
                    <button
                      type="button"
                      className="w-full flex items-center gap-2 py-2 px-2.5 hover:bg-slate-100 rounded-lg text-left text-navy-900 font-semibold transition-colors"
                      onClick={() => toggleNode(strand.id)}
                    >
                      {expandedNodes.has(strand.id) ? (
                        <ChevronDown className="w-4 h-4 text-slate-400 flex-shrink-0" />
                      ) : (
                        <ChevronRight className="w-4 h-4 text-slate-400 flex-shrink-0" />
                      )}
                      {expandedNodes.has(strand.id) ? (
                        <FolderOpen className="w-4 h-4 text-indigo-600 flex-shrink-0" />
                      ) : (
                        <Folder className="w-4 h-4 text-indigo-600 flex-shrink-0" />
                      )}
                      <span className="truncate">{strand.name}</span>
                    </button>

                    {expandedNodes.has(strand.id) && (
                      <div className="ml-5 border-l-2 border-slate-100 pl-2 mt-1 space-y-1">
                        {strand.sub_strands.map((ss) => (
                          <div key={ss.id}>
                            <button
                              type="button"
                              className="w-full flex items-center gap-2 py-1.5 px-2 hover:bg-slate-100 rounded-lg text-left text-slate-700 font-medium transition-colors"
                              onClick={() => toggleNode(ss.id)}
                            >
                              {expandedNodes.has(ss.id) ? (
                                <ChevronDown className="w-3.5 h-3.5 text-slate-400 flex-shrink-0" />
                              ) : (
                                <ChevronRight className="w-3.5 h-3.5 text-slate-400 flex-shrink-0" />
                              )}
                              {expandedNodes.has(ss.id) ? (
                                <FolderOpen className="w-4 h-4 text-navy-600 flex-shrink-0" />
                              ) : (
                                <Folder className="w-4 h-4 text-navy-600 flex-shrink-0" />
                              )}
                              <span className="truncate">{ss.name}</span>
                            </button>

                            {expandedNodes.has(ss.id) && (
                              <div className="ml-5 border-l-2 border-slate-100 pl-2 mt-1 space-y-0.5">
                                {ss.topics.map((t) => {
                                  const isSelected = selectedTopic?.id === t.id;
                                  return (
                                    <button
                                      key={t.id}
                                      type="button"
                                      className={`w-full flex items-center gap-2 py-1.5 px-2.5 rounded-lg text-left transition-colors ${
                                        isSelected
                                          ? 'bg-indigo-50 text-indigo-700 font-semibold'
                                          : 'text-slate-600 hover:bg-slate-100'
                                      }`}
                                      onClick={() => handleSelectTopic(t)}
                                    >
                                      <FileText
                                        className={`w-3.5 h-3.5 flex-shrink-0 ${
                                          isSelected ? 'text-indigo-600' : 'text-slate-400'
                                        }`}
                                      />
                                      <span className="truncate">
                                        {t.code} — {t.name}
                                      </span>
                                    </button>
                                  );
                                })}
                              </div>
                            )}
                          </div>
                        ))}
                      </div>
                    )}
                  </div>
                ))}
              </div>
            )}
          </div>
        </Card>

        {/* Right Column: Topic Details & Questions */}
        <Card className="lg:col-span-2 lg:h-[calc(100vh-210px)] flex flex-col overflow-hidden">
          {!selectedTopic ? (
            <div className="flex-1 flex flex-col items-center justify-center text-slate-500 p-10 text-center">
              <FolderOpen className="w-12 h-12 text-slate-300 mb-4" />
              <h3 className="text-lg font-semibold text-navy-900">No Topic Selected</h3>
              <p className="max-w-sm mt-2 text-sm">
                Select a topic from the curriculum tree to inspect its questions or move your custom questions into it.
              </p>
            </div>
          ) : (
            <>
              <div className="p-6 border-b border-slate-100 flex flex-wrap items-start justify-between gap-4 bg-white">
                <div>
                  <div className="text-xs font-mono font-semibold text-indigo-600 uppercase tracking-wider mb-1">
                    {selectedTopic.code}
                  </div>
                  <h2 className="text-xl font-bold text-navy-900">{selectedTopic.name}</h2>
                  <p className="text-sm text-slate-500 mt-1">
                    {topicQuestions.length} Question{topicQuestions.length !== 1 ? 's' : ''} Available
                  </p>
                </div>
                <Button onClick={() => setShowLinkModal(true)}>
                  <ArrowRightLeft className="w-4 h-4 mr-2" />
                  Move Questions Here
                </Button>
              </div>

              <div className="flex-1 overflow-y-auto bg-slate-50/50 p-6 custom-scrollbar">
                {questionsLoading ? (
                  <div className="flex justify-center py-12">
                    <Loader2 className="w-8 h-8 animate-spin text-indigo-600" />
                  </div>
                ) : topicQuestions.length === 0 ? (
                  <div className="text-center py-12 bg-white rounded-xl border border-dashed border-slate-300">
                    <FileText className="w-10 h-10 text-slate-300 mx-auto mb-3" />
                    <h3 className="text-sm font-semibold text-navy-900">No Questions Linked</h3>
                    <p className="text-sm text-slate-500 mt-1">This topic has no questions yet.</p>
                    <Button variant="outline" className="mt-4" onClick={() => setShowLinkModal(true)}>
                      Move Existing Questions
                    </Button>
                  </div>
                ) : (
                  <div className="space-y-3">
                    {topicQuestions.map((q, i) => (
                      <div key={q.id} className="bg-white p-4 rounded-xl border border-slate-200 flex gap-3.5">
                        <div className="flex-shrink-0 w-7 h-7 rounded-full bg-indigo-50 text-indigo-700 flex items-center justify-center text-xs font-bold tabular-nums">
                          {i + 1}
                        </div>
                        <div className="flex-1 min-w-0">
                          <p className="text-sm text-navy-900 font-medium">{q.stem}</p>
                          <div className="flex flex-wrap gap-2 mt-2">
                            <span className="text-[11px] px-2 py-0.5 rounded-full bg-slate-100 text-slate-600 font-medium uppercase">
                              {q.question_type.replace(/_/g, ' ')}
                            </span>
                            <span className="text-[11px] px-2 py-0.5 rounded-full bg-slate-100 text-slate-600 font-medium uppercase">
                              {q.difficulty.replace(/_/g, ' ')}
                            </span>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            </>
          )}
        </Card>
      </div>

      {showLinkModal && selectedTopic && (
        <LinkQuestionsModal
          isOpen={showLinkModal}
          onClose={() => setShowLinkModal(false)}
          topicId={selectedTopic.id}
          topicName={selectedTopic.name}
          allTopicIdsInSubject={allTopicIdsInSubject}
          currentTeacherId={teacher?.id}
          isAdmin={teacher?.is_admin}
          onLink={handleMoveQuestions}
        />
      )}
    </div>
  );
}
