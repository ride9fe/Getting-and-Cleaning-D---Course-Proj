Code Book
# Code Book for data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


## ID Fields

* `subjectID` - The subject's ID
* `activityID` - The label of the activity performed when the observations were taken

## Extracted Mean and Std Fields
the following are extracted variables in the new tidy data set
they are the measurements obtained from smart phone's accelerometer and gyrometer. 

* `tBodyAcc-mean()-X` (column `1`)
* `tBodyAcc-mean()-Y` (column `2`)
* `tBodyAcc-mean()-Z` (column `3`)
* `tBodyAcc-std()-X` (column `4`)
* `tBodyAcc-std()-Y` (column `5`)
* `tBodyAcc-std()-Z` (column `6`)
* `tGravityAcc-mean()-X` (column `41`)
* `tGravityAcc-mean()-Y` (column `42`)
* `tGravityAcc-mean()-Z` (column `43`)
* `tGravityAcc-std()-X` (column `44`)
* `tGravityAcc-std()-Y` (column `45`)
* `tGravityAcc-std()-Z` (column `46`)
* `tBodyAccJerk-mean()-X` (column `81`)
* `tBodyAccJerk-mean()-Y` (column `82`)
* `tBodyAccJerk-mean()-Z` (column `83`)
* `tBodyAccJerk-std()-X` (column `84`)
* `tBodyAccJerk-std()-Y` (column `85`)
* `tBodyAccJerk-std()-Z` (column `86`)
* `tBodyGyro-mean()-X` (column `121`)
* `tBodyGyro-mean()-Y` (column `122`)
* `tBodyGyro-mean()-Z` (column `123`)
* `tBodyGyro-std()-X` (column `124`)
* `tBodyGyro-std()-Y` (column `125`)
* `tBodyGyro-std()-Z` (column `126`)
* `tBodyGyroJerk-mean()-X` (column `161`)
* `tBodyGyroJerk-mean()-Y` (column `162`)
* `tBodyGyroJerk-mean()-Z` (column `163`)
* `tBodyGyroJerk-std()-X` (column `164`)
* `tBodyGyroJerk-std()-Y` (column `165`)
* `tBodyGyroJerk-std()-Z` (column `166`)
* `tBodyAccMag-mean()` (column `201`)
* `tBodyAccMag-std()` (column `202`)
* `tGravityAccMag-mean()` (column `214`)
* `tGravityAccMag-std()` (column `215`)
* `tBodyAccJerkMag-mean()` (column `227`)
* `tBodyAccJerkMag-std()` (column `228`)
* `tBodyGyroMag-mean()` (column `240`)
* `tBodyGyroMag-std()` (column `241`)
* `tBodyGyroJerkMag-mean()` (column `253`)
* `tBodyGyroJerkMag-std()` (column `254`)
* `fBodyAcc-mean()-X` (column `266`)
* `fBodyAcc-mean()-Y` (column `267`)
* `fBodyAcc-mean()-Z` (column `268`)
* `fBodyAcc-std()-X` (column `269`)
* `fBodyAcc-std()-Y` (column `270`)
* `fBodyAcc-std()-Z` (column `271`)
* `fBodyAccJerk-mean()-X` (column `345`)
* `fBodyAccJerk-mean()-Y` (column `346`)
* `fBodyAccJerk-mean()-Z` (column `347`)
* `fBodyAccJerk-std()-X` (column `348`)
* `fBodyAccJerk-std()-Y` (column `349`)
* `fBodyAccJerk-std()-Z` (column `350`)
* `fBodyGyro-mean()-X` (column `424`)
* `fBodyGyro-mean()-Y` (column `425`)
* `fBodyGyro-mean()-Z` (column `426`)
* `fBodyGyro-std()-X` (column `427`)
* `fBodyGyro-std()-Y` (column `428`)
* `fBodyGyro-std()-Z` (column `429`)
* `fBodyAccMag-mean()` (column `503`)
* `fBodyAccMag-std()` (column `504`)
* `fBodyBodyAccJerkMag-mean()` (column `516`)
* `fBodyBodyAccJerkMag-std()` (column `517`)
* `fBodyBodyGyroMag-mean()` (column `529`)
* `fBodyBodyGyroMag-std()` (column `530`)
* `fBodyBodyGyroJerkMag-mean()` (column `542`)
* `fBodyBodyGyroJerkMag-std()` (column `543`)

## Activity Labels

activityName and corresponding activityID
* `WALKING` (value `1`)
* `WALKING_UPSTAIRS` (value `2`)
* `WALKING_DOWNSTAIRS` (value `3`)
* `SITTING` (value `4`)
* `STANDING` (value `5`)
* `LAYING` (value `6`)
