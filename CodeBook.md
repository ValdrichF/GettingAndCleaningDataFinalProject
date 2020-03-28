## Variables used in this project
The variables from the the Human activity recognision using smartphone dataset Version 1.0 from UCI Machine Learning repository is used in this project. The mean of the average sensor reading and its standard deviation within each 20Hz window is calculated for each activity, grouped by each participant. The decription of the signals and variables from the Human activity recognision dataset can be summarised as follows:
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency

The mean value of these 'preprocessed' variables is calculated using the attached script to generate the output file 'AvgSensorReadingByActivityAndSubject.csv'. The mean is also separated by the activity that the participant was performing and also for each participant. The activity being performed is described in the variable 'activity'. Further, the participants have been ecoded into number, from 1 to 30, in the variable 'subject'

## Transformations to the data

### Going from the raw data to complete data
The encoded activity being performed was decoded for the training data and the test data. The data was attached to theoriginal data to create one dataframe for the train data and test data. These dataframes now contains all the required information. The variables containing the mean, standard devaition and mean Frequency values were subsetted. Mergeing the train data and test data gives the complete dataset.

### Splitting the data and calculating the mean
The complete data was then split base on the activity and the participants performing the activity. The same activity was kept together to help notice differences between the participants. The colMeans function was used to calculate the means for each subset of the split data. This generates the required data, but further cleaning is required

### Cleaning the final dataset
The variable names are updated to refelect the changes from the colMeans function. A suffix of '_mean' is added for this purpose. Futhermore, the activity name and the participant number is encoded together as the row names which is separated into activity and subject variables in accordance with the tidy data principles.