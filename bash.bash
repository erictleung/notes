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

# commands for imagemagick image manipulation command
convert original.png -resize 64x64 resized.png # use aspect ratio but best fit

# make directory and its intermediate directories along the way
mkdir -p directories/in/between/will/be/made
