# tidyverse package notes

# contents
# - stringr
# - dplyr
# - ggplot2
# - tidyr

# stringr --------------------------------------------------------------
library(stringr)

# extract substring easily with stringr
str_extract("I want the word James", regex("James"))
# [1] "James"
str_extract("2017-09-22_file-1_work-stuff", regex("file-[0-9]{1,3}"))
# [1] "file-1"


# dplyr ----------------------------------------------------------------
# resource:
# - https://dplyr.tidyverse.org/articles/programming.html
library(dplyr)
library(broom)

# row-wise sums
# source: https://stackoverflow.com/a/31219524/
iris %>% mutate(sum = Reduce("+", .[1:4])) # use magrittr pipe
iris$sum <- rowSums(iris[, 1:4]) # base function

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
# source: https://stackoverflow.com/a/28244567
mtcars %>%
   group_by(carb) %>%
   filter(n() > 1)

# filter by not in set
mtcars %>%
  filter(!cyl %in% c(4, 8))

# two sample t-test on tidy data


# ggplot2 --------------------------------------------------------------
require(ggplot2)

# useful resources
# - http://www.sthda.com/english/wiki/be-awesome-in-ggplot2-a-practical-guide-to-be-highly-effective-r-software-and-data-visualization

# useful ggplot2 extensions or compatible packages
# - Publication ready plots https://github.com/kassambara/ggpubr
# - Composer of ggplot2s
#     - https://github.com/thomasp85/patchwork
#     - https://github.com/wilkelab/cowplot
# - A List of ggplot2 extensions http://www.ggplot2-exts.org/

# plot ggplots side by side
# source: http://stackoverflow.com/a/3935554
require(gridExtra)
plot1 <- qplot(rnorm(100), binwidth = 0.5)
plot2 <- qplot(rpois(100, 3), binwidth = 0.5)
grid.arrange(plot1, plot2, ncol = 2)

# change legend title
# source: http://stackoverflow.com/a/14622513
p <- ggplot(df, aes(x=rating, fill=cond)) +
            geom_density(alpha=.3) +
            xlab("NEW RATING TITLE") +
            ylab("NEW DENSITY TITLE")
p <- p + guides(fill=guide_legend(title="New Legend Title"))

# add annotation to side of plot
# source: http://stackoverflow.com/a/12417481/6873133

# increase size of points
# source: http://stackoverflow.com/a/9789895/6873133
dt <- data.frame(country = letters[1:20], val = rnorm(20), siz = rnorm(20))
qplot(x = country, y = val, data = dt, geom = "point", size = siz) +
    scale_size(range = c(2, 10))

# remove all of (x) axis labels
# remove everything, but can pick and choose which ones to keep
# source: https://stackoverflow.com/a/35090981/6873133
ggplot(data = diamonds, mapping = aes(x = clarity)) + geom_bar(aes(fill = cut))+
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

# move around x-axis label
# source: https://ggplot2.tidyverse.org/reference/element.html
# inspired by: https://twitter.com/tjmahr/status/1039517803315744768
iris %>% ggplot(aes(Sepal.Length, Sepal.Width)) +
  geom_point() +
  theme(axis.title.x = element_text(hjust = 0.25, vjust = 7))
# draw ellipses around scatterplot clusters
# default, 95% of data drawn around

# reorder bars in barplot based on other variable
# source: https://stackoverflow.com/a/25664367/
corr.m <- structure(list(miRNA = structure(c(5L, 2L, 3L, 6L, 1L, 4L),
                                           .Label = c("mmu-miR-139-5p",
                                                      "mmu-miR-1983",
                                                      "mmu-miR-301a-3p",
                                                      "mmu-miR-5097",
                                                      "mmu-miR-532-3p",
                                                      "mmu-miR-96-5p"),
                                           class = "factor"),
                         variable = structure(c(1L, 1L, 1L, 1L, 1L, 1L),
                                              .Label = "pos",
                                              class = "factor"),
                         value = c(7L, 75L, 70L, 5L, 10L, 47L)),
                    class = "data.frame",
                    row.names = c("1", "2", "3", "4", "5", "6"))
ggplot(corr.m, aes(x = reorder(miRNA, -value), y = value, fill = variable)) + 
  geom_bar(stat = "identity")


# tidyr ----------------------------------------------------------------
library(tidyr)

# conditionally mutate nested file
# mutates only the setosa species
iris %>%
  as_tibble() %>%
  nest(-Species) %>%
  mutate(data = if_else(
    Species == "setosa",
    purrr::map(data, function(df) {
      df %>%
        mutate(Sepal.Length = Sepal.Length * 10)
    }),
    data
  )) %>%
  unnest()
