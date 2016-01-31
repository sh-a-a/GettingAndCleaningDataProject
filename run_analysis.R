# Check if data have been donwloaded already by checking existance of 'UCI HAR Dataset' folder. If not, then downloading it
# and uzip
if (!file.exists('UCI HAR Dataset')) {
    print('Dataset not found. Downloading...')
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', 'dataset.zip')
    unzip('dataset.zip')
}

# Task 1
# Merging training and test set
print('Loading and merging data...')
features <- read.table('./UCI HAR Dataset/features.txt')
x_test <- read.table('./UCI HAR Dataset/test/X_test.txt', col.names = features[,2])
x_train <- read.table('./UCI HAR Dataset/train/X_train.txt', col.names = features[,2])
x <- rbind(x_test, x_train)

# Task 2
# Extraction measurements on the mean and standard deviation (feature with mean() and std())
print('Extracting mean and std...')
subject_features <- features[grep('(mean|std)\\(', features[,2]),]
x_mean_and_std <- x[,subject_features[,1]]

# Task 3
# Using descriptive activity names to name activities in the data set
print('Labaling activies...')
labels <- read.table('./UCI HAR Dataset/activity_labels.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt', col.names = c('activity'))
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt', col.names = c('activity'))
y <- rbind(y_test, y_train)

for (i in 1:nrow(labels)) {
    code <- as.numeric(labels[i, 1])
    label <- as.character(labels[i, 2])
    y[y$activity == code, ] <- label
}

# Task 4
# Labeling data set with descriptive variable names
x_with_labels <- cbind(y, x)
x_mean_and_std_with_labels <- cbind(y, x_mean_and_std)

# Task 5
# Creating data set with the average of each variable for each activity and subject
print('Loading subject data and creating data set with average data...')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt', col.names = c('subject'))
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt', col.names = c('subject'))
subject <- rbind(subject_test, subject_train)

averages <- aggregate(x, by = list(activity = y[,1], subject = subject[,1]), mean)
# Saving averages to file
write.table(averages, 'averages.txt', row.names = FALSE)