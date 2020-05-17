#### decision tree

library("party")
readingSkills
str(readingSkills)


input.dat <- readingSkills[c(1:105),]

output.tree <- ctree( nativeSpeaker ~ age + shoeSize + score, data = input.dat)
plot(output.tree)


##survival
library("survival")
pbc
head(pbc)
str(pbc)


re <- survfit(Surv(pbc$time,pbc$status == 2)~1)
plot(re)


### logistics
====================
mtcars
head(mtcars)
str(mtcars)

input <- mtcars[,c("am","cyl","hp","wt")]
head(input)

rel = glm(formula = am ~ cyl + hp + wt, data = input, family = binomial)
summary(rel)



################ random forest
library(randomForest)
data(iris)
set.seed(111)
ind <- sample(2, nrow(iris), replace = TRUE, prob=c(0.8, 0.2))

iris.rf <- randomForest(Species ~ ., data=iris[ind == 1,])
##prediction
iris.pred <- predict(iris.rf, iris[ind == 2,])
table(observed = iris[ind==2, "Species"], predicted = iris.pred)



################
##Chi-Square test is a statistical method to determine if two categorical variables have a significant correlation between them. Both those variables should be from same population and they should be categorical like ??? Yes/No, Male/Female, Red/Green etc.

##For example, we can build a data set with observations on people's ice-cream buying pattern and try to correlate the gender of a person with the flavor of the ice-cream they prefer. If a correlation is found we can plan for appropriate stock of flavors by knowing the number of gender of people visiting.

library("MASS")
print(str(Cars93))

# Create a data frame from the main data set.
car.data <- data.frame(Cars93$AirBags, Cars93$Type)

# Create a table with the needed variables.
car.data = table(Cars93$AirBags, Cars93$Type) 

print(car.data)

# Perform the Chi-Square test.
print(chisq.test(car.data))






