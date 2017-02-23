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

-- comparisons
5 == 5
5 /= 4
5 > 3
5 < 4
5 <= 20
40 >= 2

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

-- define functions/expressions
doubleMe x = x + x

-- save string characters with single quote
conanO'Brien = "It's a-me, Conan O'Brien"

-- ++ operator will concatenate strings/lists
[1, 2, 3, 4] ++ [1, 2, 3, 4]
"Hello" ++ " " ++ "World"

-- string characters use double quotes
'A' -- character type
"CAT" -- list of characters

-- index strings and lists using !!
"James Gordon" !! 2 -- returns "m"
[0, 1, 2, 3] !! 3 -- returns 3

-- list operations
let exList = [1,2,3,4]
head exList -- 1
tail exList -- [2,3,4]
last exList -- 4
init exList -- [1,2,3]
length exList -- 4
null exList -- False (checks if empty list)
reverse exList -- [4,3,2,1]
take 2 exList -- [1,2]
drop 2 exList -- [3,4]

-- list arithmetic
maximum exList -- 4
minimum exList -- 1
sum exList -- 10
product exList -- 24
elem 4 exList -- True, check if element of list

-- quicker expansion of elements
[1..5] -- [1,2,3 4,5]
['f'..'h'] -- "fgh"
[2, 4..10] -- [2,4,6,8,10]

-- repeating items
take 8 (cycle [1,2,3]) -- [1,2, 3,1,2,3,1,2], cycle goes to infinity
take 8 (repeat [1,2,3]) -- [[1,2,3],[1,2,3],[1,2,3]], repeat goes to infinity
replicate 3 10 -- [10,10,10]

-- define functions with multiple arguments
f :: Int -> Int -> Int -> Int -- function f with three arguments
f x y z = x + y + z
f 3 17 8

-- cons operator to add to lists
1 : [] -- [1]
3 : (5 : []) -- [3,5]

-- lines splits on line boundaries
lines "the quick brown\nfox\njumps" -- ["the quick brown","fox","jumps"]

-- list comprehensions simliar to Python
-- framework: [WHAT_TO_RETURN | CONDITIONS]
[x*2 | x <- [1..10]] -- double all elements between 1 and 10
[x*2 | x <- [1..10], x*2 => 12] -- keep elements greater than 12 when doubled

-- first and second element of tuple
fst (1,2) -- 1
snd (1,2) -- 2

-- different types
a :: Int
b :: Integer -- another way, but larger
c :: Float -- single precision
d :: Double -- double precision
e :: Bool
f :: Char
