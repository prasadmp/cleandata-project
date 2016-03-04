# Tidy Dataset for the submission of 'Getting and Cleaning Data' Course Project
Version 1.0

## Background
This project uses'Human Activity Recognition' data collected from Samsung Galaxy
smartphone. 
The data captures experiments performed with 30 participants (subjects) doing 6 activities. 

 The original data is transformed to create a tidy dataset that represents 
mean and standard deviation values. This data set is further made tidy independently
to calculate mean of all variables per subject(participant user in the study) and per
activity they performed to collect data.

## The Dataset contents
* Dataset includes variables that capture mean value and standard deviation for
  data collected for participant's all activities. (79 in number)
* The variables are mean value and standard deviations of the readings for Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration and  Triaxial Angular velocity from the gyroscope.
*  The dataset groups the observations per activity per subject.
* Mean value of all the variables are calculated as per the above mentioned grouping.

## File(s) in repository
* "CodeBook.md" : Description of dataset. It also includes information about original dataset used.
* "RunAnalysis.R" : R transformation Script that generates and saves tidy dataset from the original data made available. 
* README.md : This file
* tidydata.txt

## Note:
* For more information on original data check pointers in the CodeBook.md
