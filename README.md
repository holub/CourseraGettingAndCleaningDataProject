Getting and Cleaning Data Project
===

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Files
* README.md -- this file
* CodeBook.md -- codebook describing variables, the data and transformations
* run_analysis.R -- actual R code

# Environment
It should run in a folder of the Samsung data (the zip had this folder: UCI HAR Dataset)
The script assumes it has in it's working directory the following files and folders:
* activity_labels.txt
* features.txt
* test/
* train/

# Script run_analysis.R

* For each data set:
  * read data set
  * attach activity labels
  * attach subject

* Merge all data sets.

* Rename variables of the data set.

* Keep only activity, subject, "mean", "std" variables in data set.

* Create a new data frame by finding the mean for each combination of subject and label.

* Write data to "tidy.txt" file in the working directory
