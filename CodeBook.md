##Getting and cleaning data
### Course Project
 
#### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### Manipulation with the raw data:
1. Files in train and test folders was merged in one dataset
    * 1.1 Names from features.txt was given by names() function
    * Note: at this step you can uncomment head() function line in code to see     head of merged dataframe

2. Mean and Standard deviations was extracted by using grep() function
 * Note: last gravity labels was not excluded, in this step I followed the task, that the sctipt have to "extracts only the measurements on the mean and standard deviation for each measurement", that means that gravity measurements have mean and sd too, and wa includen. However, I wrote the code to exclude this measurement, in the case you think that gravity must be excluded, please, uncomment 91-93 lines. 

3. Descriptive names for activity was given by gsub function

4. Descriptive variable names became descriptive by splitting and decrypting abbreviations. Symbols was erased. 

5. Tidy dataset was made by ddply function that grouped by subject and activity variables and count mean of groups. 
 * 5.1 After, environment was cleaned to erase all data beside actual dataframe to write in the file
 * 5.2 Data frame was written in the file by write.table function with row.name = F option. 

####List od the variables:

 - Subject: the integer subject ID
 
 - Activity: the string activity name:
  Walking
  Walking Upstairs
  Walking Downstairs
  Sitting
  Standing
  Laying
 
- Measures: integer within normalized range (-1:1)
-Time domain body acceleration mean along X, Y, and Z:
  time body acceleration mean x  
  time body acceleration mean y  
  time body acceleration mean z  
 
 - Time domain body acceleration standard deviation along X, Y, and Z:
  time body acceleration standard deviation x  
  time body acceleration standard deviation y  
  time body acceleration standard deviation z  
 
- Time domain gravity acceleration mean along X, Y, and Z:
  time gravity acceleration mean x  
  time gravity acceleration mean y  
  time gravity acceleration mean z  
 
- Time domain gravity acceleration standard deviation along X, Y, and Z:
  time gravity acceleration standard deviation x  
  time gravity acceleration standard deviation y  
  time gravity acceleration standard deviation z  
 
- Time domain body jerk mean along X, Y, and Z:
  time body acceleration jerk mean x  
  time body acceleration jerk mean y  
  time body acceleration jerk mean z  
 
- Time domain body jerk standard deviation along X, Y, and Z:
  time body acceleration jerk standard deviation x  
  time body acceleration jerk standard deviation y  
  time body acceleration jerk standard deviation z  
 
- Time domain gyroscope mean along X, Y, and Z:
  time body gyroscope mean x  
  time body gyroscope mean y  
  time body gyroscope mean z  
 
- Time domain gyroscope standard deviation along X, Y, and Z: 
  time body gyroscope standard deviation x  
  time body gyroscope standard deviation y  
  time body gyroscope standard deviation z 
  
- Time domain gyroscope jerk mean along X, Y, and Z:
  time body gyroscope jerk mean x  
  time body gyroscope jerk mean y  
  time body gyroscope jerk mean z  

- Time domain gyroscope jerk standard deviation along X, Y, and Z:
  time body gyroscope jerk standard deviation x  
  time body gyroscope jerk standard deviation y  
  time body gyroscope jerk standard deviation z  
 
- Time domain body acceleration magnitude mean:
  time body acceleration magnitude mean  
- Time domain body acceleration magnitude standard deviation:
  time body acceleration magnitude standard deviation  
 
- Time domain gravity acceleration magnitude mean:
  time gravity acceleration magnitude mean  
- Time domain gravity acceleration magnitude standard deviation:
  time gravity acceleration magnitude standard deviation  
 
- Time domain body jerk magnitude mean:
  time body acceleration jerk magnitude mean  
- Time domain gyroscope magnitude standard deviation:
  time body acceleration jerk magnitude standard deviation  
 
- Time domain gyroscope magnitude mean:
  time body gyroscope magnitude mean  
- Time domain gyroscope magnitude standard deviation:
  time body gyroscope magnitude standard deviation  
  
- Time domain gyroscope jerk magnitude mean:
  time body gyroscope jerk magnitude mean  
- Time domain gyroscope jerk magnitude standard deviation:
  time body gyroscope jerk magnitude standard deviation  
 
- Frequency domain body acceleration mean along X, Y, and Z:
  fft body acceleration mean x  
  fft body acceleration mean y  
  fft body acceleration mean z  
 
- Frequency domain body acceleration standard deviation along X, Y, and Z:
  fft body acceleration standard deviation x  
  fft body acceleration standard deviation y  
  fft body acceleration standard deviation z  
 
- Frequency domain body acceleration mean along X, Y, and Z:
  fft body acceleration mean freq x  
  fft body acceleration mean freq y  
  fft body acceleration mean freq z  
 
- Frequency domain body jerk mean along X, Y, and Z:
  fft body acceleration jerk mean x  
  fft body acceleration jerk mean y  
  fft body acceleration jerk mean z  

- Frequency domain body jerk standard deviation along X, Y, and Z:
  fft body acceleration jerk standard deviation x  
  fft body acceleration jerk standard deviation y  
  fft body acceleration jerk standard deviation z  
 
- Frequency domain body jerk standard deviation along X, Y, and Z:
  fft body acceleration jerk mean freq x  
  fft body acceleration jerk mean freq y  
  fft body acceleration jerk mean freq z
    
- Frequency domain gyroscope standard deviation along X, Y, and Z:
  fft body gyroscope mean x  
  fft body gyroscope mean y  
  fft body gyroscope mean z  
  
- Frequency domain gyroscope standard deviation along X, Y, and Z:
  fft body gyroscope standard deviation x  
  fft body gyroscope standard deviation y  
  fft body gyroscope standard deviation z  
 
- Frequency domain gyroscope mean along X, Y, and Z:
  fft body gyroscope mean freq x  
  fft body gyroscope mean freq y  
  fft body gyroscope mean freq z  
  
- Frequency domain body acceleration magnitude mean:
  fft body acceleration magnitude mean  
- Frequency domain body acceleration magnitude standard deviation:
  fft body acceleration magnitude standard deviation  
- Frequency domain body acceleration magnitude mean:
  fft body acceleration magnitude mean freq  
- Frequency domain body jerk magnitude mean:
  fft body body acceleration jerk magnitude mean
- Frequency domain body acceleration magnitude standard deviation:
  fft body body acceleration jerk magnitude standard deviation 
- Frequency domain body jerk magnitude mean:
  fft body body acceleration jerk magnitude mean freq  
- Frequency domain gyroscope magnitude mean:
  fft body body gyroscope magnitude mean  
- Frequency domain gyroscope magnitude standard deviation:
  fft body body gyroscope magnitude standard deviation  
- Frequency domain gyroscope magnitude mean:
  fft body body gyroscope magnitude mean freq
- Frequency domain gyroscope jerk magnitude mean:
  fft body body gyroscope jerk magnitude mean
- Frequency domain gyroscope jerk magnitude standard deviation:
  fft body body gyroscope jerk magnitude standard deviation  
- Frequency domain gyroscope jerk magnitude mean:
  fft body body gyroscope jerk magnitude mean freq 
  
- Angle time domain gravity acceleration mean
  angle time body acceleration mean gravity 
- Angle time domain jerk acceleration mean
  angle time body acceleration jerk mean gravity mean  
- Angle time domain gyroscope acceleration mean
  angle time body gyroscope mean gravity mean  
- Angle time domain gyroscope jerk acceleration mean
  angle time body gyroscope jerk mean gravity mean  
- Angle gravity mean along X, Y, Z
  angle x gravity mean  
  angle y gravity mean  
  angle z gravity mean  
