#fetch data from twitter
install.packages("twitteR")
library("twitteR")
install.packages("devtools")
library("devtools")
install.packages("SnowballC")
library("SnowballC")
install.packages("tm")
library("tm")
install.packages("syuzhet")
library("syuzhet")

consumer_key <- 'dyqqcbRL1qLFCCJN3xsPqjxUp'
consumer_secret <- 'gzG4bDMBr51AlWKlWU9MBEdbbMg8YH9TwFjkxJ9FiSt3chGeG4'
access_token <- '265838776-KnjLd1uvwvJ7bKNUUaHOS7fKb6xZ0UP08b3ZcviD'
access_secret	<- '1870oxlWjteyHkX7eUCGvVpcRIjFv1xhIZS6SkCPPGHkw'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweetdt<- userTimeline("gyandubey07",n=50)

tweetdt <- userTimeline("imVkohli", n=50)
tweetsdf <- twListToDF(tweetdt) 
setwd("C:\\Users\\vkumar15\\Desktop\\data")
write.csv(tweetsdf,"tweet.csv")

data<-read.csv("tweet.csv")
data<-data$text

sp<- c("$","@","-","\\.","\\,","#","%",":","/","+","<",">","_","!","&")
for(x in sp)
{
  data<- gsub(x,"",data)
}

words<-strsplit(data," ")
words<-unlist(words)

freq<-table(words)

barplot(freq,col = "red")
#######

sent.value <- get_sentiment(data)

write.csv(sent.value,"C:\\Users\\vkumar15\\Desktop\\data\\out.csv")


emotion.df <- get_nrc_sentiment(data)

