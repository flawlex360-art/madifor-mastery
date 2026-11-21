import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = process.env.VITE_SUPABASE_URL;
const SUPABASE_ANON_KEY = process.env.VITE_SUPABASE_ANON_KEY;
const EMAIL = process.env.TEACHER_EMAIL;
const PASSWORD = process.env.TEACHER_PASSWORD;

if (!SUPABASE_URL || !SUPABASE_ANON_KEY || !EMAIL || !PASSWORD) {
  console.error('Set VITE_SUPABASE_URL, VITE_SUPABASE_ANON_KEY, TEACHER_EMAIL, and TEACHER_PASSWORD env vars.');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

async function main() {
  const { error: authError } = await supabase.auth.signInWithPassword({ email: EMAIL, password: PASSWORD });
  if (authError) throw authError;

  const { data: topics, error } = await supabase.from('topics').select('id, name, sub_strand_id').eq('class_level', 'B7');
  if (error) throw error;
  console.log('Found topics:', topics?.length || 0);
}

main().catch(console.error);
