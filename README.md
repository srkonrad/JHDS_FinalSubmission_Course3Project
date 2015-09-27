# This is a README markdown file which describes how the run_analysis.R script works

This markdown file describes each detail of the run_analysis.R script

  - Install necessary packages
  - Download and unzip file from the internet
  - Read in training and test data
  - Create final "train" and "test" data frames
  - Merge the train and test data sets together
  - Extract a data subset which only includes measurements on the mean and standard deviation for each measurement
  - Replace numerical activity labels with descriptive names
  - Create a second, tidy data subset with the average of each variable for each activity and for subject 
  - Bonus: read in the new data file and view in R
  
### 1. Install necessary packages

The first part of the code installs the necessary packages:

```sh
$ install.packages("downloader")
$ library(downloader)
$ install.packages("dplyr")
$ library(dplyr)
```

### 2. Download and upzip file from the internet

Working directory is set to "UCI HAR Dataset"

```sh
$ if(!file.exists("./data")){dir.create("./data")}
$ fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
$ download(fileUrl, dest="./data/smartphoneProject.zip", mode="wb")
$ unzip("./data/smartphoneProject.zip", exdir = "./data/")
$ setwd("./data/UCI HAR Dataset")
```

### 3. Read in training data

And replace default column headers with "features.txt" names vector

```sh
$ tempTrain <- read.table("./train/X_train.txt")
$ featureNames <- read.table("./features.txt")
$ names(tempTrain) <- as.vector(featureNames$V2)
$ trainLabels <- read.table("./train/y_train.txt")
$ trainSubject <- read.table("./train/subject_train.txt")
```

### 4. Read in test data

And replace default column headers with "features.txt" names vector

```sh
$ tempTest <- read.table("./test/X_test.txt")
$ names(tempTest) <- as.vector(featureNames$V2)
$ testLabels <- read.table("./test/y_test.txt")
$ testSubject <- read.table("./test/subject_test.txt")
```

### 5. Create final "train" and "test" data frames

By merging with trainSubject.txt and trainLabels.txt so Subject and Activity IDs are included in addition to the measurement data.

```sh
$ train <- cbind("Subject" = trainSubject$V1,(cbind("Activity" = trainLabels$V1,tempTrain)))
$ test <- cbind("Subject" = testSubject$V1,(cbind("Activity" = testLabels$V1,tempTest)))
```

### 6. Merge the train and test data sets together

```sh
$ dataMerged <- rbind(train,test)
```


### 7. Extract a data subset which only includes measurements on the mean and standard deviation for each measurement

It has been assumed that this includes only those measurement variables which have mean() or std() in the variable name.  

```sh
$ dataMergedSub <- dataMerged[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)] 
```


### 8. Replace numerical activity labels with descriptive names 

Names correspond to activity_labels.txt file 

```sh
$ activities <- c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
$ activitiesCodes <- dataMergedSub$Activity
$ dataMergedSub$Activity <- activities[activitiesCodes]
```


### 9. Create a second, tidy data subset with the average of each variable for each activity and for subject 

And write the table to a new .txt file.  The data meets the following "tidy" data set principles:

  - Each variable is measured in one column
  - Each different observation of that variable is in a different row
  - There is one table for each kind of variable (in this case, one table for "measurement" data)
  - Includes a row at the top with variable names
  - Variable names are descriptive and readable (for the intended audience)

```sh
$ dataMergedSubSummary <- group_by(dataMergedSub,Subject,Activity) %>% summarize_each(c("mean"))
$ write.table(dataMergedSubSummary,file="./dataMergedSubSummary.txt",row.names = FALSE)
```


### 10. Bonus: Read in the new data file and view in R

For the reviewer:

```sh
$ data <- read.table("./dataMergedSubSummary.txt", header = TRUE) 
$ View(data)
```
