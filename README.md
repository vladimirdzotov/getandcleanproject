###Files in this repo

README.md -- general descryption of repo
CodeBook.md -- codebook describing variables, the data and manipulation
run_analysis.R -- script for producing tidy dataset

### Quick start with run_analysis.R 
run_ananysis was written in form of function, friendly for my peers. It shows messages of current task running and progress bar for time-consuming tasks. 
To start function:
1. Open file run_analysis.R, go to 13 line and set your working directory with unzipped folder "UCI HAR Dataset"
2. Select function from line 1 to 159 and run the code. This will load function into RAM. 
3. Run run_analysis() in console, you will see my "Hi!" message to you. Enjoy! 

### What run_analysis.R do?

1. Merge fiels in train and test folders. 
2. Extracts mean and standard deviation by using grep() function
3. Gives descriptive names for activity by gsub function
4. Gives descriptive names by splitting and decrypting abbreviations. 
5. Tidy dataset was made by ddply function that grouped by subject and activity variables and count mean of groups. 

After all, he writes data frame in file by write.table function with row.name = F option. 
