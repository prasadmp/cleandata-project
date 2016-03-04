# Read the test and train data
x_test_data <- read.delim("./test/X_test.txt", header = F, sep = "")
x_train_data <- read.delim("./train/X_train.txt", header = F, sep = "")

# Read activity
y_test_data <- read.delim("./test/y_test.txt", header = F, sep = "")
y_train_data <- read.delim("./train/y_train.txt", header = F, sep = "")

# Read the feature lables and get names to assign them to columns
features <- read.delim("./features.txt", header = F, sep = "", stringsAsFactors = F)
feature_names <- features$V2

# Read acitivity lables and subjects (participants)
act_labels <- read.delim("./activity_labels.txt", header = F, sep = "")
sub_test <- read.delim("./test/subject_test.txt", header = F, sep = "")
sub_train <- read.delim("./train/subject_train.txt", header = F, sep = "")
activity_test_names <- factor(y_test_data$V1, levels = 1:6, labels = as.character(act_labels$V2))
activity_train_names <- factor(y_train_data$V1, levels = 1:6, labels = as.character(act_labels$V2))

# Assign column names to dataset using features
colnames(x_test_data) <- feature_names
colnames(x_train_data) <- feature_names

# Add activity and participants to the data set.
library(plyr)

x_test_modd1 <- mutate(x_test_data, participant = sub_test$V1)
x_test_modd2 <- mutate(x_test_modd1, activity = activity_test_names)
x_train_modd1 <- mutate(x_train_data, participant = sub_train$V1)
x_train_modd2 <- mutate(x_train_modd1, activity = activity_train_names)

# Merge the test and train data sets.
whole_data <- rbind(x_test_data, x_train_data)
whole_data_modd <- rbind(x_test_modd2, x_train_modd2)

# Select mean and standard deviation columns (do not miss the newly 
# added participant and activity columns)
library(dplyr)
selec_col <- grep("(std|mean|participant|activity)", colnames(whole_data_modd))
sel_whole_data <- select(whole_data_modd, selec_col)

# Crude way to rename the columns to readble format.
newColNames <- names(sel_whole_data)
newColNames <- gsub("tBodyGyro", "BodyGyroscopeTime", newColNames)
newColNames <- gsub("fBodyGyro", "BodyGyroscopeFrequency", newColNames)
newColNames <- gsub("tBodyAcc", "BodyAccelerometerTime", newColNames)
newColNames <- gsub("fBodyAcc", "BodyAccelerometerFrequency", newColNames)
newColNames <- gsub("tGravityAcc", "GravityAccelerometerTime", newColNames)
newColNames <- gsub("mean\\(\\)", "MeanValue", newColNames)
newColNames <- gsub("std\\(\\)", "StandardDeviation", newColNames)
newColNames <- gsub("Freq\\(\\)", "Frequency", newColNames)
newColNames <- gsub("Mag", "Magnitude", newColNames)
newColNames <- gsub("fBodyBodyGyroMag", "BodyGyroscopeMagnitude", newColNames)
newColNames <- gsub("fBodyBodyAccJerkMag", "BodyAccelerometerJerkMagnitude", newColNames)
newColNames <- gsub("fBodyBodyGyroJerkMag", "BodyGyroscopeJerkMagnitude", newColNames)
newColNames <- gsub("Magnitudenitude", "Magnitude", newColNames)
newColNames
orig_col_names <- names(sel_whole_data)
library(data.table)
setnames(sel_whole_data, old = orig_col_names, new = newColNames)
#write.csv(sel_whole_data, "tidydata.csv", row.names = F)

testData <- sel_whole_data
#testData %>% group_by(activity) %>% summarize_each(funs(mean), -participant)
#tidyData1 <- testData %>% group_by(activity) %>% summarize_each(funs(mean), -participant)
#tidyData2 <- testData %>% group_by(participant) %>% summarize_each(funs(mean), -activity)

tidyData3 <- testData %>% group_by(activity, participant) %>% summarize_each(funs(mean))
write.table(tidyData3, "tidydata.txt", row.names = F)