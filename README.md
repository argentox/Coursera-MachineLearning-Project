# Coursera-MachineLearning-Project

##Project Introduction
"One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this project, your goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants to predict how well they are excersising."

##The Project will include:
An estimation of how the originators of the model would have handled the data to predict "classe" variable.
Explanations and descriptions of how my modeling was built.
How I used cross validation and what I am expecting to see as the "out of sample" error.
Prediction of the "classe" variable using the "testing" set given by the originators to confirm my model is as good as theirs.

##Data Set Background:
"Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement – a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this project, your goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways."

##Set Up Environment
I start by setting up an environment of potential librabries I will be using in the handling of the data sets and modelling.
```sh
library(data.table)
library(rpart)
library(rattle)
library(randomForest)
library(caret)
```
##Loading Training data set:
Loading of the data set...

```sh
train_data=url("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv")
```

##Preparation of the data sets:
I started by looking at the "pml-testing.csv" data set to give me a clue of what is inside. One immidate observation is that there is a number of columns that will need to be removed because they can not contribute to the prediction of "classe". Columns such as time-stamp, user-name, etc. will need to be removed.

```sh
training <-read.csv(train_data, header = TRUE, na.strings=c("NA","#DIV//0!",""))
print(dim(training)); 
```

##Preprocessing

##Normalizing

##Surface Plot

##Preparing a Machine Learning Training Model:
After gainig a better understanding of the variables in the data set, I make a cleaner set of data points to make a prediction model.
I take 60% of the 'pml-training.csv' to train a prediction model and use the remianing 40% to test the model.

```sh
CleanTrainData<-training[,(colSums(is.na(training))==0)]
CleanTrainData <- CleanTrainData[-(1:7)]
dim(CleanTrainData )

inTrain <- createDataPartition(CleanTrainData$classe, p=0.6, list=FALSE)
myTraining <- CleanTrainData[inTrain, ]
myTesting <- CleanTrainData[-inTrain, ]
dim(myTraining); dim(myTesting)
```


