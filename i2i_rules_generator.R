Itembasket = read.csv("ItemsBasket.csv")

library(arules)
library(arulesViz)

print("Description of the transections")
trans <- read.transactions("ItemsBasket.csv", format="basket", sep = ",")
trans
summary(trans)

par(oma=c(2,2,1,1))
itemFrequencyPlot(trans, topN=20, type="absolute")

rules <- apriori(trans, parameter = list(supp = 0.001, conf = 0.8))
rules <- sort(rules, by="confidence", decreasing=TRUE)
inspect(rules)
#write.csv("rules.csv")
