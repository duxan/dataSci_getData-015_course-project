# dataSci_getData-015_course-project
Course project for the coursera "Getting and Cleaning Data" course, peer reviewed, June 2015

- goal: explain how script run_analysis.R works and variables used

=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
* The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean the data:

 **Prestep:**
 - Checks if datasets are in the same folder. If not scipt stops with error message.

 **Step 1:**
 - Sets *feature_names*, to be used as column names for both training and test data.
 - Read X_train.txt, y_train.txt and subject_train.txt from the "UCI HAR Dataset/train" folder and store them in *X_train*, *y_train* and *subject_train* variables, respectively. I set colnames right at the beggining. Concatenate data frames in one *train* variable.     
 - Read X_test.txt, y_test.txt and subject_test.txt from the "UCI HAR Dataset/test" folder and store them in *X_test*, *y_test* and *subject_test* variables, respectively. I set colnames right at the beggining. Concatenate data frames in one *test* variable.     
 - Concatenate *test* to *train* to generate a 10299x561 data frame, called *mergedData*.

 **Step 2:**
 - Find out which names from *feature_names* contain mean() or std(), and make vector of that names' indices, called *filter_list*.
 - Subset *mergedData* by *filter_list*, and name new var *filteredData*. NOTE: I add 2 to compensate for the position of colnames.
 
 **Step 3:**
 - Read the activity_labels.txt.
 - Match data from activity column from *filteredData* with activity labels.
 
 **Step 4:**
 - Make *prettyData* out of *filteredData* by renaming already set colnames.
 - Write to file called **prettyData.txt**
 
 **Step 5:**
 - Aggregate data by activity and by subjects. Call new dataset *tidyData*.
 - Write to file **tidyData.txt**
