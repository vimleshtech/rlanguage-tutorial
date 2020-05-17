
x <-c(11,22,33,44,55)
x_name <-c ("A","B","C","D","E")
y <- x*2

#scatter
plot(x,y)


#bar/column 
barplot(x,y)
#bar with column/x name 
barplot(x,y,names.arg = x_name)


#bar chart with color 
#return color code *html code 
rainbow(length(x))
barplot(x,y,names.arg = x_name,col=rainbow(length(x)),main = "Header")

barplot(x,y,names.arg = x_name,col=rainbow(length(x)),main = "Header",legend.text = x_name)

barplot(x,y,names.arg = x_name,col=c("red","green","black","red","pink"))


barplot(x,y,names.arg = x_name,col=c("red","green","black","red","pink"),horiz = TRUE)


#piechart
pie(x,y)
pie(x,y,col=rainbow(length(x)))

pie(x,y, col=rainbow(length(x)))
    
pie(x,y, col=rainbow(length(x)),clockwise = TRUE)

pie(x,y, col=rainbow(length(x)),clockwise = FALSE)


pie(x,y, col=rainbow(length(x)),clockwise = TRUE,,main = "Header",labels = x_name )


max(x)
sum(x)

pct <- c(10.0,20.0,30.0,10.0,30.0)

lbls <- paste(x_name, pct) # add percents to labels 
lbls <- paste(x,"%",sep="") # ad % to labels 

pie(x,y,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")



#


pct <- round(x/sum(x)*100)
lbls <- paste(x_name, pct) # add percents to labels 
lbls <- paste(x,"%",sep="") # ad % to labels 

pie(x,y,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")



##3d
install.packages("plotrix")
library("plotrix")

pie3D(x,labels=lbls,explode=0.2,
      main="Pie Chart of Countries ")




                  
##Stacked Bar Plot 
count <- c("indida","us","aus")
v1 <- c(1,2,4) #male 
v2 <- c(11,5,6) #female 

data = data.frame(count,v1,v2)


data = as.matrix(data.frame(data$v1,data$v2))

y = v1*2

barplot(data,y)


#
mtcars
str(mtcars)

mtcars$vs
mtcars$gear

table(mtcars$vs) #group by default function is count

table(mtcars$gear) #group by default function is count

counts <- table(mtcars$vs, mtcars$gear)

barplot(counts,col=rainbow(3),  xlab="Number of Gears",
        ylab = "test y",main = "title",
        legend = rownames(counts)
        ) #how to pass dynamic count in rainbow 



##group Bar Plot 

barplot(counts,col=rainbow(3),  xlab="Number of Gears",
        ylab = "test y",main = "title",
        legend = rownames(counts),beside = TRUE
) #how to pass dynamic count in rainbow 


#
str(mtcars)
mpg = mtcars$mpg
cyl = mtcars$cyl

boxplot(mpg~cyl)
boxplot(mpg~cyl)


installed.packages()





#
line(x,y)

plot(x,y,type = 'line')





plot(mtcars$wt, mtcars$mpg, main="Scatterplot Example")

housetask = read.delim(file.choose(),row.names = 1)

library(MASS)
survey
View(survey)
summary(survey)
a = edit(survey)
summary(a)
tbl= table(a$Smoke,survey$Exer)
chisq.test(tbl)

ctbl = cbind(tbl[,"Freq"], tbl[,"None"] + tbl[,"Some"]) 
chisq.test(ctbl)

b = edit(survey)


