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
