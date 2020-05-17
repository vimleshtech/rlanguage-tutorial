
a = c(1,2,3,4,5)
a = c(1,2,3,4,5,6)

max(a)
min(a)
sum(a)
#vari
var(a)

#standard dev.
sd(a)

#avg 
mean(a)

median(a)
###
mode(a)

##quantile : 0% 25% 50% 75% 100%
quantile(a)

#pecentile 
quantile(a,c(.13,.23,.45,.49,.67,.89,.97))



## R - Linear Regression 
## relation between two varibales :
## one dependent and one independent 
##  lm(y~x)

height <- c(178,145,156,164,170)
weight <- c(78,45,56,60,70)

rel<-lm(weight ~height)

mydata <- data.frame(height=c(130,190))

predict(rel,newdata = mydata)

###R - Multiple Regression
## y~x1+x2+x3 ... multiple input and one output 


height <- c(178,145,156,164,170)
weight <- c(78,45,56,60,70)
age <- c(29,22,25,31,37)


rel<-lm(weight ~height+age)


####R - Logistic Regression
## GLM : general regression model 


##
mtcars
str(mtcars)


input <- mtcars[,c("mpg","disp","hp","wt")]
print(head(input))

input <- mtcars[,c("mpg","disp","hp","wt")]

# Create the relationship model.
model <- lm(mpg~disp+hp+wt, data = input)

###
hours  score 
4      30
6      50
8      78


hours<- c(1,3,5,7,9)
score<- c(30,45,75,85,95)
rel<-lm(score ~ hours)
barplot(hours,score,
        col= "green",
        xlab="hours",
        ylab = "score"        )
abc <-data.frame(hours=c(4,10))
predict(rel,newdata = abc)

