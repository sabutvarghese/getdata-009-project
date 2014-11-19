#Create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set
# 2. Extracts only the measurements on the mean and standard deviation for 
#    each measurement
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
#

setwd("C:/Users/varghese/RWork/Coursera_RProgramming/03_getdata-009/project")
#
# Define column labels
activity_col_names <- c("ActivityId", "ActivityLabel")
subject_col_names <- c("Subject")
#
# Read list of TEST subjects/people and assign column name
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- subject_col_names

# Read list of TEST activity, activity labels and column bind to assign column labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_test <- cbind(y_test, activity_labels[y_test[,1]])
names(y_test) <- activity_col_names

# Read feature list and X_test measurements and assign column names 
features <- read.table("UCI HAR Dataset/features.txt")[,2]
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
names(x_test) <- features

# Extract measurements on mean and standard deviation only
# Not sure which columns should be included; however the results should be correct
# as long as the column is included
sel_features <- names(x_test) %in% grep("mean|Mean|std", names(x_test), value=TRUE)
x_test <- x_test[,sel_features]

# Assemble TEST data
test_data <- cbind(subject_test, y_test, x_test)

################################################################################
# Read list of TRAIN subjects/people and assign column name
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- subject_col_names

# Read list of TRAIN activity, activity labels and column bind to assign column labels
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_train <- cbind(y_train, activity_labels[y_train[,1]])
names(y_train) <- activity_col_names

# Read feature list and X_test measurements and assign column names 
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
names(x_train) <- features

# Extract measurements on mean and standard deviation only
# Not sure which columns should be included; however the results should be correct
# as long as the column is included
sel_features <- names(x_train) %in% grep("mean|Mean|std", names(x_train), value=TRUE)
x_train <- x_train[,sel_features]

# Assemble TRAIN data
train_data <- cbind(subject_train, y_train, x_train)

#
# Combine/RowBind test & train data sets
m_data = rbind(test_data, train_data)

################################################################################
# Create tidy dataset with the average of each variable for each activity and each subject
tidy_data <- aggregate(m_data,by=list(Subject=m_data$Subject, ActivityId=m_data$ActivityId, ActivityLabel=m_data$ActivityLabel), FUN=mean)

# Removing redundant/meaningless columns and sorting data
tidy_data <- tidy_data[, c(-4, -5, -6)]
tidy_data <- tidy_data[order(tidy_data$Subject, tidy_data$ActivityId),]

# Write data without row ids
write.table(tidy_data, sep=",", eol="\n", file="tidy_data.txt", row.names=FALSE)





