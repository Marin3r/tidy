 
Code book
=========


For the provided UCI HAR Dataset the following vars are set from run_analysis.R. See the [README](https://github.com/Marin3r/tidy/blob/master/readme.txt) for additional details.

**Tidy Data**

A data.table named tidyData is set with the following columns. All units are maintained from the original data set. A file named tidyData.txt is written from run_analysis.R.


| Column        |             Description                | type    |
| :------------ |:---------------------------------------| :-------|
| Subject       | Identifier code of subject             | integer |
| Activity      | Label of the activity                  | factor  |    
| Set           | Which data set subject was part of.    | factor  |      
| Mean Samples  | Mean of variables by Subject/ Activity | numeric |       


**Units of data - mean samples**

The data has been scaled by dividing by the range, and when you divide units by the same units, the units are cancelled


**Reference or link to orginal data**

Source data is from the [UCI Machine Learning Repository] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)





