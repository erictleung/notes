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
