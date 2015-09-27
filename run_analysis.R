# 1 Download data from web and unzip to a local directory, and set new working directory

install.packages("downloader")
library(downloader)
install.packages("dplyr")
library(dplyr)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(fileUrl, dest="./data/smartphoneProject.zip", mode="wb")
unzip("./data/smartphoneProject.zip", exdir = "./data/")
setwd("./data/UCI HAR Dataset")


# 2 Read in training data, and assign variable names
tempTrain <- read.table("./train/X_train.txt")
featureNames <- read.table("./features.txt")
names(tempTrain) <- as.vector(featureNames$V2)
trainLabels <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")

# 3 Read in test data, and assign variable names
tempTest <- read.table("./test/X_test.txt")
names(tempTest) <- as.vector(featureNames$V2)
testLabels <- read.table("./test/y_test.txt")
testSubject <- read.table("./test/subject_test.txt")



# Create final "train" data frame by cbinding the first column of the 
# trainLabels and trainSubject data frames.  Now you have a complete data frame
# which also includes these "Subject"  and "Activity" identification columns
# which correspond to the remaining 561 measurement columns.
train <- cbind("Subject" = trainSubject$V1,(cbind("Activity" = trainLabels$V1,tempTrain)))


# Create final "test" data frame by cbinding the first column of the 
# testLabels and testSubject data frames.  Now you have a complete data frame
# which also includes these "Subject"  and "Activity" identification columns
# which correspond to the remaining 561 measurement columns.
test <- cbind("Subject" = testSubject$V1,(cbind("Activity" = testLabels$V1,tempTest)))

# Merge the train and test data sets together into one data frame
dataMerged <- rbind(train,test)

# Some simple checks
        # Check that total rows = sum of rows from train + test data sets
        # dim(dataMerged)

        # Check that each subject has done each activity
        # table(dataMerged$Activity,dataMerged$Subject)


        
# Extract a data subset with only the mean() and std() measurements
dataMergedSub <- dataMerged[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)] 

# Replace numerical activity labels with descriptive names corresponding to activity_labels.txt file
activities <- c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
activitiesCodes <- dataMergedSub$Activity
dataMergedSub$Activity <- activities[activitiesCodes]

# Create a second, tidy data subset with the average of each variable for each activity and for subject
dataMergedSubSummary <- group_by(dataMergedSub,Subject,Activity) %>% summarize_each(c("mean"))


write.table(dataMergedSubSummary,file="./dataMergedSubSummary.txt",row.names = FALSE)

#the command for reading it in and looking at it in R is:
data <- read.table("./dataMergedSubSummary.txt", header = TRUE) 
View(data)
