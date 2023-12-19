install.packages(caTools)
install.packages(randomForest)
library(caTools)
library(randomForest)

user_id <- 1:1000
age <- sample(20:70, 1000, replace = TRUE)
gender <- sample(c("Male", "Female"), 1000, replace = TRUE)
bp <- sample(80:120,1000,replace=TRUE)
cholestrol <- sample(150:250,1000,replace=TRUE)
disease<-sample(c("healthy","Not healthy"),1000,replace=TRUE)

health_data= data.frame(
	user_id=user_id,
	age=age,
	gender=gender,
	bp=bp,
	cholestrol=cholestrol,
	disease=disease
	)

health_data$gender=as.factor(health_data$gender)
health_data$disease=as.factor(health_data$disease)
health_data

split =sample.split(health_data,SplitRatio=0.7)
train=subset(health_data,split==TRUE)
test=subset(health_data,split==FALSE)

input=train[,2:5]
target=train[,6]
model=randomForest(input,target,data=health_data,class.f=FALSE,ntree=500)
model

pred= predict(model,test)
pred
conf_mat=table(pred,health_data$disease)
conf_mat

summary(model)
plot(model)
varImpPlot(model)
importance(model)
 

