###pie chart example 
expenditure<-c("Housing","Food","Cloths","Entertainment","Other")
amount<-c(600,300,150,100,200)

##x,y

#example -1
pie(amount,expenditure)


#example -2
pie(amount,
    labels=as.character(expenditure),
    main="Monthly Expenditure Breakdown",
    col=c("red","orange","yellow","blue","green"),
    border="black",
    radius = 1.3,
    clockwise=TRUE
)


## barplot
max.temp <- c(22, 27, 26, 24, 23, 26, 28)
barplot(max.temp)

barplot(max.temp,
        main = "Maximum Temperatures in a Week",
        xlab = "Degree Celsius",
        ylab = "Day",
        names.arg = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
        col =c("red","orange","yellow","blue","green","red","red"),
        horiz = FALSE
        )



##categorize or group by data 
age <- c(17,18,18,17,18,19,18,16,18,18)
table(age)


barplot(table(age),
        main="Age Count of 10 Students",
        xlab="Age",
        ylab="Count",
        border="red",
        col="blue"
        
)


##example -3
Titanic
margin.table(Titanic,1)  # count according to class
margin.table(Titanic,2)  # count according to survival
margin.table(Titanic)  # gives total count if index is not provided

barplot(margin.table(Titanic,1))



###BOX plot
airquality #dataframe
str(airquality)

boxplot(airquality$Temp)


## example  -
boxplot(airquality$Temp,
        main = "Mean ozone in parts per billion at Roosevelt Island",
        xlab = "Parts Per Billion",
        ylab = "Ozone",
        col = "orange",
        border = "brown",
        horizontal = FALSE,
        notch = TRUE
)

##EXAMPLE -2
boxplot(airquality$Ozone,airquality$Temp,airquality$Day,
        main = "Multiple boxplots for comparision",
        names = c("ozone", "normal", "temp"),
        las = 2,
        col = c("orange","red"),
        border = "brown",
        horizontal = FALSE,
        notch = TRUE,
        xlab="test"
)

#example no. 4
boxplot(airquality$Temp~airquality$Ozone,
        data=airquality,
        main="Different boxplots for each month",
        xlab="Month Number",
        ylab="Degree Fahrenheit",
        col="orange",
        border="brown"
)



#### histogram
str(airquality)
Temperature <- airquality$Temp

hist(Temperature)


##
# histogram with added parameters
hist(Temperature,
     main="Maximum daily temperature at La Guardia Airport",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     col="green",
     freq=TRUE
)

##with text label 
h <- hist(Temperature,ylim=c(0,40),col="darkmagenta")

text(h$mids,h$counts,labels=h$counts, adj=c(0.1, -0.1))

#non -uniform width
hist(Temperature,
     main="Maximum daily temperature at La Guardia Airport",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     
     col="chocolate",
     border="brown",
     breaks=c(55,60,70,75,80,100)
)

### line chart
# dummy data
set.seed(45)
df <- data.frame(x=rep(1:5, 9), val=sample(1:100, 45), 
                 variable=rep(paste0("category", 1:9), each=5))

str(df)
##install.package(ggplot)
library(ggplot2)
# plot
ggplot(data = df, aes(x=x, y=val)) + geom_line(aes(colour=variable))


##

# Create the data for the chart.
v <- c(7,12,28,3,41)
t <- c(14,7,6,19,3)


# Plot the bar chart.
plot(v,type = "o",col = "red", xlab = "Month", ylab = "Rain fall", 
     main = "Rain fall chart")

lines(t, type = "o", col = "blue")


##rainbow 
plot(0,0,xlim = c(-10,10),ylim = c(-10,10),type = "n")

cl <- rainbow(5)

for (i in 1:5){
  lines(-10:10,runif(21,-10,10),col = cl[i],type = 'b')
}


## scatter 
# Get the input values.
input <- mtcars[,c('wt','mpg')]
str(input)

# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15 and 30.
plot(x = input$wt,y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(2.5,5),
     ylim = c(15,30),		 
     main = "Weight vs Milage",
     breaks=c(1.1,2.1)
)


##
# Plot the matrices between 4 variables giving 12 plots.

# One variable with 3 others and total 4 variables.

pairs(~wt+mpg+disp+cyl,data = mtcars,
      main = "Scatterplot Matrix")

