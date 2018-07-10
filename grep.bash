# grep Notes

# search for word within files in currect directory
grep hello *

# recursively search all files for a string
# source: https://stackoverflow.com/a/15622352/6873133
cd /path/you/want
grep -r "word" .
grep -ir "WoRd" .  # ignores case
grep -R "word" dir/ # alt flag of -R

# grep is suppress file name if given one file
grep grep grep.bash
grep grep grep.bash /dev/null  # if you want the file name

# show lines not showing pattern
grep -v bash grep.bash

# search all files in directory
# source: https://stackoverflow.com/a/16957078/6873133
grep -rnw . -e 'word'
# -r = recursive
# -n = line number
# -w = match whole word

# search through files, add -n for line numbers
# source: https://superuser.com/a/614589
grep "some string" . -R
# H for file printing, i for case-insensitive, R for recursive search, E for regex 
grep -HiRE "some string|other string" . 
