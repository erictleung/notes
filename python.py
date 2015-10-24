# Python Notes

# for loop
for i in range(10):
    print i

# check list elements of matching string
randList = ["a", "ab", "bc", "de", "abc"]
toFind = "a"
print [x for x in randList if toFind in x]

# read file
with open("filename.txt", "r") as fh:
    data = fh.readline() # read line by line
    # data = fh.read() # read entire file
