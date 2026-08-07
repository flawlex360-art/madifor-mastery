import { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import type { Question } from '@/types/curriculum';
import { getQuestionsByTopicIds } from '@/api/curriculum';
import { Search, Loader2 } from 'lucide-react';

interface LinkQuestionsModalProps {
  isOpen: boolean;
  onClose: () => void;
  topicId: string;
  topicName: string;
  allTopicIdsInSubject: string[];
  onLink: (questionIds: string[]) => Promise<void>;
}

export default function LinkQuestionsModal({ isOpen, onClose, topicId, topicName, allTopicIdsInSubject, onLink }: LinkQuestionsModalProps) {
  const [questions, setQuestions] = useState<Question[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set());
  const [isLinking, setIsLinking] = useState(false);

  useEffect(() => {
    if (isOpen) {
      loadQuestions();
    }
  }, [isOpen]);

  const loadQuestions = async () => {
    setLoading(true);
    try {
      const allQuestions = await getQuestionsByTopicIds(allTopicIdsInSubject);
      // Filter out questions that are already in THIS topic
      setQuestions(allQuestions.filter((q: Question) => q.topic_id !== topicId));
      setSelectedIds(new Set());
    } finally {
      setLoading(false);
    }
  };

  const filteredQuestions = questions.filter(q => 
    q.stem.toLowerCase().includes(search.toLowerCase())
  );

  const toggleSelection = (id: string) => {
    const newSet = new Set(selectedIds);
    if (newSet.has(id)) newSet.delete(id);
    else newSet.add(id);
    setSelectedIds(newSet);
  };

  const handleLink = async () => {
    if (selectedIds.size === 0) return;
    setIsLinking(true);
    try {
      await onLink(Array.from(selectedIds));
      onClose();
    } finally {
      setIsLinking(false);
    }
  };

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="sm:max-w-[700px] max-h-[85vh] flex flex-col">
        <DialogHeader>
          <DialogTitle>Link Questions to {topicName}</DialogTitle>
        </DialogHeader>
        
        <div className="relative mt-4">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 w-4 h-4" />
          <input
            type="text"
            placeholder="Search questions by text..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full pl-9 pr-4 py-2 bg-gray-50 border border-gray-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:border-zinc-900 transition-all"
          />
        </div>

        <div className="flex-1 overflow-y-auto mt-4 min-h-[300px] border rounded-lg">
          {loading ? (
            <div className="flex items-center justify-center h-full">
              <Loader2 className="w-6 h-6 text-zinc-900 animate-spin" />
            </div>
          ) : filteredQuestions.length === 0 ? (
            <div className="flex flex-col items-center justify-center h-full text-gray-500 py-12">
              <p>No questions found.</p>
            </div>
          ) : (
            <div className="divide-y">
              {filteredQuestions.map((q) => (
                <div 
                  key={q.id} 
                  className={`p-3 flex items-start gap-3 cursor-pointer hover:bg-gray-50 transition-colors ${selectedIds.has(q.id) ? 'bg-teal-50/30' : ''}`}
                  onClick={() => toggleSelection(q.id)}
                >
                  <div className="pt-1">
                    <input 
                      type="checkbox" 
                      checked={selectedIds.has(q.id)}
                      onChange={() => {}} // handled by parent div click
                      className="w-4 h-4 text-zinc-900 rounded border-gray-300 focus:ring-teal-500"
                    />
                  </div>
                  <div>
                    <p className="text-sm text-zinc-900 line-clamp-2">{q.stem}</p>
                    <div className="flex gap-2 mt-1">
                      <span className="text-[10px] uppercase font-medium px-2 py-0.5 rounded bg-gray-100 text-gray-600">
                        {q.difficulty}
                      </span>
                      <span className="text-[10px] uppercase font-medium px-2 py-0.5 rounded bg-gray-100 text-gray-600">
                        {q.question_type.replace('_', ' ')}
                      </span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        <DialogFooter className="mt-6">
          <div className="flex items-center justify-between w-full">
            <span className="text-sm text-gray-500">
              {selectedIds.size} selected
            </span>
            <div className="flex gap-2">
              <Button variant="outline" onClick={onClose} disabled={isLinking}>
                Cancel
              </Button>
              <Button onClick={handleLink} disabled={isLinking || selectedIds.size === 0}>
                {isLinking ? 'Linking...' : 'Link Selected'}
              </Button>
            </div>
          </div>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
