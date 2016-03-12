# R Notes

# require packages
require(survival)

# for loop
for (i in 1:10) {
    print(i)
}

# order elements by length of string
v <- c("ab", "a", "abc", "abcde", "abcd")
v[order(nchar(v), v)]

# write a function
add2 <- function(n) {
    n + 2
}

# find number of levels in a factor variable
ex_factor <- factor(x = c(1, 2, 1, 1, 1, 2, 2, 1))
nlevels(ex_factor)

# run R script from command line
# Rscript foo.r

# write to standard output
cat("Hello, world!\n")
writeLines("Hello, again!")

# save figures/plots
## commands: jpeg, png, win.metafile, pdf, postscript
## Method 1
jpeg("rplot.jpg")
plot(x, y)
dev.off()
## Method 2
dev.copy(png, "myplot.png")
dev.off()

# remove incomplete cases
dat <- data.frame(x1 = c(1,2,3, NA, 5), x2 = c(100, NA, 300, 400, 500))
na.omit(dat)

# test variances between two groups
x <- rnorm(50, mean = 0, sd = 2)
y <- rnorm(30, mean = 1, sd = 1)
var.test(x, y)

# count number of characters
nchar("Hello, world!")

# interact with loaded objects
objects() # look at objects in the workspace
rm() # remove objects from the workspace

# notes on various data files
# .RData = saved data objects from an R session
# .Rhistory = history of command lines used in session

# differences between order and sort
sort(c(1, 5, 2, 3)) # 1 2 3 5 - returns sorted vector
order(c(1, 5, 2, 3)) # 1 3 4 2 - returns indices of a sorted vector

# quick if-else statement
ifelse(test = 1 == 2, yes = TRUE, no = FALSE)
