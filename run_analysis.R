# Set the base directory as the directory where "UCI HAR Dataset.zip" has
# been extracted.
# The script expects to find the test data in the subdirectory "test" and
# the training data in the subdirectory "train". All other files should be
# in the base directory.
# The script will attempt to open the following files:
#   activity_labels.txt
#   features.txt
#   test/subject_test.txt
#   test/X_test.txt
#   test/y_test.txt
#   train/subject_train.txt
#   train/X_train.txt
#   train/y_train.txt
setwd( "C:\\Users\\giorgio\\workspace\\CleanData\\UCI HAR Dataset" )

# Read train and test files containing the feature vectors and merge them
# [requirement #1 - also note that merging for subject and activity is
# performed later].
xtest  <- read.table( file = "test/X_test.txt" , header = FALSE )
xtrain <- read.table( file = "train/X_train.txt", header = FALSE )
uci.har.df <- rbind( xtest, xtrain )
rm( "xtest", "xtrain" )

# Read the names of the features from the file "features.txt" and attach
# them as dataframe names [requirement #4].
features <- read.table( file = "features.txt", header = FALSE )[,2]
colnames( uci.har.df ) <- features

# Find the indexes with with either "std" or "mean" and only keep such
# columns [requirement #2].
keep_cols <- c( grep( "std\\(\\)", features ), grep( "mean\\(\\)", features ) )
uci.har.df <- uci.har.df[,keep_cols]

# Read subject id and attach them to features dataframe.
xtest  <- read.table( file = "test/subject_test.txt" , header = FALSE )
xtrain <- read.table( file = "train/subject_train.txt", header = FALSE )
xtest <- rbind( xtest, xtrain )
uci.har.df$subject <- as.numeric( xtest[,1] )

# Read both activity id and the names for the activities - and merge all
# of them. Once done, attach the names (as new column) in the features
# dataframe [requirement #3]
xtest  <- read.table( file = "test/y_test.txt"  , header = FALSE )
xtrain <- read.table( file = "train/y_train.txt", header = FALSE )
xtest <- rbind( xtest, xtrain )
activity.df <- read.table( file = "activity_labels.txt", header = FALSE, stringsAsFactors = FALSE )
for ( x in 1:nrow( xtest ) ) {
    xtest$activity[x] = activity.df[activity.df$V1==xtest$V1[x],]$V2[1]
}
uci.har.df$activity <- xtest$activity

# Reverse the order of the column, so to start with activity and subject and then
# write the new features dataframe.
uci.har.df <- uci.har.df[c(length(names(uci.har.df)):1)]
write.table( uci.har.df, file = "merged-ucihar.txt", row.names = FALSE )

# Cycle through all activities and subjects
tidy.df <- NULL
newrow <- uci.har.df[1,]
for ( a in levels( as.factor( uci.har.df$activity ) ) ) {
    uci.act = uci.har.df[uci.har.df$activity == a,]
    for ( s in levels( as.factor( uci.act$subject ) ) ) {
        uci.act.subj = uci.act[uci.act$subject == s,]
    
        # Calculate a new record with the mean of all numeric columns
        # for this specific couple of subject and activity
        if ( nrow( uci.act.subj ) > 0 ) {
            newrow$subject = as.numeric( s )
            newrow$activity = a
            for ( v in names( uci.act.subj ) ) {
                if ( ( v != "activity" ) & ( v != "subject" ) ) {
                    newrow[[v]] <- mean( uci.act.subj[[v]], na.rm = TRUE )
                }
            }
            if ( length( tidy.df ) == 0 ) {
                tidy.df = newrow
            } else {
                tidy.df <- rbind( tidy.df, newrow )
            }
        }
        
    }
}

# Write the tidy dataframe.
write.table( tidy.df, file = "tidy-ucihar.txt", row.names = FALSE )

