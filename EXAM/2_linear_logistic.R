install.packages(ggplot2)
library(ggplot2)

weather <- data.frame(
	temp=c(15,18,19,21,23,24,27,28,30),
	humidity=c(60,63,64,67,69,70,72,75,80),
	rainy_day=c(1,1,0,0,0,1,1,1,0)
	)
weather

model=lm(humidity ~ temp ,data=weather)
model

summary(model)

ggplot(weather,aes(x=temp,y=humidity))+
geom_point()+
geom_smooth(method="lm" , se =FALSE)+
labs(title="Linear Regression of temp vs humidity")

weather$high_humidity = ifelse(weather$humidity > 65,1,0)

l_model =glm(high_humidity ~ humidity + rainy_day ,data=weather ,family=binomial)
l_model 

summary(l_model)

ggplot(weather,aes(x=temp,y=high_humidity))+
geom_point()+
geom_smooth(method="glm" ,method.args=list(family="binomial"), se =FALSE)+
labs(title="Logistic Regression of temp vs high humidity")
 