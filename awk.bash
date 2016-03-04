# awk Notes

# print entire file
awk '{ print }' example.txt
awk '{ print $0 }' example.txt

# print first column
echo one two | awk '{ print $1 }'
echo "one:two" | awk -F ":" '{ print $1 }' # -F specifies delimiter
