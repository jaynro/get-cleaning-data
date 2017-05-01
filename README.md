## Coursera peer graded assignment:  Getting & cleaning data.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

## Data set information.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities ) and wearing a smartphone on the waist.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Execute the script.

This script downloads the data set information and process it for  create following files as specified on assignment requierements:

	1. merged-data.csv  
	Merges the training and the test sets to create one data set.
	2. avg-by-each-activty-and-subject.csv  
	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	3. avg-by-each-activty-and-subject.txt
	The actual file requested on submission, same file as above.
	

### Download latest code from following git repo and set your R working directory on it:
https://github.com/jaynro/get-cleaning-data

### Execute  below comands in R:
	source('run_analysis.R')
	run_analysis()

### This R script performs next steps in order to get requiered information:
	1. Downloads the raw dataset and loads required files inside the zip file.
	2. For "Training" and "Test" data sets non-required columns are filtered and stored on 'filteredFeatures'.
	3. "Subject" and "Activity" data sets are merged with 'filteredFeatures' for
	"Test set" and one more for the "Train set".	
	4. Above sets are merged and used for write 'merged-data.csv' file. 
	5. The columns "activity" and "subject" columns are converted into factors.
	6. The mean is calculated for each variable and each "subject" and "activity" and stored in a new data frame.
	7. Finaly, above data frame is used for create 'avg-by-each-activty-and-subject.csv' file.





