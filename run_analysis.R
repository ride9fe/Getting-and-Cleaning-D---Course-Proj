library(plyr)
library(dplyr)
library(reshape2)

if(!file.exists("./data")){dir.create("./data")} # from Notes 03_05
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#
# get headers to put into data table in the next step
features <- read.table("./data/UCI HAR Dataset/features.txt")
features_name <- NULL
features_name <- features [,2]

#read data into table and assign header
#read as table for handling using either cbind/rbind or dplyr
testdata_x <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
colnames(testdata_x) <- features_name

testactivity_y <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
colnames(testactivity_y) <- "activityID"

testsubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
colnames(testsubject) <- "subjectID"

traindata_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
colnames(traindata_x) <- features_name

trainactivity_y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
colnames(trainactivity_y) <- "activityID"

trainsubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
colnames(trainsubject) <- "subjectID"
############

#merge data together
test_data <- cbind(testsubject, testactivity_y, testdata_x)
train_data <- cbind(trainsubject, trainactivity_y, traindata_x)
merged_data <- rbind(test_data, train_data)
############

#find col number that contains "mean"
mean_col_idx <- grep("mean",names(merged_data),ignore.case=TRUE)
# pull out the columns with indexed numbers that contain "mean"
mean_col_names <- names(merged_data)[mean_col_idx]
#find col number that contains "std"
std_col_idx <- grep("std",names(merged_data),ignore.case=TRUE)
# pull out the columns with indexed numbers that containt "std"
std_col_names <- names(merged_data)[std_col_idx]
#new df that has subjectID, activityID, and those with "mean" and "std"
mean_std_data <- merged_data[,c("subjectID","activityID",mean_col_names,std_col_names)]
############

# to add in column with activity description by matching the activity labels
## Read all activities and their names and label the aproppriate columns 
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",col.names=c("activityID","activityName"))
#uses dplyr inner_join to merge 2 tables with their common column = activityID
merged_data_desc_names <- inner_join(activity_labels, mean_std_data, by="activityID")
############

#because for wide format, the header has variables that is very non-intuitive and non-descriptive,
#need to convert them to long format. use melt from library (reshape)
# > str(desc_name_long)
# 'data.frame':  885714 obs. of  5 variables(activityID, activityName,subjectID, variable, value):
desc_name_long <- melt(merged_data_desc_names,id=c("activityID","activityName","subjectID"))
############

# ref: http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/
# convert it to wide format with - 
desc_name_wide <- dcast(desc_name_long, activityName + subjectID ~ variable, mean)
## Create a file with the new tidy dataset
write.table(desc_name_wide,"./tidy_data_ave_variable.txt", row.names = FALSE)

## below: Notes for self 
# features_merged_data <- c("subjectID", "activityID", features[,2]) #Note: problem if I do this way
## Notes to self:  
# > head(features_merged_data)
# [1] "subjectID"  "activityID" "243"        "244"        "245"        "250"       
# > tail(features_merged_data)
# [1] "1" "4" "3" "5" "6" "7"
# > str (features_merged_data)
# chr [1:563] "subjectID" "activityID" "243" "244" "245" "250" "251" ...
## unless force the header colnames to be as character! as below. 
# > ?as.character
# > feature_names_char <- as.character(feature_names)
# > features_merged_data_char <- c("subjectID", "activityID", feature_names_char)
# > str (features_merged_data_char)
# chr [1:563] "subjectID" "activityID" "tBodyAcc-mean()-X" ...
 
