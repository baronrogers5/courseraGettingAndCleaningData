# Variables

* xTrain , yTrain , subjectTrain --all data loaded from training data set.
* xTest , yTest, subjectTest  -- all data loaded from test data set.
* xData, yData , subjectData  -- row bound data (binding test and train data)
* features  -- contains correct names of the xData data set, these features are applied to the columns of meanAndStd.
* activities --similar to features.
* allData -- merges all data sets(xData, yData, subjectData) into one large dataset.
* averagesData -- stores the relevant averges after computation from the ddply() function in plyr library

### This averagesData set is then stored as averageData.txt file.

# Data

## The initial test data is contained in these files ::
 
* activity_labels.txt
* features.txt
* train/X_train.txt
* train/y_train.txt
* train/subject_train.txt
* test/X_test.txt
* test/y_test.txt
* test/subject_test.txt


# Transformations performed

* Row bind, Column bind
* grep
* colMeans


