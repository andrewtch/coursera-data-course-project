library(reshape2)
# 1. Merges the training and the test sets to create one data set.

train_set = read.table("train/X_train.txt")
train_labels = read.table("train/y_train.txt")

test_set = read.table("test/X_test.txt")
test_labels = read.table("test/y_test.txt")

names(train_labels) <- "activity"
names(test_labels) <- "activity"

subject_train = read.table("train/subject_train.txt")
subject_test = read.table("test/subject_test.txt")

columns = read.table("features.txt")

names(test_set) <- columns$V2
names(train_set) <- columns$V2

names(subject_train) <- "subject_id"
names(subject_test) <- "subject_id"

train = cbind(subject_train, train_labels, train_set)
test = cbind(subject_test, test_labels, test_set)

merged = rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

columns = names(merged)
target_columns = columns[grepl("mean", columns) | grepl("std", columns) | grepl("activity", columns) | grepl("subject_id", columns)]

step2_data = merged[, target_columns]

# 3. Uses descriptive activity names to name the activities in the data set

activities = read.table("activity_labels.txt")

# 4. Appropriately labels the data set with descriptive variable names. 

step2_data$activity <- factor(step2_data$activity, labels=activities$V2)

# 5.From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each subject.

out = dcast(melt(step2_data, id=c("subject_id","activity")), subject_id+activity ~ variable, mean)

# write the tidy data set to a file
write.csv(out, "out.csv", row.names=FALSE)