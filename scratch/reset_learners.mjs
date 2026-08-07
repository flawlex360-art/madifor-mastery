import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = 'https://cylnczofknwcunxhifiy.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_c27Qh-Zn0H_mBAd1lqK-6Q_j6x9d6o6';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

async function main() {
  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
    email: 'eli@flawlex.online',
    password: 'Sacramento'
  });

  if (authError) {
    console.error('Login failed:', authError.message);
    process.exit(1);
  }
  
  console.log('Logged in. Resetting all learner progress...');
  
  // To bypass RLS on delete, we either need admin permissions or we can delete using the teacher's classes.
  // Wait, if the tables don't let teachers delete all attempts, we might get an error.
  // Let's try deleting everything. If RLS blocks it, we will fetch the teacher's learners and delete only their data.
  
  // First, let's get all learners that belong to this teacher's classes.
  const { data: classes } = await supabase.from('classes').select('id').eq('teacher_id', authData.user.id);
  const classIds = classes.map(c => c.id);
  
  if (classIds.length === 0) {
    console.log("No classes found for this teacher.");
    process.exit(0);
  }

  const { data: learners } = await supabase.from('learners').select('id').in('class_id', classIds);
  const learnerIds = learners.map(l => l.id);
  
  if (learnerIds.length === 0) {
    console.log("No learners found.");
    process.exit(0);
  }

  console.log(`Found ${learnerIds.length} learners. Deleting their progress...`);

  // Delete from attempts
  let res = await supabase.from('attempts').delete().in('learner_id', learnerIds);
  console.log('Attempts deleted:', res.error ? res.error.message : 'Success');

  // Delete from review_queue
  res = await supabase.from('review_queue').delete().in('learner_id', learnerIds);
  console.log('Review Queue deleted:', res.error ? res.error.message : 'Success');

  // Delete from topic_mastery
  res = await supabase.from('topic_mastery').delete().in('learner_id', learnerIds);
  console.log('Topic Mastery deleted:', res.error ? res.error.message : 'Success');

  // Delete from self_practice_sessions
  res = await supabase.from('self_practice_sessions').delete().in('learner_id', learnerIds);
  console.log('Self Practice Sessions deleted:', res.error ? res.error.message : 'Success');

  console.log('All learner progress reset successfully.');
}

main();
