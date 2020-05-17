######################
#PIE 
######################
x <- c(21, 62, 10, 53,33)
labels <- c("London", "New York", "Singapore", "Mumbai")

pie(x)
pie(x,labels)
pie(x,labels,main="Country wise temp.", col = rainbow(length(x)))

pie(x,labels,main="Country wise temp.", col = rainbow(length(x)),clockwise = TRUE)

pie(x,labels,main="Country wise temp.", col = rainbow(length(x)),clockwise = FALSE)

pie(x,labels,main="Country wise temp.", col = rainbow(length(x)))
legend("topright", c("London","New York","Singapore","Mumbai"), cex = 0.9,
       fill = rainbow(length(x)))


######################
######################
H <- c(7,12,28,3,41)
M <- c("Mar","Apr","May","Jun","Jul")

barplot(H)
barplot(H,names.arg =  M)
barplot(H,names.arg =  M,   xlab = "MONTH")
barplot(H,names.arg =  M,   xlab = "MONTH",ylab = "height")
barplot(H,names.arg =  M,   xlab = "MONTH",ylab = "height",main="temp. and month")

barplot(H,names.arg =  M,   xlab = "MONTH",ylab = "height",main="temp. and month",
        col=rainbow(length(H)))



barplot(H,names.arg =  M,   xlab = "MONTH",ylab = "height",main="temp. and month",
        col=c("red","green","red","blue","yellow"))

data =read.csv("C:\\Users\\vkumar15\\Desktop\\sample.csv")

x =data$Customer.ID


str(data)
head(data)

a= head(data$Customer.ID)


dd <- c()
for(x in s){
  
  o=strsplit(x,"-")[[1]]
  oo = as.numeric(o[2])
  #print(oo)
  dd = append(dd,oo)
  
  #o =strsplit(x,"-")
  #print(o[2])

}


barplot(o)

p = data$Profit[1:5]

p = data$Profit[1:3]
pie(p)


pie(a)
barplot(p)


q= head(data$City)

pie(q)
matrix(q)
barplot(q)

######
[1] "abcd" "xyx" 
> d = strsplit(a," ")[[1]]
> d
[1] "abcd" "xyx" 
> d[1]
