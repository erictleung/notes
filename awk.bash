# awk Notes

# commands follow form of:
#   pattern { action }

# or they follow the form of:
#   BEGIN { print "START" }  # thing to do before anything
#         { print         }  # thing to do while reading lines
#   END   { print "STOP"  }  # thing to do after reading everything

# awk doesn't interpret variables within strings
# e.g. { print "$8\t$3" } doesn't work

# you can specify variables (e.g. will print number "5" and fifth field)
awk '
BEGIN   { x=5 }         \
        { print x, $5 } \
'

# you can use awk as interpreter
# $ awk -f filename

# print entire file
awk '{ print }' example.txt
awk '{ print $0 }' example.txt

# print first column
echo one two | awk '{ print $1 }'
echo "one:two" | awk -F ":" '{ print $1 }' # -F specifies delimiter
