==================================================================
Tidy Dataset: Getting and Cleaning Data, a course by Coursera.
==================================================================

Source
======

All data used was obtained from Bache, K. & Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.
link : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Processing 
==========

The project objects are:

- Create one R script called run_analysis.R that does the following. 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The data was processed using the R-3.1.0 base package avalible from http://cran.rstudio.com/. Additionally the R package data.table was used to aggregate the data.

Assumptions Made
================
Main objective is reformat the data to a tidy-data set which is easier to work with. Only measurements on mean and standard deviation were retained and these were reduced to one mean measurement by subject and activity type.




