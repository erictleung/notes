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
add2 <- function(n) n + 2 # one line functions

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
ls()       # another way to look at objects too
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

# save variable to global scope
globalVar <<- 1

# find arguments of function
args(plot.default)
args(mean.default)

# color schemes in R
# source: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# read in printed out text into table
readIn <- read.table(textConnection('Competition FreeLiquor RateofReturn Default
1    Yes    Yes    High    No'))

# boolean operations
# source: http://stackoverflow.com/a/6559049/6873133
# source: https://stat.ethz.ch/R-manual/R-devel/library/base/html/Logic.html
x <- TRUE
y <- FALSE
!x          # negation
x & y       # element-wise AND i.e. returns vector
x && y      # logical AND of only one value
x | y       # element-wise OR i.e. returns vector
x || y      # logical OR of only one value
xor(x, y)   # XOR == exclusive OR

# shortcut booleans
T == TRUE
F == FALSE

# write to file with text
# source: http://stackoverflow.com/a/2470277/6873133
fileConn <- file("output.txt")
writeLines(c("Hello", "World"), fileConn)
close(fileConn)

# repeat characters with replicate or rep
# source: http://stackoverflow.com/a/22359177/6873133
replicate(2, "doubleString")
# [1] "doubleString" "doubleString"
rep("doubleString", 2)
# [1] "doubleString" "doubleString"
paste(rep("doubleString", 2), collapse = "")
# [1] "doubleStringdoubleString

# install required packages if not already installed
# source: http://stackoverflow.com/a/4090208/6873133
list.of.packages <- c("ggplot2", "Rcpp")
installedPkges <- installed.packages()[, "Package"]
new.packages <- list.of.packages[!(list.of.packages %in% installedPkges)]
if (length(new.packages)) install.packages(new.packages)

# create paths easily
file.path(getwd())                       # ~/
file.path(getwd(), "Documents")          # ~/Documents
file.path(getwd(), "Documents", "Safe")  # ~/Documents/Safe

# find duplicate rows or elements
repeatX <- c(1:5, 3:7)
duplicated(repeatX)  # returns logical vector
# [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE
anyDuplicated(repeatX)  # returns index of first duplicate
# [1] 6
duplicated(repeatX, fromLast = TRUE)  # starts from end
# [1] FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE

# drop factors from subset
# source: http://stackoverflow.com/a/4284931/6873133
factor(letters[1:5]) %>% .[1:3] %>% droplevels() %>% levels

# possible origin of R code names
# source: http://stackoverflow.com/a/13496840/6873133

# get parent directory
# source: http://stackoverflow.com/a/17317210/6873133
dirname(getwd())

# write out Excel files, with specific sheets, openxlsx package
# source: https://stackoverflow.com/a/43118134/6873133

# count number of non-zero elements in each column
# source: https://stackoverflow.com/a/22286988/6873133
example <- matrix(sample(c(0,0,0,100),size=70,replace=T),ncol=7)
colSums(exmple != 0)

# explanation of R objects
#   - Rda - short for RData
#   - RData - multiple data, use with save(), load(), attach(), etc
#   - Rds - *single* R object
# source: https://stackoverflow.com/a/21370351/6873133

# directory related commands
dir.exists("directory")  # check existing directory
file.path("path", "here")  # format path to "path/here" automatically
dir.create("new-directory")  # create new directory
dirname(".")  # gets parent directory
basename("./base/")  # returns basename, which is "base"

# check version of R
R.Version()
R.version
R.version.string
version
compareVersion("1.1.0", "1.1.3")  # check versions of R

# extract substring easily with stringr
library(stringr)
str_extract("I want the word James", regex("James"))
# [1] "James"
str_extract("2017-09-22_file-1_work-stuff", regex("file-[0-9]{1,3}"))
# [1] "file-1"

# reorder factor levels
# source: https://www.r-bloggers.com/reorder-factor-levels/
x <- factor(sample(letters[1:5], 100, replace = TRUE))
print(levels(x)) # Levels: a b c d e
x <- factor(x, levels(x)[c(4, 5, 1:3)])
print(levels(x)) # Levels: d e a b c

# cut vector into defined intervals
# source: https://stackoverflow.com/a/5746634/6873133
x <- sample(0:20, 100, replace = TRUE)
cut(x, breaks = c(0, 10, 20), include.lowest = TRUE)
# [1] (10,20] [0,10]  [0,10]  (10,20] (10,20] (10,20] [0,10]  (10,20] (10,20]
# ...
# [100] (10,20]
# Levels: [0,10] (10,20]

# remove space for title using base R
par(mar = c(5, 5, 2, 2) + 0.1)
