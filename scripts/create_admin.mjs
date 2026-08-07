import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = 'https://cylnczofknwcunxhifiy.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_c27Qh-Zn0H_mBAd1lqK-6Q_j6x9d6o6';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

async function main() {
  const email = 'eli@flawlex.online';
  const password = 'Sacramento';

  console.log(`Attempting to create account for ${email}...`);

  const { data, error } = await supabase.auth.signUp({
    email,
    password,
    options: {
      data: {
        role: 'teacher'
      }
    }
  });

  if (error) {
    console.error('Error creating account:', error.message);
    process.exit(1);
  }

  console.log('Account created successfully!');
  console.log('User ID:', data.user?.id);
}

main();
