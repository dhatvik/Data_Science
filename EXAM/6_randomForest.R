install.packages(caTools)
install.packages(randomForest)
library(caTools)
library(randomForest)

used_id=1:1000
age=sample(20:70,1000,replace=TRUE)
gender=sample(c("male","female"),1000,replace=TRUE)
balance=sample(15000:250000,1000,replace=TRUE)
loans=sample(c("TRUE","FALSE"),1000,replace=TRUE)

bank_data=data.frame(
	used_id=used_id,
	age=age,
	gender=gender,
	balance=balance,
	loans=loans
	)

bank_data$gender=as.factor(bank_data$gender)
bank_data$loans=as.factor(bank_data$loans)
bank_data

split=sample.split(bank_data,SplitRatio=0.7)
train=subset(bank_data,split==TRUE)
test=subset(bank_data,split==FALSE)

input=train[,2:4]
target=train[,5]
model=randomForest(input,target,data=train,class.f=TRUE,ntree=500)
model

pred=predict(model,test)
pred
conf_mat=table(test[,5],pred)
conf_mat

summary(model)
plot(model)
varImpPlot(model)
importance(model)
