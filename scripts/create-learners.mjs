import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://cylnczofknwcunxhifiy.supabase.co',
  'sb_publishable_c27Qh-Zn0H_mBAd1lqK-6Q_j6x9d6o6'
);

const classId = 'c7b75ad4-669c-4d31-8b8b-6465364f1715'; // Basic 8
const classCode = 'f2ce1e66';

async function main() {
  // Hash PINs
  const { data: pin1 } = await supabase.rpc('hash_pin', { p_pin: '1234' });
  const { data: pin2 } = await supabase.rpc('hash_pin', { p_pin: '5678' });

  // Create learners via SECURITY DEFINER function
  const { data: id1, error: e1 } = await supabase.rpc('create_learner', {
    p_class_id: classId,
    p_display_name: 'Ama Mensah',
    p_learner_code: 'test0001',
    p_pin: pin1
  });
  if (e1) console.error('Learner 1 error:', e1.message);
  else console.log('Created Ama Mensah | PIN: 1234 | id:', id1);

  const { data: id2, error: e2 } = await supabase.rpc('create_learner', {
    p_class_id: classId,
    p_display_name: 'Kwame Asante',
    p_learner_code: 'test0002',
    p_pin: pin2
  });
  if (e2) console.error('Learner 2 error:', e2.message);
  else console.log('Created Kwame Asante | PIN: 5678 | id:', id2);

  // Verify they exist
  for (const name of ['Ama Mensah', 'Kwame Asante']) {
    const { data } = await supabase.rpc('find_learner_for_login', {
      p_class_id: classId,
      p_display_name: name
    });
    if (data && data.length > 0) {
      console.log('Verified:', name, 'exists');
    }
  }

  console.log('\n=== LOGIN CREDENTIALS ===');
  console.log('URL: https://flawlex-mastery.vercel.app');
  console.log('Class code:', classCode);
  console.log('Learner 1: Ama Mensah / PIN: 1234');
  console.log('Learner 2: Kwame Asante / PIN: 5678');
}

main().catch(console.error);
