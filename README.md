##Coursera "Getting and Cleaning Data" Course Project

This is the Readme file for the run_analysis.R script.

This script starts with the assumption that the dplyr library has been installed and that the Samsung data is available in an unzipped UCI HAR Dataset folder and that this folder is set as the working directory.

If the script is copied to the working directory, it can be run with the command: source("run_analysis.R")  

##The script consists of 8 basic steps:
### 1. Reading in the data files.
      A list of all the files being read using read.table:
        + X_train.txt
        + X_test.txt
        + Y_train.txt
        + Y_test.txt
        + subject_train.txt
        + subject_test.txt
        + features.txt
        + activity_labels.txt
        
### 2. Merging the data and test set 
    The data from X_test and Y_test are merged using rbind()
  
### 3. Appropriately labels the data set with descriptive variable names. 
     Next the columns names are added using the data from the features.txt file.

### 4. Extracting only the measurements on the mean and standard deviation for each measurement.
     Using grebl only columns that have std() and mean() in there names are extracted.
     Additional vectors obtained by averaging the signals in a signal window sample, that are used on the angle()
     variable, like gravityMean and tBodyAccMean were not included
    
### 5. Adding the subjects column
     Adding a column names "subjects" using data from subject_train.txt and subject_test.txt
    
### 6. Adding activity column
     Adding a column named "activity" using the data from Y_train.txt and Y_test.txt
     
### 7. Uses descriptive activity names to name the activities in the data set
    The activity column consisting of numeric values (1:6) are renamed using the data from activity_labels.txt 
      
### 8. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
     The dataset is grouped by subject and activity and average for each of these groups are calculated using the mean
     function, so that there is only one value for each grouping. The results of this dataset can be found in the
     tidyData.txt file

More information and the original dataset can be found here.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
