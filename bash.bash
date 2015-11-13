# bash Notes

# cd to previous directory
cd - 

# open new instance of application
open -n -a Application

# time out commands if they take too long (command doesn't natively exist on MacOS)
timeout 5 top # time out after 5 seconds

# show line numbers in less
echo "Neque porro quisquam
est qui dolorem" | less -N

# wrap less output
echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sit \
amet volutpat diam. Curabitur eget nibh convallis, condimentum urna vehicula, \
posuere turpis." | less -S

# sort by human numeric ordering
printf "1\n2\n3\n14\n5\n12" | sort # not what I want
printf "1\n2\n3\n14\n5\n12" | sort -k 1n # what I want

# enables trusted X11 forwarding
ssh -Y use@sample.com

# sneaky way of putting comments in multi-line commands using back-ticks
printf "txt\tfoo\nbaz\ttar\ntxt\tbar\n" `# create a two column list` | \
    awk '{ if ($1 > $2) print $2 "\t" $1; else print $1 "\t" $2 }' `# order` | \
    sort `# order by row` | \
    uniq `# take unique rows only`

# time command execution
time python -c "print 'hello, world!'"

# secure copy files between local and host
scp file1 user@host.com:~/Downloads/
