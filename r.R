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
objects()  # look at objects in the workspace
rm()       # remove objects from the workspace

# notes on various data files
# .RData = saved data objects from an R session
# .Rhistory = history of command lines used in session

# differences between order and sort
sort(c(1, 5, 2, 3))   # 1 2 3 5 - returns sorted vector
order(c(1, 5, 2, 3))  # 1 3 4 2 - returns indices of a sorted vector

# quick if-else statement
ifelse(test = 1 == 2, yes = TRUE, no = FALSE)

# simple title case function
# adapted from: http://stackoverflow.com/a/6364905
simpleCap <- function(x) {
    titleCase <- c()
    for (i in 1:length(x)) {
        s <- strsplit(x[i], " ")[[1]]
        titleS <- paste(toupper(substring(s, 1,1)), substring(s, 2),
                        sep="", collapse=" ")
        titleCase <- c(titleCase, titleS)
    }
    titleCase
}

# create formulas in R
tempFormula <- as.formula(paste(c("Y", "~ ."), collapse = ""))
lm(formula = tempFormula, data = data)

# use sweep function to operate on matrices to take "difference" in row/col
M <- matrix( 1:12, ncol=3)
dx <- colMeans(M)
sweep(X = M, MARGIN = 2, STATS = dx, FUNS = "-")

# remove column from data frame by setting it to NULL
iris$Species <- NULL

# matrix operations
# source: http://statmethods.net/advstats/matrix.html

# create your own operator
# source: http://stackoverflow.com/a/36809188
'%&%' <- function(x, y) paste0(x, y)
"new" %&% "operator"
# [1] "newoperator"

# fix warning startup messages about LC_.*
# source: http://stackoverflow.com/a/17510093
locale  # view local settings

# calculate number of combinations
choose(5, 0)
# [1] 1
choose(5, 1)
# [1] 5
choose(5, 2)
# [1] 10

# create empty data.frame
# source: http://stackoverflow.com/a/10689206
df <- data.frame(x1 = integer(), x2 = integer(), y = logical())
df
# 'data.frame':   0 obs. of  3 variables:
#  $ x1: int
#  $ x2: int
#  $ y : logi

# calculate cumulative sum
a <- c(1, 2, 8, -3)
cumsum(a)
# [1]  1  3 11  8

# shortcut paste(..., sep = "") with paste0()
paste(1:4, c("st", "nd", "rd", "th"))
# [1] "1 st" "2 nd" "3 rd" "4 th"
paste(1:4, c("st", "nd", "rd", "th"), sep = "")
# [1] "1st" "2nd" "3rd" "4th"
paste0(1:4, c("st", "nd", "rd", "th"))
# [1] "1st" "2nd" "3rd" "4th"

# edit data frames manually like a spreadsheet
edit(data.frame()) # just to edit without saving
newData <- edit(data.frame()) # editing with saving
