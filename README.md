# Project ReadMe
Coursera Getting and Cleaning Data project

This project has only one script, run_analysis.R 

It requires the content of the following ZIP to be in the working directory:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The goal is to create a dataset that shows the mean of the mean and standard deviation variables for each subject and activity within both the training and test data sets.

This is done by following these steps:

1. Loading the data and merging the activity and subject.
2. Adding the descriptive column names.
3. Merging the training and test data.
4. Discarding columns related to other measurements.
5. Adding the descriptive activity names.
6. Grouping and summarizing the data.
7. Saving the file.
