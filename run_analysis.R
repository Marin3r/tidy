# record time and day download
date <- format(Sys.time(), "%a %b %d %X %Y %Z")
write(date, file = "downloadDate.txt")

# download url
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# create a temporary file for zip download
file <- "data.zip"
# download into the placeholder file
download.file(url, file)
# unzip downloaded archive
unzip("data.zip")
# clear memory
rm(list=ls())

#extract test and train data and create merged data frame
testDF1 <- read.table(file="UCI HAR Dataset/test/X_test.txt")
testAct <- read.table(file="UCI HAR Dataset/test/y_test.txt")
testSub <- read.table(file="UCI HAR Dataset/test/subject_test.txt")
ID <- rep("test", nrow(testDF1))
testDF2 <- cbind(ID, testSub, testAct, testDF1)

trainDF1 <- read.table(file="UCI HAR Dataset/train/X_train.txt")
trainAct <- read.table(file="UCI HAR Dataset/train/y_train.txt")
trainSub <- read.table(file="UCI HAR Dataset/train/subject_train.txt")
ID <- rep("train", nrow(trainDF1))
trainDF2 <- cbind(ID, trainSub, trainAct, trainDF1)
mergeDF <- data.frame(rbind(testDF2, trainDF2))

colnames(mergeDF)[1:3] <- c("Set", "Subject", "Activity")

# remove all objects except merged dataframe
rm(list=setdiff(ls(),"mergeDF"))

# create vector of features
features <- scan(file="UCI HAR Dataset/features.txt", what="", sep="\n")
# identify which ones refer to mean and std.
cols <- grep("mean()+|std()+", features)



# create an aggregated date table with only the measurements on the mean and
# standard deviation for each measurement
library(data.table)
mergeDFtab <- data.table(mergeDF)
aggData <- mergeDFtab[, lapply(.SD, mean), by=list(Subject,Activity, Set),
                      .SDcols=cols+3]

# Create vector of features labels
featuresSelect <- features[cols]

featureEdit <- gsub("([0-9])","", featuresSelect)
featureEdit01 <- sub(" ", "",featureEdit)
featureEdit02 <- gsub("()","",featureEdit01, fixed=TRUE)

# Create vector of activity labels
actLabel <- c(scan(file="UCI HAR Dataset/activity_labels.txt",
                   what="", sep="\n"))
actLabel01 <- tolower(gsub("([0-9]) ","", actLabel))

# Replace activities code with labels
aggData01 <- within(aggData, Activity<- factor(Activity, labels =actLabel01))

# Create tidyData set by sorting by Activity and subject
tidyData <- aggData01[with(aggData01, order(Activity, Subject)),]
row.names(tidyData) <- NULL 
setnames(tidyData,colnames(tidyData),c("Subject", "Activity", "Set", featureEdit02))

# save tidyData set and clear console
write.table(x = tidyData, file = "tidyData.txt", sep = ",", col.names = T)
rm(list=(ls()))

# read tidyData file to check format
tidyData <- read.table(file = "tidyData.txt",header = T, sep = ",")







