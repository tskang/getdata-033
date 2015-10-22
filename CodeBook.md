# Code Book

This code book describes the variables, the data, and any transformations or work that were performed to clean up the data.

* The data was originally from:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project was obtained from:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

* The run_analysis.R script performs the following steps to clean the data: 
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "train" folder and store them in *d11*, *d12*, and *d13* variables respectively.       
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "test" folder and store them in *d21*, *d22*, and *d23* variables respectively.  
 3. cbind *d11*, *d12*, and *d13* to to generate *d1*; 
    cbind *d21*, *d22*, and *d23* to to generate *d2*;
    concatenate *d1* to *d2* to generate a merged data frame, *merged* 
    and write the data frame into "merged.txt" file.  
 4. Load the "features.txt" file into a variable called *f*. 
 5. Extract the measurements on the mean and standard deviation using grepl to select the columns including mean() and std(). Store them into *m* and *s*, respectively. Combine and store *m* and *s* into *ms* (mean-std). Merge the first column "subject", *ms*, and the last column "activity" to yield *mms* (merged-mean-std) with the 68 corresponding columns.  
 6. Load the "activity_labels.txt" file into a variable called *a*.  
 7. Replace the column names of *mms* with corresponding descriptive ones from *a*. 
 8. Replace the numerical values of "activity" column of *mms* with the descriptive activity names.
 9. Write the *mms* out to "mms_labeled.txt" file in current working directory.  
 10. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects *subs* and 6 unique activities *acts*, which result in a 180 combinations of the two. Then, subset the matched rows for a particular sub and store into *mmsg*. For each combination pair <subject, activity> *g*, we calculate the mean *avg* of each measurement with the corresponding combination. Therefore, after initializing the *mms_avg* data frame and performing the two for-loops, we get a 180x68 data frame.
 11. Write the *mms_avg* out to "mms_avg.txt" file in current working directory. 
 