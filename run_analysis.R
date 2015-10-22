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

merged <- rbind(d1, d2)
write.table(merged, file = "merged.txt", row.name=FALSE)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# read the features
f <- read.table("features.txt")
# grep mean and standard deviation: mean 33, std 33
m <- subset(f, grepl("mean\\(\\)", V2))
s <- subset(f, grepl("std\\(\\)", V2))
ms <- rbind(m, s) # 66 obs.
mms <- merged[c(1, 1 + ms$V1, ncol(merged))]

# 3. Uses descriptive activity names to name the activities in the data set
# read activity labels
a <- read.table("activity_labels.txt")

# 4. Appropriately labels the data set with descriptive variable names. 
colnames(mms) <- c("subject", as.character(ms$V2), "activity")

mms$activity[mms$activity == 1] <- "WALKING"
mms$activity[mms$activity == 2] <- "WALKING_UPSTAIRS"
mms$activity[mms$activity == 3] <- "WALKING_DOWNSTAIRS"
mms$activity[mms$activity == 4] <- "SITTING"
mms$activity[mms$activity == 5] <- "STANDING"
mms$activity[mms$activity == 6] <- "LAYING"

write.table(mms, file = "mms_labeled.txt", row.name=FALSE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
mms <- read.table("mms_labeled.txt", header = TRUE)

subs <- unique(mms$subject)
acts <- as.character(unique(mms$activity))
mms_avg <- data.frame(stringsAsFactors=FALSE)
for(sub in subs) {
  mmsg <- subset(mms, subject == sub)
  for(act in acts) {
    g <- subset(mms, activity == act)
    avg <- colMeans(g[,-c(1,ncol(g))], na.rm = TRUE)
    mms_avg <- rbind(mms_avg, data.frame(sub, act, t(avg)))
  }
}
colnames(mms_avg) <- c("subject", "activity", colnames(mms[,-c(1,ncol(mms))]))
write.table(mms_avg, file = "mms_avg.txt", row.name=FALSE)

# test reading the tidy data file
# tidy <- read.table("mms_avg.txt", header = TRUE)
