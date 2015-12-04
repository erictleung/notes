# Python Notes
# Version 2.7

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

# reload local package if modified
reload(package)

# check if file/directory exists
import os.path
os.path.isfile(FILENAME) # tests specifically files
os.path.exists(ANYTHING) # tests files and directories

# create generator with yield command
def createGenerator():
    mylist = range(3)
    for i in mylist:
        yield i * i

# clone instead of point to a set object
setA = set([1, 2, 3, 4])
setB = set(setA)

# unit testing with unittest
def fun(x):
    return x + 1
class TestAddingMethod(unittest.TestCase):
    def test_three(self):
        self.assertEqual(fun(3), 4)
