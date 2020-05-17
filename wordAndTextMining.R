
setwd("C:\\Users\\vkumar15\\Desktop")

n =2

freq <- c()

readdata <- function(){
      
      data = readChar("words.txt", file.info("words.txt")$size)
      
      sc <- c(",",";","|","$","\r","\n",".")
      for(x in sc){
        data = gsub(x," ",data ,fixed = TRUE )
        
      }
      words = unlist(strsplit(data, " "))
      uq = unique(words)
      
      for(x in uq){
        
            c = 0
            for(w in words){
              
              if(x == w){
                c=c+1
              }
            }  
            
            print(paste(x,c))
            freq = append(freq,c)
            #print(freq)
            print(max(freq))
            print(min(freq))
            print(max(freq)/n)
      }
}



####
data = 
1,sjhsjk,male,slkhjhsjs
1,sjhsjk,male,slkhjhsjs
1,sjhsjk,male,slkhjhsjs
1,sjhsjk,male,slkhjhsjs
1,sjhsjk,male,slkhjhsjs
1,sjhsjk,male,slkhjhsjs


for(x in data){
  
  sc <- c(";","|")
  
  for(s in sc){
    x = gsub(s,",",x ,fixed = TRUE )
  }
  x = unlist(strsplit(x, ",")) 
  rbind...
  
}


data<- c("a,b,c","x,y,x")

for(x in data){
  
  x = unlist(strsplit(x, ",")) 
  print(x[1])
  
}




