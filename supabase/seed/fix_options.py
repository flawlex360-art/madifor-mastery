import re

with open(r'C:\Users\kpand\Music\flawlex mastery\flawlex-mastery\supabase\seed\generate_b9_questions.py', 'r', encoding='utf-8') as f:
    content = f.read()

# Fix pattern: q('...','['opt1','opt2']', -> q('...',['opt1','opt2'],
# This replaces 'string' options with list options
content = re.sub(r"q\('([^']*(?:\\.[^']*)*)',\s*'\[", r"q('\1', [", content)
content = re.sub(r"\]',(\s*\d+,)", r"],\1", content)

with open(r'C:\Users\kpand\Music\flawlex mastery\flawlex-mastery\supabase\seed\generate_b9_questions.py', 'w', encoding='utf-8') as f:
    f.write(content)

print('Fixed option formatting')
