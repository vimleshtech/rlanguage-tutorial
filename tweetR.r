install.packages("twitteR")
install.packages(c("devtools", "rjson", "bit64", "httr"))
install.packages("SnowballC")
install.packages("tm")
install.packages("syuzhet")

library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")
library(devtools)                 


consumer_key <- 'yBrWeERMyvyg0XtBxOgTkcnY7'
consumer_secret <- 'fkdu59y8QmqBMae4WBY3ndqKs8SGW02y6dBk9siQVTw00LVKBC'
access_token <- '919434545924935681-pm4kjsZhklseLCEIiQk9znOTGAcxMRE'
access_secret <- 'GS1Mf8opgNeGhQtLalJnvzu9y0eBotCddgAJAG796Gtnj'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweetdt <- userTimeline("realDonaldTrump", n=20)

tweets.df <- twListToDF(tweetdt) 

write.csv(tweets.df,"C:\\Users\\vkumar15\\Desktop\\tweet.csv")

head(tweets.df)

####decision tree
install.packages("party")
library("party")

print(head(readingSkills))
str(readingSkills)

input.dat <- readingSkills[c(1:105),]

output.tree <- ctree(nativeSpeaker ~ age + shoeSize + score,data = input.dat)

plot(output.tree)


##survival 
install.packages("survival")
library("survival")

print(head(pbc))

str(pbc)


survfit(Surv(pbc$time,pbc$status == 2)~1)


plot(survfit(Surv(pbc$time,pbc$status == 2)~1))

##Chi Square Test
library("MASS")
print(str(Cars93))

car.data <- data.frame(Cars93$AirBags, Cars93$Type)
car.data = table(Cars93$AirBags, Cars93$Type) 


print(chisq.test(car.data))


#positive
#negetive
#netural


#most.negative 
#most.positive
#total  - (most.positive+most.negative  )

## convert tweetdf to words 
#
head(tweets.df$text)
#tweets.df2 <- gsub("http.*","",tweets.df$text)
#tweets.df2 <- gsub("https.*","",tweets.df2)
#tweets.df2 <- gsub("#.*","",tweets.df2)
#
tweets.df2 <- gsub("@.*","",tweets.df2)
word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)
emotion.df2 <- cbind(tweets.df2, emotion.df) 
head(emotion.df2)

sent.value <- get_sentiment(word.df)
most.positive <- word.df[sent.value == max(sent.value)]
most.positive

most.negative <- word.df[sent.value <= min(sent.value)] 
most.negative 

positive.tweets <- word.df[sent.value > 0]
head(positive.tweets)


negative.tweets <- word.df[sent.value < 0]
head(negative.tweets)

neu.tweets <- word.df[sent.value == 0]
head(neu.tweets)


