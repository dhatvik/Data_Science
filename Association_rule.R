#write a program to demonstrate association rule

# Installing Packages 
install.packages("arules") 
install.packages("arulesViz") 

#library import
library(arules)
library(arulesViz)

# Loading data 
dataset = read.transactions("D:/MY DOWNLOADS/Market_Basket_Optimisation.csv",sep = ',', rm.duplicates = TRUE)

# Structure 
str(dataset)  


# Fitting model 
# Training Apriori on the dataset 
set.seed = 220 # Setting seed 
association_rules = apriori(data = dataset,  
                        parameter = list(support = 0.004,  
                                         confidence = 0.2)) 

# Plot 
itemFrequencyPlot(dataset, topN = 10) 

# Visualising the results 
inspect(sort(association_rules, by = 'lift')[1:10]) 
plot(association_rules, method = "graph",  
     measure = "confidence", shading = "lift") 
