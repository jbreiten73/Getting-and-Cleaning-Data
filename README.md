# Getting and Cleaning Data Course Project


This document describes how to obtain the text files MergedData.txt and tidyData.txt.

- First, you have to download the data to your working directory from the following URL and unzip them there:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Run the run_analysis.R file: The execution results in two text files in your working directory:
  1. mergedData.txt contains the original data in a "tidy" form: There are two key variables ("Subject" and "Activity"),
     which contain Subject ID and the type of activity that was performed when the measures were taken. 
     This results in a data set with 10299 observations and 68 variables.
  2. tidyData.txt contains the average for each measurement by subject and activity type resulting in a data set 
     with 180 observations and 68 variables, as there are 30 subjects and 6 types of activities.
