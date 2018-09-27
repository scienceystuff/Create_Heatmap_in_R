# a heat map fundamentally requires 3 things:
# x value
# y value
# additional dependent variable value 

# method 1: ggplot
# source: R graphics Cookbook.  Winston Chang. OReilly Press, ©2012 pp 651-654
# ggplot requires that the data for a heatmap be in a data frame, and:
# at least 2 of the 3 listed above must be numeric, or
# the x axis can be converted to a factor with levels, the fill is numeric, and the y axis is a factor
# if a data frame can be created from a table that is imported into R, so be it, otherwise you may need to do a bit of work
# also note that data must be formatted in a certain way; for example:


# Gene,Control,Treatment
# A,1,3
# B,2,2

# must be reformatted to:

# Gene,Value,Condition
# A,1,Treatment
# B,2,Treatment
# A,3,Control
# B,2,Control

# there are several options for a color pallette:
colors <- colorRampPalette(c("lightblue", "green", "red"))(3)
# Color Brewer can be used as well, although it is a bit complex
library("RColorBrewer", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
mypalette<-brewer.pal(7,"Greens")

# following the example above, assuming t is the dataframe with the data
p <- ggplot(t, aes(x=Condition, y=Gene, fill=Value))
p + geom_tile() + scale_x_discrete() + scale_fill_gradientn(colors=c("blue", "darkred"))
# here there needs to be a few cautionary words.  You MUST match continuous color mapping with continous values, and discrete color mapping with discrete values, or the heatmap creation will fail with an unhelpful error.
# In the example above, x is a discrete value, but if scale_x_continuous() were used, R will either fail to create the heatmap, or ignore the command
# if the fill is a continuous numeric, likewise you must use a continuous color mapping
# The same applies to RColorBrewer.  An alternative is to set up buckets:
# p + geom_tile() + scale_x_continuous(breaks=seq(lower,upper, by=stepValue)) + scale_y_reverse() + scale_fill_gradient2(midpoint=somevalue,mid="grey50", limits=c(0,100))

# you can also modify the axes with xlab() and ylab(), the legend title with guides(fill=guide_legend(title="TSS Distance")), and title attributes with theme(legend.title = element_text()
# p + geom_tile() + scale_fill_gradientn(colors=c("skyblue", "blue", "red")) + ylab(label = "Gene Name") + xlab(label = "Experimental Condition") + guides(fill=guide_legend(title="TSS Distance")) # theme(legend.title = element_text()

# this will save the plot
ggsave("myplot.pdf", height=8, width=8, units="in")
# or you can take a screenshot in R-Studio using Command-Control-4
