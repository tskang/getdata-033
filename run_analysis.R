# read the training set
d1 <- read.csv("X_train.txt", header = FALSE, sep = " ")
str(d1) # 'data.frame':	11228 obs. of  662 variables

# read the test set
d2 <- read.csv("X_test.txt", header = FALSE, sep = " ")
str(d2) # 'data.frame':	4312 obs. of  667 variables

merged <- merge(d1, d2, all = TRUE)
str(merged)
write.table(merged, file = "X_merged.txt", row.name=FALSE)

