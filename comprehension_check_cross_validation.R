library(tidyverse)
library(caret)


set.seed(1996, sample.kind="Rounding") #if you are using R 3.6 or later
n <- 1000
p <- 10000
x <- matrix(rnorm(n*p), n, p)
colnames(x) <- paste("x", 1:ncol(x), sep = "_")
y <- rbinom(n, 1, 0.5) %>% factor()

x_subset <- x[ ,sample(p, 100)]

install.packages("BiocManager")
BiocManager::install("genefilter")
library(genefilter)
tt <- colttests(x, y)

pvals <- tt$p.value

#p-value cutoff of 0.01 to define "statistcally significant"
cutoff <- 0.01

ind <- which(pvals <= cutoff)
length(ind)
class(ind)

x_subset <- x[ ,ind]
tt <- colttests(x, y)
pvals <- tt$p.value

#Q4
fit <- train(x_subset, y, method = "glm")
fit$results

#Q5
fit <- train(x_subset, y, method = "knn", tuneGrid = data.frame(k = seq(101, 301, 25)))
ggplot(fit)

#Q6
#We used the entire dataset to select the columns used in the model.

#Q7
library(dslabs)
data("tissue_gene_expression")

tge <- tissue_gene_expression
head(tge)
x <- tge$x
y <- tge$y
fit <- train(x, y, method = "knn", tuneGrid = data.frame(k = seq(seq(1,7,2))))
ggplot(fit)
