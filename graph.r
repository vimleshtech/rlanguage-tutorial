
install.packages("ggplot2")

library("ggplot2")

  x       :   vector   
  lables : description
  radious:  -1  to +1
  title :   
  clockwise :  
  

##
#pie(x, labels, radius, main, col, clockwise)
#x is a vector containing the numeric values used in the pie chart.
#labels is used to give description to the slices.
#radius indicates the radius of the circle of the pie chart.(value between ???1 and +1).
#main indicates the title of the chart.
#col indicates the color palette.
#clockwise is a logical value indicating if the slices are drawn clockwise or anti clockwise.


## line graph
# Create the data for the chart.
v <- c(7,12,28,3,41)

# Give the chart file a name.
png(file = "line_chart.jpg")

# Plot the bar chart. 
plot(v,type = "o")



# Save the file.
dev.off()


###
v <- c(7,12,28,3,41)
t <- c(14,7,6,19,3)

# Give the chart file a name.
png(file = "line_chart_2_lines.jpg")

# Plot the bar chart.
plot(v,type = "o",col = "blue", xlab = "Month", ylab = "Rain fall", 
     main = "Rain fall chart")


# Create data for the graph.
x <- c(21, 62, 10, 53,33,44)
labels <- c("London", "New York", "Singapore", "Mumbai","a","b")

# Plot the chart.
pie(x,labels)

# Plot the chart with title and rainbow color pallet.
pie(x, labels, main = "City pie chart", col = rainbow(length(x)))


# Plot the chart.
pie(x, labels = piepercent, main = "City pie chart",col = rainbow(length(x)))

legend("topright", c("London","New York","Singapore","Mumbai"), cex = 0.4,
       fill = rainbow(length(x)))


###
install.packages("plotrix")
library(plotrix)
# Plot the chart.
pie3D(x,labels = lbl,explode = 0.1, main = "Pie Chart of Countries ")



#### bar
# Plot the bar chart 
H <- c(7,12,28,3,41)
M <- c("Mar","Apr","May","Jun","Jul")

barplot(H,names.arg=M,xlab="Month",ylab="Revenue",col="red",
        main="Revenue chart",border="black")



#####
colors = c("green","orange","brown")
months <- c("Mar","Apr","May","Jun","Jul")
regions <- c("East","West","North")

# Create the matrix of the values.
Values <- matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11), nrow = 3, ncol = 5, byrow = TRUE)

# Create the bar chart
barplot(Values, main = "total revenue", names.arg = months, xlab = "month", ylab = "revenue", col = colours)


###box 
input <- mtcars[,c('mpg','cyl')]
print(head(input))


# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")



## histogram 
# Create data for the graph.
v <-  c(9,13,21,8,36,22,12,41,31,33,19)

# Create the histogram.
hist(v,xlab = "Weight",col = "yellow",border = "blue")
