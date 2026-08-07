import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { Skeleton } from '@/components/ui/Skeleton';

export function AssessmentSkeleton() {
  return (
    <div className="max-w-3xl mx-auto space-y-6 animate-in fade-in duration-500">
      {/* Header Skeleton */}
      <div className="flex justify-between items-center mb-8">
        <Skeleton className="h-6 w-32" />
        <Skeleton className="h-6 w-16" />
      </div>

      {/* Progress Bar Skeleton */}
      <div className="mb-6">
        <Skeleton className="h-2 w-full rounded-full" />
      </div>

      {/* Main Card Skeleton */}
      <Card className="shadow-lg">
        <CardHeader>
          <div className="space-y-4">
            <Skeleton className="h-4 w-24" /> {/* Question type badge */}
            <Skeleton className="h-8 w-[90%]" /> {/* Question text line 1 */}
            <Skeleton className="h-8 w-[60%]" /> {/* Question text line 2 */}
          </div>
        </CardHeader>
        <CardContent className="space-y-4 mt-6">
          {/* Options Skeletons */}
          {[1, 2, 3, 4].map((i) => (
            <div key={i} className="flex items-center space-x-4 p-4 rounded-xl border">
              <Skeleton className="h-6 w-6 rounded-full shrink-0" />
              <Skeleton className="h-6 w-[80%]" />
            </div>
          ))}
        </CardContent>
        <div className="flex justify-between items-center mt-6 p-6">
          <Skeleton className="h-10 w-24" /> {/* Hint button */}
          <Skeleton className="h-10 w-32" /> {/* Check Answer button */}
        </div>
      </Card>
    </div>
  );
}
