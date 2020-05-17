#pos.words <- scan("pve.csv",what = 'character')
#neg.words <- scan("nve.csv",what = 'character')
#pos.words,
#neg.words,
pos.words = c( "new","nice" ,"good", "horizon")
neg.words = c( "wtf", "behind","feels", "ugly", "back","worse" , 
"shitty", "bad", "no","freaking","sucks","horrible")



score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
  require(plyr)
  require(stringr)
  
  # we got a vector of sentences. plyr will handle a list
  # or a vector as an "l" for us
  # we want a simple array ("a") of scores back, so we use 
  # "l" + "a" + "ply" = "laply":
  
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    # clean up sentences with R's regex-driven global substitute, gsub():
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    # and convert to lower case:
    sentence = tolower(sentence)
    
    # split into words. str_split is in the stringr package
    word.list = str_split(sentence, '\\s+')
    # sometimes a list() is one level of hierarchy too much
    words = unlist(word.list)
    
    # compare our words to the dictionaries of positive & negative terms
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    
    # match() returns the position of the matched term or NA
    # we just want a TRUE/FALSE:
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    
    # and conveniently enough, TRUE/FALSE will be treated as 1/0 by sum():
    score = sum(pos.matches) - sum(neg.matches)
    
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}

#  Install Requried Packages
installed.packages("SnowballC")
installed.packages("tm")
installed.packages("twitteR")
installed.packages("syuzhet")

# Load Requried Packages
library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")

##


consumer_key <- 'dyqqcbRL1qLFCCJN3xsPqjxUp'
consumer_secret <- 'gzG4bDMBr51AlWKlWU9MBEdbbMg8YH9TwFjkxJ9FiSt3chGeG4'
access_token <- '265838776-KnjLd1uvwvJ7bKNUUaHOS7fKb6xZ0UP08b3ZcviD'
access_secret	<- '1870oxlWjteyHkX7eUCGvVpcRIjFv1xhIZS6SkCPPGHkw'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweets <- userTimeline("realDonaldTrump", n=200)

n.tweet <- length(tweets)

##Cleaning the tweets for further analysis
tweets.df <- twListToDF(tweets) 
head(tweets.df)

head(tweets.df$text)

ving hashtag , urls and other special charactersR
tweets.df2 <- gsub("http.*","",tweets.df$text)

tweets.df2 <- gsub("https.*","",tweets.df2)

tweets.df2 <- gsub("#.*","",tweets.df2)

tweets.df2 <- gsub("@.*","",tweets.df2)
##
tweets.df2 <- gsub("http.*","",tweets.df$text)

tweets.df2 <- gsub("https.*","",tweets.df2)

tweets.df2 <- gsub("#.*","",tweets.df2)

tweets.df2 <- gsub("@.*","",tweets.df2)

#
head(tweets.df2)

#Getting sentiment score for each tweet
word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)

emotion.df2 <- cbind(tweets.df2, emotion.df) 

head(emotion.df2)


##POSITIVE 
sent.value <- get_sentiment(word.df)

most.positive <- word.df[sent.value == max(sent.value)]

most.positive


#NEGATIVE

most.negative <- word.df[sent.value <= min(sent.value)] 
most.negative 

#Segregating positive and negative tweets
positive.tweets <- word.df[sent.value > 0]
head(positive.tweets)

negative.tweets <- word.df[sent.value < 0] 
head(negative.tweets)
     
neutral.tweets <- word.df[sent.value == 0] 
head(neutral.tweets)


# Alternate way to classify as Positive, Negative or Neutral tweets

category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0, "Positive", "Neutral"))

table(category_senti)



############time series forecasting
data(AirPassengers)
class(AirPassengers)

start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)

summary(AirPassengers)

#Detailed Metrics
#The number of passengers are distributed across the spectrum
plot(AirPassengers)
#This will plot the time series
abline(reg=lm(AirPassengers~time(AirPassengers)))
# This will fit in a line


cycle(AirPassengers)
#This will print the cycle across years.
plot(aggregate(AirPassengers,FUN=mean))
#This will aggregate the cycles and display a year on year trend
boxplot(AirPassengers~cycle(AirPassengers))
#Box plot across months will give us a sense on seasonal effect

#Important Inferences
#The year on year trend clearly shows that the #passengers have been increasing without fail.
#The variance and the mean value in July and August is much higher than rest of the months.
#Even though the mean value of each month is quite different their variance is small. Hence, we have strong seasonal effect with a cycle of 12 months or less.
#Exploring data becomes most important in a time series model - without this exploration, you will not know whether a series is stationary or not. As in this case we already know many details about the kind of model we are looking out for.




###survival analysis
hmohiv<-read.table("https://stats.idre.ucla.edu/stat/r/examples/asa/hmohiv.csv", sep=",", header = TRUE) 

install.packages(c("survival", "survminer"))

library("survival")
library("survminer")


data("lung")
head(lung)

fit <- survfit(Surv(time, status) ~ sex, data = lung)
print(fit)

# Summary of survival curves
summary(fit)
# Access to the sort summary table
summary(fit)$table




d <- data.frame(time = fit$time,
                n.risk = fit$n.risk,
                n.event = fit$n.event,
                n.censor = fit$n.censor,
                surv = fit$surv,
                upper = fit$upper,
                lower = fit$lower
)
head(d)



# Change color, linetype by strata, risk.table color by strata
ggsurvplot(fit,
           pval = TRUE, conf.int = TRUE,
           risk.table = TRUE, # Add risk table
           risk.table.col = "strata", # Change risk table color by groups
           linetype = "strata", # Change line type by groups
           surv.median.line = "hv", # Specify median survival
           ggtheme = theme_bw(), # Change ggplot2 theme
           palette = c("#E7B800", "#2E9FDF"))




summary(fit)$table


##
#n R, we have lm() function for linear regression while nonlinear regression is supported by nls() function which is an abbreviation for nonlinear least squares function. To apply nonlinear regression, it is very important to know the relationship between the variables

xvalues <- c(1.6,2.1,2,2.23,3.71,3.25,3.4,3.86,1.19,2.21)
yvalues <- c(5.19,7.43,6.94,8.11,18.75,14.88,16.06,19.12,3.21,7.58)

# Give the chart file a name.
png(file = "nls.png")


# Plot these values.
plot(xvalues,yvalues)


# Take the assumed values and fit into the model.
model <- nls(yvalues ~ b1*xvalues^2+b2,start = list(b1 = 1,b2 = 3))

# Plot the chart with new data by fitting it to a prediction from 100 data points.
new.data <- data.frame(xvalues = seq(min(xvalues),max(xvalues),len = 100))
lines(new.data$xvalues,predict(model,newdata = new.data))

# Save the file.
dev.off()

# Get the sum of the squared residuals.
print(sum(resid(model)^2))

# Get the confidence intervals on the chosen values of the coefficients.
print(confint(model))

#We can conclude that the value of b1 is more close to 1 while the value of b2 is more close to 2 and not 3.


##It creates randomized samples of the data set (just like random forest) and grows trees on a different sample of the original data. The remaining 1/3 of the sample is used to estimate unbiased OOB error. It considers all the features at a node (for splitting).
########

# Data Source: https://archive.ics.uci.edu/ml/machine-learning-databases/car/

install.packages("randomForest")
library(randomForest)

# Load the dataset and explore
data1 <- read.csv(file.choose(), header = TRUE)

head(data1)

str(data1)

summary(data1)



# Split into Train and Validation sets
# Training Set : Validation Set = 70 : 30 (random)
set.seed(100)
train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
TrainSet <- data1[train,]
ValidSet <- data1[-train,]
summary(TrainSet)
summary(ValidSet)


summary(TrainSet)
summary(ValidSet)

# Create a Random Forest model with default parameters
model1 <- randomForest(Condition ~ ., data = TrainSet, importance = TRUE)
model1

#By default, number of trees is 500 and number of variables tried at each split is 2 in this case. Error rate is 3.6%.

# Fine tuning parameters of Random Forest model
model2 <- randomForest(Condition ~ ., data = TrainSet, ntree = 500, mtry = 6, importance = TRUE)
model2


When we have increased the mtry to 6 from 2, error rate has reduced from 3.6% to 2.32%. We will now predict on the train dataset first and then predict on validation dataset.


# Predicting on train set
predTrain <- predict(model2, TrainSet, type = "class")
# Checking classification accuracy
table(predTrain, TrainSet$Condition) 

table(predTrain, TrainSet$Condition)


# Predicting on Validation set
predValid <- predict(model2, ValidSet, type = "class")
# Checking classification accuracy
mean(predValid == ValidSet$Condition)                    
table(predValid,ValidSet$Condition)


mean(predValid == ValidSet$Condition)                    
[1] 0.9884393
> table(predValid,ValidSet$Condition)


In case of prediction on train dataset, there is zero misclassification; however, in the case of validation dataset, 6 data points are misclassified and accuracy is 98.84%. We can also use function to check important variables. The below functions show the drop in mean accuracy for each of the variables.

1
2
3
# To check important variables
importance(model2)        
varImpPlot(model2)        

 importance(model2) 
 
 varImpPlot(model2)
 

 # Using For loop to identify the right mtry for model
 a=c()
 i=5
 for (i in 3:8) {
   model3 <- randomForest(Condition ~ ., data = TrainSet, ntree = 500, mtry = i, importance = TRUE)
   predValid <- predict(model3, ValidSet, type = "class")
   a[i-2] = mean(predValid == ValidSet$Condition)
 }
 
 a
 
 plot(3:8,a)
 