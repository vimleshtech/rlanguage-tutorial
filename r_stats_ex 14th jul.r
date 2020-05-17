########mean
faithful
duration = faithful$eruptions     # the eruption durations 
mean(duration)


##The median of an observation variable is the value at the middle when the data is sorted in ascending order. It is an ordinal measure of the central location of the data values.
duration = faithful$eruptions     # the eruption durations 
median(duration)  
median(c(1,2,3,4))  


##Quartile
#There are several quartiles of an observation variable. The first quartile, or lower quartile, is the value that cuts off the first 25% of the data when it is sorted in ascending order. The second quartile, or median, is the value that cuts off the first 50%. The third quartile, or upper quartile, is the value that cuts off the first 75%.

duration = faithful$eruptions     # the eruption durations 
quantile(duration)                # apply the quantile function 


##Percentile
#The nth percentile of an observation variable is the value that cuts off the first n percent of the data values when it is sorted in ascending order.

duration = faithful$eruptions     # the eruption durations 
quantile(duration, c(.13,.17,.32, .57)) 

#Range
#The range of an observation variable is the difference of its largest and smallest data values. It is a measure of how far apart the entire data spreads in value.

duration = faithful$eruptions     # the eruption durations 
max(duration) ??? min(duration)     # apply the max and min functions 

#Interquartile Range
#The interquartile range of an observation variable is the difference of 
#its upper and lower quartiles. It is a measure of how far apart the middle portion of data spreads in value.
duration = faithful$eruptions     # the eruption durations 
#upper quartile - lower quartile 
IQR(duration)                     # apply the IQR function 

var(duration)
sd(duration)

#Variance
#The variance is a numerical measure of how the data values is dispersed around the mean. In particular, the sample variance is defined as:

duration = faithful$eruptions    # the eruption durations 
var(duration)                    # apply the var function 

#Standard Deviation
#The standard deviation of an observation variable is the square root of its variance.

#Solution
#We apply the sd function to compute the standard deviation of eruptions.

duration = faithful$eruptions    # the eruption durations 
sd(duration)                     # apply the sd function 


#Covariance
#The covariance of two variables x and y in a data set measures how the two are linearly related. A positive covariance would indicate a positive linear relationship between the variables, and a negative covariance would indicate the opposite.

duration = faithful$eruptions   # eruption durations 
waiting = faithful$waiting      # the waiting period 
cov(duration, waiting)          # apply the cov function 
#The covariance of eruption duration and waiting time is about 14. It indicates a positive linear relationship between the two variables.



#Correlation Coefficient
#The correlation coefficient of two variables in a data set equals to their covariance divided by the product of their individual standard deviations. It is a normalized measurement of how the two are linearly related.

#Formally, the sample correlation coefficient is defined by the following formula, where sx and sy are the sample standard deviations, and sxy is the sample covariance.

duration = faithful$eruptions   # eruption durations 
waiting = faithful$waiting      # the waiting period 
cor(duration, waiting)          # apply the cor function 
#The correlation coefficient of eruption duration and waiting time is 0.90081. Since it is rather close to 1, we can conclude that the variables are positively linearly related.


####
#Skewness
#The skewness of a data population is defined by the following formula, where ??2 and ??3 are the second and third central moments.

#the skewness is a measure of symmetry. As a rule, 
skewness indicates that the mean of the data values is less than the
median, and the data distribution is left-skewed. Positive skewness would 
indicate that the mean of the data values is larger than the median, 
and the data distribution is right-skewed.

install.packages("e1071")
library(e1071)                    # load e1071 
duration = faithful$eruptions     # eruption durations 
 skewness(duration)                # apply the skewness function 
#The skewness of eruption duration is -0.41355. It indicates that the eruption duration distribution is skewed towards the left.
 
 
#Kurtosis
 #The kurtosis of a univariate population is defined by the following formula, where ??2 and ??4 are respectively the second and fourth central moments.
 #the kurtosis describes the tail shape of the data distribution. The normal distribution has zero kurtosis and thus the standard tail shape. It is said to be mesokurtic. Negative kurtosis would indicate a thin-tailed data distribution, and is said to be platykurtic. Positive kurtosis would indicate a fat-tailed distribution, and is said to be leptokurtic.
 
 library(e1071)                    # load e1071 
 duration = faithful$eruptions     # eruption durations 
 kurtosis(duration)                # apply the kurtosis function 
 #The kurtosis of eruption duration is -1.5116, which indicates that eruption duration distribution is platykurtic. This is consistent with the fact that its histogram is not bell-shaped.
 
 ###
 Steps to Establish a Regression
 A simple example of regression is predicting weight of a person when his height is known. To do this we need to have the relationship between height and weight of a person.
 
 The steps to create the relationship is ???
 
 Carry out the experiment of gathering a sample of observed values of height and corresponding weight.
 
 Create a relationship model using the lm() functions in R.
 
 Find the coefficients from the model created and create the mathematical equation using these
 
 Get a summary of the relationship model to know the average error in prediction. Also called residuals.
 
 To predict the weight of new persons, use the predict() function in R.
 
 
 
 x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
 y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
 
 # Apply the lm() function.
 relation <- lm(y~x)
 
 print(summary(relation))
 
 
 # Find weight of a person with height 170.
 a <- data.frame(x = 170)
 result <-  predict(relation,a)
 print(result)
 
 # Plot the chart.
 plot(y,x,col = "blue",main = "Height & Weight Regression",
      abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")
 
 
 ###################
 input <- mtcars[,c("mpg","disp","hp","wt")]
 
 # Create the relationship model.
 model <- lm(mpg~disp+hp+wt,data=input)
 
 # Show the model.
 print(model)
 
 # Get the Intercept and coefficients as vector elements.
 cat("# # # # The Coefficient Values # # # ","\n")
 
 a <- coef(model)[1]
 print(a)
 
 Xdisp <- coef(model)[2]
 Xhp <- coef(model)[3]
 Xwt <- coef(model)[4]
 
 print(Xdisp)
 print(Xhp)
 print(Xwt)
 
 
 ##The Logistic Regression is a regression model in which the response variable (dependent variable) has categorical values such as True/False or 0/1. It actually measures the probability of a binary response as the value of response variable based on the mathematical equation relating it with the predictor variables.
 
 
 input <- mtcars[,c("am","cyl","hp","wt")]
 print(head(input))
 am.data = glm(formula = am ~ cyl + hp + wt, data = input, family = binomial)
 
 print(summary(am.data))
 
 
 
 
 
 In statistics, the correlation coefficient r measures the strength and direction of a linear relationship between two variables on a scatterplot. The value of r is always between +1 and -1. To interpret its value, see which of the following values your correlation r is closest to:
   
   Exactly -1. A perfect downhill (negative) linear relationship
 
 -0.70. A strong downhill (negative) linear relationship
 
 -0.50. A moderate downhill (negative) relationship
 
 -0.30. A weak downhill (negative) linear relationship
 
 0. No linear relationship
 
 +0.30. A weak uphill (positive) linear relationship
 
 +0.50. A moderate uphill (positive) relationship
 
 +0.70. A strong uphill (positive) linear relationship
 
 Exactly +1. A perfect uphill (positive) linear relationship
 
 
 
 
 
 hours <- c(6,7,8,9,11)
 score <- c(60,62,65,72,81)
rel <- lm(score~hours)
 
ned <- data.frame(hours=c(12,14))
predict(rel,newdata = ned)

###

cc <- c(1200,1300,1500,1600,2000)
mil <- c(20,19,18,16,12)
w <- c(1100,1250,1550,1700,2200)

barplot(cc,mil)

rel <- lm(mil~cc+w)

data<-read.csv("C:\\Users\\vkumar15\\Desktop\\data\\cancer.csv")
 <-data$smoothness_mean
quantile(smooth)

05263 0.08637 0.09587 0.10530 0.16340

quantile(smooth,c(.5))
max(smooth)
median(smooth)
mean(smooth)
IQR(smooth)
14.99
13.50
13.33
13.59

11.19
12.90
14.35
16.38
var(smooth)
sd(smooth)
data$radius_mean
cov(data$radius_mean,data$smoothness_mean)
cor(data$radius_mean,data$smoothness_mean)
skewness(smooth)
linearmodel <-lm(smooth~data$radius_mean)
                                                                                              mean(smooth)
multiplemodel <-