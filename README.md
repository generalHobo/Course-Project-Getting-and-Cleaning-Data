title: "Getting & Cleaning Data - Class Project"
author: "David Morton"
date: "July 26, 2015"


===========================================
Purpose
===========================================
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

- 'README.md': this file

- 'CodeBook.md': describes the variables, the data, and any transformations or work that you performed to clean up the data

- 'run_analysis.R': the only code file that will load the raw data, transform it, and create the two tidy datasets

- 'step5.txt': this is a tidy dataset with the average for each variable for each activity and each subject

- (folder) 'UCI HAR Dataset': this is the raw data used 

===========================================
To run the course project
===========================================
1. Source the file 'run_analysis.R'
2. call the function 'courseProject()' -> does not require any parameters to be passed in

===========================================
Assumptions
===========================================
- Does not require raw data to exist ahead of time, if it does not exist it will be downloaded and extracted 
- Built on windows based OS, might not work for Mac
- Requires library - data.table be installed | (minimum version 1.9.5) from GitHub <https://github.com/Rdatatable/data.table/wiki/Installation>
- Requires library - dplyr be installed
