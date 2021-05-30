#install the caret package and the randomForest package
library(caret)
library(randomForest)

# Upload the traina and test data
train <- read.table('C:/Users/SrinathNM/Desktop/titanic/train.csv', sep=",", header= TRUE)
test <- read.table('C:/Users/zulaikha/Desktop/titanic/test.csv', sep = ",", header = TRUE)

# Printing the records
head(test)

# Visualizing the data in box plot chart 
library(fields)
bplot.xy(train$Survived, train$Age)

summary(train$Age)
>  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   0.42   20.12   28.00   29.70   38.00   80.00     177 
   
summary(train$Fare)
 >  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    7.91   14.45   32.20   31.00  512.33 
   
 # Converting &lsquo;Survived&rsquo; to a factor
train$Survived <- factor(train$Survived)
# Set a random seed
set.seed(51)
# Training using &lsquo;random forest&rsquo; algorithm
model <- train(Survived ~ Pclass + Sex + SibSp +
Embarked + Parch + Fare, # Survived is a function of the variables we decided to include
data = train, # Use the train data frame as the training data
method = 'rf',# Use the 'random forest' algorithm
trControl = trainControl(method = 'cv', # Use cross-validation
number = 5) # Use 5 folds for cross-validation

model
Random Forest 
 
891 samples
  6 predictor
  2 classes: '0', '1' 
 
No pre-processing
Resampling: Cross-Validated (5 fold) 
Summary of sample sizes: 712, 713, 713, 712, 714 
Resampling results across tuning parameters:
 
  mtry  Accuracy   Kappa    
  2     0.8047116  0.5640887
  5     0.8070094  0.5818153
  8     0.8002236  0.5704306
 
#Accuracy was used to select the optimal model using the largest value.
#The final value used for the model was mtry = 5.

test$Fare <- ifelse(is.na(test$Fare), mean(test$Fare, na.rm = TRUE), test$Fare)
test$Survived <- predict(model, newdata = test)
test$Survived
