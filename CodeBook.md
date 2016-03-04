# Tidy Dataset
The data made available here is an independent tidy representation of  the original data (see below for references)
The data set includes average of different variables for each activity and each subject (participant). 

## Background on original data: 
The original data (we treat it as raw data here), is collected from accelerometer and gyroscope of the Samsung Galaxy S smart phone.
Please refer to original data archive for more details.

The signal data collected denotes 3 axial signals in X, Y and Z directions. Jerk signals are derived and included in original data. The data falls in mainly two categories time domain signal and frequency domain signals. 
In addition to accelerometer and gyroscope reading the raw dataset also includes estimated variables such as mean value, standard deviation, max and min values, correlation etc.  

The original dataset is further arbitrarily decided in to test data and training data. 

## Derived Tidy Dataset:
The original dataset is further cleaned to create independent dataset that only include mean and standard deviations for each measurement.  Activity and subject information is stored in separate file(s) in original data set. This information is made tidy using their descriptions and included in the new data set. 

The above applies to both the test and training data which is then merged to create whole data set. 

Thus our whole data set so far includes all the mean and standard deviation values for all readings in test as well as training data.

This data is further cleaned for ease of analysis by calculating average of each variable for each activity and each subject (participant in the data collection).

Activity variable provides activity label from a set of following values for every reading.
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Following variables are each are available for every axis (X, Y and Z) with their mean and standard * deviation values (appended to the name)
* BodyAccelerometerTime 
* BodyAccelerometerTimeJerk
* BodyAccelerometerFrequency
* BodyAccelerometerFrequencyJerk
* BodyGyroscopeTime
* BodyGyroscopeTimeJerk
* BodyGyroscopeFrequency
* GravityAccelerometerTime

Following variables are presented with their mean value and standard deviations.
* BodyAccelerometerTimeMagnitude
* BodyAccelerometerFrequencyMagnitude
* BodyAccelerometerJerkMagnitude
* BodyGyroscopeTimeMagnitude
* BodyGyroscopeTimeJerkMagnitude

## How to run run_analysis.R script:
* Make sure that the current working directory is set to the directory where 
all file(s) are available. e.g. ...\project\data\UCI HAR Dataset
* Simply run the script which will create the dataset file tidydata.txt
in working directory

## Transformations:
Following are salient features of the transformation performed on the original dataset.
* Read the activities and assign labels 
* Read test and training data and assign readable column names
* Merge test an darting data and add subjects and activity variables
* Select only mean and standard deviation variables for all measurements
* Group the data by activity and subject and summerize_each variable.


## Original data
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The is available for download from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
