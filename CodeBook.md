Code Book
=========================


**Regarding "tidy data" requirements for variable names**: Please consider Community TA Trent Baur's clarification that we do NOT need to completely spell out words in variable names:
https://class.coursera.org/getdata-007/forum/thread?thread_id=249#comment-829

    ...
    Like naming conventions and coding standards, tidy data is rather subjective. There is no "specific" expectation in the grading process so as long as you describe/justify the changes you are making to the column names, you should receive full marks. The idea is to improve the column labels.
    
    Given it's subjective nature, my personal style would be to avoid excessively long column names. While changing t and f to Time and Frequency makes column names more more readable, it can cause some downstream issues when viewing the file in Excel or via head() because fewer columns will appear on the page. But I also hate cryptic abbreviations, so I see your motivation.
    
    I only bring all of this up to highlight how subjective and non-specific these choices can be. All you can do is decide on your rationale and explain it in your codebook.

**Regarding which mean and standard deviation columns to import**:  Please also consider Community TA David Hood's clarification 
https://class.coursera.org/getdata-007/forum/thread?thread_id=49#post-114
from midway down his post:
    
    * what columns are measurements on the mean and standard deviation
    
    Based on column names in the features is an open question as to is the the entries that include mean() and std() at the end, or does it include entries with mean in an earlier part of the name as well. There are no specific marking critieria on the number of columns. It is up to you to make a decision and explain what you did to the data. Make it easy for people to give you marks by explaining your reasoning.

Variables and Summaries
-------------------------
Note: All data expressed below are normalized, therefore have no units. 

--> Above per Community TA Wendal Hope's comments:
https://class.coursera.org/getdata-007/forum/thread?thread_id=201#comment-748

    About the units, you will find the following line in the readme.txt that accompanied the data
    
    - Features are normalized and bounded within [-1,1]
    
    When you see normalized data, it has no units.


Mean and Standard Deviation columns were chosen based on including all
columns where either "-mean" or "-std" appeared in the original field name.
The course instructions did not state to exlcude "meanFreq", therefore,
those fields have been included.  Also, I decided to err on the side of 
caution and include them as having "gone further than needed" is not wrong
but "missing a required field" would certainly lose points.

Field Renaming Rules
----------------------
*Special characters "-", "(" and ")" were removed from the original field names.

*The prifix "t" in the original field names was replaced with prefix "Time".

*The prifix "f " in the original field names was replaced with prefix "Freq" as short for Frequency.

*NOTE: See last section "Complete list of renamed fields" for exact translation of names for numeric columns from original.

### Columns in output file "avg_by_activity.txt"


NOTE: After running run_analysis.R, the output file "avg_by_activity.txt"" may be read back into R if required using read.table, for example:

> avg_by_act <- read.table("avg_by_activity.txt")

Columns in the "avg_by_activity.txt" file are as follows
* activity (column position 1):  activity type, being one of:
    * LAYING
    * SITTING
    * STANDING
    * WALKING
    * WALKING_DOWNSTAIRS
    * WALKING_UPSTAIRS

...emaining columns (column positions 2-80) in "avg_by_activity.txt" were renamed from the original source as follows:

* "tBodyAcc-mean()-X" was renamed to:    TimeAccMeanX
* "tBodyAcc-mean()-Y" was renamed to:	TimeAccMeanY
* "tBodyAcc-mean()-Z" was renamed to:	TimeAccMeanZ
* "tBodyAcc-std()-X" was renamed to:	TimeAccStdX
* "tBodyAcc-std()-Y" was renamed to:	TimeAccStdY
* "tBodyAcc-std()-Z" was renamed to:	TimeAccStdZ
* "tGravityAcc-mean()-X" was renamed to:	TimeGravityAccMeanX
* "tGravityAcc-mean()-Y" was renamed to:	TimeGravityAccMeanY
* "tGravityAcc-mean()-Z" was renamed to:	TimeGravityAccMeanZ
* "tGravityAcc-std()-X" was renamed to:	TimeGravityAccStdX
* "tGravityAcc-std()-Y" was renamed to:	TimeGravityAccStdY
* "tGravityAcc-std()-Z" was renamed to:	TimeGravityAccStdZ
* "tBodyAccJerk-mean()-X" was renamed to:	TimeAccJerkMeanX
* "tBodyAccJerk-mean()-Y" was renamed to:	TimeAccJerkMeanY
* "tBodyAccJerk-mean()-Z" was renamed to:	TimeAccJerkMeanZ
* "tBodyAccJerk-std()-X" was renamed to:	TimeAccJerkStdX
* "tBodyAccJerk-std()-Y" was renamed to:	TimeAccJerkStdY
* "tBodyAccJerk-std()-Z" was renamed to:	TimeAccJerkStdZ
* "tBodyGyro-mean()-X" was renamed to:	TimeGyroMeanX
* "tBodyGyro-mean()-Y" was renamed to:	TimeGyroMeanY
* "tBodyGyro-mean()-Z" was renamed to:	TimeGyroMeanZ
* "tBodyGyro-std()-X" was renamed to:	TimeGyroStdX
* "tBodyGyro-std()-Y" was renamed to:	TimeGyroStdY
* "tBodyGyro-std()-Z" was renamed to:	TimeGyroStdZ
* "tBodyGyroJerk-mean()-X" was renamed to:	TimeGyroJerkMeanX
* "tBodyGyroJerk-mean()-Y" was renamed to:	TimeGyroJerkMeanY
* "tBodyGyroJerk-mean()-Z" was renamed to:	TimeGyroJerkMeanZ
* "tBodyGyroJerk-std()-X" was renamed to:	TimeGyroJerkStdX
* "tBodyGyroJerk-std()-Y" was renamed to:	TimeGyroJerkStdY
* "tBodyGyroJerk-std()-Z" was renamed to:	TimeGyroJerkStdZ
* "tBodyAccMag-mean()" was renamed to:	TimeAccMagMean
* "tBodyAccMag-std()" was renamed to:	TimeAccMagStd
* "tGravityAccMag-mean()" was renamed to:	TimeGravityAccMagMean
* "tGravityAccMag-std()" was renamed to:	TimeGravityAccMagStd
* "tBodyAccJerkMag-mean()" was renamed to:	TimeAccJerkMagMean
* "tBodyAccJerkMag-std()" was renamed to:	TimeAccJerkMagStd
* "tBodyGyroMag-mean()" was renamed to:	TimeGyroMagMean
* "tBodyGyroMag-std()" was renamed to:	TimeGyroMagStd
* "tBodyGyroJerkMag-mean()" was renamed to:	TimeGyroJerkMagMean
* "tBodyGyroJerkMag-std()" was renamed to:	TimeGyroJerkMagStd
* "fBodyAcc-mean()-X" was renamed to:	FreqAccMeanX
* "fBodyAcc-mean()-Y" was renamed to:	FreqAccMeanY
* "fBodyAcc-mean()-Z" was renamed to:	FreqAccMeanZ
* "fBodyAcc-std()-X" was renamed to:	FreqAccStdX
* "fBodyAcc-std()-Y" was renamed to:	FreqAccStdY
* "fBodyAcc-std()-Z" was renamed to:	FreqAccStdZ
* "fBodyAcc-meanFreq()-X" was renamed to:	FreqAccMeanFreqX
* "fBodyAcc-meanFreq()-Y" was renamed to:	FreqAccMeanFreqY
* "fBodyAcc-meanFreq()-Z" was renamed to:	FreqAccMeanFreqZ
* "fBodyAccJerk-mean()-X" was renamed to:	FreqAccJerkMeanX
* "fBodyAccJerk-mean()-Y" was renamed to:	FreqAccJerkMeanY
* "fBodyAccJerk-mean()-Z" was renamed to:	FreqAccJerkMeanZ
* "fBodyAccJerk-std()-X" was renamed to:	FreqAccJerkStdX
* "fBodyAccJerk-std()-Y" was renamed to:	FreqAccJerkStdY
* "fBodyAccJerk-std()-Z" was renamed to:	FreqAccJerkStdZ
* "fBodyAccJerk-meanFreq()-X" was renamed to:	FreqAccJerkMeanFreqX
* "fBodyAccJerk-meanFreq()-Y" was renamed to:	FreqAccJerkMeanFreqY
* "fBodyAccJerk-meanFreq()-Z" was renamed to:	FreqAccJerkMeanFreqZ
* "fBodyGyro-mean()-X" was renamed to:	FreqGyroMeanX
* "fBodyGyro-mean()-Y" was renamed to:	FreqGyroMeanY
* "fBodyGyro-mean()-Z" was renamed to:	FreqGyroMeanZ
* "fBodyGyro-std()-X" was renamed to:	FreqGyroStdX
* "fBodyGyro-std()-Y" was renamed to:	FreqGyroStdY
* "fBodyGyro-std()-Z" was renamed to:	FreqGyroStdZ
* "fBodyGyro-meanFreq()-X" was renamed to:	FreqGyroMeanFreqX
* "fBodyGyro-meanFreq()-Y" was renamed to:	FreqGyroMeanFreqY
* "fBodyGyro-meanFreq()-Z" was renamed to:	FreqGyroMeanFreqZ
* "fBodyAccMag-mean()" was renamed to:	FreqAccMagMean
* "fBodyAccMag-std()" was renamed to:	FreqAccMagStd
* "fBodyAccMag-meanFreq()" was renamed to:	FreqAccMagMeanFreq
* "fBodyBodyAccJerkMag-mean()" was renamed to:	FreqAccJerkMagMean
* "fBodyBodyAccJerkMag-std()" was renamed to:	FreqAccJerkMagStd
* "fBodyBodyAccJerkMag-meanFreq()" was renamed to:	FreqAccJerkMagMeanFreq
* "fBodyBodyGyroMag-mean()" was renamed to:	FreqGyroMagMean
* "fBodyBodyGyroMag-std()" was renamed to:	FreqGyroMagStd
* "fBodyBodyGyroMag-meanFreq()" was renamed to:	FreqGyroMagMeanFreq
* "fBodyBodyGyroJerkMag-mean()" was renamed to:	FreqGyroJerkMagMean
* "fBodyBodyGyroJerkMag-std()" was renamed to:	FreqGyroJerkMagStd
* "fBodyBodyGyroJerkMag-meanFreq()" was renamed to:	FreqGyroJerkMagMeanFreq
