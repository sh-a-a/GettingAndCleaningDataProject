# Project Code Book
This document describes code and variables in `run_analysis.R`.

The code is splitted by comments in sections by task numbers (from Task 1 to Task 5).

Code checks for existence of dataset directory `UCI HAR Dataset`, if it is not found then script downloading zip archive
with data and unpacking it.

## Variables
### Source Data
`features` – Features (column names). Data loaded from './UCI HAR Dataset/features.txt'
`x_test` – Test data set. Data loaded from './UCI HAR Dataset/test/X_test.txt'
`x_train` – Train data set. Data loaded from './UCI HAR Dataset/train/X_train.txt'
`labels` – Activity labels. Data loaded from './UCI HAR Dataset/activity_labels.txt'
`y_test` – Activity in test data set. Data loaded from './UCI HAR Dataset/test/y_test.txt'
`y_train` – Activity in train data set. Data loaded from './UCI HAR Dataset/train/y_train.txt'
`subject_test` – Subject data from test data set. Data loaded from './UCI HAR Dataset/test/subject_test.txt'
`subject_train` – Subject data from train data set. Data loaded from './UCI HAR Dataset/train/subject_train.txt'

### Processed Data
`x` – `x_test` and `x_train` merged data frame with `features` as column names
`x_with_labels` – `x` with activity labels changed to descriptive names
`subject_features` – contains subset of columns which names contains **mean** or **std** to create `x_mean_and_std` data set
`x_mean_and_std` – `x` with **mean** and **std** measurements
`x_mean_and_std_with_labels` – `x_mean_and_std` with descriptive names for activity labels 
`subject` – `subject_test` and `subject_train` merged data frame
`averages` – data set with the average of each variable for each activity and subject
