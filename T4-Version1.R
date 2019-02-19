#### Ubiqum Module 2: Data Analytics II
### Task 4: Discover Associations Between Products
## Analyst: Alican Tanaçan
# Version 1: Getting To Know Transactional Data

## Libraries ----
library(arules)
library(arulesViz)

## Importing Dataset ----
data <- read.transactions("ElectronidexTransactions2017.csv",
                          format = "basket", sep=",", rm.duplicates=FALSE)
# To explore transactions and items:
summary(data)
str(data)
length(data)
itemLabels(data)

## Visualizing Dataset ----
itemFrequencyPlot(data, topN = 10)
image(sample(data,250,125))

## Apriori Algorithm ----
rules <- apriori(data, parameter = list(supp = 0.01, conf = 0.5))
inspect(rules)
summary(rules)

# To inspect rules in decreasing order by measure:
inspect(sort(rules, decreasing = TRUE, by = "support"))
inspect(sort(rules, decreasing = TRUE, by = "confidence"))
inspect(sort(rules, decreasing = TRUE, by = "lift"))

# To see redundance among the rules:
is.redundant(rules)

# To plot the rules:
plot(rules[1:6], method = "paracoord", control = list(reorder = TRUE))
plot(rules[1:6], method = "matrix", control = list(reorder = "support"))
