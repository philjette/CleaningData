CleaningData
============

Coursera Getting and Cleaning Data - Course Project

This project uses data linked to from the course website represent data collected 
from the accelerometers from the Samsung Galaxy S smartphone.

Test and Train datasets are combined, activities and subjects are added along with features for the column headers. 
Data is then stripped of all but the mean/sd variables, then molten and dcast to output means by subject and activity.

The plyr and reshape2 libraries were both used. 
