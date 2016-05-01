# dplyr Notes

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
