################################################################################
# run_analysis.R
################################################################################

################################################################################
# Required gloabl parameters (used by functions invoked from the accompanying
# readme.Rmd file).
################################################################################
# Set wd to another directory if desired, otherwise the current directory is used.
wd <-"."
# The name of the ZIP to which the data will be downlowded to.
archiveName <- "dataset.zip"
# The URL of the data archive.
archiveURL  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
archive     <- ifelse(wd==".",archiveName,paste(wd,archiveName,sep='/'))
# The names of directories/ files in the data set
root             <- "UCI HAR Dataset"
testSD           <- "test"
trainSD          <- "train"
activityLabelsFN <- "%s/activity_labels.txt"
featuresFN       <- "%s/features.txt"
subjectFN        <- "%s/%s/subject_%s.txt"
XFN              <- "%s/%s/X_%s.txt"
yFN              <- "%s/%s/y_%s.txt"
# The name of the ourput file containing the tidy dataset of averages
averagesFNN      <- "averages.txt"
averagesFN       <- ifelse(wd==".",averagesFNN,paste(wd,averagesFNN,sep='/'))

################################################################################
# Define the work as a function to avoid cluttering the top level environment
# with internal use variables.
################################################################################
run <- function() {
   ################################################################################
   # Load data
   ################################################################################
   # Load activity and column names
   activity <- getActivities(verbose=TRUE)

   # Load features and compute the vector of those that interest us
   features  <- getFeatures(verbose=TRUE)
   ifeatures <- getInterestingFeatures(features)

   # Load labels, i.e., the activity type
   train.y <- read.table.from(yFN,trainSD,vec=1)
   test.y  <- read.table.from(yFN,testSD,vec=1)

   # Load subjects
   train.s <- read.table.from(subjectFN,trainSD,vec=1)
   test.s  <- read.table.from(subjectFN,testSD,vec=1)

   # Load main data and assign readable column names
   train.X <- read.table.from(XFN,trainSD,col.names=features)
   test.X  <- read.table.from(XFN,testSD,col.names=features)

   # Merge the data and keep only the means and standard deviation columns
   msg("Merging traning and test datasets")
   X <- rbind(train.X,test.X)[,ifeatures]

   msg("Adding columns for activites and subjects")
   X <- cbind(
      # Add a column which is the descriptive name of the activity
      Activity=activity[c(train.y,test.y)],
      # ... and a column which is the subject number
      Subject =c(train.s,test.s),
      # ... at the left (i.e., before the other columns)
      X)

   # The following is the final result dataset. It contains the averages of
   # all variables aggregated by activity and subject number.
   # The first 12 rows and first 5 columns will look like this.
#               Activity Subject tBodyAcc.mean.X tBodyAcc.mean.Y tBodyAcc.mean.Z
#   1             Laying       1       0.2215982    -0.040513953      -0.1132036
#   2            Sitting       1       0.2612376    -0.001308288      -0.1045442
#   3           Standing       1       0.2789176    -0.016137590      -0.1106018
#   4            Walking       1       0.2773308    -0.017383819      -0.1111481
#   5  WalkingDownstairs       1       0.2891883    -0.009918505      -0.1075662
#   6    WalkingUpstairs       1       0.2554617    -0.023953149      -0.0973020
#   7             Laying       2       0.2813734    -0.018158740      -0.1072456
#   8            Sitting       2       0.2770874    -0.015687994      -0.1092183
#   9           Standing       2       0.2779115    -0.018420827      -0.1059085
#   10           Walking       2       0.2764266    -0.018594920      -0.1055004
#   11 WalkingDownstairs       2       0.2776153    -0.022661416      -0.1168129
#   12   WalkingUpstairs       2       0.2471648    -0.021412113      -0.1525139

   msg("Computing averages of all variables aggregated by activity and subject")
   averages <- aggregate(X[,3:ncol(X)],
                     list(Activity=X$Activity,Subject=X$Subject),mean)

   # Finally, save the result to a file.
   msg("Writting result file to %s",averagesFN)
   write.table(averages,file=averagesFN)
}

################################################################################
# Read a table from the zip file and return it as a data.frame.
# But, if vec is non-zero, return that column as a vector
################################################################################
read.table.from <- function(fn,sd1="",sd2=sd1,
                            r=root,zip=archive,verbose=TRUE,vec=0,...) {
   if (!file.exists(archive)) {
      msg("Downloading data archive ...")
      rc<-download.file(archiveURL,archive,method="curl",extra="-#")
      if (rc) stop(sprintf("Problem downloading data, RC=%d",rc))
   }
   f <- sprintf(fn,r,sd1,sd2)
   if (verbose) msg("Loading %s:/%s",zip,f)
   df<-read.table(unz(zip,f),...)
   if (vec) as.vector(df[[vec]]) else df
}

################################################################################
# Display a message to the console.
# The first arg is a sprintf format, the rest are insertions.
################################################################################
msg <- function(fmt,...) {
   cat(sprintf(paste0(fmt,'\n'),...))
   flush.console()
}

################################################################################
# Get the activity names from the data set
################################################################################
getActivities <- function(verbose=FALSE) {
   # Load activities
   activity <- read.table.from(activityLabelsFN,
                     colClasses=c("integer","character"),verbose=verbose,vec=2)
   # Normalize, e.g., WALKING_UPSTAIRS -> WalkingUpstairs
   sapply(activity,
         function(n) gsub("(^|_)(.)","\\U\\2\\E",tolower(n),perl=T),USE.NAMES=F)
}

################################################################################
# Return the full set of features
################################################################################
getFeatures <- function(verbose=FALSE) {
   # Load features
   features <- read.table.from(featuresFN,
                     colClasses=c("integer","character"),verbose=verbose,vec=2)
   # Normalize them be able to serve as column names a bit prettier than the default
   # (remove trailing periods, and collapse multiple periods into one)
   sub("\\.$","",gsub("\\.+",".",make.names(features)))
}

################################################################################
# Compute the interesting set of features form the full set
# Those are the ones whose names contain either 'mean' or 'std' at word boundaries
################################################################################
getInterestingFeatures <- function(features=getFeatures()) {
   features[grepl("\\b(mean|std)\\b",features)]
}


msg('Type "run()" to run the analysis')
