import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = 'https://cylnczofknwcunxhifiy.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_c27Qh-Zn0H_mBAd1lqK-6Q_j6x9d6o6';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

async function main() {
  const email = 'eli@flawlex.online';
  const password = 'Sacramento';

  console.log(`Signing in as ${email}...`);

  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
    email,
    password,
  });

  if (authError) {
    console.error('Login error:', authError.message);
    process.exit(1);
  }

  const userId = authData.user.id;
  console.log('Logged in successfully. User ID:', userId);

  console.log('Inserting teacher profile...');
  const { error: insertError } = await supabase
    .from('teachers')
    .insert({
      id: userId,
      full_name: 'Eli Admin',
      email: email
    });

  if (insertError) {
    console.error('Insert error:', insertError.message);
    process.exit(1);
  }

  console.log('Teacher profile created successfully!');
}

main();
