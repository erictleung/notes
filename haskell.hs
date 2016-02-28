-- Haskell Programming Notes

-- arithmetic
2 + 13
4 - 3
6 * 5
10 / 3

-- boolean values and operations
True
False
True && False
True || False
not False

-- comaprisons
5 == 5
5 /= 4

-- basic function use
succ 5 -- returns successor i.e. 6
min 4 1 -- returns minimum i.e. 1

-- function preference
succ 9 + max 5 4 + 1 -- is the same as...
(succ 9) + (max 5 4) + 1

-- infix vs prefix functions
1 + 2 -- infix function
min 1 2 -- prefix function
1 `min` 2 -- make prefix function an infix function

-- define functions
doubleMe x = x + x
