# Decision Tree Regression

# Data Preprocessing

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# No splitting because the dataset is very small (just 10 lines)

# #Splitting the data into the Training and Test set
# #install.packages('caTools')
# library('caTools')
# set.seed(123)
# #primer parametro es y, la variable dependiente,
# #segundo el tamaño del training set. devuelve true si va a training set y false si va a test set
# split = sample.split(dataset$Purchased, SplitRatio=0.8) 
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)


# Fitting Decision Tree Model to the dataset
# Create your regressor here
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data=dataset,
                  control = rpart.control(minsplit = 1))


# Predicting a new result with Regression
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualising the Regression  Model results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line (aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
             colour = 'blue') +
  ggtitle('Decision Tree Model') +
  xlab('Level')+
  ylab('Salary')


# Visualising the Regression  Model results (for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line (aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
             colour = 'blue') +
  ggtitle('Decision Tree Model') +
  xlab('Level')+
  ylab('Salary')
