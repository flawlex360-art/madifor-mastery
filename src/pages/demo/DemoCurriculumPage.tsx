import { useState } from 'react';
import { Card } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import { Folder, FolderOpen, FileText, ChevronRight, ChevronDown, ArrowRightLeft } from 'lucide-react';
import { toast } from '@/stores/toastStore';
import Select from '@/components/ui/Select';
import { DEMO_TOPICS, DEMO_QUESTIONS, type DemoTopic } from './demoData';

const DEMO_SUBJECTS = [{ id: 's1', name: 'Integrated Science (B8)' }];

const DEMO_TREE = {
  id: 's1',
  name: 'Integrated Science',
  strands: [
    {
      id: 'st1',
      name: 'Diversity of Matter',
      sub_strands: [
        { id: 'ss1', name: 'Materials', topics: [DEMO_TOPICS[0]] },
        { id: 'ss2', name: 'Living Cells', topics: [DEMO_TOPICS[1]] },
      ],
    },
    {
      id: 'st2',
      name: 'Cycles',
      sub_strands: [
        { id: 'ss3', name: 'Earth Cycles', topics: [DEMO_TOPICS[2]] },
      ],
    },
    {
      id: 'st3',
      name: 'Systems',
      sub_strands: [
        { id: 'ss4', name: 'Ecosystems', topics: [DEMO_TOPICS[4]] },
      ],
    },
    {
      id: 'st4',
      name: 'Forces and Energy',
      sub_strands: [
        { id: 'ss5', name: 'Forces and Motion', topics: [DEMO_TOPICS[3]] },
      ],
    },
  ],
};

export default function DemoCurriculumPage() {
  const [selectedSubjectId, setSelectedSubjectId] = useState('s1');
  const [expandedNodes, setExpandedNodes] = useState<Set<string>>(
    new Set(['st1', 'st2', 'st3', 'st4', 'ss1', 'ss2', 'ss3', 'ss4', 'ss5'])
  );
  const [selectedTopic, setSelectedTopic] = useState<DemoTopic | null>(DEMO_TOPICS[0]);

  const toggleNode = (id: string) => {
    setExpandedNodes((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  };

  const handleReadOnlyAction = () => {
    toast.info('Moving questions is disabled in Demo mode.');
  };

  const topicQuestions = selectedTopic
    ? DEMO_QUESTIONS.filter((q) => q.topic_id === selectedTopic.id)
    : [];

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-navy-900">Curriculum Explorer</h1>
          <p className="text-sm text-slate-500 mt-1">Explore sample B8 strands, sub-strands, and questions</p>
        </div>
        <div className="w-full sm:w-64">
          <Select
            options={DEMO_SUBJECTS.map((s) => ({ value: s.id, label: s.name }))}
            value={selectedSubjectId}
            onChange={(e) => setSelectedSubjectId(e.target.value)}
          />
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <Card className="lg:col-span-1 lg:h-[calc(100vh-250px)] overflow-hidden flex flex-col">
          <div className="p-4 border-b border-slate-100 bg-slate-50/70">
            <h2 className="font-semibold text-navy-900">Curriculum Tree</h2>
          </div>
          <div className="flex-1 overflow-y-auto p-3.5 custom-scrollbar">
            <div className="space-y-1">
              {DEMO_TREE.strands.map((strand) => (
                <div key={strand.id} className="text-sm">
                  <button
                    type="button"
                    className="w-full flex items-center gap-2 py-2 px-2.5 hover:bg-slate-100 rounded-lg text-left text-navy-900 font-semibold"
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
                            className="w-full flex items-center gap-2 py-1.5 px-2 hover:bg-slate-100 rounded-lg text-left text-slate-700 font-medium"
                            onClick={() => toggleNode(ss.id)}
                          >
                            {expandedNodes.has(ss.id) ? (
                              <ChevronDown className="w-3.5 h-3.5 text-slate-400 flex-shrink-0" />
                            ) : (
                              <ChevronRight className="w-3.5 h-3.5 text-slate-400 flex-shrink-0" />
                            )}
                            <Folder className="w-4 h-4 text-navy-600 flex-shrink-0" />
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
                                    onClick={() => setSelectedTopic(t)}
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
          </div>
        </Card>

        <Card className="lg:col-span-2 lg:h-[calc(100vh-250px)] flex flex-col overflow-hidden">
          {!selectedTopic ? (
            <div className="flex-1 flex flex-col items-center justify-center text-slate-500 p-10 text-center">
              <FolderOpen className="w-12 h-12 text-slate-300 mb-4" />
              <h3 className="text-lg font-semibold text-navy-900">No Topic Selected</h3>
              <p className="max-w-sm mt-2 text-sm">Select any topic from the tree to preview its questions.</p>
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
                    {topicQuestions.length} Sample Questions
                  </p>
                </div>
                <Button onClick={handleReadOnlyAction}>
                  <ArrowRightLeft className="w-4 h-4 mr-2" />
                  Move Questions Here
                </Button>
              </div>

              <div className="flex-1 overflow-y-auto bg-slate-50/50 p-6 custom-scrollbar">
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
                            MCQ
                          </span>
                          <span className="text-[11px] px-2 py-0.5 rounded-full bg-slate-100 text-slate-600 font-medium uppercase">
                            {q.difficulty.replace(/_/g, ' ')}
                          </span>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </>
          )}
        </Card>
      </div>
    </div>
  );
}
