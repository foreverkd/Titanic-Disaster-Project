library(rattle)
library(rpart)
library(rpart.plot)
library(RColorBrewer)

model <- read.csv("train.csv")
test <- read.csv("test.csv")

test$Survived=0

rPart <- function()
{
	model <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = "class")
	
	fancyRpartPlot(model)
	
	prediction <- predict(model,test,method="class")
	final_df <- data.frame(PassengerId = test$PassengerId, Survived = prediction)
	return(final_df)
}