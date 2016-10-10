#!/usr/bin/env python

# Python's NLTK notes

import nltk
from nltk.book import *

# Functions for Frequency Distribution
fdist = FreqDist(text1)
fdist['monstrous'] # Count number of times
fdist.freq('monstrous') # Frequency percent
fdist.N() # Total samples
fdist.keys() # Samples sorted by decreasing frequency
# for sample in fdist: # Loop through samples
fdist.max()
fdist.tabulate()
fdist.plot(50, cumulative=True)
fdist1 < fdist2 # Compare samples between two distributions

# Word Comparison Operators
s.startswith("String")
s.endswith("String")
s.islower()
s.isupper()
s.isalpha() # Characters in the alphabet
s.isalnum() # Characters are alphanumeric
s.isdigit() # Characters are digits
s.ittitle() # Characters are titlecased
