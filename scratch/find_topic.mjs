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
  console.log('Logged in as teacher:', authData.user.id);

  // Find the topic
  const { data: topics, error: topicsError } = await supabase
    .from('topics')
    .select('id, name, sub_strand_id, sub_strands(name, strand_id, strands(name, class_level))')
    .eq('class_level', 'B7');

  if (topicsError) {
    console.error('Topics error:', topicsError);
    process.exit(1);
  }

  const materialsTopics = topics.filter(t => t.name.toLowerCase().includes('materials') || t.sub_strands?.name.toLowerCase().includes('materials'));
  console.log('Found materials topics:', JSON.stringify(materialsTopics, null, 2));

  for (const t of materialsTopics) {
    const { count, error } = await supabase
      .from('questions')
      .select('id', { count: 'exact', head: true })
      .eq('topic_id', t.id);
    
    console.log(`Topic ${t.id} ("${t.name}") has ${count} questions`);
  }
}

main();
