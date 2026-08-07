import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://cylnczofknwcunxhifiy.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5bG5jem9ma253Y3VueGhpZml5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4NTc5MDA1NCwiZXhwIjoyMTAxMzY2MDU0fQ.WX2bnHSAFRUUiTPxHEEkXJLmqoIZ74DRtFEz3AoXY_o'
);

async function main() {
  // Create admin user in Supabase Auth
  const { data, error } = await supabase.auth.admin.createUser({
    email: 'eli@flawlex.online',
    password: 'Sacramento',
    email_confirm: true
  });

  if (error) {
    console.error('Auth error:', error.message);
  } else {
    console.log('Auth user created:', data.user.id);

    // Add to teachers table as admin
    const { error: tErr } = await supabase.from('teachers').upsert({
      id: data.user.id,
      full_name: 'Admin',
      email: 'eli@flawlex.online',
      role: 'school_admin'
    });
    if (tErr) console.error('Teacher insert error:', tErr.message);
    else console.log('Admin teacher record created');
  }
}

main().catch(console.error);
