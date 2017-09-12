#!/usr/bin/env python3

# data types in Python3
2       # integers and numbers
"eggs"  # strings
[1, 2]  # lists

# multiple assignment
a, b = 0, 1

# reload local or any modules
# Source: http://stackoverflow.com/a/14390676
import imp
imp.reload(module)

# autoconcatenate strings, doesn't work with variables
'Py' 'thon' # first way
('Py'
 'thon') # another way

# get range generator
range(5)        # returns 'range(0, 5)'
range(2, 5)     # returns 'range(2, 5)'
list(range(5))  # get contents out

# function definition
def add_two(a, b):
    return(a + b)

# run quick script from CLI
# python -c "print('Hello, World!')"

# create for loop
for i in range(5):
    print(i)
