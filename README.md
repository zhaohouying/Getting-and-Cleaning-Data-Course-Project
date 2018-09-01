# Getting-and-Cleaning-Data-Course-Project
For assignment of Coursera course - Getting and Cleaning Data Course Project

## Purpose and Description
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## How the scripts work and how they are connected
The R script called run_analysis.R does the following:

### Step0: Pre-process
Firstly, the data folder which would contain the downloaded and process data is created.
And then the the zip file mentioned above will be downloaded and unzipped into the data folder.
Next step is to read in the data from the folder just unzipped:
*Directly under the unzipped folder, there are four files, within which the activity_labels.txt and features.txt will be read in later.
*Under the sub-folder 'train', there are three files (X_train.txt,y_train.txt,subject_train). The files are all read in as data frame.
*Under the sub-folder 'test', there are three files (X_test.txt,y_test.txt,subject_test). The files are all read in as data frame.

### Step1: Merges the training and the test sets to create one data set.
This step firstly combines the three train data frames into one train data frame and the three test data frames into one test data frame through cbind (column bind).
Then the train and test data frames are combined (stacking) together through rbind (row bind). Up to now a merged data set is created.

### Step2: Extracts only the measurements on the mean and standard deviation for each measurement. 
Directly under the unzipped folder, there is one file called features.txt. This file is read in as a data frame in this step.
Then only the rows including "mean" (meanFreq is excluded as it is actually not mean value) and "std" are greped to form a vector, as the index to extracts only the measurements on the mean and standard deviation for each measurement in the merged data set generated in step1.

### Step3: Uses descriptive activity names to name the activities in the data set
Directly under the unzipped folder, there is one file called activity_labels.txt. This file is read in as a data frame in this step.
In this data frame, there are two columns, the class labels and their activity name. While in the merged data set (after filter in step2 as well), there is only the class labels (as numbers 1 to 6). Through a merge function, the activity name is 'merged' into the data set generated in Step2.

### Step4: Appropriately labels the data set with descriptive variable names. 
In the features.txt there are descriptive variable names, which are exactly mapped to the columns of the merged data set.
At step2, we have grep only the rows including "mean" (meanFreq is excluded as it is actually not mean value) and "std" from the features.txt. to form a vector. 
With this vector, we have already filtered the merged data set. At this step we also filtered the original features dataset so that its list of descriptive variable names could be mapped to the filtered data set. To form a tidy data set, we have used 'sub' function to replace the original names with more understandble and tidy names.
Then we further merge the two filtered data frame to combine the descriptive variable names into a final merged dataset.

### Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
We use reshape2 package here to reshape the data set created in step4.
Firstly we melt the data set in step 4, with activity and subject as the id variable. Then we recast the metled data frame to creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data set generated in Step5 is exported as meanbysubjectandlabel.csv.