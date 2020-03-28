# Average Sensor readings for each activity performed by participants

## Functioning of the script
The script was used to calculate the average sensor reading for each activity and for each subject. The set-up of the experiment and the list of activities covered are described by the Human activity recognision using smartphone dataset Version 1.0 from UCI Machine Learning repository. 
Only values of the mean and standard deviation from the preprocessed data offered by the UCI repository were used to calculate the average values. This was a requirement of the project. The output is presented in the my_data variable from the script. It is also saved as a csv file, AvgSensorReadingByActivityAndSubject.csv, in this GitHub repository.

## Connection between the files
To run the script, the data files from the UCI repository should be saved in a folder called 'Data' which is in the same folder as the script. This is to save the user from updating the file path every time. Alternately, the working directory could be manually updated to the foler containing the data folder. An example of the resultant path to the data would be './Data/UCI HAR Dataset/train/y_train.txt'.

The source of the data is from Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
