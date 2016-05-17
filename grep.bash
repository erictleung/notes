# grep Notes

# search for word within files in currect directory
grep hello *

# recursively search all files for a string
cd /path/you/want
grep -r "word" .
grep -ir "WoRd" .  # ignores case

# grep is suppress file name if given one file
grep grep grep.bash
grep grep grep.bash /dev/null  # if you want the file name

# show lines not showing pattern
grep -v bash grep.bash
