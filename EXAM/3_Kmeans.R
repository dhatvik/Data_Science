install.packages(cluster)
install.packages(ClusterR)
library(cluster)
library(ClusterR)

data = data.frame(
		x=c(2,2,8,5,7,6,1,4,3),
		y=c(10,5,4,8,5,4,2,9,9)
	 )
data

str(data)

model = kmeans(data,centers=3)
model

summary(model)

plot(data[c("x","y")],
     col=model$cluster,
     pch=19,
     main="K-means with 3 clusters"
    )

printf(model$cluster)

clusplot(data,model$cluster)	