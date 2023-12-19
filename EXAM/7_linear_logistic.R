install.packages(ggplot2)
library(ggplot2)

housing <- data.frame(
	rooms =c(10,12,15,18,20,22,26,27,28,29,32,35,37,39,40),
	rent  =c(60,63,64,66,69,71,74,76,79,83,86,88,90,93,95),
	loans =c(1,1,1,0,1,0,1,0,1,0,0,0,1,1,0)
	)
housing

model=lm(rent ~ rooms, data=housing)
model

summary(model)

ggplot(housing,aes(x=rooms,y=rent))+
geom_point()+
geom_smooth(method='lm',se=FALSE)+
labs(title="LINEAR REGRESSION")

housing$high_rent = ifelse(housing$rent > 75,1,0)

l_model=glm(high_rent ~ rent+loans ,data=housing ,family="binomial")
l_model

summary(l_model)

ggplot(housing,aes(x=rooms,y=high_rent))+
geom_point()+
stat_smooth(method="glm" ,method.args=list(family="binomial"),se=FALSE)+
labs(title="LOGISTIC REGRESSION")
