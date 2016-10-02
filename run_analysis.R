library(plyr)

# Merge training and test datasets to create one dataset

xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")
subjectTrain <- read.table("train/subject_train.txt")

xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")
subjectTest <- read.table("test/subject_test.txt")

# create 'x' data set, 'y' data set and 'subject' data set
xData <- rbind(xTrain, xTest)

yData <- rbind(yTrain, yTest)

subjectData <- rbind(subjectTrain, subjectTest)


# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")

# read columns with mean() or std() in their names
meanAndStd <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
xData <- xData[, meanAndStd]

# correct the column names
names(xData) <- features[meanAndStd, 2]


# Use descriptive activity names to name the activities in the data set


activities <- read.table("activity_labels.txt")

# update values with correct activity names
yData[, 1] <- activities[yData[, 1], 2]

# correct column name
names(yData) <- "activities"

# Appropriately label the data set with descriptive variable names

# correct column name
names(subjectData) <- "subjects"

# bind all the data in a single data set
allData <- cbind(xData, yData, subjectData)


# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

averagesData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averagesData, "averageData.txt", row.name=FALSE)
