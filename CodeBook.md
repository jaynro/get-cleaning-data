##Tidy data set

###Identifier
#### Subject: A unique  identifier for the 30  subject who carried out the experiment.
#### Activities:  Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).


###Varibles 

Detailed information of the measured variables can be found on this link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


In order to filter  the requiered columns (Mean & Std) and replace them for meaningful names, variable names on features.txt were converted using the following : 

 1. Select values  containing the string   '-mean' or '-std'
 2. Replace above for 'Mean' and 'Std'
 3. Remove '()'

Examples:
	From 'tBodyAcc-mean()-X'  converted to  'tBodyAccMeanX'
	From 'tBodyAcc-std()-X'  converted to  'tBodyAccStdX'



