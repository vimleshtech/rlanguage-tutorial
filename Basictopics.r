## repeat 
x <- 1

repeat {
  print(x)
  x = x+1
  if (x == 6){
    break
  }
}


##### Recursive function 


# Recursive Functions in R Example
factorial <- function(number)
{

  if(number == 0 || number == 1) {
    
    return (1)
    
  } else {
    
    return (number *  factorial(number - 1) )
    
  }
  
}

factorial(5)

#### loop 
i =1
number =6
fact = 1

while (i<=number){
  
  fact = fact*i
  i =i+1
}

print(fact)



fn ="RAman"
ln ="siinha"

paste(fn,ln)
paste(fn,ln,sep = "")
name = paste(fn,ln,sep = ",")

toupper(name)
tolower(name)

substring (name,1,2)   # cut 

nchar(name)  # return length of chars/string

v <- c(111,2,23,3)
length(v)     # return length of vector 


### string handling
#substr(x, start=n1, stop=n2)
ts="abcde"
substring(ts,1,1) # What is the first character in ts?

a = substring(ts,1,1)="X" # Change the first character to "X"

## no. of char
nchar(ts) # Number of characters in ts

## length
length(ts) # Length of the vector ts


####
tolower("ABCDE")

###
toupper("abcde")

##paste
paste(GENETIC_CODE[lam60.triplets],collapse="")



grep(pattern,x, value=FALSE, ignore.case=FALSE, fixed=FALSE)

gsub(pattern, replacement, x, ignore.case=FALSE, fixed=FALSE)
gregexpr(pattern, text, ignore.case=FALSE, perl=FALSE,
         fixed=FALSE)
strsplit(x, split)
paste(., sep="", collapse=NULL)
sprintf(fmt, .)
toupper/tolower(x)
nchar(x)
