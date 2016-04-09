# Reading test data sets:
x_test<-read.table("test/X_test.txt ")
y_test<-read.table("test/y_test.txt ")
subject_test<-read.table("test/subject_test.txt ")

# Reading training data sets:
x_train<-read.table("train/X_train.txt ")
y_train<-read.table("train/y_train.txt ")
subject_train<-read.table("train/subject_train.txt ")

# Joining the measurement data
Measures<-rbind(x_train,x_test)

# Joining the activity code data
ActCode<-rbind(y_train,y_test)

# Joining the data with subject IDs
Subject<-rbind(subject_train,subject_test)

# Reading in "features" data
features<-read.table("features.txt")
head(features)

# Determining those Indices containing the string "mean()" or "std()"
meanstd_ind <- grep("mean\\(\\)|std\\(\\)", features[, 2])
Measures<-Measures[,meanstd_ind]
names(Measures)<-features[meanstd_ind,2]

# "Cosmetics"
names(Measures) <- gsub("mean", "Mean", names(Measures))
names(Measures) <- gsub("std", "Std", names(Measures))
names(Measures) <- gsub("\\(\\)", "", names(Measures))
names(Measures) <- gsub("-", "", names(Measures))
names(Measures) <- gsub("BodyBody", "Body", names(Measures))

# Reading in "activity" data
activity<-read.table("activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))

# Connecting Activty Codes with Activity Names
ActCode[,1]<-activity[ActCode[,1],2]
names(ActCode)<-"Activity"
names(Subject)<-"Subject"
mergedData<-cbind(Subject,ActCode,Measures)

# writing into text file
write.table(mergedData, "mergedData.txt")

# calculating the Mean for each Activity for each Subject concerning all measures
library(reshape2)
mergedDataMelt <- melt(mergedData, id = c("Subject", "Activity"))
mergedDataMean <- dcast(mergedDataMelt, Subject + Activity ~ variable, mean)

# writing into text file
write.table(mergedDataMean, "tidyData.txt")