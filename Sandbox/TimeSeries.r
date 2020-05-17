#https://data.cityofchicago.org/api/views/ijzp-q8t2/rows.csv

install.packages("data.table")
library(data.table)

setwd("C:\\Users\\vkumar15\\Downloads")
getwd()

dat = fread("Crimes_-_2001_to_present.csv")
length(dat)
length(dat$Year)



colnames(dat) = gsub(" ", "_", tolower(colnames(dat)))

dat[, date2 := as.Date(date, format="%m/%d/%Y")]

mydat = dat[primary_type=="THEFT", .N, by=date2][order(date2)]

length( mydat)
length( mydat$date2)

str(mydat)
View(mydat)

mydat[1:6]
head(mydat)


##
library(xts)

# create a xts object 
mydat2 = as.xts(mydat)
mydat2$N
View( mydat2)


plot.xts(mydat2)
# filter by date 
mydat2["2015"]  ## 2015
mydat2["201501"]  ## Jan 2015
mydat2["20150101/20150105"]  ## Jan 01 to Jan 05 2015 
# replace all valuues from Aug 25 onwards with 0
mydat2["20170825/"] <- 0
mydat2["20170821/"]
# get the last one month 
last(mydat2, "1 month")
# get stats by time frame
apply.monthly(mydat2, sum)
apply.monthly(mydat2, quantile)
period.apply(mydat2, endpoints(mydat2,on='months'), sum)
period.apply(mydat2, endpoints(mydat2,on='months'), quantile)



##
library(lubridate)
ymd("2010-01-01")
mdy("01-01-2010")
ymd_h("2010-01-01 10")
ymd_hm("2010-01-01 10:02")
ymd_hms("2010-01-01 10:02:30")



library(dynlm)
mydat = dat[primary_type=="THEFT", .N, by=date2][order(date2)]
mydat[, weather := sample(c(20:90), dim(mydat), replace=TRUE)]
mydat[, weather_lag := shift(weather, 1, type = 'lag')]
mod = dynlm(N ~ L(weather), data = mydat2)

summary(mydat)











