# Load data
data("mtcars")
my_data <- mtcars[, c(1,3,4,5,6,7)]
# print the first 6 rows
head(my_data, 6)

res <- cor(my_data)
round(res, 3)


#
cor(my_data, use = "complete.obs")


##
install.packages("Hmisc")

library("Hmisc")
res2 <- rcorr(as.matrix(my_data))
res2

# Extract the correlation coefficients
res2$r
# Extract p-values
res2$P


####assignment
# ++++++++++++++++++++++++++++
# flattenCorrMatrix
# ++++++++++++++++++++++++++++
# cormat : matrix of the correlation coefficients
# pmat : matrix of the correlation p-values
flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}

##
library(Hmisc)
res2<-rcorr(as.matrix(mtcars[,1:7]))
flattenCorrMatrix(res2$r, res2$P)


##
png("corplot.png", width=5, height=5, units="in", res=200)
op <- par(mar=c(6,6,1,1), ps=10)
COR <- cor(iris[,1:4])
image(x=seq(nrow(COR)), y=seq(ncol(COR)), z=cor(iris[,1:4]), axes=F, xlab="", ylab="")
text(expand.grid(x=seq(dim(COR)[1]), y=seq(dim(COR)[2])), labels=round(c(COR),2))
box()
axis(1, at=seq(nrow(COR)), labels = rownames(COR), las=2)
axis(2, at=seq(ncol(COR)), labels = colnames(COR), las=1)
par(op)
dev.off()




##########p value
x = c(9.0,9.5,9.6,10.2,11.6)
t.test(x)

#df, intercept, pvalue, coefficient

help(t.test)