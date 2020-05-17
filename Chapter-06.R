#break   : to stop the loop 
a = c(1:20)

#for : is iterator which repeat the number from first to last one by one
#break   : to stop the loop 
for(x in a){
  if (x%%3 ==0)
  {
    break #stop the loop 
  }
  print(x)
}



#next: skip the current iteration and resume from next 
for(x in a){
  if (x%%3 ==0)
  {
    next #resume from next
  }
  print(x)
}

#repeat  : run or repeat the code till condition will bot be false
i  =1
repeat{
  
  i = i*2
  print(i)
  if(i>100){
    break
  }
}
#switch example
switch(4,"mon","tue","wed","thu","fri","sat","sun")

#key and value 
switch("color", "color" = "red", "shape" = "square", "length" = 5)
switch("length", "color" = "red", "shape" = "square", "length" = 5)

##string handling
paste("a","b")
paste("a","b",sep="")
paste("a","b",sep=",")

split("ab cd"," ")

 format(23.123456789, digits = 4)
name ="raman SInha"

toupper(name)
tolower(name)

substring("abcde", 2, 5)



##print given no in reverse order
123
321


a =123
b = a%/%100
c = (a - (b*100)) %/%10
d = a%%10
print( paste(d, c, b))




#Vector : one type data 
v = c(11,222,333,444,"f")
v = c("s","ff",233)
typeof(v)

#list  : mix data type
a = list(111,222,33,"fjfjf",v,c(111,222,443))
a[5]

#array : multiple dimenssion 
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

# Take these vectors as input to the array.
result <- array(c(vector1,vector2),dim = c(3,3,2))
print(result)

#R - Factors : convert to label data
gen =c("male","female","male","female","female")
as.factor(gen)



