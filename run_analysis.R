## Loading Libraries
library(dplyr)

## Reading in the files.
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
labels_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
labels_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
features <- read.table("UCI HAR Dataset/features.txt", sep=" ")
labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep=" ")

## Building main data set and adding column names
data <- rbind(xtrain, xtest)
colnames(data) <- features[, 2]

## Filter out columns containing mean() and std() 
df_mean <- data[,grepl("mean\\(\\)", colnames(data))]
df_std <- data[,grepl("std\\(\\)", colnames(data))]
df <- cbind(df_mean, df_std)

## Adding the Subjects column
df$subjects <- as.numeric(c(subject_train, subject_test, recursive = TRUE))

## Adding Activities column
df$activity <- as.character(c(labels_train, labels_test, recursive = TRUE))

## Renaming Activities
activ_factor <- as.vector(labels[, 2])
for (i in 1:6) { df$activity[df$activity == i] <- activ_factor[i] }

## Getting the  average of each variable for each activity and each subject
tidydf <- df %>% 
  group_by(subjects, activity) %>%
  summarise_each(funs(mean)) %>%
  arrange(subjects)


## Export table as .txt file
write.table(tidydf, file = "tidyData.txt", row.names=FALSE)

