args <- commandArgs(TRUE)

table <- read.table(args[1], header = FALSE, sep = "\t")
table.matrix <- as.matrix(table)
names <- args[-c(1, 2)]
rownames(table.matrix) <- names
colnames(table.matrix) <- names

library(pheatmap)
pheatmap(table.matrix, color = colorRampPalette(c("black", "white"))(100), filename = paste(args[2], "heatmap.png", sep = "."))
dev.off()

library(directlabels)
library(lattice)
mds <- cmdscale(as.dist(table.matrix), k = 2, eig = TRUE)
colnames(mds$points) <- c("PC1", "PC2")

png(filename = paste(args[2], "mds.png", sep = "."), width = 800, height = 800)
direct.label(xyplot(PC2 ~ PC1, data.frame(mds$points), groups = rownames(mds$points)))
dev.off()

library(ape)
mst <- mst(as.dist(table.matrix))
angle <- seq(0, 2 * pi, length = length(names) + 1)
x <- cos(angle)
y <- sin(angle)

png(filename = paste(args[2], "mst.png", sep = "."), width = 800, height = 800)
plot(x = NULL, y = NULL, xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2), axes = FALSE, xlab = "", ylab = "")
for(index in 1:length(names)) {
	index1 <- which(mst[index, ] == 1)
	segments(x[index] * 0.8, y[index] * 0.8, x[index1] * 0.8, y[index1] * 0.8)
}
text(x, y, names)
dev.off()

png(filename = paste(args[2], "me.png", sep = "."), width = 800, height = 800)
plot(fastme.bal(as.dist(table.matrix)), "u")
dev.off()
