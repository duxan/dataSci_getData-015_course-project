# dataSci_getData-015_course-project
Course project for the coursera "Getting and Cleaning Data" course, peer reviewed, June 2015

- goal: explain how all of the scripts in the repo work and how they are connected

========================================
In this repo there are three files:
1. README (this file) with general comments
2. CodeBook.md which explains how run_analysis.R works and variables used
3. run_analysis.R which runs the code if data is present in the same directory

In order to use the script provided in this repo, you need to:
* Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and leave it in the default name "UCI HAR Dataset" and structure.
* Make sure the folder "UCI HAR Dataset" and run_analysis.R script are both in the same directory, which doesn-t have to be current working directory.
* Use source("run_analysis.R", chdir=T) command in RStudio. `chdir` ensures that script's location is set as WD.
* You will find two output files generated:
  - prettyData.txt (~ 8Mb): it contains a data frame with 10299*68 dimension
  - tidyData.txt (~ 220 Kb): it contains a data frame 180*68 dimension
