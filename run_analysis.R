setwd("C:/DataScience/getdata-009/course-project/UCI HAR Dataset/")

# 1. Merges the training and the test sets to create one data set.

#Reads in all the files to table variables
data_train <- read.table("train/X_train.txt", header=FALSE)
data_test <- read.table("test/X_test.txt", header=FALSE)
label_train <- read.table("train/y_train.txt", header=FALSE)
label_test <- read.table("test/y_test.txt", header=FALSE)
subject_train <- read.table("train/subject_train.txt", header=FALSE)
subject_test <- read.table("test/subject_test.txt", header=FALSE)

# Combines data tables by rows with rbind
data_table <- rbind(data_train, data_test)
label_table <- rbind(label_train, label_test)
subject_table <- rbind(subject_train, subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Read in features file to table variable
features <- read.table("features.txt")
# Give non-numeric names to the features columns
names(features) <- c('features_number', 'features_name')
# Search for matches to argument mean or standard deviation (sd)  within each element of character vector
mean_sd_features <- grep("-mean\\(\\)|-std\\(\\)", features$features_name)
data_table <- data_table[, mean_sd_features]
# Replaces all matches of a string features
names(data_table) <- gsub("\\(|\\)", "", (features[mean_sd_features, 2]))

# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.

# Read in activity labels file to table variable
activities <- read.table("activity_labels.txt")
# Give non-numeric names to the activities columns
names(activities) <- c('activity_number', 'activity_name')
label_table[, 1] = activities[label_table[, 1], 2]

names(label_table) <- "Activity"
names(subject_table) <- "Subject"

# Combines data tables by columns with cbind
tidyLikeBillyMays <- cbind(subject_table, label_table, data_table)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyNumberTwo <- tidyLikeBillyMays[, 3:dim(tidyLikeBillyMays)[2]] 
tidyDataCleanAverage <- aggregate(TidyNumberTwo,list(tidyLikeBillyMays$Subject, tidyLikeBillyMays$Activity), mean)

# Activity and Subject name of columns 
names(tidyDataCleanAverage)[1] <- "Subject"
names(tidyDataCleanAverage)[2] <- "Activity"

# Using tidy data set created in step 5 generate a txt file created with write.table() using row.name=FALSE.
write.table(file = "tidyDataCleanAverage.txt", x = tidyDataCleanAverage, row.names = FALSE)

# Have a nice day.
# Stay gold.
