---
title: "CodeBook.md"
author: "Kanji Sakamoto"
date: "2020/9/7"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Source data

the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Download file

the (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) file was downloaded by click and stored in my PC.
So, the text files is called from a directory by read.table().

## Dataset

'features.txt'

'activity_labels.txt'

'X_train.txt'

'y_train.txt'

'X_test.txt' 

'y_test.txt'

'subject_train.txt' 

'subject_test.txt' 

## Variables

re_column: column names drawn from features.txt and modify the names appropriately

ms_bind: extract mean and standard deviation column of X train&test merged dataset

alldata: merge X,Y,subject train&test dataset

alldataMeans: a second, independent tidy data set with the average of each variable for each activity and each subject.

## Column names

At first, I made column names because the train and test text files don't contain proper column names.
so, I used "features.txt" to make "re_column" which is used for the coliumn names of the merged file.

## Merge the files 
merged "X_test.txt"and "X_train.txt" by rbind function. 
When you use merge function, the data is sorted by the value of column 1.
In this assignment, I think rbind is better.

## Change Y value from number to character by using features.txt 
the Y.train&test.txt values are initially number.
So, substitute the numbers to characters which characters are in features.txt

## Create Table of the average
we have to make a text file of tidy data set with the average of each variable for each activity and each subject. So, I used dplyr package and sort and merge the file.
