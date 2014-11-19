# Getting and Cleaning Data - Course Project 1
This repository contains work that I have completed for the Coursera course "Getting and Cleaning Data".

## Project
This project work requires the following items for the given data set:
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for 
   each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set
   with the average of each variable for each activity and each subject.

## Approach
1. Download and uncompress the data set received. Make sure that the data is not corrupt
2. Understand the data and make sure that the data set can be used to answer the questions fully
3. Develop code with the name run_analysis.R to create the tidy dataset

## Running the Solution in Windows
1. Create a project folder for this project (C:/../project)
2. Download data for the project into this directory. This will create directory /UCI HAR Dataset under the project folder
3. Download the file run_analysis.R into the /project directory and run the code using source command
4. The code runs and creates a tidy data set with the name tidy_data.txt
