
# y_test is the activities. The meaning od the number is given in activiy_labels.txt
y_test = read.table('./Data/UCI HAR Dataset/test/y_test.txt')

# each column is a summary whos details are given in features.txt
X_test = read.table('./Data/UCI HAR Dataset/test/X_test.txt')

subject_test = read.table('./Data/UCI HAR Dataset/test/subject_test.txt')

features = read.table('./Data/UCI HAR Dataset/features.txt')
activity_labels = read.table('./Data/UCI HAR Dataset/activity_labels.txt')


names(X_test) = features[,2]
X_test = cbind(y_test$V1, X_test)
colnames(X_test)[1] = 'activityNo.'
a = merge(X_test, activity_labels,by.x = 'activityNo.', by.y = 'V1')
