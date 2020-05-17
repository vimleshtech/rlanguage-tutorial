# create heatmap and don't reorder columns
# scale data to mean=0, sd=1 and convert to matrix
mtscaled <- as.matrix(scale(mtcars))
str(mtcars)

heatmap(mtscaled, Colv=F, scale='none')

####
# Mosaic Plot Example
install.packages("vcd")
library(vcd)
mosaic(HairEyeColor, shade=TRUE, legend=TRUE)


#####
# First Correlogram Example
install.packages("corrgram")
library(corrgram)
str(mtcars)
corrgram(airquality, order=TRUE, 
         lower.panel=panel.shade,
         upper.panel=panel.pie, ##text.panel=panel.txt,
         main="Air quality index")


# Second Correlogram Example
library(corrgram)
corrgram(mtcars, order=TRUE, lower.panel=panel.ellipse,
         upper.panel=panel.pts, text.panel=panel.txt,
         diag.panel=panel.minmax, 
         main="Car Mileage Data in PC2/PC1 Order")


# Third Correlogram Example
library(corrgram)
corrgram(mtcars, order=NULL, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Car Milage Data (unsorted)")



##### map 
install.packages("ggmap")

library(ggmap)

qmap(location = "pune")

qmap(location = "boston university")

qmap(location = "boston university", zoom = 14)

qmap(location = "boston university", zoom = 14, source = "osm")


##### 3d
library("plot3D")
# x, y and z coordinates
x <- sep.l <- iris$Sepal.Length
y <- pet.l <- iris$Petal.Length
z <- sep.w <- iris$Sepal.Width

scatter3D(x, y, z, clab = c("Sepal", "Width (cm)"))


month.name
###web data 
library(data.table)
mydat <- fread('http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat')


install.packages("RODBC")
library("RODBC")


myconn <-odbcConnect("test")


#crimedat <- sqlFetch(myconn, "product")

data <- sqlQuery(myconn, "select * from employee")
qmap(location = data$country)

data$country

