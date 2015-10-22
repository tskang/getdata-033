# Getting and Cleaning Data Project

The script run_analysis.R does the following. 

0. Presumes that the dataset was downloded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped in the current working directory with folders "test" and "training".
1. Merges the training and the test sets to create one data set assuming the data set folders "test", "training", and the run_analysis.R script are all in the current working directory, and outputs an intermediate result file "merged.txt".
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names and outputs an intermediate result file "mms_labeled.txt". 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject and outputs the final dataset file "mms_avg.txt".

* As a result, the script will generate three output files in the current working directory:
  - merged.txt : contains the merged dataset of the training sets "train/subject_train.txt", "train/X_train.txt", "train/y_train.txt" and test sets.
  - data_with_means.txt (220 Kb): it contains a data frame called result with 180*68 dimension.
* Finally, use data <- read.table("data_with_means.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features. 
