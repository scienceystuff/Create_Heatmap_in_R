## Creating a Heatmap in R

### Synopsis
Heatmaps have several uses, especially in Bioinformatics and the visualization of Biological data.  At a basic level, a heatmap contrasts multiple data points, and uses a color scale to show quantitative (usually gene expression) values.  Note that a heatmap is **not** a statistical comparison by default, meaning unless you specify filtering by pvalues, R will not do this for you!

There are two methods listed.  [Create_Heatmap_method1.R](https://github.com/scienceystuff/Create_Heatmap_in_R/blob/master/Create_Heatmap_method1.R) provides an example and general instructions using ggplot.  [Create_Heatmap_method2.R](https://github.com/scienceystuff/Create_Heatmap_in_R/blob/master/Create_Heatmap_method2.R) provides an example use, and primarily addresses creating a Heatmap using DESeq2.
