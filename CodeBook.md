---
title: "Run_Analysis_Code_Book"
output: html_document
---


This code book provides information regarding the run_analysis R script developed as part of the project work for the Getting and Cleaning Data Coursera Coursera.

This document is divided into 5 sections:  
1.Background of Data - this provides information on the raw data, how it was collected and where it was accessed from
2.Raw Data - this section describes the raw data and what raw files were used.   
3.Transformations - this section describes the  functions and processing done on the raw data to obtain the tidy data  
4.Running the Script - this section describes what is required to run the script and the expected output  
5.Tidy Data Variables - this section describes the tidy data and the variables   


#1. Background of Raw Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
As part of the course some processing will be done on this data to present a tidy data set.


#2. Raw Data
The data was downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 with a full description of the data available at 
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
 
The raw data consists of several files listed below:
1. README.txt    
2. features_info.txt: Shows information about the variables used on the feature vector.  
3. features.txt: List of all features.  
4. activity_labels.txt: Links the class labels with their activity name.  
5. train/X_train.txt: Training set.  
6. train/y_train.txt: Training labels.  
7. test/X_test.txt: Test set.  
8. test/y_test.txt': Test labels.  

The following files are available for the train and test data. Their descriptions are equivalent.   
1. train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
2. train/Inertial Signals/total_acc_x_train.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.   
3. train/Inertial Signals/body_acc_x_train.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration.  
4. train/Inertial Signals/body_gyro_x_train.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.   

NOTE: the data in the Inertial Signals folders was not used by the analysis script

#3. Transformations 
The instructions regarding the functionality of the script were provided on the Coursera website and are:
You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The following steps were done during transformation of the data and more detailed information can be found in the r_analysis file

1. For the test and train data, the x data, y data and subject data were read into R and merged into  1 file
2. The test and train data was then combined into 1 file
3. The column names of the new dataset were then extracted and used to determine which variables contained mean and standard deviation values
4. This was then used to extract only the data which contained means and standard deviations
5. The values in the activity column were then modified from numeric to more descriptive values 
6. The labels of the columns in the data set were also made more descriptive
7. Finally the data was shaped to generate the average of each variable for each subject and each activity
8. This data was then written to a file

NOTE: In step 3 all column names which referred to mean or standard deviation were extracted

#4. Running the Script
In order to run the script, the file r_analysis.R should be saved in the same folder as the test data or in the UCI HAR Dataset

The script can then be run by using the following code: 

```
source("r_analys.R")  
r_analysis()  
```


The script will take some time to run but on completion will write the output to a file tidydata.txt in the same folder.

#5. Tidy Data Variables 
The resulting tidy data file will have 180 rows and 88 columns. There will be 6 rows for each subject representing each of the six activities a subject performed. The 88 column  variables in the  tidy data data set  are listed below in 2 columns

Subject refers to one of the 30 subjects involved in the test and Activity refers to the activities undertaken eg WALKING. The remaining columns provided are the mean of all variables for a given subject doing a particular activity


 
 [1] "Subject"                             
 [2] "Activity"                            
 [3] "tBodyAcc-mean()-X"                   
 [4] "tBodyAcc-mean()-Y"                   
 [5] "tBodyAcc-mean()-Z"                   
 [6] "tBodyAcc-std()-X"                    
 [7] "tBodyAcc-std()-Y"                    
 [8] "tBodyAcc-std()-Z"                    
 [9] "tGravityAcc-mean()-X"                
[10] "tGravityAcc-mean()-Y"                
[11] "tGravityAcc-mean()-Z"                
[12] "tGravityAcc-std()-X"                 
[13] "tGravityAcc-std()-Y"                 
[14] "tGravityAcc-std()-Z"                 
[15] "tBodyAccJerk-mean()-X"               
[16] "tBodyAccJerk-mean()-Y"               
[17] "tBodyAccJerk-mean()-Z"               
[18] "tBodyAccJerk-std()-X"                
[19] "tBodyAccJerk-std()-Y"                
[20] "tBodyAccJerk-std()-Z"                
[21] "tBodyGyro-mean()-X"                  
[22] "tBodyGyro-mean()-Y"                  
[23] "tBodyGyro-mean()-Z"                  
[24] "tBodyGyro-std()-X"                   
[25] "tBodyGyro-std()-Y"                   
[26] "tBodyGyro-std()-Z"                   
[27] "tBodyGyroJerk-mean()-X"              
[28] "tBodyGyroJerk-mean()-Y"              
[29] "tBodyGyroJerk-mean()-Z"              
[30] "tBodyGyroJerk-std()-X"               
[31] "tBodyGyroJerk-std()-Y"               
[32] "tBodyGyroJerk-std()-Z"               
[33] "tBodyAccMag-mean()"                  
[34] "tBodyAccMag-std()"                   
[35] "tGravityAccMag-mean()"               
[36] "tGravityAccMag-std()"                
[37] "tBodyAccJerkMag-mean()"              
[38] "tBodyAccJerkMag-std()"               
[39] "tBodyGyroMag-mean()"                 
[40] "tBodyGyroMag-std()"                  
[41] "tBodyGyroJerkMag-mean()"             
[42] "tBodyGyroJerkMag-std()"              
[43] "fBodyAcc-mean()-X"                   
[44] "fBodyAcc-mean()-Y"                   
[45] "fBodyAcc-mean()-Z"                   
[46] "fBodyAcc-std()-X"                    
[47] "fBodyAcc-std()-Y"                    
[48] "fBodyAcc-std()-Z"                    
[49] "fBodyAcc-meanFreq()-X"               
[50] "fBodyAcc-meanFreq()-Y"               
[51] "fBodyAcc-meanFreq()-Z"               
[52] "fBodyAccJerk-mean()-X"               
[53] "fBodyAccJerk-mean()-Y"               
[54] "fBodyAccJerk-mean()-Z"               
[55] "fBodyAccJerk-std()-X"                
[56] "fBodyAccJerk-std()-Y"                
[57] "fBodyAccJerk-std()-Z"                
[58] "fBodyAccJerk-meanFreq()-X"           
[59] "fBodyAccJerk-meanFreq()-Y"           
[60] "fBodyAccJerk-meanFreq()-Z"           
[61] "fBodyGyro-mean()-X"                  
[62] "fBodyGyro-mean()-Y"                  
[63] "fBodyGyro-mean()-Z"                  
[64] "fBodyGyro-std()-X"                   
[65] "fBodyGyro-std()-Y"                   
[66] "fBodyGyro-std()-Z"                   
[67] "fBodyGyro-meanFreq()-X"              
[68] "fBodyGyro-meanFreq()-Y"              
[69] "fBodyGyro-meanFreq()-Z"              
[70] "fBodyAccMag-mean()"                  
[71] "fBodyAccMag-std()"                   
[72] "fBodyAccMag-meanFreq()"              
[73] "fBodyBodyAccJerkMag-mean()"          
[74] "fBodyBodyAccJerkMag-std()"           
[75] "fBodyBodyAccJerkMag-meanFreq()"      
[76] "fBodyBodyGyroMag-mean()"             
[77] "fBodyBodyGyroMag-std()"              
[78] "fBodyBodyGyroMag-meanFreq()"         
[79] "fBodyBodyGyroJerkMag-mean()"         
[80] "fBodyBodyGyroJerkMag-std()"          
[81] "fBodyBodyGyroJerkMag-meanFreq()"     
[82] "angle(tBodyAccMean,gravity)"         
[83] "angle(tBodyAccJerkMean),gravityMean)"
[84] "angle(tBodyGyroMean,gravityMean)"    
[85] "angle(tBodyGyroJerkMean,gravityMean)"
[86] "angle(X,gravityMean)"                
[87] "angle(Y,gravityMean)"                
[88] "angle(Z,gravityMean)"              


