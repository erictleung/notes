# ggplot2 Notes
require(ggplot2)

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

# draw ellipses around scatterplot clusters
# default, 95% of data drawn around
# source: http://ggplot2.tidyverse.org/reference/stat_ellipse.html
faithpoint <- ggplot(faithful, aes(waiting, eruptions, color = eruptions > 3)) +
    geom_point() +
faithpoint + stat_ellipse()
faithpoint + stat_ellipse(level = 0.99)
