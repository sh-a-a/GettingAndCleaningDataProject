# Project Code Book
This document describes code and variables in `run_analysis.R`.

The code is splitted by comments in sections by task numbers (from Task 1 to Task 5).

Code checks for existence of dataset directory `UCI HAR Dataset`, if it is not found then script downloading zip archive
with data and unpacking it.

## Variables and Modifications

### Source Data
- `features` – Features (column names). Data loaded from './UCI HAR Dataset/features.txt'
- `x_test` – Test data set. Data loaded from './UCI HAR Dataset/test/X_test.txt'
- `x_train` – Train data set. Data loaded from './UCI HAR Dataset/train/X_train.txt'
- `labels` – Activity labels. Data loaded from './UCI HAR Dataset/activity_labels.txt'
- `y_test` – Activity in test data set. Data loaded from './UCI HAR Dataset/test/y_test.txt'
- `y_train` – Activity in train data set. Data loaded from './UCI HAR Dataset/train/y_train.txt'
- `subject_test` – Subject data from test data set. Data loaded from './UCI HAR Dataset/test/subject_test.txt'
- `subject_train` – Subject data from train data set. Data loaded from './UCI HAR Dataset/train/subject_train.txt'

### Processed Data
- `x` – `x_test` and `x_train` merged data frame with `features` as column names
- `x_with_labels` – `x` with activity labels changed to descriptive names
- `subject_features` – contains subset of columns which names contains **mean** or **std** to create `x_mean_and_std` data set
- `x_mean_and_std` – `x` with **mean** and **std** measurements
- `x_mean_and_std_with_labels` – `x_mean_and_std` with descriptive names for activity labels 
- `subject` – `subject_test` and `subject_train` merged data frame
- `averages` – data set with the average of each variable for each activity and subject

## Data Description

Information about dataset, licensing and files can be found in `UCI HAR Dataset/README.txt` after script will download and unpack it.

## Feature Selection (from original)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'UCI HAR Dataset/features.txt'
