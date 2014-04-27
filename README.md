README
------


Steps to tidy the data listed in CodeBook.md
1. download the file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. unzip the file in an empty directory, making sure to re-create the directory structure saved in the zip 
   file. More specifically, make sure to have two subdirectories: test/ and train/
3. launch R
4. make sure to set the current working directory as the directory where the data has been unzipped
5. open the file run_analysis.R and run it
   The file runs for around 15 secs - actual speed may vary and depends on the actual host system.

Results
A. File merged-ucihar.txt, containing merged data from training and the test sets, with only the measurements
   on the mean and standard deviation for each measurement. Also, the file uses descriptive activity names to
   name the activities in the data set and has appropriate labels for the descriptive activity names.
B. File tidy-ucihar.txt, containing the average of each variable for each activity and each subject.
