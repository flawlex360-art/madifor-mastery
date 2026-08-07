import { useState } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Select from '@/components/ui/Select';

interface CreateTopicModalProps {
  isOpen: boolean;
  onClose: () => void;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  curriculumTree: any; // Using any to quickly handle the tree structure for now
  classLevel: string;
  onSave: (data: { name: string; code: string; sub_strand_id: string; class_level: string }) => Promise<void>;
}

export default function CreateTopicModal({ isOpen, onClose, curriculumTree, classLevel, onSave }: CreateTopicModalProps) {
  const [name, setName] = useState('');
  const [code, setCode] = useState('');
  const [strandId, setStrandId] = useState('');
  const [subStrandId, setSubStrandId] = useState('');
  const [loading, setLoading] = useState(false);

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const strands = curriculumTree?.strands || [];
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const selectedStrand = strands.find((s: any) => s.id === strandId);
  const subStrands = selectedStrand?.sub_strands || [];

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!subStrandId || !name || !code) return;
    
    setLoading(true);
    try {
      await onSave({
        name,
        code,
        sub_strand_id: subStrandId,
        class_level: classLevel,
      });
      onClose();
      setName('');
      setCode('');
      setStrandId('');
      setSubStrandId('');
    } finally {
      setLoading(false);
    }
  };

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="sm:max-w-[425px]">
        <DialogHeader>
          <DialogTitle>Create New Topic ({classLevel})</DialogTitle>
        </DialogHeader>
        
        <form onSubmit={handleSave} className="space-y-4 py-4">
          <Select
            label="Strand"
            value={strandId}
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            options={strands.map((s: any) => ({ value: s.id, label: s.name }))}
            onChange={(e) => {
              setStrandId(e.target.value);
              setSubStrandId('');
            }}
            required
          />

          <Select
            label="Sub-Strand"
            value={subStrandId}
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            options={subStrands.map((ss: any) => ({ value: ss.id, label: ss.name }))}
            onChange={(e) => setSubStrandId(e.target.value)}
            disabled={!strandId}
            required
          />

          <Input
            label="Topic Name"
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder="e.g. Algebraic Expressions"
            required
          />

          <Input
            label="Topic Code"
            value={code}
            onChange={(e) => setCode(e.target.value)}
            placeholder="e.g. B7.2.1.1"
            required
          />

          <DialogFooter className="mt-6">
            <Button type="button" variant="outline" onClick={onClose} disabled={loading}>
              Cancel
            </Button>
            <Button type="submit" disabled={loading || !name || !code || !subStrandId}>
              {loading ? 'Creating...' : 'Create Topic'}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  );
}
