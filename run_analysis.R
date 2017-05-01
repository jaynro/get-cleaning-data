run_analysis <- function(){
  # Load requiered packages
  if(!require("reshape2")){
    install.packages("reshape2")
    if(!require("reshape2")){
      #If Installation fails aborting...
      stop("Aborting since  the script couldnt install reshape2 package!")
    }
  }
  library(reshape2)  
  
  # Define constants

  FILE_NAME       <-"Raw_Data.zip"
  SEARCH_STR      <-".*mean.*|.*std.*"
  RESTUL_FILE     <-"tidyData.txt"
  FOLDER_PREFIX   <-"UCI HAR Dataset/"
  ACTIVITY_LABEL  <-paste(FOLDER_PREFIX,"activity_labels.txt", sep = "")
  FEATURES        <-paste(FOLDER_PREFIX,"features.txt", sep = "")
  X_TEST          <-paste(FOLDER_PREFIX,"test/X_test.txt", sep = "")
  Y_TEST          <-paste(FOLDER_PREFIX,"test/Y_test.txt", sep = "")
  SUBJECT_TEST    <-paste(FOLDER_PREFIX,"test/subject_test.txt", sep = "")
  X_TRAIN         <-paste(FOLDER_PREFIX,"train/X_train.txt", sep = "")
  Y_TRAIN         <-paste(FOLDER_PREFIX,"train/Y_train.txt", sep = "")
  SUBJECT_TRAIN   <-paste(FOLDER_PREFIX,"train/subject_train.txt", sep = "")
  URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  

  #
  # Download raw data and extract  only requiered data for the
  # exercise purpose.
  #

  download.file(URL, FILE_NAME, method="curl")
  unzip(FILE_NAME) 
  #Get Columns headers
  activityLabels <-read.table(ACTIVITY_LABEL)
  activityLabels[,2] <-as.character(activityLabels[,2])
  features <-read.table(FEATURES)
  features[,2] <-as.character(features[,2])
  
  # Rename column headers
  filteredFeatures <-grep(SEARCH_STR, features[,2])
  filteredFeatures.names <-features[filteredFeatures,2]
  filteredFeatures.names <-gsub('-mean', 'Mean', filteredFeatures.names)
  filteredFeatures.names <-gsub('-std', 'Std', filteredFeatures.names)
  filteredFeatures.names <-gsub('[-()]', '', filteredFeatures.names)
  #Test Set
  testSet <-read.table(X_TEST)[filteredFeatures]
  testActivities <-read.table(Y_TEST)
  testSubjects <-read.table(SUBJECT_TEST)
  testSet <-cbind(testSubjects, testActivities, testSet)
  #Train Set
  trainSet <-read.table(X_TRAIN)[filteredFeatures]
  trainActivities <-read.table(Y_TRAIN)
  trainSubjects <-read.table(SUBJECT_TRAIN)
  trainSet <-cbind(trainSubjects, trainActivities, trainSet)
  # Union of rows for train & test
  mergedData <- rbind(trainSet, testSet)
  colnames(mergedData) <- c("subject", "activity", filteredFeatures.names)
  #Write to CSV the merge of training and the test sets to create one data set.
  write.csv(mergedData, file = 'merged-data.csv', row.names = FALSE)
  
  #Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  mergedData$activity <- factor(mergedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
  mergedData$subject <- as.factor(mergedData$subject)
  
  meltedData <- melt(mergedData, id = c("subject", "activity"))
  meltedDataByMean<- dcast(meltedData, subject + activity ~ variable, mean)
  #Write to CSV the average by variable for each activity and subject
  
  write.csv(meltedDataByMean,file = 'avg-by-each-activty-and-subject.csv', row.names = FALSE, quote = FALSE)
  

}  
