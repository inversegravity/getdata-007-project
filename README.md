Coursera.org "Getting and Cleaning Data" Course Project
=========================
Submitted via Github.com:  https://github.com/inversegravity/getdata-007-project

Introduction
-------------------------
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the course instructors originally obtained the data:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

NOTE: Per the assignment instructions, the actual data files used for this assignment were provided by the course instructor at the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Files Submitted for This Assignment via Github:
-------------------------
### README.md (markdown file)
This file (yes, the very file you reading now) describing how all files and scripts work and how they are connected.  

### CodeBook.md (markdown file)
Describes the variables, the data, and transformations performed to clean up the data. 

### UCI HAR Dataset (folder)
Folder containing source data:  Folder and contents were simply extracted from the .zip file provided by the instructor into the working directory.  NOTE: Absolutely no changes have been made to the files beyond extracting them. "UCI HAR Dataset" folder must be in your working directory for the run_analysis.R script to find it.

### run_analysis.R (R language script)
R language scipt containing code for processing the raw data.

**run_analysis.R** does the following:
    
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
    
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
Requires "UCI HAR Dataset" folder and contents to be in the working directory.
