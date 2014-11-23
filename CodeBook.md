# Code Book

## Getting and Cleaning Data Course Project

### run_analysis.R
This is the script which will accomplish the analysis of the data.  You will not need to load any libraries to execute it.  It is constructed of functions and methods included in the base R install.

### ID Fields

* `subject` - The participants of the study are identified by a unique numeric integer.
* `activity` - There are six activities initially identified by an integer.  They are noted below.

### Activity Labels

* `WALKING` (value `1`)
* `WALKING_UPSTAIRS` (value `2`)
* `WALKING_DOWNSTAIRS` (value `3`)
* `SITTING` (value `4`)
* `STANDING` (value `5`)
* `LAYING` (value `6`)

### Data Files

This project's source data can be found here:(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

For the purposes of this project only the files below are required for analysis.  Neither of the 'Inertial Signals' folders, or their contents, will be used.

- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

### Attribute Names

Observation attributes have had their parenthesis removed by the run_analysis.R script to improve readability in the final output.  Example: `tBodyAcc-mean()-Y` is transformed into `tBodyAcc-mean-Y`.  This is done with the gsub() function.

### Variable Names

`data_train` Data frame of X_train.txt contents

`data_test` Data frame of X_test.txt contents

`label_train` Data frame of y_train.txt contents

`label_test` Data frame of y_test.txt contents

`subject_train` Data frame of subject_train.txt contents

`subject_test` Data frame of subject_test.txt contents

`data_table` Data frame of `data_train` and `data_test` created with rbind

`label_table` Data frame of `label_train` and `label_test` created with rbind

`subject_table` Data frame of `subject_train` and `subject_test` created with rbind

`features` Data frame of features.txt contents

`mean_sd_features` Integer factor created using grep on mean and std from `features`

`activities` Data frame of activity_labels.txt contents

`tidyLikeBillyMays` Data frame of `subject_table`, `label_table` and `data_table` created with cbind

`TidyNumberTwo` Data frame created with dimensions retrieved from `tidyLikeBillyMays`

`tidyDataCleanAverage` The final data frame with only the elements required per the project instructions







