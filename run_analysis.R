#Create the data folder which would contain the downloaded and process data
if(!file.exists("data")){
      dir.create("data")
}
setwd("./data")
getwd()

#Download and unzip the data
print("Please wait for the zip file to be downloaded......")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="./dataset.zip")
unzip(zipfile = "./dataset.zip",exdir = "./data")


#Read in the data
Xtraindata <- "./data/UCI HAR Dataset/train/X_train.txt"
ytraindata <- "./data/UCI HAR Dataset/train/y_train.txt"
subjecttraindata <- "./data/UCI HAR Dataset/train/subject_train.txt"
Xtestdata <- "./data/UCI HAR Dataset/test/X_test.txt"
ytestdata <- "./data/UCI HAR Dataset/test/y_test.txt"
subjecttestdata <- "./data/UCI HAR Dataset/test/subject_test.txt"
Xtrain <- read.table(Xtraindata)
ytrain <- read.table(ytraindata)
names(ytrain) <- "labelnum"
subjecttrain <- read.table(subjecttraindata)
names(subjecttrain) <- "subject"
Xtest <- read.table(Xtestdata)
ytest <- read.table(ytestdata)
names(ytest) <- "labelnum"
subjecttest <- read.table(subjecttestdata)
names(subjecttest) <- "subject"

#Step1: Merges the training and the test sets to create one data set.
traindata <- cbind(Xtrain,subjecttrain,ytrain)
testdata <- cbind(Xtest,subjecttest,ytest)
merged <- rbind(traindata,testdata)

#Step2: Extracts only the measurements on the mean and standard deviation for each measurement. 
featuresdata <- "./data/UCI HAR Dataset/features.txt"
features <- read.table(featuresdata)
selected <- grep("mean[^F]|std",features$V2)
selecteddata <- merged[,c(selected,dim(merged)[2]-1,dim(merged)[2])]

#Step3: Uses descriptive activity names to name the activities in the data set
activitydata <- "./data/UCI HAR Dataset/activity_labels.txt"
activity <- read.table(activitydata)
names(activity) <- c("labelnum","label")
activitynamed <- merge(selecteddata,activity,by="labelnum")[,-1]

#Step4: Appropriately labels the data set with descriptive variable names. 
selectedfeature <- features[selected,]

selectedfeature$V2 <- sub("^f","freq.",selectedfeature$V2) 
selectedfeature$V2 <- sub("^t","time.",selectedfeature$V2)
selectedfeature$V2 <- sub("\\(\\)","",selectedfeature$V2) 
selectedfeature$V2 <- gsub("-",".",selectedfeature$V2) 
selectedfeature$V2 <- sub("X$","xdirection",selectedfeature$V2) 
selectedfeature$V2 <- sub("Y$","ydirection",selectedfeature$V2) 
selectedfeature$V2 <- sub("Z$","zdirection",selectedfeature$V2) 
selectedfeature$V2 <- tolower(selectedfeature$V2)

rowname <- c(selectedfeature$V2,"subject","label")
names(activitynamed) <- rowname
labeled <- cbind(activitynamed[dim(activitynamed)[2]],activitynamed[dim(activitynamed)[2]-1],activitynamed)[-c(69:70)] 

#Step5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
melted <- melt(labeled,id.vars = c("subject","label"))
groupedmean <- dcast(melted,subject+label~variable,mean)
write.table(groupedmean,file="../meanbysubjectandlabel.txt",row.names = FALSE)
print("meanbysubjectandlabel.txt is the data set with the average of each variable for each activity and each subject.")

setwd("../")
