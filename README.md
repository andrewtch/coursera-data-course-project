# Document

This is a Course Project submission for Data Science Coursera.

# Prerequisites

Install ```reshape2``` and download / extract data to working directory (or use data in this repo).

# Steps

* step 1: data loading, we change "labels" to "activity", and ```cbind``` them to test / train frames. Then we rbind test and train.
* step 2: we filter columns, containing "std" or "mean", also keeping "activity" and "subject_id" columns
* step 3: we read activities
* step 4: we use factor() to replace "activities" with string values
* step 5: we melt and aggregate data, saving it to "out.csv"
