import { useState } from 'react';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Input from '@/components/ui/Input';
import Button from '@/components/ui/Button';
import { DEMO_TEACHER } from './demoData';
import { AlertCircle } from 'lucide-react';

export default function DemoSettingsPage() {
  const [demoError, setDemoError] = useState('');
  
  const handleAction = (e: React.FormEvent) => {
    e.preventDefault();
    setDemoError('Editing is disabled in the demo environment.');
  };

  return (
    <div className="max-w-4xl space-y-6">
      <div className="mb-4 bg-teal-50 border border-teal-200 rounded-lg p-4 text-teal-800 text-sm">
        <strong className="font-bold">👋 Welcome to the Demo Environment!</strong> You can view settings, but modifying them is disabled.
      </div>

      <div>
        <h1 className="text-2xl font-bold text-zinc-900">Settings</h1>
        <p className="text-gray-500">Manage your account preferences</p>
      </div>

      {demoError && (
        <div className="bg-amber-50 text-amber-800 p-4 rounded-lg flex items-center gap-3 border border-amber-200">
          <AlertCircle className="w-5 h-5 text-amber-600" />
          <span className="font-medium">{demoError}</span>
        </div>
      )}

      <Card>
        <CardHeader>
          <h3 className="text-lg font-semibold leading-none tracking-tight">Profile Information</h3>
          <p className="text-sm text-zinc-500">Update your personal details</p>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleAction} className="space-y-4">
            <Input
              label="Full Name"
              value={DEMO_TEACHER.full_name}
              readOnly
            />
            <Input
              label="Email Address"
              type="email"
              value={DEMO_TEACHER.email}
              readOnly
            />
            <div className="flex justify-end pt-2">
              <Button type="submit">Save Changes</Button>
            </div>
          </form>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <h3 className="text-lg font-semibold leading-none tracking-tight">Change Password</h3>
          <p className="text-sm text-zinc-500">Update your account password</p>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleAction} className="space-y-4">
            <Input
              label="Current Password"
              type="password"
              placeholder="••••••••"
            />
            <Input
              label="New Password"
              type="password"
              placeholder="••••••••"
            />
            <Input
              label="Confirm New Password"
              type="password"
              placeholder="••••••••"
            />
            <div className="flex justify-end pt-2">
              <Button type="submit">Update Password</Button>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}
