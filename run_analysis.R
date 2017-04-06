
# Read in the Training data
# - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each
#    window sample. Its range is from 1 to 30.
# - 'train/X_train.txt': Training set.
# - 'train/y_train.txt': Training labels.

train_subject <- read.table("subject_train.txt")
train_x <- read.table("X_train.txt")
train_y <- read.table("y_train.txt")

# Read in the Test data
# - 'test/subject_test.txt': Each row identifies the subject who performed the activity for each
#    window sample. Its range is from 1 to 30.
# - 'test/X_test.txt': Test set.
# - 'test/y_test.txt': Test labels.

test_subject <- read.table("subject_test.txt")
test_x <- read.table("X_test.txt")
test_y <- read.table("y_test.txt")



# Step 1
# Merge the training and test sets to create one data set

joint_subject <- rbind(train_subject,test_subject)
joint_x <- rbind(train_x,test_x)
joint_y <- rbind(train_y,test_y)



# Step 2
# Extract only the measurements on the mean and
# standard deviation for each measurement

joint.mean <- sapply(joint_x,mean)
joint.sd <- sapply(joint_x,sd)



# Step 3
# Use descriptive activity names to name the activities in the data set
# - 'features.txt': List of all features.
# - 'activity_labels.txt': Links the class labels with their activity name.

features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")



# Step 4
# Appropriately label the data set with descriptive variable names
# Change the labels of the merged X data frame

# Change the column names to match the features
names(joint_x) <- features[,2]

# Match the activity number with the activity name
joint_y <- plyr::join(joint_y,activities)



# Step 5
# From the data above, create tidy data with avg of each variable for each activity
# and each subject

# Add the Activity and Subject number to the data set

joint_x["Activity"]<-joint_y[,2]
joint_x["Subject"]<-joint_subject[,1]

library(dplyr)
# Load the dplyr library, then group the data by Subject and Activity
# and use the summarise_all command to compute the mean of all
# columns that are not being grouped
SummaryData <- joint_x %>% group_by(Subject,Activity) %>%
  summarise_all(mean)

write.table(SummaryData,file="tidy-data.txt",row.name=FALSE)




