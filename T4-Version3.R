#### Ubiqum Module 2: Data Analytics II
### Task 4: Discover Associations Between Products
## Analyst: Alican Tanaçan
# Version 3: Finding Association Between Product Categories

## Libraries ----
library(arules)
library(arulesViz)

## Importing Datasets ----
transactionsdata <- read.transactions("ElectronidexTransactions2017.csv",
                          format = "basket",
                          sep=",",
                          rm.duplicates = T)
ProductCategoryList <- read.csv("Product Category List 3.csv")

# To preserve original data:
data2 <- transactionsdata

## Categorizing The Items ----
# To assign categories for each item info:
data2@itemInfo$label <- ProductCategoryList$Category

# To categorize the products:
data2 <- aggregate(data2, by= data2@itemInfo$label)

# To see the frequency of each category:
itemFrequencyPlot(data2, topN = 13)

## Apriori Algorithm ----
# To find association rules among the categories:
categoryrules <- apriori(data2, parameter = list(support = 0.1,
                                          confidence = 0.7))

# To inspect the rules:
inspect(categoryrules)

# To see parallel coordinates plot:
plot(categoryrules[1:15], 
     method = "paracoord", 
     control = list(reorder = T))

# To write excel for rules:
write(categoryrules,
      file = "category_rules.csv",
      sep = ",",
      quote = TRUE,
      row.names = FALSE)
