# bash Notes

# Useful resources
# - https://zwischenzugs.com/2018/01/21/ten-more-things-i-wish-id-known-about-bash/
# - http://conqueringthecommandline.com/book
# - http://mywiki.wooledge.org/BashGuide
# - http://redsymbol.net/articles/unofficial-bash-strict-mode/
# - https://kvz.io/blog/2013/11/21/bash-best-practices/
# - https://google.github.io/styleguide/shell.xml

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

# ... find and sort directories by KB units greater than 500 MB
# -k = chunk into 1024-byte (1 KB) blocks
# see https://www.moncefbelyamani.com/find-the-largest-folders-on-your-mac-in-one-keystroke-with-keyboard-maestro-or-quicksilver/
du -k . | awk '$1 > 500000' | sed -e 's_^\([09-]*\)_\1 KB_' | sort -nr

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

# another way to make arrays
# source: https://stackoverflow.com/a/1336245/6873133
A=( foo bar "a  b c" 42 )
B=("${A[@]:1:2}")
C=("${A[@]:1}")   # slice to the end of the array
echo "${B[@]}"    # bar a  b c
echo "${B[1]}"    # a  b c
echo "${C[@]}"    # bar a  b c 42

# execute previous commands
!500 # execute 500th entry in history
!! # execute last command

# CLI best practices
# - http://eng.localytics.com/exploring-cli-best-practices/
# - http://docopt.org/
# - http://catb.org/esr/writings/taoup/html/ch11s06.html

# add column of numbers using awk
# source: http://stackoverflow.com/a/3098072/6873133
awk '{ s += $1 } END { print s }' # where $1 is column one

# list only directories in current directory
# source: http://stackoverflow.com/a/14352330/6873133
ls -d */

# download file with curL
# specify download file name
curl -o iris.csv \
    http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data
# write file with same name as linked address
curl -O http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data

# unzip file into directory
unzip zipped-file.zip -d target-directory

# specify where to output wget
# source: http://stackoverflow.com/a/1078539/6873133
# -P prefix

# difference between semicolon and double ampersand
# source: https://unix.stackexchange.com/a/187148
false ; echo "OK"   # prints "OK"
false && echo "OK"  # prints nothing

# calculate size of directory and contents
# source: https://unix.stackexchange.com/a/3021
du -s directory_name
du -hs directory_name # human-readable size
du -ch | grep total # get total size of current directory

# get script name itself (put within a script to test)
me=`basename "$0"`

# dump HTML contents of page to file using lynx
# source: https://unix.stackexchange.com/a/83987
lynx -dump http://www.google.com >> google.txt

# remove files without error if doesn't exist
# source: https://superuser.com/a/76068
rm -f file.txt

# Or and And operations
# -a, && = and
# -o, || = or
# source: https://stackoverflow.com/a/16203126/
if [ 1 == 1 ] || [ 2 == 2 ]; then
    echo "This is true."
fi
if [ 1 == 1 -o 2 == 2]; then
    echo "This is also true."
fi

# increment numeric variables
# note: double parentheses permit arthimetic expansion and evaluation
# source: https://askubuntu.com/a/385532
var=0
var=$((var+1))
((var=var+1))
((var+=1))
((var++))
