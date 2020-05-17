###############################################################

A heat map (or heatmap) is a graphical representation of data where the individual values contained in a matrix are represented as colors. It is a bit like looking a data table from above. It is really useful to display a general view of numerical data, not to

extract specific data point. It is quite straight forward to make a heat map, as shown on the examples below. However be careful to understand the underlying mechanisms. You will probably need to normalise your matrix, choose a relevant colour

palette, use cluster analysis and thus permute the rows and the columns of the matrix to place similar values near each other according to the clustering.

###############################################################
mtcars
str(mtcars)

# The mtcars dataset:
data=as.matrix(mtcars)

head(data)

# Default Heatmap (left)
heatmap(data)

# Use 'scale' to normalize (right)
heatmap(data, scale="column")

# No dendrogram nor reordering for neither column or row
heatmap(data, Colv = NA, Rowv = NA, scale="column")

##


# 1: native palette from R
heatmap(data, scale="column", col = cm.colors(256))
heatmap(data, scale="column", col = terrain.colors(256))

# 2: Rcolorbrewer palette
library(RColorBrewer)
coul = colorRampPalette(brewer.pal(8, "PiYG"))(25)
heatmap(data, scale="column", col = coul)


#############################
#Visualizing Categorical Data
#The vcd package provides a variety of methods for visualizing multivariate categorical data, inspired by Michael Friendly's wonderful "Visualizing Categorical Data". Extended mosaic and association plots are described here. Each provides a method of visualizng complex data and evaluating deviations from a specified independence model. For more details, see The Strucplot Framework.
##############################

# Mosaic Plot Example
library(vcd)
HairEyeColor

mosaic(HairEyeColor, shade=TRUE, legend=TRUE)
mosaic(HairEyeColor,shade=TRUE)

########################

require(stats)
mosaicplot(Titanic, main = "Survival on the Titanic", color = TRUE)
## Formula interface for tabulated data:
mosaicplot(~ Sex + Age + Survived, data = Titanic, color = TRUE)

mosaicplot(HairEyeColor, shade = TRUE)
## Independence model of hair and eye color and sex.  Indicates that
## there are more blue eyed blonde females than expected in the case
## of independence and too few brown eyed blonde females.
## The corresponding model is:
fm <- loglin(HairEyeColor, list(1, 2, 3))
pchisq(fm$pearson, fm$df, lower.tail = FALSE)

mosaicplot(HairEyeColor, shade = TRUE, margin = list(1:2, 3))
## Model of joint independence of sex from hair and eye color.  Males
## are underrepresented among people with brown hair and eyes, and are
## overrepresented among people with brown hair and blue eyes.
## The corresponding model is:
fm <- loglin(HairEyeColor, list(1:2, 3))
pchisq(fm$pearson, fm$df, lower.tail = FALSE)

## Formula interface for raw data: visualize cross-tabulation of numbers
## of gears and carburettors in Motor Trend car data.
mosaicplot(~ gear + carb, data = mtcars, color = TRUE, las = 1)
# color recycling
mosaicplot(~ gear + carb, data = mtcars, color = 2:3, las = 1)


###############################
#Correlograms
#Correlograms help us visualize the data in correlation matrices. For details, see Corrgrams: Exploratory displays for correlation matrices.
########################################
# First Correlogram Example
install.packages("corrgram")

library(corrgram)
mtcars

corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Car Milage Data in PC2/PC1 Order")


#
# Third Correlogram Example
library(corrgram)
corrgram(mtcars, order=NULL, lower.panel=panel.shade,
         upper.panel=NULL, text.panel=panel.txt,
         main="Car Milage Data (unsorted)")


corrgram(mtcars, order=TRUE, lower.panel=NULL,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Car Milage Data in PC2/PC1 Order",args.name=c(.3,.1))


M<-cor(mtcars)
head(round(M,2))

install.packages("corrplot")

library(corrplot)
corrplot(M, method="circle")

corrplot(M, type="upper")
corrplot(M, type="upper", order="hclust")


#####


######################
#3D
#########################
install.packages("plot3D")

library("plot3D")

data(iris)
head(iris)
# x, y and z coordinates
x <- sep.l <- iris$Sepal.Length
y <- pet.l <- iris$Petal.Length
z <- sep.w <- iris$Sepal.Width

a <- b <- 10




scatter3D(x, y, z,  colvar = z, col = NULL, add = FALSE)

scatter3D(x, y, z)

scatter2D(x, y, colvar = NULL, col = NULL, add = FALSE)

scatter3D(x, y, z, clab = c("Sepal", "Width (cm)"))


scatter3D(x, y, z,  col = rainbow(length(x)),
          pch = 10, cex = 0.6)


# full box
scatter3D(x, y, z, bty = "f", colkey = FALSE, main ="bty= 'f'")
# back panels and grid lines are visible
scatter3D(x, y, z, bty = "b2", colkey = FALSE, main ="bty= 'b2'" )

# grey background with white grid lines
scatter3D(x, y, z, bty = "g", colkey = FALSE, main ="bty= 'g'")
# User defined
scatter3D(x, y, z, pch = 18, bty = "u", colkey = FALSE, 
          main ="bty= 'u'", col.panel ="steelblue", expand =0.4, 
          col.grid = "darkblue")


##
hist3D (x = 1:5, y = 1:4, z = VADeaths,
        bty = "g", phi = 20,  theta = -60,
        xlab = "", ylab = "", zlab = "", main = "VADeaths",
        col = "#0072B2", border = "black", shade = 0.8,
        ticktype = "detailed", space = 0.15, d = 2, cex.axis = 1e-9)

# Use text3D to label x axis
text3D(x = 1:5, y = rep(0.5, 5), z = rep(3, 5),
       labels = rownames(VADeaths),
       add = TRUE, adj = 0)
# Use text3D to label y axis
text3D(x = rep(1, 4),   y = 1:4, z = rep(0, 4),
       labels  = colnames(VADeaths),
       add = TRUE, adj = 1)

USArrests
str(USArrests)
#
# Only text
with(USArrests, text2D(x = Murder, y = Assault + 5, colvar = Rape, 
                       xlab = "Murder", ylab = "Assault", clab = "Rape", 
                       main = "USA arrests", labels = rownames(USArrests), cex = 0.6, 
                       adj = 0.5, font = 2))




####


install.packages("ggmap")
library(ggmap)

qmap(location = "boston university") 
qmap(location = "pune", zoom = 14) 
qmap(location = "boston university", zoom = 14, source = "osm")