run_analysis <- function () {
        
        
        message("Hello, colleague! This is my function for you. It can run much faster, in a milisecond,
        But I want you to enjoy this process and messages :)
        P.S. Make sure I can find folder UCI HAR Dataset in your working directory.")
        Sys.sleep(6)
        
        require(stringr)
        require(plyr)
                
#---------------->
setwd("") #set your working directory here
#----------------/        
        
        numberSteps<-20
        message("1.0 Reading X and Y train datasets, this takes a while")
        pb <- txtProgressBar(min = 0, max = numberSteps, style = 3, char = ".")
        for(i in 1:numberSteps){
                X_train  <- read.table("./UCI HAR Dataset/train/X_train.txt", header = F, stringsAsFactors = F, sep = "", dec = ".")
                Y_train  <- read.table("./UCI HAR Dataset/train/y_train.txt", header = F, stringsAsFactors = F, sep = "", dec = ".")
                subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = F, stringsAsFactors = F, sep = "", dec = ".")
                setTxtProgressBar(pb, i)
        }
        close(pb) 
        message("1.0 Done")
        
        message("1.1 Merging train in form |X_train|subject_train|Y_train")
        pb <- txtProgressBar(min = 0, max = numberSteps, style = 3, char = ".")
        Sys.sleep(1)
        for(i in 1:numberSteps){
                merged_train <- cbind(X_train, subject_train)
                merged_train <- cbind(merged_train, Y_train)
                setTxtProgressBar(pb, i)
        }
        close(pb) 
        message("1.1 Done")
        
        
        
        message("1.2 Reading test datasets, this takes a while")
        for(i in 1:numberSteps){
                X_test  <- read.table("./UCI HAR Dataset/test/X_test.txt", header = F, stringsAsFactors = F, sep = "", dec = ".")
                Y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt", header = F, stringsAsFactors = F, sep = "", dec = ".")
                subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = F, stringsAsFactors = F, sep = "", dec = ".")
                setTxtProgressBar(pb, i)
        }
        close(pb) 
        message("1.2 Done")
        
        message("1.3 Merging test |X_test|subject_test|Y_test")
        Sys.sleep(1)
        merged_test <- cbind(X_test, subject_test)
        merged_test <- cbind(merged_test, Y_test)
        Sys.sleep(2)
        
        message("1.4 Merging train and test datasets")
        Sys.sleep(1)
        for(i in 1:numberSteps){
                merged_train_test <- rbind(merged_train, merged_test)
                setTxtProgressBar(pb, i)
        }
        close(pb) 
        message("1.4 Done")
       
        
        message("1.5 Read features.txt")
        Sys.sleep(1)
        features <-  read.table("./UCI HAR Dataset/features.txt", header = F, stringsAsFactors = F, sep = "")
        Sys.sleep(1)
        message("1.6 Adding features.txt as names to the top of merged_train_test")
        names(merged_train_test) <- features[,2]
        
        data <- merged_train_test
        rm(merged_train_test)
        
        # test if dataset done correctly
        #head(data[,1:5])
        #Sys.sleep(4)
        
        message("2.0 Extracting mean and std variables")
        Sys.sleep(3)
        data_mean_sd <- grep("[Mm]ean|[Ss][Tt][Dd]", names(data))
        data_mean_sd <- data[data_mean_sd]
        message("2.1 Excluding gravity labels, I'm not sure if we have to exclude gravity measurements, 
        some people exclude, some not, here I will literally follow each measurement in the task:
        Extracts only the measurements on the mean and standard deviation for each measurement")
        Sys.sleep(4)

        # But if you think gravity have to be excluded, just uncomment next two lines.
        # data_no_gravity <- grep("[Gg]ravity", names(data_mean_sd))
        # data_mean_sd <- data_mean_sd[, -data_no_gravity]
        
        #"2.2 dont forget last two colums in activity labesls, their names was NA")
        Sys.sleep(2)
        data_mean_sd <- cbind(data_mean_sd, data[,c(562,563)])
        rm(data)
        
        message("3.0 Giving names for activities, I suppose there is some another better way for naming, please advice me in feedback")
        Sys.sleep(4)
        for(i in 1:numberSteps){
                data_mean_sd$NA.1 <- gsub(1, "Walking", data_mean_sd$NA.1)
                data_mean_sd$NA.1 <- gsub(2, "Walking_upstairs", data_mean_sd$NA.1)
                data_mean_sd$NA.1 <- gsub(3, "Walking_downstairs", data_mean_sd$NA.1)
                data_mean_sd$NA.1 <- gsub(4, "Sitting", data_mean_sd$NA.1)
                data_mean_sd$NA.1 <- gsub(5, "Standing", data_mean_sd$NA.1)
                data_mean_sd$NA.1 <- gsub(6, "Laying", data_mean_sd$NA.1)
                setTxtProgressBar(pb, i)
                close(pb) 
        }
                message("Changing name for activity and subject variables")
                colnames(data_mean_sd)[88] <- "Activity"
                colnames(data_mean_sd)[87] <- "Subject"
        message("3.0 Done")
        Sys.sleep(2)
        
        message("4.0 Giving descriptive names for variables")
        message("4.0.1 Splitting variables, credits for solution to Rahmnatn at https://stackoverflow.com/questions/7988959/splitting-string-based-on-letters-case")
        Sys.sleep(4)
        names(data_mean_sd) <- gsub("(.)([[:upper:]])", "\\1 \\2", names(data_mean_sd))
        message("4.1 Cleaning symbols and giving descriptive names")
        names(data_mean_sd) <- gsub("[()-,]"," ",names(data_mean_sd))
        names(data_mean_sd) <- gsub("[-]"," ",names(data_mean_sd))
        names(data_mean_sd) <- gsub("\\<t\\>","time", names(data_mean_sd))
        names(data_mean_sd) <- gsub("[Aa]cc","acceleration",names(data_mean_sd))
        names(data_mean_sd) <- gsub("[Gg]yro","gyroscope",names(data_mean_sd))
        names(data_mean_sd) <- gsub("[Mm]ag","magnitude",names(data_mean_sd))
        names(data_mean_sd) <- gsub("f","FFT",fixed = TRUE, names(data_mean_sd))
        names(data_mean_sd) <- gsub("std","standard deviation", fixed = TRUE, names(data_mean_sd))
        names(data_mean_sd) <- gsub("freq","frequency", names(data_mean_sd))
        names(data_mean_sd) <- str_trim(names(data_mean_sd), side = "both")
        names(data_mean_sd) <- tolower(names(data_mean_sd))
        Sys.sleep(2)

        message("5.0 Making a new tidy dataset with avg of each variable for each activity and each subject")
        message("Short way, long way in script")
        tidy_data_using_ddply <- ddply(data_mean_sd, .variables = c("subject", "activity"), .fun = colwise(mean) , .progress = progress_text(char = "."))
        
        # long way
        # # This was my first experimental function :)
        # uncomment to try
        # attach(data_mean_sd)
        # tidy_data <- aggregate(data_mean_sd, by = list(activity, subject), FUN = "mean")
        # detach(data_mean_sd)
        # tidy_data <- tidy_data[, -c(89,90)] 
        # #Name groups
        # colnames(tidy_data)[1] <- "activity"
        # colnames(tidy_data)[2] <- "subject"
        
        message('5.1 Cleaning environment, all but actual data frame')
        rm(list=(ls()[ls()!="tidy_data_using_ddply"])) 
        Sys.sleep(2)
        
        message('5.2  Write table into text file')
        write.table(tidy_data_using_ddply, "tidy.txt", sep = ",", dec=".",  row.names = F, fileEncoding = "UTF-8")
        
        writeLines("All done! Check your working directory for tidy.txt  \n I hope there was no errors and you enjoyed this cleaning. \n Please give me five stars, leave a comment and subscribe to my channel! :P")
}

run_analysis()

