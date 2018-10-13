#Bubble plot with ggplot package
#Code by Anurag Raj(anurag.raj@igib.in)

#loading packages
library(ggplot2)
library(reshape2)

#function to plot
bubbleplot <- function(data.Matrix){
    melt.matrix <- melt(data.Matrix)

    entry_order <- factor(data.Matrix$Entry)
    melt.matrix_subset <- subset(melt.matrix, value > 0)
    gg <- ggplot(melt.matrix_subset, aes(x=melt.matrix_subset$Entry,y=melt.matrix_subset$variable))
    gg <-  gg + geom_point(aes(fill = value), stat = "identity", size = melt.matrix_subset$value, shape = 21)
    gg <- gg + theme_test()
    gg <- gg + theme(text = element_text(size=9, color = "black"), axis.text.x = element_text(angle=90, hjust=1), axis.text.y = element_text(size = 12), axis.title = element_text(size = 14))
    gg <- gg + labs(x = "Entry", y = "Variable")
    print(gg)

}

#reading matrix data
#the matrix need to be in 0 and 1 format or it can be value for gradient filling
data.Matrix <- read.table(file = "matrix.csv", sep = ",",header = TRUE)

#running function
pdf("bubblePlot.pdf",width = 8, height = 4, title = Bubble Plot)
bubbleplot(data.Matrix)
dev.off()

