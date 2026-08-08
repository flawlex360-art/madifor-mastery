import { useState } from 'react';
import { Card } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import { Folder, FolderOpen, FileText, ChevronRight, ChevronDown, Link } from 'lucide-react';
import { toast } from '@/stores/toastStore';
import Select from '@/components/ui/Select';
import { DEMO_TOPICS, DEMO_QUESTIONS } from './demoData';

const DEMO_SUBJECTS = [{ id: 's1', name: 'Science' }];

const DEMO_TREE = {
  id: 's1',
  name: 'Science',
  strands: [
    {
      id: 'st1',
      name: 'Diversity of Matter',
      sub_strands: [
        {
          id: 'ss1',
          name: 'Materials',
          topics: [DEMO_TOPICS[0]]
        },
        {
          id: 'ss2',
          name: 'Living Cells',
          topics: [DEMO_TOPICS[1]]
        }
      ]
    },
    {
      id: 'st2',
      name: 'Forces and Energy',
      sub_strands: [
        {
          id: 'ss3',
          name: 'Forces and Motion',
          topics: [DEMO_TOPICS[2]]
        }
      ]
    }
  ]
};

export default function DemoCurriculumPage() {
  const [selectedSubjectId, setSelectedSubjectId] = useState('s1');
  const [expandedNodes, setExpandedNodes] = useState<Set<string>>(new Set(['st1', 'st2']));
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const [selectedTopic, setSelectedTopic] = useState<any>(null);

  const toggleNode = (id: string) => {
    const newSet = new Set(expandedNodes);
    if (newSet.has(id)) newSet.delete(id);
    else newSet.add(id);
    setExpandedNodes(newSet);
  };

  const handleLinkQuestions = () => {
    toast.error('Editing is disabled in the demo environment.');
  };

  const filteredStrands = DEMO_TREE.strands;
  const topicQuestions = selectedTopic ? DEMO_QUESTIONS.filter(q => q.topic_id === selectedTopic.id) : [];

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-zinc-950">Curriculum Explorer</h1>
          <p className="text-gray-500 mt-1">Manage topics and link questions</p>
        </div>
        <div className="w-64">
          <Select
            options={DEMO_SUBJECTS.map(s => ({ value: s.id, label: s.name }))}
            value={selectedSubjectId}
            onChange={(e) => setSelectedSubjectId(e.target.value)}
          />
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Left Column: Tree Explorer */}
        <Card className="lg:col-span-1 h-[calc(100vh-220px)] overflow-hidden flex flex-col">
          <div className="p-4 border-b bg-gray-50/50">
            <h2 className="font-semibold text-zinc-900">Curriculum Tree</h2>
          </div>
          <div className="flex-1 overflow-y-auto p-4">
            <div className="space-y-1">
              {filteredStrands.map((strand) => (
                <div key={strand.id} className="text-sm">
                  {/* Strand Node */}
                  <div 
                    className="flex items-center gap-2 py-1.5 px-2 hover:bg-gray-100 rounded cursor-pointer text-zinc-900 font-medium"
                    onClick={() => toggleNode(strand.id)}
                  >
                    {expandedNodes.has(strand.id) ? <ChevronDown className="w-4 h-4 text-gray-400" /> : <ChevronRight className="w-4 h-4 text-gray-400" />}
                    {expandedNodes.has(strand.id) ? <FolderOpen className="w-4 h-4 text-zinc-900" /> : <Folder className="w-4 h-4 text-zinc-900" />}
                    <span className="truncate">{strand.name}</span>
                  </div>

                  {/* Sub-strands */}
                  {expandedNodes.has(strand.id) && (
                    <div className="ml-6 border-l-2 border-gray-100 pl-2 mt-1 space-y-1">
                      {strand.sub_strands.map((ss) => (
                        <div key={ss.id}>
                          <div 
                            className="flex items-center gap-2 py-1.5 px-2 hover:bg-gray-100 rounded cursor-pointer text-gray-700"
                            onClick={() => toggleNode(ss.id)}
                          >
                            {expandedNodes.has(ss.id) ? <ChevronDown className="w-3 h-3 text-gray-400" /> : <ChevronRight className="w-3 h-3 text-gray-400" />}
                            {expandedNodes.has(ss.id) ? <FolderOpen className="w-4 h-4 text-blue-500" /> : <Folder className="w-4 h-4 text-blue-500" />}
                            <span className="truncate">{ss.name}</span>
                          </div>

                          {/* Topics */}
                          {expandedNodes.has(ss.id) && (
                            <div className="ml-5 border-l-2 border-gray-100 pl-2 mt-1 space-y-0.5">
                              {ss.topics.map((t) => (
                                <div 
                                  key={t.id}
                                  className={`flex items-center gap-2 py-1.5 px-2 rounded cursor-pointer text-gray-600 ${selectedTopic?.id === t.id ? 'bg-teal-50 text-teal-700 font-medium' : 'hover:bg-gray-100'}`}
                                  onClick={() => setSelectedTopic(t)}
                                >
                                  <FileText className={`w-3.5 h-3.5 ${selectedTopic?.id === t.id ? 'text-zinc-900' : 'text-gray-400'}`} />
                                  <span className="truncate">{t.code} — {t.name}</span>
                                </div>
                              ))}
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

        {/* Right Column: Topic Details & Questions */}
        <Card className="lg:col-span-2 h-[calc(100vh-220px)] flex flex-col">
          {!selectedTopic ? (
            <div className="flex-1 flex flex-col items-center justify-center text-gray-500 p-8 text-center">
              <FolderOpen className="w-12 h-12 text-gray-300 mb-4" />
              <h3 className="text-lg font-medium text-zinc-900">No Topic Selected</h3>
              <p className="max-w-sm mt-2">Select a topic from the curriculum tree on the left to view its details and manage linked questions.</p>
            </div>
          ) : (
            <>
              <div className="p-6 border-b flex items-start justify-between bg-white">
                <div>
                  <div className="text-xs font-semibold text-zinc-900 uppercase tracking-wider mb-1">{selectedTopic.code}</div>
                  <h2 className="text-xl font-bold text-zinc-950">{selectedTopic.name}</h2>
                  <p className="text-sm text-gray-500 mt-1">{topicQuestions.length} Questions Linked</p>
                </div>
                <Button onClick={handleLinkQuestions}>
                  <Link className="w-4 h-4 mr-2" />
                  Link Questions
                </Button>
              </div>
              
              <div className="flex-1 overflow-y-auto bg-gray-50/50 p-6">
                {topicQuestions.length === 0 ? (
                  <div className="text-center py-12 bg-white rounded-lg border border-dashed border-gray-300">
                    <FileText className="w-10 h-10 text-gray-300 mx-auto mb-3" />
                    <h3 className="text-sm font-medium text-zinc-900">No Questions Linked</h3>
                    <p className="text-sm text-gray-500 mt-1">This topic is empty.</p>
                    <Button variant="outline" className="mt-4" onClick={handleLinkQuestions}>
                      Link Existing Questions
                    </Button>
                  </div>
                ) : (
                  <div className="space-y-3">
                    {topicQuestions.map((q, i) => (
                      <div key={q.id} className="bg-white p-4 rounded-lg border shadow-sm flex gap-4">
                        <div className="flex-shrink-0 w-6 h-6 rounded-full bg-teal-50 text-zinc-900 flex items-center justify-center text-xs font-bold">
                          {i + 1}
                        </div>
                        <div className="flex-1">
                          <p className="text-sm text-zinc-950 font-medium">{q.text}</p>
                          <div className="flex gap-2 mt-2">
                            <span className="text-xs px-2 py-0.5 rounded-full bg-gray-100 text-gray-600 font-medium uppercase">
                              {q.type.replace('_', ' ')}
                            </span>
                            <span className="text-xs px-2 py-0.5 rounded-full bg-gray-100 text-gray-600 font-medium uppercase">
                              {q.difficulty}
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
    </div>
  );
}
