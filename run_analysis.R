# Requires:  "UCI HAR Dataset" folder and enclosed source files to be in the
#   working directory.
#   
# Logic:
#   1 Merges the training and the test sets to create one data set. 
#   2 Extracts only the measurements on the mean and standard deviation for each
#   measurement. 
#   3 Uses descriptive activity names to name the activities in the data set
#   4 Appropriately labels the data set with descriptive variable names.
#      - NOTE: Please see CodeBook.md for reasoning on choice of names.
#   5 From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.
#      - NOTE: Considering "phone sensor data" as a single kind of data, we only
#              need one output file to be "tidy data". 

#read features.txt to get original column names (AKA 'features'):
orig_feat <- read.table("UCI HAR Dataset/features.txt", 
					   col.names = c("col", "rawFieldName"),
					   sep = " ", 
					   comment.char = "", 
					   stringsAsFactors = FALSE
					  )


#create a TRUE/FALSE vector with TRUE for each orig_feat containing "-std" or "-mean"
is_mean_std <- grepl("-std|-mean", orig_feat$rawFieldName, ignore.case = TRUE)

#make a vector containing just the column names we are keeping:
mean_std_fieldnames <- orig_feat[is_mean_std, "rawFieldName"]

mean_std_fieldnames <- gsub("-std", "Std", mean_std_fieldnames)
mean_std_fieldnames <- gsub("-mean", "Mean", mean_std_fieldnames)
#removing the word "Body" (as really not needed):
mean_std_fieldnames <- gsub("Body", "", mean_std_fieldnames)
#removing special characters:
mean_std_fieldnames <- gsub("[-()]", "", mean_std_fieldnames)

#substitute "Time" or "Freq" at front:
mean_std_fieldnames <- sub("^t", "Time", mean_std_fieldnames)
mean_std_fieldnames <- sub("^f", "Freq", mean_std_fieldnames)

#show me the money, er, I mean the cleaned up variable names:
mean_std_fieldnames


#TRICK HERE to read in JUST selected columns from a file, based on example from:
#https://stackoverflow.com/questions/2193742/ways-to-read-only-select-columns-from-a-file-into-r-a-happy-medium-between-re?lq=1

#TRICK IS to 1) create a vector with all "NULL" for each column in the original data
col_classes <- rep("NULL", 561) 
#TRICK IS to 2) for columns you want to read put the actual field type instead of "NULL"
col_classes[is_mean_std] <- "numeric"

#read X_train.txt which contains the DF: columns where col_classes == "NULL" will be 
#     skipped...meaning not read into memory at all == MUCH FASTER + less memory!
DF <- read.table("UCI HAR Dataset/train/X_train.txt", 
					colClasses = col_classes,  #where "NULL" col will not be read.
					comment.char = ""
				  )

#append X_test.txt to DF using rbind()
DF <- rbind(DF, 
			  read.table("UCI HAR Dataset/test/X_test.txt",
			  		     colClasses = col_classes,  #where "NULL" col will not be read.
						 comment.char = ""
                        )
			 )

#assign variable (AKA field) names to columns:
colnames(DF) <- mean_std_fieldnames


#read y_train.txt which contains a single column of activity codes
activities <-       read.table("UCI HAR Dataset/train/y_train.txt", col.names = "act_code")

activities <- rbind(activities,
                    read.table("UCI HAR Dataset/test/y_test.txt",   col.names = "act_code"))


activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              col.names = c("act_code", "activity"),
                              stringsAsFactors = FALSE
                             )
activity  <- activity_labels[activities$act_code, "activity"]

#add our descriptive activities as row names:
DF  <- cbind(activity, DF)

#show result:
#View(DF)

#Finally, complete task 5: create average for each column grouped by "activity"
# this becomes easy using plyr, as explained in example:
#https://stackoverflow.com/questions/10787640/ddply-summarize-for-repeating-same-statistical-function-across-large-number-of
library(plyr)
# following works because we want a mean for every numeric column in data
avg_by_activity <- ddply(DF, .(activity), numcolwise(mean))

#write to output file
write.table(avg_by_activity, file = "avg_by_activity.txt", row.names = FALSE)
