# ggplot2 Notes
require(ggplot2)

# plot ggplots side by side
# Source: http://stackoverflow.com/a/3935554
require(gridExtra)
plot1 <- qplot(rnorm(100), binwidth = 0.5)
plot2 <- qplot(rpois(100, 3), binwidth = 0.5)
grid.arrange(plot1, plot2, ncol = 2)
