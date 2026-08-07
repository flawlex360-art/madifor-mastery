const { createClient } = require('@supabase/supabase-js');
const supabase = createClient(
  'https://cylnczofknwcunxhifiy.supabase.co',
  'sb_publishable_c27Qh-Zn0H_mBAd1lqK-6Q_j6x9d6o6'
);

async function main() {
  const classId = 'c7b75ad4-669c-4d31-8b8b-6465364f1715';

  // Use find_learner_for_login to check if learners already exist
  const { data: existing } = await supabase.rpc('find_learner_for_login', {
    p_class_id: classId,
    p_display_name: 'Ama Mensah'
  });
  if (existing && existing.length > 0) {
    console.log('Ama Mensah already exists, id:', existing[0].id);
  }

  // Hash PINs
  const { data: pin1 } = await supabase.rpc('hash_pin', { p_pin: '1234' });
  const { data: pin2 } = await supabase.rpc('hash_pin', { p_pin: '5678' });
  console.log('PINs hashed');

  // Try direct insert
  const { data: l1, error: e1 } = await supabase
    .from('learners')
    .insert({ class_id: classId, display_name: 'Ama Mensah', learner_code: 'test0001', pin: pin1 })
    .select()
    .single();

  if (e1) {
    console.error('Direct insert failed:', e1.message);

    // Fallback: use the Supabase SQL API via fetch
    console.log('Trying REST API directly...');
    const resp = await fetch('https://cylnczofknwcunxhifiy.supabase.co/rest/v1/rpc/hash_pin', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'apikey': 'sb_publishable_c27Qh-Zn0H_mBAd1lqK-6Q_j6x9d6o6',
        'Authorization': 'Bearer sb_publishable_c27Qh-Zn0H_mBAd1lqK-6Q_j6x9d6o6'
      },
      body: JSON.stringify({ p_pin: '1234' })
    });
    console.log('REST response status:', resp.status);
  } else {
    console.log('Created:', l1.display_name, 'id:', l1.id);
  }
}

main().catch(console.error);
