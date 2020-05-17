
install.packages("party")

library("party")

readingSkills

str(readingSkills)

head(readingSkills) #top 6 rows

tail(readingSkills) #buttom 6 rows 

summary(readingSkills)


#split data in two parts :train   and test 
#tain : historical , apply the model on this dataset
#test : to be predicted 

#tain data: 80%
train_data =   sample(1: nrow(readingSkills) , 0.8*nrow(readingSkills) )
test_data =   setdiff(1: nrow(readingSkills), train_data) #reject train data set

length(train_data) #80% 
length(test_data)  #20% 

train_data = readingSkills[train_data,1:4] #read all rows for 80% tain data 
test_data = readingSkills[test_data,1:4] #read all rows for 80% tain data 


#ctree(formula, data)
out= ctree(nativeSpeaker ~ age + shoeSize + score, data = train_data)


plot(out)



##
x <- c(1:10)
y <-x*2
name <- c("nitin","jatin","divya","ayush","nidhi","rahul","monika","divya","gaurav","Kshtiz")

plot(x,y)

barplot(x,y)

barplot(x,y,main="test header",xlab = "x ..", ylab = "y lab")


barplot(x,y,main="test header",xlab = "x ..", ylab = "y lab",names.arg = x)


barplot(x,y,main="test header",xlab = "x ..", ylab = "y lab",names.arg =  name)

barplot(x,y,main="test header",xlab = "x ..", ylab = "y lab",names.arg =  name,col=c("red","green"))

rainbow(length(x)) #return color code

barplot(x,y,main="test header",xlab = "x ..", ylab = "y lab",names.arg =  name,col=rainbow(length(x)))



barplot(x,y,main="test header",xlab = "x ..", ylab = "y lab",names.arg =  name,horiz = TRUE,
        col=rainbow(length(x)))



pie(x,col=rainbow(length(x)))


