import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Input from '@/components/ui/Input';
import Button from '@/components/ui/Button';
import { DEMO_TEACHER } from './demoData';
import { User, Lock, Save } from 'lucide-react';
import { toast } from '@/stores/toastStore';

export default function DemoSettingsPage() {
  const handleReadOnlySubmit = (e: React.FormEvent) => {
    e.preventDefault();
    toast.info('Demo mode is read-only. Create a real teacher account to update settings.');
  };

  return (
    <div className="space-y-6 max-w-2xl">
      <div>
        <h1 className="text-2xl font-bold text-navy-900">Settings</h1>
        <p className="text-sm text-slate-500">Manage your educator profile and account preferences</p>
      </div>

      <Card>
        <CardHeader>
          <div className="flex items-center gap-2">
            <User className="w-5 h-5 text-indigo-600" />
            <h2 className="font-semibold text-navy-900">Profile</h2>
          </div>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleReadOnlySubmit} className="space-y-4">
            <Input
              label="Full Name"
              value={DEMO_TEACHER.full_name}
              readOnly
              className="bg-slate-50"
            />
            <Input
              label="Email Address"
              type="email"
              value={DEMO_TEACHER.email}
              disabled
              className="bg-slate-50 text-slate-500"
            />
            <div className="flex items-center gap-3">
              <span className="text-sm text-slate-500">Role:</span>
              <span className="px-2.5 py-1 text-xs font-semibold bg-indigo-50 text-indigo-700 rounded-full capitalize">
                {DEMO_TEACHER.role}
              </span>
            </div>
            <Button type="submit">
              <Save className="w-4 h-4 mr-2" />
              Save Changes
            </Button>
          </form>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <div className="flex items-center gap-2">
            <Lock className="w-5 h-5 text-indigo-600" />
            <h2 className="font-semibold text-navy-900">Change Password</h2>
          </div>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleReadOnlySubmit} className="space-y-4">
            <Input label="New Password" type="password" placeholder="At least 6 characters" />
            <Input label="Confirm New Password" type="password" placeholder="Re-enter your new password" />
            <Button type="submit">
              <Lock className="w-4 h-4 mr-2" />
              Update Password
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}
