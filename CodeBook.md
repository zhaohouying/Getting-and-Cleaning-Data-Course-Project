# CodeBook for Getting-and-Cleaning-Data-Course-Project
For assignment of Coursera course - Getting and Cleaning Data Course Project

## Description of meanbysubjectandlabel.txt

### column1: subject
This column identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### column2: lable
This column identifies the the activity name for each class label. There are six activity names:
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

### column3 to column68
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  

The column names from column3 to column68 are defined as follows (to make them more readable, dot is used to seperate each sections in the name):

* "time" denote time whole "freq" denote frequency domain
* "mean" and "std" means mean value and standard deviation accordingly
* "xdirection"/"ydirection"/"zdirection" is used to denote 3-axial signals in the X, Y and Z directions.

The value (observation) of these variables is the average of each variable for each activity and each subject.





