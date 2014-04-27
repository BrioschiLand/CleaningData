Code Book
---------

This file describes the variables, the data, and any transformations or work that performed to transform or clean
up the data.

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
More details on the data on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Variable description
--------------------
The features selected for this database come from the accelerometer and gyroscope of a mobile phone, recorded from
30 subjects when they were performed different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING). Using its embedded accelerometer and gyroscope, the smartphone captured 3-axial linear acceleration
and 3-axial angular velocity at a constant rate of 50Hz.
For each record it is provided
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Data description
----------------
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for
generating the training data and 30% the test data. 
The dataset includes the following files:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample.

Data transformationation
------------------------
Purpose of this work is to merge all provided information (both train and test) in just one single flat file - also
including information about the activity description and the subject identifier.
The primary output is actually a subset of the data, reporting only the arithmentic mean of the different spatial
measurement (already initially provided in form of mean and standard deviation).
No additional operation has been performed to clean up the data.
