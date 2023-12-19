install.packages(arules)
install.packages(arulesViz)
library(arules)
library(arulesViz)

df=read.transactions("D:/DataScience/EXAM/market_basket.csv",sep=',',rm.duplicates=TRUE)
df

str(df)

set.seed=220

rules=apriori(data=df,parameter=list(support=0.004,confidence=0.2))

itemFrequencyPlot(df,topN=10)

inspect(sort(rules,by='lift')[1:10])

plot(rules ,method = "graph" , measure= "confidence" ,shading="lift")