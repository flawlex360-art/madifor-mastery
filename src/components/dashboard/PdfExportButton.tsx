import { useState } from 'react';
import Button from '@/components/ui/Button';
import { Download, Loader2 } from 'lucide-react';
import { sanitizeFilename } from '@/lib/utils';
import { toast } from '@/stores/toastStore';

interface LearnerReportData {
  learner_name: string;
  learner_code: string;
  class_name: string;
  readiness_score: number;
  retained_count: number;
  first_pass_count: number;
  total_topics: number;
  topic_mastery: {
    topic_code: string;
    topic_name: string;
    first_pass_pct: number;
    status: string;
  }[];
}

interface PdfExportButtonProps {
  learnerData: LearnerReportData;
  className?: string;
}

export default function PdfExportButton({ learnerData, className }: PdfExportButtonProps) {
  const [generating, setGenerating] = useState(false);

  const handleExport = async () => {
    setGenerating(true);
    try {
      const { pdf } = await import('@react-pdf/renderer');
      const { default: LearnerReport } = await import('./LearnerReport');

      const blob = await pdf(<LearnerReport data={learnerData} />).toBlob();
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `${sanitizeFilename(learnerData.learner_name)}-mastery-report.pdf`;
      a.click();
      setTimeout(() => URL.revokeObjectURL(url), 1000);
      toast.success('PDF report generated.');
    } catch (err) {
      console.error('PDF generation failed:', err);
      toast.error('Failed to generate PDF report. Please try again.');
    } finally {
      setGenerating(false);
    }
  };

  return (
    <Button
      variant="outline"
      size="sm"
      onClick={handleExport}
      disabled={generating}
      className={className}
    >
      {generating ? (
        <Loader2 className="w-4 h-4 mr-2 animate-spin" />
      ) : (
        <Download className="w-4 h-4 mr-2" />
      )}
      {generating ? 'Generating...' : 'Export PDF'}
    </Button>
  );
}
