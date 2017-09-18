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

# playing with time
import time
time.time() # seconds since Unix Epoch i.e. 1200 Jan 1 1970
time.localtime(time.time()) # parsed time with structure
time.asctime(time.localtime(time.time())) # more readble time
time.sleep(5) # pause for 5 seconds

# datetime module
import datetime
datetime.datetime.today()
d = datetime.date(1993, 12, 1) # Yr 1993, Mn 12, Dy 1
t = datetime.time(hour = 12) # 12:00
datetime.datetime.combine(d, t)
datetime.time(12) < datetime.time(13) # compare times
datetime.datetime(1993, 12, 1) < datetime.datetime(1993, 11, 3) # compare dates
datetime.datetime.today().strftime('%d %a %b %Y %H:%M:%S') # formatted date
