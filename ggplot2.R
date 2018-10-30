# ggplot2 Notes
require(ggplot2)

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
# source: http://ggplot2.tidyverse.org/reference/stat_ellipse.html
faithpoint <- ggplot(faithful, aes(waiting, eruptions, color = eruptions > 3)) +
    geom_point() +
faithpoint + stat_ellipse()
faithpoint + stat_ellipse(level = 0.99)

# add table into plot with tableGrob
# source: https://stackoverflow.com/a/44121513/6873133
library(gridExtra)
mydata <- data.frame(a=1:50, b=rnorm(50))
mytable <- cbind(sites=c("site 1","site 2","site 3","site 4"), mydata[10:13,])
k <- ggplot(mydata,aes(x=a,y=b)) + 
  geom_point(colour="blue") + 
  geom_point(data=mydata[10:13, ], aes(x=a, y=b), colour="red", size=5) + 
  annotation_custom(tableGrob(mytable, rows=NULL), 
                    xmin=35, xmax=50, ymin=-2.5, ymax=-1)

# another version to add tables to plots
# source: https://stackoverflow.com/a/40335941/
library(gridExtra)
library(cowplot)
df <- data.frame(
    dose=c(10,0.625,2.5,0.15625,0.0390625,0.0024414,0.00976562,0.00061034,10,
           0.625,2.5,0.15625,0.0390625,0.0024414,0.00976562,0.00061034,10,
           0.625,2.5,0.15625,0.0390625,0.0024414,0.00976562,0.00061034),
    viability=c(6.117463479317,105.176885855348,57.9126197628863,81.9068445005286,
                86.484379347143,98.3093580807309,96.4351897372596,81.831197750164,
                27.3331232120347,85.2221817678203,80.7904933803092,91.9801454635583,
                82.4963735273569,110.440066995265,90.1705406346481,76.6265869905362,
                11.8651732228561,88.9673125759484,35.4484427232156,78.9756635057238,
                95.836828982968,117.339025930735,82.0786828300557,95.0717213053837),
    stringsAsFactors = FALSE)
ann.df <- data.frame(
    "param" = c("Slope", "Lower", "Upper", "ED50"),
    "value" = c(5.70, 15.10, 91.40, 2.61),
    stringsAsFactors = FALSE)
p <- ggplot(df,aes(x = dose, y = viability)) + geom_point()
ggdraw(p) + draw_grob(tableGrob(ann.df), x = 0.1, y = 0.2)

# add counts above bars in bar graph
# sources:
# - https://stackoverflow.com/a/23770326/
# - https://stackoverflow.com/a/19853744/
# - https://stackoverflow.com/a/3695592/
# - But may be replaced with calc() eventually
#   - See https://stackoverflow.com/a/17506197/
dd <- data.frame(x = rnorm(100, 5, 2))
ggplot(dd, aes(x = x)) + geom_histogram() +
  stat_bin(aes(y = ..count.., label = ..count..), geom = "text", vjust = -0.5)

# add vertical line to plots
# source: https://stackoverflow.com/a/19622114/
iris %>% ggplot(aes(Sepal.Length, Sepal.Width)) +
  geom_point() +
  geom_vline(xintercept = 3)

# change x- and y-axis limits
# source: https://stackoverflow.com/a/3606798/
iris %>% ggplot(aes(Sepal.Length, Sepal.Width)) +
  geom_point() +
  coord_cartesian(xlim = c(5, 7)) # Without clipping data
iris %>% ggplot(aes(Sepal.Length, Sepal.Width)) +
  geom_point() +
  scale_x_continuous(c(5, 7)) # Removes unseen data points
