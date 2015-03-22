Code book 
===

This document provides information about the generated sets by the script 'run_analysis.R', provided in this repository.

# Data set 'tidy.txt'

The dataset 'tidy.txt' is the result of cleaning and selecting data from data from an experiment in which measurements were collected from the accelerometer and gyroscope from the Samsung Galaxy S smartphone used by 30 subjects carrying out a variety of 6 activities.
More information about the measurements in the raw dataset is best obtained from the website where the dataset was taken from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here follows a description of what 'tidy.txt' looks like.

1. The first variable 'subject' denotes the subject number that performed an activity.
2. The second variable 'activity' denotes the activity performed by the subject. There are six activites, listed here:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

A total of 79 features were selected from the original data: only the estimated mean and standard deviations, using a `grep` on '"mean|std"'. These features form the 79 other variables in the dataset, making a total of 81 columns.
The feature names from the original data have been rewritten, using the following rules:

* The prefix 't' was rewritten into 'time', to make it clear the feature corresponds to the time domain
* The prefix 'f' was rewritten into 'freq', to make it clear the feature corresponds to the frequency domain
* dashes and parentheses have been removed
* CamelCasing has been applied to the names

For example:

* 'tBodyAcc-mean()-X' becomes 'timeBodyAccMeanX' 
* 'tBodyAcc-std()-Y' becomes 'timeBodyAccStdY'
* 'fBodyAcc-mean()-Z' becomes 'freqBodyAccMeanZ'
* 'fBodyBodyGyroMag-mean()' becomes 'freqBodyGyroMagMean'
* 'fBodyBodyGyroJerkMag-meanFreq()' becomes 'freqBodyGyroJerkMagMeanFreq'

A full description of the features is best obtained from the file 'features_info.txt', included with the original dataset.
