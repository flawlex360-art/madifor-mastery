import { useAuth } from '@/hooks/useAuth';
import QuestionBuilder from '@/components/question-builder/QuestionBuilder';

export default function QuestionBuilderPage() {
  const { teacher } = useAuth();

  if (!teacher) return null;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-zinc-900">Question Builder</h1>
        <p className="text-gray-500">Create and manage questions for your topics</p>
      </div>
      <QuestionBuilder />
    </div>
  );
}
