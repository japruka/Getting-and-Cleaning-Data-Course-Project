## Create Column names from features.txt

features<-read.table("./UCI HAR Dataset/features.txt")
features2<-features[2]
uf<-unlist(features2)
ms<-grep("mean|std",uf)
column<-features2[ms,]
r_column<-gsub("\\()","",column,)
re_column<-gsub("-","\\/",r_column,)
re_column<-gsub("Freq","Frequency",re_column)
re_column<-gsub("Acc", "Accelerometer",re_column)
re_column<-gsub("Mag", "Magnitude",re_column)
re_column<-gsub("^t","Time",re_column)
re_column<-gsub("^f","Frequency",re_column)
re_column<-gsub("Gyro", "Gyroscope",re_column)
re_column<-gsub("BodyBody", "Body",re_column)

## Merge X train&test dataset

test1<-read.table("./UCI HAR Dataset/test/X_test.txt")
ms_test1<-test1[,ms]
train1<-read.table("./UCI HAR Dataset/train/X_train.txt")
ms_train1<-train1[,ms]
##ms_merge<-merge(ms_test1,ms_train1,all=TRUE)だと1行目の値によって並び替えられてしまう
ms_bind<-rbind(ms_train1,ms_test1)

## Set the Column names X dataset 

colnames(ms_bind) <-re_column
ms_bind

## Merge train&test subject dataset and Set column name

train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject<-rbind(train,test)
colnames(subject)<-"subject"

## Merge train&test Y dataset and Set column name

train2<-read.table("./UCI HAR Dataset/train/Y_train.txt")
test2<-read.table("./UCI HAR Dataset/test/Y_test.txt")
Y<-rbind(train2,test2)
colnames(Y)<-"activity"

## Merge all datasets

alldata<-cbind(subject,Y,ms_bind)

## Change activity column from number to character

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
alldata$activity<-activityLabels[alldata$activity,2]

## Split the dataset and Calcurate the average  and Summarize them

alldataMeans <- alldata %>% 
        group_by(subject, activity) %>%
        summarise_each(funs(mean))
write.table(alldataMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)