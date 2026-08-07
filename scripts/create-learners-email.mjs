import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://cylnczofknwcunxhifiy.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5bG5jem9ma253Y3VueGhpZml5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4NTc5MDA1NCwiZXhwIjoyMTAxMzY2MDU0fQ.WX2bnHSAFRUUiTPxHEEkXJLmqoIZ74DRtFEz3AoXY_o'
);

async function main() {
  const classId = 'c7b75ad4-669c-4d31-8b8b-6465364f1715'; // Basic 8

  // Create learner accounts
  const learners = [
    { name: 'Ama Mensah', email: 'ama@flawlex.online', password: 'Flawlex123' },
    { name: 'Kwame Asante', email: 'kwame@flawlex.online', password: 'Flawlex123' },
  ];

  for (const l of learners) {
    const { data, error } = await supabase.rpc('create_learner_account', {
      p_class_id: classId,
      p_display_name: l.name,
      p_email: l.email,
      p_password: l.password,
    });
    if (error) {
      console.error(`Error creating ${l.name}:`, error.message);
    } else {
      console.log(`Created: ${l.name} | Email: ${l.email} | Password: ${l.password} | ID: ${data}`);
    }
  }

  console.log('\n=== LOGIN CREDENTIALS ===');
  console.log('URL: https://flawlex-mastery.vercel.app');
  console.log('\nAdmin:');
  console.log('  Email: eli@flawlex.online');
  console.log('  Password: Sacramento');
  console.log('\nLearner 1:');
  console.log('  Email: ama@flawlex.online');
  console.log('  Password: Flawlex123');
  console.log('\nLearner 2:');
  console.log('  Email: kwame@flawlex.online');
  console.log('  Password: Flawlex123');
}

main().catch(console.error);
