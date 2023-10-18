#install
install.packages("dplyr")
install.packages("caTools")  
install.packages("ROCR") 

#load
library(dplyr)
library(caTools)
library(ROCR)     

#create dataset
set.seed(123) 
x1 <- rnorm(500, mean=5, sd=1)  
x2 <- rnorm(500, mean=7, sd=2)
x3 <- rnorm(500, mean=3, sd=1.5)
y <- ifelse(x1+x2+x3>15, 1, 0)
df <- data.frame(x1, x2, x3, y) 
df

split <- sample.split(df, SplitRatio = 0.8) 
train_set <- subset(df, split == "TRUE")
test_set<- subset(df, split == "FALSE")

# Training model
logistic_model <- glm(y ~ x1+x2+x3,
                    data = train_set,
                    family = "binomial")
logistic_model

# Summary
summary(logistic_model)

predict_reg <- predict(logistic_model,
                       test_set, type = "response")
predict_reg <-ifelse(predict_reg>0.5 ,1,0)
predict_reg
# Evaluating model accuracy
# using confusion matrix
table(test_set$y, predict_reg)

#ploting roc curve
roc<-performance(prediction(predict_reg,test_set$y),measure = 'tpr',x.measure = 'fpr')
plot(roc)
