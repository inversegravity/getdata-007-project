setwd("/home/keith/Documents/Coursera/JHU-getdata-007/CourseProject/UCI HAR Dataset")

#delete this if not needed
#library(data.table)

#   ...should create one R script called run_analysis.R that does the following:
#   
#   1 Merges the training and the test sets to create one data set. 
#   2 Extracts only the measurements on the mean and standard deviation for each
#   measurement. 
#   3 Uses descriptive activity names to name the activities in the data set
#   4 Appropriately labels the data set with descriptive variable names.
#   5 From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.


#define file locations and names
#UCI HAR Dataset
#features.txt -file listing raw column names for data files X_train.txt
#subject_train.txt  -file of single column of data representing subjects
#X_train.txt  -sensor data
#y_train.txt  -activity list

#read features.txt to get column names
orig_feat <- read.table("features.txt", 
					   col.names = c("col", "rawFieldName"),
					   sep = " ", 
					   comment.char = "", 
					   stringsAsFactors = FALSE
					  )


#select all fields with std or mean in the field name
#https://stackoverflow.com/questions/2193742/ways-to-read-only-select-columns-from-a-file-into-r-a-happy-medium-between-re?lq=1
# trick to read only selected columns is to specify colClass with "NULL" 
is_mean_std <- grepl("-std|-mean", orig_feat$rawFieldName, ignore.case = TRUE)
mean_std_fieldnames <- orig_feat[is_mean_std, "rawFieldName"]
mean_std_fieldnames <- gsub("-std", "Std", mean_std_fieldnames)
mean_std_fieldnames <- gsub("-mean", "Mean", mean_std_fieldnames)
mean_std_fieldnames <- gsub("Body", "", mean_std_fieldnames)
mean_std_fieldnames <- gsub("[-()]", "", mean_std_fieldnames)


mean_std_fieldnames <- sub("^t", "Time", mean_std_fieldnames)
mean_std_fieldnames <- sub("^f", "Freq", mean_std_fieldnames)
mean_std_fieldnames
#Acc accelerometer 
Gyro gyroscope
mean, Mean
std, StandardDeviation
Mag, Magnitude
Freq, Frequency
gravity, Gravity
# #acceleration signal was then separated into body and gravity acceleration
# signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth
# filter with a corner frequency of 0.3 Hz.
# 
# Subsequently, the body linear acceleration and angular velocity were derived
# in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also
# the magnitude of these three-dimensional signals were calculated using the
# Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag,
# tBodyGyroJerkMag).
# 
# Finally a Fast Fourier Transform (FFT) was applied to some of these signals
# producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
# fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain
# signals



remove:  -()
replace prefix t, Time
f, Freq



#create a vector with all "NULL" for each column in the original data
col_classes <- rep("NULL", 561)
#for columns you want to read put the field type instead of "NULL"
col_classes[is_mean_std] <- "numeric"

#read X_train.txt which contains the data
data <- read.table("train/X_train.txt", 
					colClasses = col_classes,  #where "NULL" col will not be read.
					comment.char = ""
				  )

#append X_test.txt to data using rbind()
data <- rbind(data, 
			  read.table("test/X_test.txt",
			  		     colClasses = col_classes,  #where "NULL" col will not be read.
						 comment.char = ""
                        )
			 )
colnames(data) <- mean_std_fieldnames


#read y_train.txt which contains a single column of activity codes
activities <-       read.table("train/y_train.txt", col.names = "act_code")

activities <- rbind(activities,
                    read.table("test/y_test.txt",   col.names = "act_code"))


activity_labels <- read.table("activity_labels.txt", 
                              col.names = c("act_code", "activity"),
                              stringsAsFactors = FALSE
                             )
activity  <- activity_labels[activities$act_code, "activity"]

data  <- cbind(activity, data)

View(data)



#base r solution:
#aggregate(data[,mean_std_fieldnames], 
#          by = data[c("activity")],
#          FUN=mean, na.rm=TRUE)

#library(data.table)

library(plyr)
#https://stackoverflow.com/questions/10787640/ddply-summarize-for-repeating-same-statistical-function-across-large-number-of
#ddply(iris, .(Species), numcolwise(mean))
ddply(data, .(activity), numcolwise(mean))
system.time(ddply(data, .(activity), numcolwise(mean)))
