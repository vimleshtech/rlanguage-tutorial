##ETL: Extract transformation load
##Extract : data source (from which source we can upload the data such as  csv,exce, database etc.)
##Transfomation: conversation/apply your desire logic
##Load : destination (show output/visualiation or save output in desired format such as pdf,image etc.)
#######################################################

###get current working director or folder location 
getwd()

#change default location 
setwd("C:\\Users\\vkumar15\\Desktop")

## csv file : read  with header
read.csv("emp.csv")  #read data with header 


#read with header 
X = read.csv("emp.csv",header = TRUE)


#read without hreader
d = read.csv("emp.csv",header = FALSE)


#write to file
write.csv(d,"newcopy.csv")

#read a column 
d$V1


###### read from excel
#install the required package 
install.packages("xlsx")  #only one time required on every system

#load the package 
library(xlsx)

#here sheet number means : read from 1st worksheet
dd = read.xlsx("OGS Primary Secondry Skill EmployeeDetails- 17Dec2019 EIS.xlsx",sheetIndex = 1)

read.xlsx("OGS Primary Secondry Skill EmployeeDetails- 17Dec2019 EIS.xlsx",startRow = 3,endRow = 10,sheetName = "testsheet")


write.xlsx(dd,"newexcelfile.xlsx")


##read from file (.txt, .binary file)
data= read.table("fruits_data.txt")
data= read.table("fruits_data.txt",header = FALSE)

data$V1
write.table(data,"path.txt")


### SQL : Structural query language 
#   MY SQL Server : Read data from database server 
## commands: show databases; use database; select * from tablename;
install.packages("RMySQL")

library(RMySQL)


mydb = dbConnect(MySQL(), user='root', password='root', dbname='hrms', host='localhost')
#show lis to tables
dbListTables(mydb)

#show list of column in a table
dbListFields(mydb, 'product')


#get data 
rs = dbSendQuery(mydb, "select * from product")

x= fetch(rs,n=-1) # -1 read all data 

x$pid





##
# Create a connection object to read the file in binary mode using "rb".
read.filename <- file("c:\\abc\\binmtcars.dat", "rb")

# First read the column names. n = 3 as we have 3 columns.
column.names <- readBin(read.filename, character(),  n = 3)

# Next read the column values. n = 18 as we have 3 column names and 15 values.
read.filename <- file("/web/com/binmtcars.dat", "rb")
bindata <- readBin(read.filename, integer(),  n = 18)

# Print the data.
print(bindata)

# Read the values from 4th byte to 8th byte which represents "cyl".
cyldata = bindata[4:8]
print(cyldata)

# Read the values form 9th byte to 13th byte which represents "am".
amdata = bindata[9:13]
print(amdata)

# Read the values form 9th byte to 13th byte which represents "gear".
geardata = bindata[14:18]
print(geardata)

# Combine all the read values to a dat frame.
finaldata = cbind(cyldata, amdata, geardata)
colnames(finaldata) = column.names
print(finaldata)



#############################
install.packages("XML") #extensiable 

# Load the package required to read XML files.
library("XML")

# Also load the other required package.
library("methods")

# Convert the input xml file to a data frame.
xmldataframe <- xmlToDataFrame("emp.xml")

print(xmldataframe)

###############json
install.packages("rjson")

#Input Data
#Create a JSON file by copying the below data into a text editor like notepad. Save the file with a .json extension and choosing the file type as all files(*.*).

# Load the package required to read JSON files.
library("rjson")

# Give the input file name to the function.
result <- fromJSON(file = "emp.json")

# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)

print(json_data_frame)


### web 
install.packages("RCurl")
install.packages("XML")
install.packages("stringr")
install.packages("plyr")

library(RCurl)
library(stringr)
library(plyr)

# Read the URL.
url <- "https://www.geos.ed.ac.uk/~weather/jcmb_ws/"

# Gather the html links present in the webpage.
links <- getHTMLLinks(url)
  

# Identify only the links which point to the JCMB 2015 files. 
filenames <- links[str_detect(links, "JCMB_2015")]

# Store the file names as a list.
filenames_list <- as.list(filenames)

# Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
  filedetails <- str_c(mainurl,filename)
  download.file(filedetails,filename)
}

# Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = "https://www.geos.ed.ac.uk/~weather/jcmb_ws/")



#"JCMB_2015.csv" "JCMB_2015_Apr.csv" "JCMB_2015_Feb.csv" "JCMB_2015_Jan.csv""JCMB_2015_Mar.csv"

 
#directly read data from website 
X <- read.csv(url("https://www.geos.ed.ac.uk/~weather/jcmb_ws/JCMB_2011_Mar.csv"))
str(X)


