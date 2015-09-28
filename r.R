# R Notes

# for loop
for (i in 1:10) {
    print(i) 
}

# order elements by length of string
v <- c("ab", "a", "abc", "abcde", "abcd")
v[order(nchar(v), v)]
