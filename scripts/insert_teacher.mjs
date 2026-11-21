import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = process.env.VITE_SUPABASE_URL || process.env.SUPABASE_URL;
const SUPABASE_ANON_KEY = process.env.VITE_SUPABASE_ANON_KEY;
const EMAIL = process.env.TEACHER_EMAIL;
const PASSWORD = process.env.TEACHER_PASSWORD;

if (!SUPABASE_URL || !SUPABASE_ANON_KEY || !EMAIL || !PASSWORD) {
  console.error('Set VITE_SUPABASE_URL, VITE_SUPABASE_ANON_KEY, TEACHER_EMAIL, and TEACHER_PASSWORD env vars.');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

async function main() {
  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({ email: EMAIL, password: PASSWORD });
  if (authError) throw authError;

  const { error: insertError } = await supabase.from('teachers').insert({
    id: authData.user.id,
    full_name: process.env.TEACHER_NAME || 'Teacher',
    email: EMAIL,
  });
  if (insertError) throw insertError;
  console.log('Teacher profile created successfully.');
}

main().catch((err) => {
  console.error(err.message);
  process.exit(1);
});
