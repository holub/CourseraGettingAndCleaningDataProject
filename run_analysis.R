#setwd("~/Dropbox/projects/@coursera/rlang/proj3")

library(dplyr)
library(tidyr)
#install.packages("LaF")
#install.packages("ffbase")
library(LaF)
library(ffbase)
library(reshape2)

#Prepare labels
headers <- read.table("UCI HAR Dataset/features.txt", sep=" ", stringsAsFactor=FALSE)
headers <- headers[, 2]

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
colnames(activityLabels) <- c("activityID","activityLabel")

LoadDataSet <- function(setType) {
  #slow: t <- read.fwf(file="UCI HAR Dataset/train/X_train.txt", widths=rep(16, 561))
  set <- laf_open_fwf(paste0("UCI HAR Dataset/", setType, "/X_", setType, ".txt"), 
                           column_widths=rep(16,561), column_types=rep("numeric", 561),
                           column_names=headers) %>%
    laf_to_ffdf %>% as.data.frame %>%
    tbl_df

  activities <- read.table(paste0("UCI HAR Dataset/", setType, "/y_", setType, ".txt"),stringsAsFactors=FALSE)
  colnames(activities) <- "activityID"
  activities <- merge(activities, activityLabels)
  set <- cbind(activity=activities[,"activityLabel"], set)

  subjects <-  read.table(paste0("UCI HAR Dataset/", setType, "/subject_", setType, ".txt"),stringsAsFactors=FALSE)
  colnames(subjects) <- "subject"
  set <- cbind(subject=subjects, set)
  
  set
}

#Merge training and test data sets
allData <- bind_rows(LoadDataSet("test"), LoadDataSet("train")) %>%
  select(activity, subject, contains("mean"), contains("std"))

#Rename variables
newNames <- names(allData)
newNames <- gsub(pattern="^t", replacement="time", x=newNames)
newNames <- gsub(pattern="^f", replacement="freq", x=newNames)
newNames <- gsub(pattern="\\.mean", replacement="Mean", x=newNames)
newNames <- gsub(pattern="\\.std", replacement="Std", x=newNames)
newNames <- gsub(pattern="\\.", replacement="", x=newNames)
names(allData) <- newNames

#Summarize variables
molten <- melt(allData,id.vars= c("subject","activity"))
cast <- dcast(molten, subject+activity ~ variable, fun.aggregate=mean)

#Write tidy date
write.table(cast, "tidy.txt", row.names=FALSE)
