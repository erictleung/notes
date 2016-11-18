# bash Notes

# cd to previous directory
cd -

# open new instance of application
open -n -a Application

# time out commands if they take too long (command doesn't natively exist on
# MacOS)
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

# enables X11 forwarding
ssh -X use@sample.com # just X11 forwarding
ssh -Y use@sample.com # trusted
echo $DISPLAY # test remote display

# sneaky way of putting comments in multi-line commands using back-ticks
printf "txt\tfoo\nbaz\ttar\ntxt\tbar\n" `# create a two column list` | \
    awk '{ if ($1 > $2) print $2 "\t" $1; else print $1 "\t" $2 }' `# order` | \
    sort `# order by row` | \
    uniq `# take unique rows only`

# time command execution
time python -c "print 'hello, world!'"

# secure copy files between local and host
scp file1 user@host.com:~/Downloads/ # from local to host
scp user@host.com:~/Downloads/file1 file1 # from host to local

# special parameters in bash
## https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html
## e.g. 'echo $?' - returns exit status of last executed foreground pipeline

# arithmetic expressions of integers $((EXPR)) or expr
# Reference: http://tldp.org/LDP/abs/html/arithexp.html
## double paraentheses
num1=2
num2=3
num5=$((num1 + num2)); echo $num5
num5=$(($num1 + $num2)); echo $num5
(( num1 += 1 )); echo $num1 # returns 3
## expr command
znum=`expr 4 + 2`; echo $znum
echo $[365 * 24] # bracket notation for calculations

# shift command - shifts parameter variables e.g. $1, $2 by given number
## e.g. shift 2 # shift parameter variables by 2
## e.g. shift # shifth parameter variables by 1

# writing functions two ways
## Version 1
hello() {
    echo "Hello, world";
}
## Version 2
function helloAlso {
    echo "Hello, again";
}

# brace expansion
echo a{p,c,d,b}e # ape ace ade abe
echo {1..5} # 1 2 3 4 5
echo {1..10..3} # 1 4 7 10

# make directory and its intermediate directories along the way
mkdir -p directories/in/between/will/be/made

# change permissions
## r w x
## 4 2 1
## OWNER, GROUP, WORLD
## Users = u, Group = g, Others = o, All = a
chmod +x file.txt # add execution permission to user
chmod 202 file.txt # owner write, world write
chmod a+x file.txt # all execution permissions to everyone

# loop through files in current directory
for f in *;
do
    echo $f;
done

# find the largest files in directory (doesn't work on Mac OS X 10.10.5)
find . -printf '%s %p\n' | sort -nr | head

# another command to find largest files and directories
du -a . | sort -nr | head

# convert a tab-delimited file to a comma-delimited file
tr '\t' ',' < file.tsv > file.csv

# create random number
echo $RANDOM
echo $[ RANDOM % 6 ] # random number modulo 6

# view a .csv file in the command line
# source: http://stackoverflow.com/a/3800791
column -s, -t < someFile.csv | less -#2 -N -S

# create sequence of numbers
seq 10

# check top 30 bash commands in your history
cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30

# display line numbers in cat
cat -n myfile.md

# run bash script for debugging with -x
# bash -x script.sh

# single vs double quotes
date=20021224
echo "$date"
# 20021224
echo '$date'
# $date

# parameter expansion
echo $SHELL # normal expansion
echo ${!T*} # '!' allows for var expansion
echo $FRANKY # returns nothing
echo ${FRANKY:=Franky} # sets variable value if nonexistent
FRANKY="James" # reassign variable
echo ${FRANKY:="Back to Franky"} # fails to reassign

# command substitution
echo $(date)
echo `date`

# display all shell options
set -o
set -o variableName # set shell option on
set +o variableName # set shell option off

# make arrays
fruits[0]=Pineapple
fruits[1]=Tomato
fruits[2]=Banana
echo ${fruits[0]} # Pineapple
fruits=(Pineapple Tomato Banana) # another way to make arrays
echo ${fruits[*]} # array expansion
echo ${fruits[@]} # ...another way <- use this

# execute previous commands
!500 # execute 500th entry in history
!! # execute last command
