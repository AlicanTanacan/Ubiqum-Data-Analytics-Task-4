#### Ubiqum Module 2: Data Analytics II
### Task 4: Discover Associations Between Products
## Analyst: Alican Tanaçan
# Version 1: Finding Insightful Association Rules

# DO NOT RUN ALL SCRIPT, IT HAS 6 EXCELS TO WRITE

## Libraries ----
library(arules)
library(arulesViz)

## Importing Dataset ----
data <- read.transactions("ElectronidexTransactions2017.csv",
                          format = "basket",
                          sep=",",
                          rm.duplicates = F)

## Finding Associations ----
# Apriori 1:
rules1 <- apriori(data, 
                  parameter = list(supp = 0.01, 
                                   conf = 0.5))
plot(rules1[1:19],
     method = "paracoord",
     control = list(reorder = T))

inspect(rules1)

write(rules1,
      file = "association_rules1.csv",
      sep = ",",
      quote = TRUE,
      row.names = FALSE)

associationrules1 <- read.csv("association_rules1.csv")

# Apriori 2:
rules2 <- apriori(data,
                  parameter = list(supp = 0.007,
                                   conf = 0.6))
plot(rules2[1:8],
     method = "paracoord",
     control = list(reorder = T))

inspect(rules2)

write(rules2,
      file = "association_rules2.csv",
      sep = ",",
      quote = TRUE,
      row.names = FALSE)

associationrules2 <- read.csv("association_rules2.csv")

# Apriori 3:
rules3 <- apriori(data,
                  parameter = list(supp = 0.005,
                                   conf = 0.65))
plot(rules3[1:9],
     method = "paracoord", 
     control = list(reorder = T))

inspect(rules3)

write(rules3,
      file = "association_rules3.csv",
      sep = ",",
      quote = TRUE,
      row.names = FALSE)

associationrules3 <- read.csv("association_rules3.csv")

# Apriori 4:
rules4 <- apriori(data, 
                  parameter = list(supp = 0.02, 
                                   conf = 0.4))
plot(rules4[1:16], 
     method = "paracoord", 
     control = list(reorder = T))

inspect(rules4)

write(rules4,
      file = "association_rules4.csv",
      sep = ",",
      quote = TRUE,
      row.names = FALSE)

associationrules4 <- read.csv("association_rules4.csv")

# Apriori 5:
rules5 <- apriori(data, 
                  parameter = list(supp = 0.03, 
                                   conf = 0.4))
plot(rules5[1:5], 
     method = "matrix", 
     control = list(reorder = "support"))

inspect(rules5)

write(rules5,
      file = "association_rules5.csv",
      sep = ",",
      quote = TRUE,
      row.names = FALSE)

associationrules5 <- read.csv("association_rules5.csv")


## Combining All Rules ----
AllRules <- rbind(associationrules1, 
                  associationrules2,
                  associationrules3,
                  associationrules4,
                  associationrules5)