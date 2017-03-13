This readme file describes the run_analysis.R script

Data were obtained for this project from the Human Activity Recognition Using Smartphones Data Set at UCI Machine Learning Repositor website, here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset consists of data collected from the accelerometers from the Samsung Galaxy S smartphone. The purpose in gathering this data was to capture 3-axial linear acceleration and 3-axial angular velocity for 30 subjects who each performed six distinct physical activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

For this project, the purpose was to take the raw data and transform it into tidy data sets, one dataset which only includes variables with summary measures of means and standard deviations, and a second dataset which contains only the averages of the summary measures included in the first data set by subject and by activity.

For more information on each variable, please refer to the CodeBook.md file included in this repository

Here are the steps in that process which are written in run_analysis.r

<b>Steps for Data set 1, which takes raw data set, merges that data, and extracts only the variables with summary measures of the mean and standard deviation</b> <br>
<li>Install all needed r packages</li>
<li>Download the data and place in the working directory</li>
<li>Read in the variable data from the test and training sets, and merge them together into one file called "x"</li>
<li>Name the variables in "x" by reading in the features.txt file and taking the features names to "x", thereby labeling the data set with descriptive variables names</li>
<li>Subset "x" by the feature names that only have the "mean" and the "standard deviation" measures</li>
<li>Read in the labels from the test and training sets, and merge them together into one file called "y"</li>
<li>Read in the subjects from the test and training sets, and merge them together into one file called "subject"</li>
<li>merge "subject","y", and "x" into one file called "data"</li>
<li>Read in the activity labels file</li>
<li>Use the descriptive activity labels to label the activities in the data set</li>
<li>After these steps, the final data set 1 is "data"</li>

<b>Steps for data set 2, which has averages of variables from data set 1 by each subject and activity</b> <br>
<li>Creates an interaction term to split the data set by subject and activity in a list</li>
<li>Once the data are split and put into a list, loop through the columns of the list components and take the averages of each columns</li>
<li>Name the variables appropriately</li> 
<li>Transpose the data to ensure that the variables are in the columns and the observations are in the rows</li>
<li>Create variables for each subject by the activity performed</li>
<li>Produce a final data set and write it out to a .txt file, titled "tidyfinal.txt"</li>
 
