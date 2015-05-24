#Run analysis function to merge training and test data sets
#and create a clean data set as the project for the Getting
#and Cleaning Data course by Coursera

#The default file names remain similar to the download file names
#X_text.txt (X test data) and X_train.txt(X training data)
#Col names for the original files are found in features.txt

run_analysis<-function(){
        
        #####PART 1######
        #Read the two files into variables xtest and xtrain respectively
        xtest<-read.table("test/X_test.txt",sep="")
        xtrain<-read.table("train/X_train.txt",sep="")
        
        #Read the activity label files to indicate what activity was done
        xtestact<-read.table("test/y_test.txt",sep="")
        xtrainact<-read.table("train/y_train.txt",sep="")
        
        #Read the subject data to identify the subjects
        xtestsubject<-read.table("test/subject_test.txt",sep="")
        xtrainsubject<-read.table("train/subject_train.txt",sep="")
        
        
        #Merge the all test data into 1 data set ie subject,activity, rest of the data
        xtestdata<-cbind(xtestsubject,xtestact,xtest)
        
        #Merge the all training data into 1 data set ie subject,activity, rest of the data
        xtraindata<-cbind(xtrainsubject,xtrainact,xtrain)
        
        #Merge the test and training data using rbind because there is no common subject id in both files
        #which could be used for a useful merge
        #Although the activity ID is common, using this would not necessarily make a reduced dataset
        xdata<-rbind(xtestdata,xtraindata)
        
        ######PART 2#########
        #Extract the mean and standard deviation and mean for each measurement
        #Column names with names ending in mean() and also containing Mean were selected
        
        #Extract all the column names which have the phrase mean from the features.txt file
        
        #Read in features.txt file
        colnames<-read.table("features.txt",sep="")
        
        #Create empty frame to hold the relevant columnnames
        colnamesmean<-data.frame()
        
        #Cycle through the features.txt file checking for the phrase "mean" in the column name, ignoring the case
        #position and store the result (name and index) in colnames mean
        for(i in 1:nrow(colnames)){
                if(grepl("mean",colnames[i,2],ignore.case=TRUE)==TRUE){
                        colnamesmean<-rbind(colnamesmean,colnames[i,]) 
                }
                        
        }
        #Remove NA values
        meannames<-colnamesmean[complete.cases(colnamesmean),]
        #print(colnamesmean)    
        #Repeat the process above to get the standard  deviation data
        colnamesstd<-data.frame()
        for(i in 1:nrow(colnames)){
                if(grepl("std",colnames[i,2],ignore.case=TRUE)==TRUE){
                        colnamesstd<-rbind(colnamesstd,colnames[i,]) 
                }
                
        }
        #Remove NA values
        stdnames<-colnamesstd[complete.cases(colnamesstd),]
        
        #Combine column names 
        ########and order by index into variable newnames
        newnames0<-rbind(meannames,stdnames)       
        newnames<-newnames0[order(newnames0$V1),]
        
        #Extract the mean and  sd data
        xdatanew<-xdata[,1:2]
        j<-3
        for(i in 1:nrow(newnames)){
        #Add 2 since the first 2 columns are for the subject and activity respectively
        xdatanew[j]<-xdata[,(2+newnames[i,1])]     
        j<-j+1
        }
        
        
        ######PART 3####
        #Modify activity names  from numeric to descriptive names
        #Descriptive names used were extracted from the activity_labels file
        
        labels<-read.table("activity_labels.txt",sep="")
        xdatalabel0<-data.frame()
        xdatalabel<-data.frame()
        
        #Extract the activity column from the data set 
        actcol<-xdatanew[,2]
        actcol2<-xdata[,2]
        
        #Replace the numbers with descriptive names
        for(i in 1:nrow(labels)){
                #print(i)
                #print(labels[i,2])
        acol<-as.data.frame(sapply(actcol2,gsub,pattern=i,replacement=labels[i,2]))
        actcol2<-acol
        }
        #Rename the column
        names(actcol2)<-c("Activity")
                        

        #Merge the new columns into the tidy data set
        xdatanew3<-cbind(Subject=xdatanew[,1],actcol2,xdatanew[,3:ncol(xdatanew)])
        
        
        
        
        ###PART 4####
        #Appropriatelay label the data set with descriptive variable names
        
        #Get the list of names from the newnames variable and create the full list of names
        fnames<-c("Subject","Activity")
        snames<-as.character(newnames[,2])
        fullnames<-append(fnames,snames)
        
        #Write the new names into the xdatanew3 dataset
        names(xdatanew3)<-fullnames
        
        ####PART 5###
        #Using the data set generated in step 4 generate the average of each variable for each subject and each subject
        
        #We load the reshape library for this part
        library(dplyr)
        
        #Melt the data into id and variables
        #xdatamelt<-melt(xdatanew3,id=fnames,measure.vars=snames)
        #Group the data
        
        xgroup<-group_by(xdatanew3,Subject,Activity) %>%summarise_each(funs(mean))
        
        #Write the data to a file
        write.table(xgroup,file="./tidydata.txt",row.names=FALSE)
        
        
}