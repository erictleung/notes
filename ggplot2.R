# ggplot2 Notes
require(ggplot2)

# plot ggplots side by side
# Source: http://stackoverflow.com/a/3935554
require(gridExtra)
plot1 <- qplot(rnorm(100), binwidth = 0.5)
plot2 <- qplot(rpois(100, 3), binwidth = 0.5)
grid.arrange(plot1, plot2, ncol = 2)

# change legend title
# Source: http://stackoverflow.com/a/14622513
p <- ggplot(df, aes(x=rating, fill=cond)) +
            geom_density(alpha=.3) +
            xlab("NEW RATING TITLE") +
            ylab("NEW DENSITY TITLE")
p <- p + guides(fill=guide_legend(title="New Legend Title"))

# add annotation to side of plot
# Source: http://stackoverflow.com/a/12417481/6873133
