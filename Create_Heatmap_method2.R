# method2: pheatmap
# pretty heat map pheatmap() requries data be in a matrix.  
# One advantage over ggplot is that it can be used to show dendrogram clustering

# A crude but simple method--used with caution--is to convert a dataframe with data to a matrix

selection_ofData <- as.matrix(dataFrame[1:14,1:6]) 

# then create the heatmap with:
pheatmap(selection_ofData, cluster_rows = TRUE, show_rownames = TRUE, cluster_cols = TRUE, color = colorRampPalette(c("navy", "white", "firebrick3"))(50)

# to save the plot, ggsave() will save the last viewed plot as a pdf, etc. based on the file extension in the name.  Be warned that it will overwrite existing files without warning!
ggsave("myplot.pdf", height=8, width=8, units="in")
         
