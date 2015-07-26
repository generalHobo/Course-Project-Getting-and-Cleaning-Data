courseProject <-function(){
  print("started processing")

  library(dplyr)
  library(data.table)
  ##step 1

  if (!dir.exists("UCI HAR Dataset/test") & !dir.exists("UCI HAR Dataset/train")){
    tmp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",tmp)
    unzip(tmp)
    unlink(tmp)
  }
  
  activity_lables <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id","activity"))
  features <- read.table("./UCI HAR Dataset/features.txt")
  training_set <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=features[,2], check.names=FALSE)
  training_labels <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names="activity_id")
  training_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subject_id")
  test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=features[,2], check.names=FALSE)
  test_labels <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names="activity_id")
  test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="subject_id")
  
  #combine the activity_ids and subjects to each the training and test datasets
  training <- cbind(training_labels,training_set)
  training <- cbind(training, training_subject)  

  test <- cbind(test_labels,test_set)
  test <- cbind(test, test_subject)  
  
  #combine both the test and training datasets into one. They will have the same number and names of columns
  combined <- rbind(test,training)
  
  ##step 2

  #get a unique listing of features (since there are duplicate columns)
  unique_features <- make.unique(names(combined))

  #get a list of the columns we want (only the standard deviation and mean, along with the subjects and activities)  
  MeanStdColumns <-c("activity_id",grep("-std\\(\\)|-mean\\(\\)",unique_features, value=TRUE),"subject_id")
  
  #limit the data to just those measurements we want
  limited <- combined[,MeanStdColumns]
  
  ##step 3
  
  #instead of activity ids join to the activity_lables dataset to get the human readable names
  joined <-inner_join(activity_lables,limited,by="activity_id")
  
  #remove the activity ids from the master dataset since we have the activity names
  joined <- select(joined, -activity_id)

  ##step 4
  
  #convert all the names of the joined dataset to lowercase so we can start to standardize the names
  names <-tolower(names(joined))
  
  #standardardize the joined dataset names
  names <- gsub("^t","time.",names)
  names <- gsub("^f","frequency.",names)
  names <- gsub("body","body.",names)
  names <- gsub("gravity","gravity.",names)
  names <- gsub("bodybody","body.",names)
  names <- gsub("acc","accelerometer.",names)
  names <- gsub("gyro","gyroscope.",names)
  names <- gsub("jerk","jerk.",names)
  names <- gsub("mag","magnitude.",names)
  names <- gsub("-std\\(\\)","stddev",names)  
  names <- gsub("-mean\\(\\)","mean",names)  
  names <- gsub("-x",".x",names)    
  names <- gsub("-y",".y",names)    
  names <- gsub("-z",".z",names)    

  #reassign the column names with the standardized names
  names(joined) <- names
  
  ##step 5
  
  # create a second dataset with the average for each variable for each activity and each subject
  avgs <- summarise_each(group_by(joined,subject_id,activity),funs(mean))
  
  write.table(avgs,"step5.txt",row.names = FALSE)
  print("completed processing")
  }