This readme file describes the run_analysis.R script

Data were obtained for this project from the Human Activity Recognition Using Smartphones Data Set at UCI Machine Learning Repositor website, here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset consists of data collected from the accelerometers from the Samsung Galaxy S smartphone. The purpose in gathering this data was to capture 3-axial linear acceleration and 3-axial angular velocity for 30 subjects who each performed six distinct physical activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

For this project, the purpose was to take the raw data and transform it into tidy data sets, one dataset which only includes variables with summary measures of means and standard deviations, and a second dataset which contains only the averages of the summary measures included in the first data set. 

Here are the steps in that process which are written in run_analysis.r

Data set 1 steps
Install all needed r packages
Download the data and place in the working directory
Read in the variable data from the test and training sets, and merge them together into one file "y"
Name the variables in X by reading in the features.txt file and naming the files
Subset "X" by the feature names that only have the "mean" and the "standard deviation" measures.
Read in the labels from the test and training sets, and merge them together into one file "x"
Read in the subjects from the test and training sets, and merge them together into one file "subject"
Merge "subject","y", and "x" into one file called "data"
Read in the activity labels.
Use the descriptive activity labels to name the activities in the data set, "data", to arrive at data set 1 for project

Data set 2 steps, which has averages of variables from data set 1 by each subject and activity
Creates an interaction term to split the data set by subject and activity in a list
Once the data are split and put into a list, loop through the columns of the list components and take the averages of each columns
Name the variables appropriately 
Transpose the data to ensure that the variables are in the columns and the observations are in the rows.
Create variables for each subject by the activity performed.
Produce a final data set and write it out to a .txt file. 
 
