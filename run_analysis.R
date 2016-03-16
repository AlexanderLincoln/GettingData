# Working directory is same as zip extracted

#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement.
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names.
#5 From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.

# Load

library(dplyr)

features <- read.table("features.txt",col.names = c("featurenumber","featurename"),stringsAsFactors = FALSE)


test <- read.table("./test/X_test.txt")
testactivity <- read.table("./test/y_test.txt", col.names= "activitynumber")
test<- cbind(testactivity,test)
testsubject <- read.table("./test/subject_test.txt", col.names= "subject")
test<- cbind(testsubject,test)

train <-  read.table("./train/X_train.txt")
trainactivity <-  read.table("./train/y_train.txt", col.names = "activitynumber")
train<- cbind(trainactivity,train)

trainsubject <-  read.table("./train/subject_train.txt", col.names = "subject")
train<- cbind(trainsubject,train)


colnames(test) <- c("subject","activity",features$featurename)

colnames(train) <- c("subject","activity",features$featurename)



#merge

merged <- rbind(test,train)



#extract only mean and standard deviation for each measurement

cols <- grep(colnames(merged),pattern = "(mean[^f])|std",ignore.case = TRUE )

extract <- merged[,c(1:2, cols)]



#descriptive activitynames


activities <- read.table("activity_labels.txt",stringsAsFactors = FALSE, col.names = c("number","activityname"))


data <- merge(activities,extract,by.x = "number",by.y = "activity", sort = FALSE)
data<- data[ ,-1]

#make a tidy dataset with average of each variable for each activity and subject
grp <- data %>% group_by(subject,activityname) 

tidy <- summarize_each(grp,funs(mean))

write.table(tidy,file = "tidyData.txt",row.names = FALSE)
