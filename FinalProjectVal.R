library(dplyr)
library(tidyr)

## Loading the Data
# y_test/y_train are the activities. The meaning of the number is given in activiy_labels.txt
y_test  = read.table('./Data/UCI HAR Dataset/test/y_test.txt')
y_train = read.table('./Data/UCI HAR Dataset/train/y_train.txt')

# each column is a summary whos details are given in features.txt
X_test  = read.table('./Data/UCI HAR Dataset/test/X_test.txt')
X_train = read.table('./Data/UCI HAR Dataset/train/X_train.txt')
    
# numerical codes reffering to the participants in the test
subject_test    = read.table('./Data/UCI HAR Dataset/test/subject_test.txt')
subject_train   = read.table('./Data/UCI HAR Dataset/train/subject_train.txt')

# Suplimentary data (colnames and activity label)
features        = read.table('./Data/UCI HAR Dataset/features.txt',
                             stringsAsFactors = F)
activity_labels = read.table('./Data/UCI HAR Dataset/activity_labels.txt',
                             stringsAsFactors = F)

## Steps 2 & 3
# Adding the activity and column name to the raw data
X_test = full_join( y_test, activity_labels, by = 'V1', name = 'activity')[,2]%>%
    cbind(subject_test, X_test)
names(X_test)  = c('activity', 'subject', features[,2])
X_train = full_join( y_train, activity_labels, by = 'V1', name = 'activity')[,2]%>%
    cbind(subject_train, X_train)
names(X_train) = c('activity', 'subject', features[,2])

# Subsetting the data with columns with standard deviations or mean values
meanStd        = grep('(mean())|(std())',features$V2)
test_mean_std  = X_test[,c(1, 2, meanStd+2)]
train_mean_std = X_train[,c(1, 2, meanStd+2)]

## Step 1. Merging the train and test sets
data_mean_std  = rbind(test_mean_std,train_mean_std)

## Step 5.
split.data = split(data_mean_std[,-(1:2)],
                   list(data_mean_std$activity, data_mean_std$subject)) 
my_table = t(sapply(split.data,colSums))
my_table = cbind.data.frame(as.character(row.names(my_table)),my_table)
colnames(my_table)[1] = 'activity.subject'
my_table = separate(my_table, activity.subject,
                    c('activity','subject'), '\\.')
# updating the row names and column names
old.names = names(my_table)
new.names = sapply(old.names, paste0, '_mean')
colnames(my_table)[-(1:2)] = new.names[-(1:2)]
row.names(my_table) = NULL
