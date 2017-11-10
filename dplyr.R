# dplyr Notes

# load library
library(dplyr)

# grep through values in data frame
# adapted from: http://stackoverflow.com/a/26766945
fruits <- c("apple", "banana", "watermelon", "strawberry")
data %>% select(columnToGrep) %>%
    mutate_each(funs(grepl(paste(fruits,
                                 collapse = "|"),
                                 .,
                                 ignore.case = TRUE)
                    )
               )

# non-standard evaluation of parameters to dynamically pass parameters
# source: http://stackoverflow.com/a/26003971
multipetal <- function(df, n) {
    varname <- paste("petal", n , sep=".")
    varval <- lazyeval::interp(~Petal.Width * n, n=n)
    mutate_(df, .dots= setNames(list(varval), varname))
}

# pass anonymous functions through pipes
# source: http://stackoverflow.com/a/28075092
foobar <- 1:3
foobar %>% (function(x) x * 2)
# [1] 2 4 6

# force show all rows
iris %>% tbl_df %>% as.data.frame

# apply grep search to rows
df %>% filter(!grepl("\\d+", columnName)) # search for one or more numbers

# find duplicate rows or values in columns
# source: https://stackoverflow.com/a/28244567/6873133
mtcars %>%
   group_by(carb) %>%
   filter(n() > 1)
