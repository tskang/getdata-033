# This code does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.

# 1. Merge the training and the test sets to create one data set.
# read the training set
d11 <- read.table("train/subject_train.txt")
d12 <- read.table("train/X_train.txt")
d13 <- read.table("train/y_train.txt")
d1 <- cbind(d11, d12, d13)

# read the test set
d21 <- read.table("test/subject_test.txt")
d22 <- read.table("test/X_test.txt")
d23 <- read.table("test/y_test.txt")
d2 <- cbind(d21, d22, d23)

# merged <- merge(d1, d2, all = TRUE)
merged <- rbind(d1, d2)
# merged <- read.csv("X_merged.txt", header = FALSE, sep = " ")
# str(merged)
write.table(merged, file = "merged.txt", row.name=FALSE)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# read the features
f <- read.csv("features.txt", sep = " ", header = FALSE)
str(f) # 'data.frame':	561 obs. of  2 variables:
# grep mean and standard deviation: mean 33, std 33
m <- subset(f, grepl("mean\\(\\)", V2))
s <- subset(f, grepl("std\\(\\)", V2))
# str(m)
# str(s)
ms <- rbind(m, s) # 66 obs.
# str(ms)
mms <- merged[ms$V1]
# str(mms) # 'data.frame':	15541 obs. of  66 variables:

# 3. Uses descriptive activity names to name the activities in the data set
colnames(mms) <- ms$V2
write.table(mms, file = "merged_mean_std.txt", row.name=FALSE)

# 4. Appropriately labels the data set with descriptive variable names. 

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.


