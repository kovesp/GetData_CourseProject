

Code Book
=========

This code book lists all variables (columns) of the results of the analysis 
described in the *README.md* file. For a detailed description the reader is
referred to the *README.txt* and *features_info.txt* files of the original researchers
(these are included in the submission).

The data set is located in the *averages.txt* file which contains 
**180** rows of **68** columns.
Note: **180** = **30** activities X **6** subjects.

The columns correspond to variables while the rows are observations. The data in the table are the averages of the original retained variables by the activity type and subject.

The first 12 rows and first 5 columns look like this:


|Activity          | Subject| tBodyAcc.mean.X| tBodyAcc.mean.Y| tBodyAcc.mean.Z|
|:-----------------|-------:|---------------:|---------------:|---------------:|
|Laying            |       1|          0.2216|         -0.0405|         -0.1132|
|Sitting           |       1|          0.2612|         -0.0013|         -0.1045|
|Standing          |       1|          0.2789|         -0.0161|         -0.1106|
|Walking           |       1|          0.2773|         -0.0174|         -0.1111|
|WalkingDownstairs |       1|          0.2892|         -0.0099|         -0.1076|
|WalkingUpstairs   |       1|          0.2555|         -0.0240|         -0.0973|
|Laying            |       2|          0.2814|         -0.0182|         -0.1072|
|Sitting           |       2|          0.2771|         -0.0157|         -0.1092|
|Standing          |       2|          0.2779|         -0.0184|         -0.1059|
|Walking           |       2|          0.2764|         -0.0186|         -0.1055|
|WalkingDownstairs |       2|          0.2776|         -0.0227|         -0.1168|
|WalkingUpstairs   |       2|          0.2472|         -0.0214|         -0.1525|

So for example, in this extract the value **0.2216** is the average of the variable **tBodyAcc.mean.X** for the activity **Laying**
for subject **#1**.

The first two columns are

Column | Variable | Description
------ | -------- | ----------------
1      | Activity | The descriptive name of the activity being performed.
2      | Subject  | The number of the subject performing the activity.

The subsequent columns are


|Column |Variable                  |
|:------|:-------------------------|
|3      |tBodyAcc.mean.X           |
|4      |tBodyAcc.mean.Y           |
|5      |tBodyAcc.mean.Z           |
|6      |tBodyAcc.std.X            |
|7      |tBodyAcc.std.Y            |
|8      |tBodyAcc.std.Z            |
|9      |tGravityAcc.mean.X        |
|10     |tGravityAcc.mean.Y        |
|11     |tGravityAcc.mean.Z        |
|12     |tGravityAcc.std.X         |
|13     |tGravityAcc.std.Y         |
|14     |tGravityAcc.std.Z         |
|15     |tBodyAccJerk.mean.X       |
|16     |tBodyAccJerk.mean.Y       |
|17     |tBodyAccJerk.mean.Z       |
|18     |tBodyAccJerk.std.X        |
|19     |tBodyAccJerk.std.Y        |
|20     |tBodyAccJerk.std.Z        |
|21     |tBodyGyro.mean.X          |
|22     |tBodyGyro.mean.Y          |
|23     |tBodyGyro.mean.Z          |
|24     |tBodyGyro.std.X           |
|25     |tBodyGyro.std.Y           |
|26     |tBodyGyro.std.Z           |
|27     |tBodyGyroJerk.mean.X      |
|28     |tBodyGyroJerk.mean.Y      |
|29     |tBodyGyroJerk.mean.Z      |
|30     |tBodyGyroJerk.std.X       |
|31     |tBodyGyroJerk.std.Y       |
|32     |tBodyGyroJerk.std.Z       |
|33     |tBodyAccMag.mean          |
|34     |tBodyAccMag.std           |
|35     |tGravityAccMag.mean       |
|36     |tGravityAccMag.std        |
|37     |tBodyAccJerkMag.mean      |
|38     |tBodyAccJerkMag.std       |
|39     |tBodyGyroMag.mean         |
|40     |tBodyGyroMag.std          |
|41     |tBodyGyroJerkMag.mean     |
|42     |tBodyGyroJerkMag.std      |
|43     |fBodyAcc.mean.X           |
|44     |fBodyAcc.mean.Y           |
|45     |fBodyAcc.mean.Z           |
|46     |fBodyAcc.std.X            |
|47     |fBodyAcc.std.Y            |
|48     |fBodyAcc.std.Z            |
|49     |fBodyAccJerk.mean.X       |
|50     |fBodyAccJerk.mean.Y       |
|51     |fBodyAccJerk.mean.Z       |
|52     |fBodyAccJerk.std.X        |
|53     |fBodyAccJerk.std.Y        |
|54     |fBodyAccJerk.std.Z        |
|55     |fBodyGyro.mean.X          |
|56     |fBodyGyro.mean.Y          |
|57     |fBodyGyro.mean.Z          |
|58     |fBodyGyro.std.X           |
|59     |fBodyGyro.std.Y           |
|60     |fBodyGyro.std.Z           |
|61     |fBodyAccMag.mean          |
|62     |fBodyAccMag.std           |
|63     |fBodyBodyAccJerkMag.mean  |
|64     |fBodyBodyAccJerkMag.std   |
|65     |fBodyBodyGyroMag.mean     |
|66     |fBodyBodyGyroMag.std      |
|67     |fBodyBodyGyroJerkMag.mean |
|68     |fBodyBodyGyroJerkMag.std  |

The above table is an exhaustive list of all columns. The following two tables
give a more compact list of the **26** variables for
which data is given in the file.

The following 17 variables have 6 variants
(...*stat*.*coord*, *stat*=mean | std, *coord* = X | Y | Z):


|N  |Variable             |
|:--|:--------------------|
|1  |tBodyAcc             |
|2  |tGravityAcc          |
|3  |tBodyAccJerk         |
|4  |tBodyGyro            |
|5  |tBodyGyroJerk        |
|6  |tBodyAccMag          |
|7  |tGravityAccMag       |
|8  |tBodyAccJerkMag      |
|9  |tBodyGyroMag         |
|10 |tBodyGyroJerkMag     |
|11 |fBodyAcc             |
|12 |fBodyAccJerk         |
|13 |fBodyGyro            |
|14 |fBodyAccMag          |
|15 |fBodyBodyAccJerkMag  |
|16 |fBodyBodyGyroMag     |
|17 |fBodyBodyGyroJerkMag |

The following 9 variables have 2 variants (...*stat*, *stat*=mean | std):


|N  |Variable             |
|:--|:--------------------|
|18 |tBodyAccMag          |
|19 |tGravityAccMag       |
|20 |tBodyAccJerkMag      |
|21 |tBodyGyroMag         |
|22 |tBodyGyroJerkMag     |
|23 |fBodyAccMag          |
|24 |fBodyBodyAccJerkMag  |
|25 |fBodyBodyGyroMag     |
|26 |fBodyBodyGyroJerkMag |


