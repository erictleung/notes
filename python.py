# Python Notes
# Version 2.7

# How To Package Your Python Code
# http://python-packaging.readthedocs.io

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

# regular expressions
import re
re.findall(r'\bf[a-z]*', 'which foot or hand fell fastest')
# ['foot', 'fell', 'fastest']

# find number of cores on computer
# cli: python -c 'import multiprocessing as m; print m.cpu_count()'
import multiprocessing as m
print m.cpu_count()

# create function
def functionName(params):
    print("Hello, World!")
functionName("input")

# functional programming introduction (un-Pythonic patterns)
# source: https://maryrosecook.com/blog/post/a-practical-introduction-to-functional-programming
