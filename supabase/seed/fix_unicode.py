import re

with open(r'C:\Users\kpand\Music\flawlex mastery\flawlex-mastery\supabase\seed\generate_b9_questions.py', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace unicode characters
content = content.replace('\u2014', '-')  # em dash
content = content.replace('\u2013', '-')  # en dash
content = content.replace('\u2018', "'")  # left single quote
content = content.replace('\u2019', "'")  # right single quote
content = content.replace('\u201c', '"')  # left double quote
content = content.replace('\u201d', '"')  # right double quote
content = content.replace('\u00d7', 'x')  # multiplication sign
content = content.replace('\u00b2', '2')  # superscript 2
content = content.replace('\u03a9', 'ohm')  # omega

with open(r'C:\Users\kpand\Music\flawlex mastery\flawlex-mastery\supabase\seed\generate_b9_questions.py', 'w', encoding='utf-8') as f:
    f.write(content)

print('Fixed unicode characters')
