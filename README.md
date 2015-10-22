# Getting and Cleaning Data Project

The script run_analysis.R does the following. 

0. Presumes that the dataset was downloded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped in the current working directory with folders "test" and "training".
1. Merges the training and the test sets to create one data set assuming the data set folders "test", "training", and the run_analysis.R script are all in the current working directory, and outputs an intermediate result file "merged.txt".
2. Extracts only the measurements on the mean and standard deviation for each measurement by selecting the 33 mean() columns and 33 standard() columns. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names and outputs an intermediate result file "mms_labeled.txt" (meaning merged-mean-standard with labeled).
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject and outputs the final dataset file "mms_avg.txt".

* As a result, the following three output files will be generated in the current working directory:
  - merged.txt : contains the merged dataset of the training sets "train/subject_train.txt", "train/X_train.txt", "train/y_train.txt" and the test sets "test/subject_test.txt", "test/X_test.txt", "test/y_test.txt".
  - mms_labeled.txt: contains a labeled data frame with the merged-mean-standard dataset.
  - mms_avg.txt: contains a data frame for the average of each variable for each pair of <activity, subject>, with 6 activities, 30 subjects, 68 variables resulting in 180*68 dimension. 
