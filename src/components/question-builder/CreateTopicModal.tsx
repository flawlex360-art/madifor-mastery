import { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter } from '@/components/ui/Dialog';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Select from '@/components/ui/Select';

interface CurriculumSubStrandNode {
  id: string;
  name: string;
}

interface CurriculumStrandNode {
  id: string;
  name: string;
  sub_strands?: CurriculumSubStrandNode[];
}

interface CreateTopicModalProps {
  isOpen: boolean;
  onClose: () => void;
  curriculumTree: { strands?: CurriculumStrandNode[] } | null;
  classLevel: string;
  onSave: (data: { name: string; code: string; sub_strand_id: string; class_level: string }) => Promise<void>;
}

export default function CreateTopicModal({
  isOpen,
  onClose,
  curriculumTree,
  classLevel,
  onSave,
}: CreateTopicModalProps) {
  const [name, setName] = useState('');
  const [code, setCode] = useState('');
  const [strandId, setStrandId] = useState('');
  const [subStrandId, setSubStrandId] = useState('');
  const [loading, setLoading] = useState(false);

  const strands = curriculumTree?.strands || [];
  const selectedStrand = strands.find((s) => s.id === strandId);
  const subStrands = selectedStrand?.sub_strands || [];

  useEffect(() => {
    if (isOpen) {
      setName('');
      setCode('');
      setStrandId('');
      setSubStrandId('');
    }
  }, [isOpen]);

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!subStrandId || !name.trim() || !code.trim()) return;

    setLoading(true);
    try {
      await onSave({
        name: name.trim(),
        code: code.trim(),
        sub_strand_id: subStrandId,
        class_level: classLevel,
      });
      onClose();
    } finally {
      setLoading(false);
    }
  };

  return (
    <Dialog open={isOpen} onOpenChange={(open) => !open && onClose()} disableClose={loading}>
      <DialogContent className="sm:max-w-[440px]">
        <DialogHeader>
          <DialogTitle>Create New Topic ({classLevel})</DialogTitle>
        </DialogHeader>

        <form onSubmit={handleSave} className="space-y-4 pt-4">
          <Select
            label="Strand"
            value={strandId}
            options={[
              { value: '', label: 'Select a strand...' },
              ...strands.map((s) => ({ value: s.id, label: s.name })),
            ]}
            onChange={(e) => {
              setStrandId(e.target.value);
              setSubStrandId('');
            }}
            required
          />

          <Select
            label="Sub-Strand"
            value={subStrandId}
            options={[
              { value: '', label: strandId ? 'Select a sub-strand...' : 'Select a strand first' },
              ...subStrands.map((ss) => ({ value: ss.id, label: ss.name })),
            ]}
            onChange={(e) => setSubStrandId(e.target.value)}
            disabled={!strandId || subStrands.length === 0}
            required
          />

          <Input
            label="Topic Name"
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder="e.g. Particulate Nature of Matter"
            required
          />

          <Input
            label="Topic Code"
            value={code}
            onChange={(e) => setCode(e.target.value)}
            placeholder={`e.g. ${classLevel}.1.1.1`}
            required
          />

          <DialogFooter className="pt-2">
            <Button type="button" variant="outline" onClick={onClose} disabled={loading}>
              Cancel
            </Button>
            <Button type="submit" disabled={loading || !name.trim() || !code.trim() || !subStrandId}>
              {loading ? 'Creating...' : 'Create Topic'}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  );
}
