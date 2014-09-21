library(plyr)
library(reshape2)

#load features, keep only the names column
features<-read.table("features.txt", sep=" ")
features<-features[2]

#clean up the features a bit for later use
features<-gsub("^t","Time",features[,1])
features<-gsub("^f","Freq",features)
features<-gsub("-","",features)
features<-gsub("mean","Mean",features)
features<-gsub("std","StdDev",features)
features<-gsub("()","",features)

#transpose the features vector
transp<-t(features)

#load the activity names
actLabels<-read.table("activity_labels.txt")

#load test data
test<-read.table("test/X_test.txt")
subtest<-read.table("test/subject_test.txt")
ytest<-read.table("test/y_test.txt")

#load training data
train<-read.table("train/X_train.txt")
subtrain<-read.table("train/subject_train.txt")
ytrain<-read.table("train/y_train.txt")

#combine test and training sets for subjects
subjects<-rbind(subtest,subtrain)
names(subjects)<-"subjects"

#combine test and training sets for activities
activities<-rbind(ytest,ytrain)
names(activities)<-"activity"

#replace activity ID numbers with labels
activities<-mapvalues(activities[,1], 1, "WALKING")
activities<-mapvalues(activities, 2, "WALKING_UPSTAIRS")
activities<-mapvalues(activities, 3, "WALKING_DOWNSTAIRS")
activities<-mapvalues(activities, 4, "SITTING")
activities<-mapvalues(activities, 5, "STANDING")
activities<-mapvalues(activities, 6, "LAYING")

#stick the whole thing together
combined<-rbind(test, train)

#proper var names from the transposed features vector
names(combined)<-transp

#strip out everything but the mean and SD variables
MeanAndStd<-combined[,grep("Mean|StdDev",colnames(combined))]

#add new columns to the combined dataframe for subject and activity
MeanAndStd<-cbind(MeanAndStd,subjects,activities)

#Melt data into a tidy, dcast ready format
MoltenData<-melt(MeanAndStd, id.vars=c("subjects", "activities"), measure.vars=features[grep("Mean|StdDev",features)])

#Cast data to compute mean by subject and activity
castData<-dcast(MoltenData, subjects+activities~variable, mean)

#output the tidy data
write.table(castData,"CastData.txt", row.names=FALSE)

