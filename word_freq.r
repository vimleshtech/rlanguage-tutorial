
#set working/current directory 
setwd('C:\\Users\\vkumar15\\Desktop')
getwd() # get current directory 

#scan( ) : is function which read data from file 
#character : datatype is char 
#sep : \n (new line)
sentences <- scan("testdata.txt","character",sep="\n");

#Replace full stop and comma
#remove the char 
sentences<-gsub("\\.","",sentences)
sentences<-gsub("\\,","",sentences)

#Split sentence
words<-strsplit(sentences," ")

#Calculate word frequencies
words = unlist(words)

words.freq<- table(words);


cbind(names(words.freq),as.integer(words.freq))

  
barplot(words.freq,col="green")
words$freq



words<- c("will","freedom","ring","day","dream","let","every","able","together")  
freq <- c(17,13,12,11,11,11,11,9,8,7)

#scale: Indicates the range of sizes of the words.
#max.words: Plots the specified number of words and discard least frequent terms.]
#min.freq: Discards all terms whose frequency is below the specified value.
#random.order: By setting this to false, we make it so that the words with the highest frequency are plotted first. If we don't set this, it will plot the words in a random order and the highest frequency words may not necessarily appear in the center.
#rot.per: Determines the fraction of words that are plotted vertically.
#colors: The default value is black. If you want to use different colors based on frequency, you can specify a vector of colors or use one of the pre-defined color palettes.

# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


set.seed(1234)

wordcloud(words = words, freq = freq, min.freq = 2,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


barplot(words,freq)


####

