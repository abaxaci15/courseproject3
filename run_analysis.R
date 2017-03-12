# Load packages

install.packages("reshape")
library(reshape)

# Create working directory, and then download zip file and place in working directory 

wd<-setwd("C:/Users/Carmel/Documents/Coursera/getting and cleaning data")
zip<-"tidy.zip"

if (!file.exists(zip)) 
{download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",zip)}

if(!file.exists("UCI HAR Dataset")) {unzip(zip, exdir = wd)}

features<-read.table("UCI HAR Dataset/features.txt", header= FALSE, stringsAsFactors = FALSE)

# Read in the data from the test and train sets, and merge the data together

x_test<-read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)
x_train<-read.table("UCI HAR Dataset/train/X_train.txt",stringsAsFactors = FALSE)
x<-rbind(x_test,x_train)

# Name the variables from variables in the features.txt file and
# Subset the data by the feature names that only have the mean and the standard deviation in the variable names

names(x)<-features[,2]
x<-x[grepl("mean|std",names(x))]

# Read in the test and train set labels, and merge them together

y_test<-read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",stringsAsFactors = FALSE)
y<-rbind(y_test,y_train)
names(y)<-c("labels")

# Read in the test and train set subjects, and merge them together

subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
subject<-rbind(subject_test,subject_train)
names(subject)<-c("subject")

# merge the data, labels, and subjects together
data<-cbind(subject,y,x)

# read in the activity labels
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt",header= FALSE, stringsAsFactors = FALSE)


# Use descriptive activity names to name the activities in the data set
data$labels<-as.character(data$labels)
for (i in 1:nrow(data))
{if (data$labels[i]==1) {data$labels[i]<-activity_labels[1,2]}
    else if (data$labels[i]==2) {data$labels[i]<-activity_labels[2,2]}
      else if (data$labels[i]==3) {data$labels[i]<-activity_labels[3,2]}
        else if (data$labels[i]==4) {data$labels[i]<-activity_labels[4,2]}
          else if (data$labels[i]==5) {data$labels[i]<-activity_labels[5,2]}
            else data$labels[i]<-activity_labels[6,2]
}
 # Calculate the averages of each variable by each subject and by activity

datafactor<-interaction(data$subject,data$labels)
data<-cbind(data,datafactor)
splitdata<-split(data[,3:81],datafactor)

datameans<-vector()
  for (i in 1:180) 
    {datameans[i]<-as.vector(lapply(splitdata[i],colMeans))
  }

# Make a second, independent tidy data set

names(datameans)<-names(splitdata)
meanfactors<-as.data.frame(datameans)
tidy<-t(meanfactors)
tidy<-as.data.frame(tidy)
tidy$datafactor<-rownames(tidy)
tidy$datafactor<-substr(tidy$datafactor,2,nchar(tidy$datafactor))
tidy$datafactor<-strsplit(tidy$datafactor,"[.]")

for (i in 1:nrow(tidy))
    {
    tidy$subject[i]<-tidy$datafactor[[i]][[1]]
        tidy$activity[i]<-tidy$datafactor[[i]][[2]]
}

tidy<-tidy[,-80]
tidyfinal<-cbind(tidy[,80:81],tidy[,1:79])
id<-1:180
rownames(tidyfinal)<-id

# Tidyfinal is the final dataset, write it to the working directory
write.table(tidyfinal,"tidyfinal.txt", row.name=FALSE)
