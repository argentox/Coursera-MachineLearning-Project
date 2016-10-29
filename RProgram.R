##SET UP ENVIRONMENT
library(data.table)
library(rpart)
library(rattle)
library(randomForest)
library(caret)

normalize <- function(x) {
    return ((x - min(x)) / (max(x) - min(x)))
  }

##LOAD DATA
train_data=url("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv")
test_data=url("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv")
##looking at the spreadsheets we need to take out "NA", "DIV/0!", and ""


##train_data <- "C:\\Users\\bbedard\\Desktop\\train_2000.csv";
##test_data <- "C:\\Users\\bbedard\\Desktop\\test.csv";
training <-read.csv(train_data, header = TRUE, na.strings=c("NA","#DIV//0!",""))
testing <- read.csv(test_data, header = TRUE, na.strings=c("NA","#DIV//0!",""))

print(dim(training)); 
print(dim(testing));

##CLEAN UP DATA (isolate complete data sets that contribute to what we want to predict, 'classe')
##'classe' is an indicator ranging from A to E describing how well the excersise is done.
##data sets that are empty are removed with
CleanTrainData<-training[,(colSums(is.na(training))==0)]
CleanTestSet<-testing[,(colSums(is.na(testing))==0)]


## Keep only valid predictors
CleanTrainData <- CleanTrainData[-(1:7)]
CleanTestSet<- CleanTestSet[-(1:7)]
CleanTestSet<- CleanTestSet[-53]

dim(CleanTrainData );
dim(CleanTestSet);

## Normalized data
##CleanTrainData <- as.data.frame(lapply(CleanTrainData[1:52], normalize))


dim(CleanTrainData); dim(CleanTestSet)
##data sets cleaned of missing measuring points

##PARTITION TRAINING DATA SET : Selects p randomly
inTrain <- createDataPartition(CleanTrainData$classe, p=0.6, list=FALSE)
## This is your 60%
myTraining <- CleanTrainData[inTrain, ]
## This is your remaining 40%
myTesting <- CleanTrainData[-inTrain, ]
dim(myTraining); dim(myTesting)

##we make sure the training data set is a prediction factor
myTraining$classe <- as.factor(myTraining$classe) 
myTesting$classe <- as.factor(myTesting$classe)

##CREATE A REGRESSION TREE & PLOT
RegTree <- rpart(classe ~ ., data=myTraining, method="class")
##fancyRpartPlot(RegTree)

##VALIDATE THE MODEL WITH 'TESTING' DATA SET
RegTreePredict<-predict(RegTree, myTesting, type="class")
confusionMatrix(RegTreePredict, myTesting$classe)
##pops out 'accuracy'

print("Predicted class for the test data:\n");
print(RegTreePredict<-predict(RegTree, CleanTestSet, type="class"))


##CREATE A RANDOM FOREST & PLOT
RanForest <- randomForest(classe ~ ., data=myTraining)
RanForestPredict <- predict(RanForest, myTesting, type = "class")
ConMatFR <- confusionMatrix(RanForestPredict, myTesting$classe)
ConMatFR
#pop out 'accuracy'
plot(RanForest)


##CREATE A BOOSTED REGRESSION 
BoostedReg <- trainControl(method = "repeatedcv",number=5, repeats=1)
gbmFIT<- train(classe ~ ., data=myTraining, method = "gbm",trControl = BoostedReg, verbose=FALSE)
gbmFITmod <- gbmFIT$finalModel
gbmPredictionTest <- predict(gbmFIT, newdata=myTesting)
ConMatRFgbm <- confusionMatrix(gbmPredictionTest, myTesting$classe)
ConMatRFgbm

##TEST THE PREDICTION MODEL OF CHOICE
BestPredict <- predict(RanForest, testing, type = "class")
BestPredict


