#### Ubiqum Module 2: Data Analytics II
### Task 4: Discover Associations Between Products
## Analyst: Alican Tanaçan
# Version 4: Association Rules & Frequency of Itemset Analyses

## Libraries ----
library(arules)
library(arulesViz)

## Importing Datasets ----
transactionsdata <- read.transactions("ElectronidexTransactions2017.csv",
                                      format = "basket",
                                      sep=",",
                                      rm.duplicates = F)
ProductCategoryList <- read.csv("Product Category List 3.csv")

# To see the most frequent single items in transactions:
products_1item <- transactionsdata[which(size(transactionsdata) == 1), ]

crosstable <- crossTable(products_1item)

crosstable[1:10, 1:10]

itemFrequencyPlot(products_1item, topN = 10, type = "absolute")

# To preserve original data:
data2 <- transactionsdata

## Categorizing The Items ----
# To assign categories for each item info:
data2@itemInfo$label <- ProductCategoryList$Category

# To categorize the products:
data2 <- aggregate(data2, by= data2@itemInfo$label)

# To see the frequency of each category:
itemFrequencyPlot(data2, topN = 13)

# To see the most frequent single category item in transactions:
categories_1item <- data2[which(size(data2) == 1), ]

crosstable <- crossTable(categories_1item)

crosstable[1:10, 1:10]

itemFrequencyPlot(categories_1item, topN = 13, type = "absolute")

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
