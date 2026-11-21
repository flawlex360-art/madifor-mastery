import { useState, useEffect, useCallback } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import type { Question } from '@/types/curriculum';
import { getQuestionsByTopicIds } from '@/api/curriculum';
import { toast } from '@/stores/toastStore';
import { Search, Loader2 } from 'lucide-react';

interface LinkQuestionsModalProps {
  isOpen: boolean;
  onClose: () => void;
  topicId: string;
  topicName: string;
  allTopicIdsInSubject: string[];
  currentTeacherId?: string;
  isAdmin?: boolean;
  onLink: (questionIds: string[]) => Promise<void>;
}

export default function LinkQuestionsModal({
  isOpen,
  onClose,
  topicId,
  topicName,
  allTopicIdsInSubject,
  currentTeacherId,
  isAdmin = false,
  onLink,
}: LinkQuestionsModalProps) {
  const [questions, setQuestions] = useState<Question[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set());
  const [isLinking, setIsLinking] = useState(false);

  const loadQuestions = useCallback(async () => {
    setLoading(true);
    try {
      const allQuestions = await getQuestionsByTopicIds(allTopicIdsInSubject);
      // Show only questions in OTHER topics that this teacher is allowed to move
      setQuestions(
        allQuestions.filter(
          (q: Question) =>
            q.topic_id !== topicId &&
            (isAdmin || !currentTeacherId || q.owner_teacher_id === currentTeacherId)
        )
      );
      setSelectedIds(new Set());
      setSearch('');
    } catch (err) {
      console.error('Failed to load questions:', err);
      toast.error('Failed to load questions.');
    } finally {
      setLoading(false);
    }
  }, [allTopicIdsInSubject, topicId, currentTeacherId, isAdmin]);

  useEffect(() => {
    if (isOpen) {
      loadQuestions();
    }
  }, [isOpen, loadQuestions]);

  const filteredQuestions = questions.filter((q) =>
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
    } catch (err) {
      console.error('Failed to move questions:', err);
      toast.error('Could not move selected questions. Check permissions.');
    } finally {
      setIsLinking(false);
    }
  };

  return (
    <Dialog open={isOpen} onOpenChange={(open) => !open && onClose()} disableClose={isLinking}>
      <DialogContent className="sm:max-w-[700px] max-h-[85vh] flex flex-col">
        <DialogHeader>
          <DialogTitle>Move Questions to {topicName}</DialogTitle>
          <p className="text-xs text-slate-500 mt-1">
            Select from your existing questions in other topics to reassign them to this topic.
          </p>
        </DialogHeader>

        <div className="relative mt-4">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 w-4 h-4" />
          <input
            type="text"
            placeholder="Search questions by text..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full pl-9 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-lg text-sm text-navy-900 placeholder:text-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 transition-all"
          />
        </div>

        <div className="flex-1 overflow-y-auto mt-4 min-h-[280px] border border-slate-200 rounded-xl custom-scrollbar">
          {loading ? (
            <div className="flex items-center justify-center h-full py-12">
              <Loader2 className="w-6 h-6 text-indigo-600 animate-spin" />
            </div>
          ) : filteredQuestions.length === 0 ? (
            <div className="flex flex-col items-center justify-center h-full text-slate-500 py-12 px-4 text-center text-sm">
              <p>
                {search
                  ? 'No movable questions match your search.'
                  : 'No movable questions found in other topics.'}
              </p>
            </div>
          ) : (
            <div className="divide-y divide-slate-100">
              {filteredQuestions.map((q) => (
                <div
                  key={q.id}
                  className={`p-3.5 flex items-start gap-3 cursor-pointer hover:bg-slate-50 transition-colors ${
                    selectedIds.has(q.id) ? 'bg-indigo-50/50' : ''
                  }`}
                  onClick={() => toggleSelection(q.id)}
                >
                  <div className="pt-0.5">
                    <input
                      type="checkbox"
                      checked={selectedIds.has(q.id)}
                      onChange={() => {}}
                      className="w-4 h-4 text-indigo-600 rounded border-slate-300 focus:ring-indigo-500"
                    />
                  </div>
                  <div className="min-w-0">
                    <p className="text-sm text-navy-900 line-clamp-2">{q.stem}</p>
                    <div className="flex gap-2 mt-1.5">
                      <span className="text-[11px] uppercase font-medium px-2 py-0.5 rounded bg-slate-100 text-slate-600">
                        {q.difficulty}
                      </span>
                      <span className="text-[11px] uppercase font-medium px-2 py-0.5 rounded bg-slate-100 text-slate-600">
                        {q.question_type.replace(/_/g, ' ')}
                      </span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        <DialogFooter className="mt-5">
          <div className="flex items-center justify-between w-full">
            <span className="text-sm text-slate-500 font-medium">
              {selectedIds.size} selected
            </span>
            <div className="flex gap-2">
              <Button variant="outline" onClick={onClose} disabled={isLinking}>
                Cancel
              </Button>
              <Button onClick={handleLink} disabled={isLinking || selectedIds.size === 0}>
                {isLinking ? 'Moving...' : 'Move Selected'}
              </Button>
            </div>
          </div>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
