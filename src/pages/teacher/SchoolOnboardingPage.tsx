import { useState, useEffect } from 'react';
import { useAuth } from '@/hooks/useAuth';
import { supabase } from '@/lib/supabase';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import { School, Plus, Copy, Check, Users } from 'lucide-react';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const db = supabase as any;

export default function SchoolOnboardingPage() {
  const { teacher } = useAuth();
  const [hasSchool, setHasSchool] = useState(!!teacher?.school_id);
  const [schoolName, setSchoolName] = useState('');
  const [joinCode, setJoinCode] = useState('');
  const [createdCode, setCreatedCode] = useState('');
  const [copied, setCopied] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [schoolInfo, setSchoolInfo] = useState<{ name: string; invite_code: string } | null>(null);

  useEffect(() => {
    if (teacher?.school_id) {
      // Load school info
      db.from('schools')
        .select('name, invite_code')
        .eq('id', teacher.school_id)
        .single()
        .then(({ data }: { data: Record<string, unknown> | null }) => {
          if (data) setSchoolInfo(data as { name: string; invite_code: string });
        });
    }
  }, [teacher]);

  const handleCreateSchool = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!teacher || !schoolName.trim()) return;

    setLoading(true);
    setError('');
    try {
      // Create school
      const { data: school, error: sErr } = await db
        .from('schools')
        .insert({ name: schoolName.trim() })
        .select()
        .single();
      if (sErr) throw new Error(sErr.message);

      // Link teacher to school
      const { error: tErr } = await db
        .from('teachers')
        .update({ school_id: school.id, role: 'school_admin' })
        .eq('id', teacher.id);
      if (tErr) throw new Error(tErr.message);

      setSchoolInfo({ name: school.name, invite_code: school.invite_code });
      setHasSchool(true);
      setSuccess(`School "${school.name}" created successfully!`);
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : 'Failed to create school');
    } finally {
      setLoading(false);
    }
  };

  const handleJoinSchool = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!teacher || !joinCode.trim()) return;

    setLoading(true);
    setError('');
    try {
      const { data, error: fnErr } = await db.rpc('join_school_via_invite', {
        p_teacher_id: teacher.id,
        p_invite_code: joinCode.trim(),
      });
      if (fnErr) throw new Error(fnErr.message);
      if (!data) throw new Error('Invalid or expired invite code');

      // Refresh to show new school
      setSuccess('Joined school successfully! Refreshing...');
      setTimeout(() => window.location.reload(), 1500);
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : 'Failed to join school');
    } finally {
      setLoading(false);
    }
  };

  const handleCreateInviteCode = async () => {
    if (!teacher?.school_id) return;

    setLoading(true);
    setError('');
    try {
      const { data, error: cErr } = await db
        .from('teacher_invite_codes')
        .insert({
          school_id: teacher.school_id,
          created_by: teacher.id,
        })
        .select('code')
        .single();
      if (cErr) throw new Error(cErr.message);

      setCreatedCode(data.code);
    } catch (err: unknown) {
      setError(err instanceof Error ? err.message : 'Failed to create invite code');
    } finally {
      setLoading(false);
    }
  };

  const copyCode = (code: string) => {
    navigator.clipboard.writeText(code);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  // Already in a school
  if (hasSchool && schoolInfo) {
    return (
      <div className="space-y-6 max-w-2xl">
        <h1 className="text-2xl font-bold text-zinc-900">School</h1>

        <Card>
          <CardHeader>
            <div className="flex items-center gap-2">
              <School className="w-5 h-5 text-zinc-900" />
              <h2 className="font-semibold text-zinc-900">{schoolInfo.name}</h2>
            </div>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="flex items-center gap-3">
              <span className="text-sm text-gray-500">School invite code:</span>
              <code className="px-3 py-1.5 bg-gray-100 rounded-lg text-sm font-mono text-zinc-900">
                {schoolInfo.invite_code}
              </code>
              <button
                onClick={() => copyCode(schoolInfo.invite_code)}
                className="p-1.5 hover:bg-gray-100 rounded"
              >
                {copied ? (
                  <Check className="w-4 h-4 text-green-500" />
                ) : (
                  <Copy className="w-4 h-4 text-gray-400" />
                )}
              </button>
            </div>

            <div className="border-t pt-4">
              <h3 className="text-sm font-medium text-navy-700 mb-2">Invite Another Teacher</h3>
              <p className="text-xs text-gray-500 mb-3">
                Create an invite code to share with another teacher. They can use it during registration to join your school.
              </p>
              <div className="flex items-center gap-3">
                <Button size="sm" onClick={handleCreateInviteCode} disabled={loading}>
                  <Plus className="w-4 h-4 mr-1" />
                  Generate Invite Code
                </Button>
                {createdCode && (
                  <div className="flex items-center gap-2">
                    <code className="px-3 py-1.5 bg-green-50 border border-green-200 rounded-lg text-sm font-mono text-green-800">
                      {createdCode}
                    </code>
                    <button
                      onClick={() => copyCode(createdCode)}
                      className="p-1.5 hover:bg-gray-100 rounded"
                    >
                      <Copy className="w-4 h-4 text-gray-400" />
                    </button>
                  </div>
                )}
              </div>
            </div>
          </CardContent>
        </Card>

        {success && (
          <p className="text-sm text-green-600 bg-green-50 p-3 rounded-lg">{success}</p>
        )}
      </div>
    );
  }

  // Not in a school — show create/join options
  return (
    <div className="space-y-6 max-w-2xl">
      <h1 className="text-2xl font-bold text-zinc-900">School Setup</h1>
      <p className="text-gray-500">
        Create a new school or join an existing one to collaborate with other teachers.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Create school */}
        <Card>
          <CardHeader>
            <h2 className="font-semibold text-zinc-900">Create a School</h2>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleCreateSchool} className="space-y-3">
              <Input
                label="School Name"
                value={schoolName}
                onChange={(e) => setSchoolName(e.target.value)}
                placeholder="e.g. Accra Academy"
                required
              />
              <Button type="submit" className="w-full" disabled={loading}>
                <School className="w-4 h-4 mr-2" />
                {loading ? 'Creating...' : 'Create School'}
              </Button>
            </form>
          </CardContent>
        </Card>

        {/* Join school */}
        <Card>
          <CardHeader>
            <h2 className="font-semibold text-zinc-900">Join a School</h2>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleJoinSchool} className="space-y-3">
              <Input
                label="Invite Code"
                value={joinCode}
                onChange={(e) => setJoinCode(e.target.value)}
                placeholder="Enter the code from your school admin"
                required
              />
              <Button type="submit" variant="outline" className="w-full" disabled={loading}>
                <Users className="w-4 h-4 mr-2" />
                {loading ? 'Joining...' : 'Join School'}
              </Button>
            </form>
          </CardContent>
        </Card>
      </div>

      {error && (
        <p className="text-sm text-red-500 bg-red-50 p-3 rounded-lg">{error}</p>
      )}
      {success && (
        <p className="text-sm text-green-600 bg-green-50 p-3 rounded-lg">{success}</p>
      )}
    </div>
  );
}
