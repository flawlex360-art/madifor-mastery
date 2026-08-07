import { useState } from 'react';
import Button from '@/components/ui/Button';
import { Download, FileText, Table } from 'lucide-react';

interface ExportButtonProps {
  classId: string;
  className?: string;
  learners: Record<string, unknown>[];
  classMastery: Record<string, unknown>[];
  className_: string;
}

export default function ExportButton({ learners, classMastery, className_: classNameLabel }: ExportButtonProps) {
  const [showMenu, setShowMenu] = useState(false);

  const exportCSV = () => {
    // Build CSV from learner summary data
    const headers = ['Name', 'ID', 'Topics Attempted', 'Topics Retained', 'First-Pass Mastery %', 'Overall Avg %'];
    const rows = learners.map((l) => [
      l.display_name as string,
      (l.learner_code as string) || '',
      String((l.topics_attempted as number) || 0),
      String((l.topics_retained as number) || 0),
      String(Math.round((l.overall_avg_pct as number) || 0)),
      String(Math.round((l.overall_avg_pct as number) || 0)),
    ]);

    const csv = [headers, ...rows].map((r) => r.map(csvEscape).join(',')).join('\n');
    downloadFile(csv, `${classNameLabel}-mastery-report.csv`, 'text/csv');
    setShowMenu(false);
  };

  const exportTopicCSV = () => {
    if (!classMastery || classMastery.length === 0) {
      alert('No topic mastery data available to export.');
      return;
    }

    const headers = ['Topic Code', 'Topic Name', 'Avg First-Pass %', 'First-Pass Mastered', 'Retained Mastered', 'Total Learners'];
    const rows = classMastery.map((m) => [
      (m.topic_code as string) || '',
      (m.topic_name as string) || '',
      String(Math.round((m.avg_first_pass_pct as number) || 0)),
      String((m.first_pass_mastered_count as number) || 0),
      String((m.retained_mastered_count as number) || 0),
      String((m.total_learners as number) || 0),
    ]);

    const csv = [headers, ...rows].map((r) => r.map(csvEscape).join(',')).join('\n');
    downloadFile(csv, `${classNameLabel}-topic-mastery.csv`, 'text/csv');
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
          <div className="absolute right-0 mt-2 w-56 bg-white rounded-lg shadow-lg border z-20 py-1">
            <button
              onClick={exportCSV}
              className="w-full flex items-center gap-3 px-4 py-2.5 text-sm text-zinc-900 hover:bg-gray-50"
            >
              <Table className="w-4 h-4 text-gray-400" />
              Learner Summary (CSV)
            </button>
            <button
              onClick={exportTopicCSV}
              className="w-full flex items-center gap-3 px-4 py-2.5 text-sm text-zinc-900 hover:bg-gray-50"
            >
              <FileText className="w-4 h-4 text-gray-400" />
              Topic Mastery (CSV)
            </button>
          </div>
        </>
      )}
    </div>
  );
}

// M-8: Escape double quotes in CSV values
function csvEscape(value: string): string {
  return `"${value.replace(/"/g, '""')}"`;
}

function downloadFile(content: string, filename: string, mimeType: string) {
  const blob = new Blob([content], { type: mimeType });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}
