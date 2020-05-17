
#install.packages("party")

library("party")

readingSkills 

str(readingSkills )


getwd()
setwd("C:\\Users\\vkumar15\\Documents\\Training\\Training\\R Language\\")

write.csv(readingSkills,"reading.csv")






##
#ctree(y~x1+x2+x2)
input.dat <- readingSkills[c(1:105),]

c(1:105)

readingSkills[4:10,1:2]
readingSkills[4:10,] #selected rows and all columns/vector



out <- ctree(nativeSpeaker~age+shoeSize+score,data=input.dat)

out

plot(out)


################## Text Classification   #####
comments <- "this is test comment. R language is open source language"

#split #break the data by space(word by word)
x = strsplit(comments," ")

y = table(x)

plot(y)

####
getwd()


#####  get freq of all data and show in bar format 
testFile[1]

table(testFile)
x = strsplit(testFile)



















