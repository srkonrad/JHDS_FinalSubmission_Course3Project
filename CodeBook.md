# This is the CodeBook markdown file

This CodeBook includes the following:

  - Information about the variables in the tidy data set (including units)
  - Information about the summary choices made
  - Information about the experiment study design

  
### 1. Code Book: Variables in the tidy data set

The tidy data set consists of 180 observations of 68 variables.  The first two column variables are labels (Subject, Activity) while the remaining 66 volumns are measurement variables. Each row represents the average across all observations for that particular measurement from the original raw data set, for that particular Subject and Activity. The 66 measurement variables included in this data set are a subset of the original data set which included 561 measurement variables.  These 66 measurement variables are all related to mean and standard deviation measurements. 

The following variables are included in this tidy data set.  Details on the units can be found below, based on the original raw data descriptions. It is assumed that the intended audience will understand this labeling structure and unit measurement.

  - Subject (subject id 1-30)
  - Activity (walking, walking upstairs, walking downstairs, sitting, standing, or laying)

The following measurement variables are all in (Hz) units.

  - tBodyAcc-mean()-X
  - tBodyAcc-mean()-Y
  - tBodyAcc-mean()-Z
  - tBodyAcc-std()-X
  - tBodyAcc-std()-Y
  - tBodyAcc-std()-Z
  - tGravityAcc-mean()-X
  - tGravityAcc-mean()-Y
  - tGravityAcc-mean()-Z
  - tGravityAcc-std()-X
  - tGravityAcc-std()-Y
  - tGravityAcc-std()-Z
  - tBodyAccJerk-mean()-X
  - tBodyAccJerk-mean()-Y
  - tBodyAccJerk-mean()-Z
  - tBodyAccJerk-std()-X
  - tBodyAccJerk-std()-Y
  - tBodyAccJerk-std()-Z
  - tBodyGyro-mean()-X
  - tBodyGyro-mean()-Y
  - tBodyGyro-mean()-Z
  - tBodyGyro-std()-X
  - tBodyGyro-std()-Y
  - tBodyGyro-std()-Z
  - tBodyGyroJerk-mean()-X
  - tBodyGyroJerk-mean()-Y
  - tBodyGyroJerk-mean()-Z
  - tBodyGyroJerk-std()-X
  - tBodyGyroJerk-std()-Y
  - tBodyGyroJerk-std()-Z
  - tBodyAccMag-mean()
  - tBodyAccMag-std()
  - tGravityAccMag-mean()
  - tGravityAccMag-std()
  - tBodyAccJerkMag-mean()
  - tBodyAccJerkMag-std()
  - tBodyGyroMag-mean()
  - tBodyGyroMag-std()
  - tBodyGyroJerkMag-mean()
  - tBodyGyroJerkMag-std()
  - fBodyAcc-mean()-X
  - fBodyAcc-mean()-Y
  - fBodyAcc-mean()-Z
  - fBodyAcc-std()-X
  - fBodyAcc-std()-Y
  - fBodyAcc-std()-Z
  - fBodyAccJerk-mean()-X
  - fBodyAccJerk-mean()-Y
  - fBodyAccJerk-mean()-Z
  - fBodyAccJerk-std()-X
  - fBodyAccJerk-std()-Y
  - fBodyAccJerk-std()-Z
  - fBodyGyro-mean()-X
  - fBodyGyro-mean()-Y
  - fBodyGyro-mean()-Z
  - fBodyGyro-std()-X
  - fBodyGyro-std()-Y
  - fBodyGyro-std()-Z
  - fBodyAccMag-mean()
  - fBodyAccMag-std()
  - fBodyBodyAccJerkMag-mean()
  - fBodyBodyAccJerkMag-std()
  - fBodyBodyGyroMag-mean()
  - fBodyBodyGyroMag-std()
  - fBodyBodyGyroJerkMag-mean()
  - fBodyBodyGyroJerkMag-std()
  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
  
 
### 2. Information about the summary choices made

The tidy data set is a result of several transformations of the original raw data provided. For an exact detailed step-by-step instructions of getting from the raw data to the tidy data set, please see the README.md file.  The main transformations include:

  - Original train data set has been enriched with Subject labels and Activity labels (files subject_train.txt and y_train.txt)
  - Original test data set has been enriched with Subject labels and Activity labels (files subject_test.txt and y_test.txt)
  - Column headers in both train and test data sets have been replaced with descriptive Features labels based on file features.txt
  - For all of the above modifications, it has been assumed that the Subject, Activty, and Features label files were in the correct order, corresponding to the main train and test data sets
  - Activity numerical labels have been replaced with activity names corresponding to file activity_labels.txt
  - Only measurements with variable names containing mean() or std() have been extracted, averaged, and included in the tidy data set
  
### 2. Information about the experiment study design

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 