install.packages(dplyr)
install.packages(ggplot2)
library(dplyr)
library(ggplot2)

data <- data.frame(
	x=(2,2,8,5,7,6,1,4,3,),
	y=(10,5,4,8,5,4,2,9,9)
     )

plot(data$x,data$y,col="red",pch=19)

d_mat=dist(data,method="euclidean")
d_mat

model = hclust(d_mat,method="average")
model 

summary(model)

plot(model)

fit<-cutree(model,k=3)
print(fit)


