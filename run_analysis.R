# Check if dataset is extracted in root dir
if(!file.exists("./UCI HAR Dataset")){
    stop("UCI HAR Dataset not in root dir")
}


# Step 1: Merges the training and the test sets to create one data set
# traning/test data, accompanying activity labels and subject ids are in separate files
# It is more intuitive to join ids + labels + data for two datasets separetely, first
# Also, to include feature names in data from the beggining (X_train/X_test col.names)
feature_names <- read.table("UCI HAR Dataset/features.txt")[,2]

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject_id")) # values 1:30
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity")) # values 1:6
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feature_names) # 561 cols
train <- cbind(subject_train, y_train, X_train)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject_id")) # values 1:30
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity")) # values 1:6
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feature_names) # 561 cols
test <- cbind(subject_test, y_test, X_test)

mergedData <- rbind(train, test)


# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
# In previous step we already included feature names in merged dataset. 
# We need to filter on those that have mean() and std() in them, ie. we keep their indices.
filter_list <- grep("mean\\(\\)|std\\(\\)", feature_names)
filteredData <- mergedData[,c(1:2,filter_list + 2)] # add 2 for first two cols


# Step 3: Uses descriptive activity names to name the activities in the data set.
# activity_labels.txt holds the names, and activity ids are in second col of the filtered data
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "label"))
filteredData$activity <- activity_names[filteredData$activity,]$label


# Step 4: Appropriately labels the data set with descriptive variable names. 
# We have already attached feature names to datase, but we can make them prettier
prettyData <- filteredData
names(prettyData) <- gsub("mean", " Mean", names(prettyData)) # capitalize M
names(prettyData) <- gsub("std", " Std", names(prettyData)) # capitalize S
names(prettyData) <- gsub("-", " ", names(prettyData)) # remove "-" in column names 
names(prettyData) <- gsub("\\.\\.", " ", names(prettyData))
names(prettyData) <- gsub("\\.", " ", names(prettyData))
names(prettyData) <- gsub("  ", " ", names(prettyData))
names(prettyData) <- gsub(" $", "", names(prettyData))
write.table(prettyData, "prettyData.txt")


# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- aggregate(x=prettyData, by=list(activities=prettyData$activity, subjects=prettyData$subject_id), FUN=mean)
tidyData <- tidyData[, !(colnames(tidyData) %in% c("subject_id", "activity"))]
write.table(tidyData, "tidyData.txt", row.names = F)
