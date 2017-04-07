# Getting-and-Cleaning-Data-Project
Peer-graded assignment for Course 3 of Data Science

## Files in this repo

* Codebook.rmd
  + A description of the variables used in the R script and the signal data contained in the data set
* run_analysis.R
  + The actual R code that reads in the data set, combines, and then summarizes the mean of each variable
  for each activity and each subject.  It then produces the tidy-data.txt
* tidy-data.txt
  + This contains the output of the summary data produced by the R script
* README.md
  + This Readme file

### Original data

The run_analysis.R script reads each of the input files from the current directory from which the script was executed.  That data is not provided in this repo.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
