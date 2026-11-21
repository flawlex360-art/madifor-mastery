import { useState } from 'react';
import Button from '@/components/ui/Button';
import { Download, FileText, Table } from 'lucide-react';
import { csvEscape } from '@/lib/exportUtils';
import { sanitizeFilename } from '@/lib/utils';
import { toast } from '@/stores/toastStore';

interface ExportButtonProps {
  classId: string;
  className?: string;
  learners: Record<string, unknown>[];
  classMastery: Record<string, unknown>[];
  className_: string;
}

export default function ExportButton({ learners, classMastery, className_: classNameLabel }: ExportButtonProps) {
  const [showMenu, setShowMenu] = useState(false);

  const safeClassName = sanitizeFilename(classNameLabel || 'class');

  const exportCSV = () => {
    if (!learners || learners.length === 0) {
      toast.info('No learner data available to export.');
      setShowMenu(false);
      return;
    }

    const headers = [
      'Name',
      'Learner Code',
      'Topics Attempted',
      'First-Pass Mastered',
      'Retained Mastered',
      'Overall Avg %',
    ];
    const rows = learners.map((l) => [
      (l.display_name as string) || '',
      (l.learner_code as string) || '',
      Number(l.topics_attempted ?? 0),
      Number(l.topics_first_pass ?? 0),
      Number(l.topics_retained ?? 0),
      Math.round(Number(l.overall_avg_pct ?? 0)),
    ]);

    const csv = [headers, ...rows].map((r) => r.map(csvEscape).join(',')).join('\n');
    downloadFile(csv, `${safeClassName}-mastery-report.csv`, 'text/csv;charset=utf-8;');
    toast.success('Learner mastery report exported.');
    setShowMenu(false);
  };

  const exportTopicCSV = () => {
    if (!classMastery || classMastery.length === 0) {
      toast.info('No topic mastery data available to export.');
      setShowMenu(false);
      return;
    }

    const headers = [
      'Topic Code',
      'Topic Name',
      'Avg First-Pass %',
      'First-Pass Mastered',
      'Retained Mastered',
      'Total Learners',
    ];
    const rows = classMastery.map((m) => [
      (m.topic_code as string) || '',
      (m.topic_name as string) || '',
      Math.round(Number(m.avg_first_pass_pct ?? 0)),
      Number(m.first_pass_mastered_count ?? 0),
      Number(m.retained_mastered_count ?? 0),
      Number(m.total_learners ?? 0),
    ]);

    const csv = [headers, ...rows].map((r) => r.map(csvEscape).join(',')).join('\n');
    downloadFile(csv, `${safeClassName}-topic-mastery.csv`, 'text/csv;charset=utf-8;');
    toast.success('Topic mastery report exported.');
    setShowMenu(false);
  };

  return (
    <div className="relative">
      <Button variant="outline" size="sm" onClick={() => setShowMenu(!showMenu)}>
        <Download className="w-4 h-4 mr-2" />
        Export
      </Button>

      {showMenu && (
        <>
          <div className="fixed inset-0 z-10" onClick={() => setShowMenu(false)} />
          <div className="absolute right-0 mt-2 w-56 bg-white rounded-xl shadow-lg border border-slate-200 z-20 py-1.5">
            <button
              type="button"
              onClick={exportCSV}
              className="w-full flex items-center gap-3 px-4 py-2.5 text-sm text-navy-900 hover:bg-slate-50 transition-colors"
            >
              <Table className="w-4 h-4 text-slate-400" />
              Learner Summary (CSV)
            </button>
            <button
              type="button"
              onClick={exportTopicCSV}
              className="w-full flex items-center gap-3 px-4 py-2.5 text-sm text-navy-900 hover:bg-slate-50 transition-colors"
            >
              <FileText className="w-4 h-4 text-slate-400" />
              Topic Mastery (CSV)
            </button>
          </div>
        </>
      )}
    </div>
  );
}

function downloadFile(content: string, filename: string, mimeType: string) {
  const blob = new Blob([content], { type: mimeType });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = filename;
  a.click();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}
