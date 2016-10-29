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

##Preparation of the data sets:
I started by looking at the "pml-testing.csv" data set to give me a clue of what is inside. One immidate observation is that there is a number of columns that will need to be removed because they can not contribute to the prediction of "classe". Columns such as time-stamp, user-name, etc. will need to be removed.

##Set Up Environment
I start by setting up an environment of potential librabries I will be using in the handling of the data sets and modelling.
```sh
library(data.table)
library(rpart)
library(rattle)
library(randomForest)
library(caret)
```

##Preprocessing

##Normalizing

##Surface Plot

