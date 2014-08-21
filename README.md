


# Introduction
This project is a demonstration of obtaining raw (or in this case near-raw) data
and trasfroming it into a more readily usable form. The data itself relates to
wearable computing. To quote from the problem statement:

>One of the most exciting areas in all of data science right now is wearable
>computing --- see for example
>[this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).
>Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most
>advanced algorithms to attract new users. The data linked to from the course
>website represent data collected from the accelerometers from the
>Samsung Galaxy S smartphone. A full description is available at the site where
>the data was obtained: 
>

>>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## Data Characterization
The data set contains accelerometer and gyroscope sensor readings collected from
30 experiment participants. The participants were measured on the following types
of activities: 

              Activity
1 Walking             
2 WalkingUpstairs     
3 WalkingDownstairs   
4 Sitting             
5 Standing            
6 Laying              

The following simplified description is derived from the description of features
provided with the data (cf., *features_info.txt*):

The features selected for this database come from the accelerometer and gyroscope
3-axial raw signals. These time domain signals
(prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then various filters were applied and the acceleration signal was separated
into body and gravity acceleration signals as well as Jerk signals. The magnitude of
these three-dimensional signals were then calculated. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing frequency domain signals(note the 'f' prefix to indicate this). 

In summary, these signals were used to estimate variables of the feature vector
for each pattern: '-XYZ' is used to denote 3-axial signals in the
X, Y and Z directions.

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

A set of variables were then estimated from these signals including the **mean**
and **standard deviation**---these are the only ones we are going to consider
in this project.

The original researchers separated the data into training and test sets with a
71%/29% breakdown. Making this breakdown is standard procedure
in machine learning projects.

# Project Goals

1. Combine the training and test sets into a single set.
2. Extract the means and standard deviations.
3. Add descriptive activity names
4. Label the dataset with descriptive variable names
5. Create a new dataset with the average of each variable for each activity and
   each subject.
   
# Solution Flow

1. Download the zip file containing the data from the supplied URL to the current
   directory (this is only done on the first run)
2. Load activity and feature (column) names from *activity_labels.txt* and *features.txt* as vectors.
 + This and subsequent loads are done directly from the zip file without unzipping into files.
 + Activity names are normalize as per above.
 + Features names are normalized to be usable as column names.
3. A vector of names of interesting features is computed. These are names
   which contain either *mean* or *std* at word boundaries
4. Data labels corresponding to each row of the data are loaded from
   *train/y_train.txt* and *test/y_test.txt* as vectors.
   The labels are the activity numbers that will be mapped to activity names.
5. The subject numbers corresponding to each row of the data are loaded from
   *train/subject_train.txt* and *test/subject_test.txt* as vectors.
6. The main data is loaded as data.frames from
   *train/X_train.txt* and *test/X_test.txt*. During the load the feature names
   
7. The two data frames are combined into a single data.frame containing both
   training and test data set.
8. Using the intersting names computed in step 3, the data is reduced by
   keeping only these columns and discarding the rest.
9. The activity names (utilizing the results of steps 2 and 4) and the subject
   numbers (utilizing the results of step 5) are prepended to the data set
   as two new columns.
10. Now the final desired data set of all interesting variables averaged by
    activity and subject can be computed by aggrgating over the first two
    columns.
11. Finally the result is written to the file *averages.txt* in a form that
    can be loaded by **read.table**. The column names are included in the file.
    
# Using the Code
1. source("run_analysis.R")
2. run()

# Appendix

## Files

The following files are contained in the submission:

File Name        | Description
---------------- | --------------------------------------------
README.md        | This file.
README.Rmd       | The Rmd source of this file.
README.html      | The HTML version of this fie.
codeBook.md      | The code book describing the tidy data.
codeBook.Rmd     | The Rmd sourse of the code book.
codeBook.html    | The HTML version of the code book.
README.txt       | The original README extracted from the data set zip file.
features_info.txt| The original feature descripitons extracted from the data set zip file.
run_analysis.R   | Main script to to load the data, clean it and produce the output.
averages.txt     | Result dataset of intersting variables averaged by activity and subject.

## Input Data Set Structure

The input data set is contained in a zip file. The root of the zip file contains
a single directory---*UCI HAR Dataset*---with the following files and sub-directories:


File Name           | Description
------------------- | ----------------------------------
activity_labels.txt | Maps activity codes to descriptive names.
features.txt        | Maps the 561 feature numbers (columns) to names.
features_info.txt   | Descripiton of the features.
README.txt          | Overall description of the dataset
train/              | The subdirectory of training data 
test/               | The subdirectory of test data

The two subdirectories contain the following files and directories:

File Name               | Description | Size (***sd***=train) | Size (***sd***=test)
----------------------- | ----------- | --------------------- | --------------------
X_***sd***.txt          | The collected data. | 7352x561 | 2947x561
y_***sd***.txt          | The data labels. | 7352x1 | 2947x1
subject_***sd***.txt    | The subject number for each observation. | 7352x1 | 2947x1
Inertial Signals/       | A subdirectory of raw data which we ignore. |                 |
