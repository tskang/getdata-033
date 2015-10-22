# This code does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.

# 1. Merge the training and the test sets to create one data set.
# read the training set
# d11 <- read.table("train/subject_train.txt")
# d12 <- read.table("train/X_train.txt")
# d13 <- read.table("train/y_train.txt")
# d1 <- cbind(d11, d12, d13)

# read the test set
# d21 <- read.table("test/subject_test.txt")
# d22 <- read.table("test/X_test.txt")
# d23 <- read.table("test/y_test.txt")
# d2 <- cbind(d21, d22, d23)

# merged <- rbind(d1, d2)
# write.table(merged, file = "merged.txt", row.name=FALSE)
merged <- read.table("merged.txt", header = TRUE)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# read the features
f <- read.table("features.txt")
# grep mean and standard deviation: mean 33, std 33
m <- subset(f, grepl("mean\\(\\)", V2))
s <- subset(f, grepl("std\\(\\)", V2))
ms <- rbind(m, s) # 66 obs.
mms <- merged[c(1, 1 + ms$V1, ncol(merged))]
# mms <- read.table("mms.txt")

# 3. Uses descriptive activity names to name the activities in the data set
# read activity labels
a <- read.table("activity_labels.txt")
# write.table(mms, file = "mms_activity.txt", row.name=FALSE)

# 4. Appropriately labels the data set with descriptive variable names. 
colnames(mms) <- c("subject", as.character(ms$V2), "activity")
# for(act in a) {
#   mms$activity[mms$activity == act$V1] <- act$V2
# }
mms$activity[mms$activity == 1] <- "WALKING"
mms$activity[mms$activity == 2] <- "WALKING_UPSTAIRS"
mms$activity[mms$activity == 3] <- "WALKING_DOWNSTAIRS"
mms$activity[mms$activity == 4] <- "SITTING"
mms$activity[mms$activity == 5] <- "STANDING"
mms$activity[mms$activity == 6] <- "LAYING"

write.table(mms, file = "mms_labeled.txt", row.name=FALSE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
# mms <- read.table("mms_labeled.txt", header = TRUE)

# aggregate(x = mms, by = list(activity), FUN = "mean")
# aggregate(activity, mms, mean)


