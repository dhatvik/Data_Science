#Demonstrate  Kmeans Clustering 
# Installing Packages 
install.packages("ClusterR") 
install.packages("cluster")

#loading
library(ClusterR)
library(cluster)

#dataframe
df <- data.frame(x = c(18, 21, 22, 24, 26, 26, 27, 30, 31, 35, 39, 40, 41, 42, 44, 46, 47, 48, 49, 54),
    y = c(10, 11, 22, 15, 12, 13, 14, 33, 39, 37, 44, 27, 29, 20, 28, 21, 30, 31, 23, 24)
)

#structure
str(df)

#fitting
kmeans_r <- kmeans(df, centers = 2) 
kmeans_r

# Confusion Matrix 
#cm <- table(df$x, kmeans_r$cluster) 
#cm

# Model Evaluation and visualization 
plot(df[c("x", "y")],  
     col = kmeans_r$cluster,
     pch=19,
     main = "K-means with 2 clusters") 


## Visualizing clusters 
y_kmeans <- kmeans_r$cluster 
clusplot(df[c("x","y")], 
         y_kmeans, 
         lines = 0, 
         shade = TRUE, 
         color = TRUE, 
         labels = 2, 
         plotchar = FALSE, 
         span = TRUE, 
         main = paste("Cluster X Y"), 
         xlab = 'X', 
         ylab = 'Y')  

