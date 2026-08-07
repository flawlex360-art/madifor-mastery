import { useState } from 'react';
import { useAuth } from '@/hooks/useAuth';
import { supabase } from '@/lib/supabase';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import { toast } from '@/stores/toastStore';
import { User, Lock, Save } from 'lucide-react';

export default function SettingsPage() {
  const { teacher } = useAuth();

  // Profile edit state
  const [fullName, setFullName] = useState(teacher?.full_name || '');
  const [profileSaving, setProfileSaving] = useState(false);

  // Password change state
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [passwordSaving, setPasswordSaving] = useState(false);

  const handleProfileSave = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!teacher || !fullName.trim()) return;

    setProfileSaving(true);
    try {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const { error } = await (supabase as any)
        .from('teachers')
        .update({ full_name: fullName.trim() })
        .eq('id', teacher.id);
      if (error) throw new Error(error.message);
      toast.success('Profile updated successfully');
    } catch (err: unknown) {
      toast.error(err instanceof Error ? err.message : 'Failed to update profile');
    } finally {
      setProfileSaving(false);
    }
  };

  const handlePasswordChange = async (e: React.FormEvent) => {
    e.preventDefault();

    if (newPassword.length < 6) {
      toast.warning('Password must be at least 6 characters');
      return;
    }
    if (newPassword !== confirmPassword) {
      toast.warning('Passwords do not match');
      return;
    }

    setPasswordSaving(true);
    try {
      const { error } = await supabase.auth.updateUser({ password: newPassword });
      if (error) throw new Error(error.message);
      toast.success('Password changed successfully');
      setNewPassword('');
      setConfirmPassword('');
    } catch (err: unknown) {
      toast.error(err instanceof Error ? err.message : 'Failed to change password');
    } finally {
      setPasswordSaving(false);
    }
  };

  if (!teacher) return null;

  return (
    <div className="space-y-6 max-w-2xl">
      <h1 className="text-2xl font-bold text-zinc-900">Settings</h1>

      {/* Profile */}
      <Card>
        <CardHeader>
          <div className="flex items-center gap-2">
            <User className="w-5 h-5 text-gray-400" />
            <h2 className="font-semibold text-zinc-900">Profile</h2>
          </div>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleProfileSave} className="space-y-4">
            <Input
              label="Full Name"
              value={fullName}
              onChange={(e) => setFullName(e.target.value)}
              required
            />
            <Input
              label="Email"
              value={teacher.email}
              disabled
              className="bg-gray-50"
            />
            <div className="flex items-center gap-3">
              <span className="text-sm text-gray-500">Role:</span>
              <span className="px-2 py-1 text-xs font-medium bg-teal-100 text-teal-700 rounded-full capitalize">
                {teacher.role}
              </span>
            </div>

            <Button type="submit" disabled={profileSaving}>
              <Save className="w-4 h-4 mr-2" />
              {profileSaving ? 'Saving...' : 'Save Changes'}
            </Button>
          </form>
        </CardContent>
      </Card>

      {/* Password */}
      <Card>
        <CardHeader>
          <div className="flex items-center gap-2">
            <Lock className="w-5 h-5 text-gray-400" />
            <h2 className="font-semibold text-zinc-900">Change Password</h2>
          </div>
        </CardHeader>
        <CardContent>
          <form onSubmit={handlePasswordChange} className="space-y-4">
            <Input
              label="New Password"
              type="password"
              value={newPassword}
              onChange={(e) => setNewPassword(e.target.value)}
              placeholder="At least 6 characters"
              minLength={6}
              required
            />
            <Input
              label="Confirm New Password"
              type="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              placeholder="Re-enter your new password"
              required
            />

            <Button type="submit" disabled={passwordSaving}>
              <Lock className="w-4 h-4 mr-2" />
              {passwordSaving ? 'Changing...' : 'Change Password'}
            </Button>
          </form>
        </CardContent>
      </Card>

      {/* App info */}
      <Card>
        <CardContent className="p-6">
          <div className="text-center text-sm text-gray-500 space-y-1">
            <p className="font-medium text-zinc-900">Madifor Mastery</p>
            <p>Topic-based assessment platform for BECE Science</p>
            <p className="text-xs text-gray-400">v0.1.0</p>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
