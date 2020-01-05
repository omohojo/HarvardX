#Q1
#creatResample function can be sused to create bootstrap samples
data("mnist_27")

set.seed(1995, sample.kind="Rounding")
indexes <- createResample(mnist_27$train$y, 10)

head(indexes)

count(as.data.frame(which(indexes$Resample01 == 3)))

count(as.data.frame(which(indexes$Resample01 == 4)))

count(as.data.frame(which(indexes$Resample01 == 7)))

#Q2
un_index <- unlist(indexes)
length(which(un_index ==3))

#Q3
set.seed(1, sample.kind="Rounding")

B <- 10000
M_star <- replicate(B, {
  y <- rnorm(100, 0, 1)
  X_star <- sample(y, N, replace = TRUE)
  quantile(X_star, 0.75)
})

mean(M_star)
sd(M_star)

#Q4
set.seed(1, sample.kind="Rounding")
y <- rnorm(100, 0, 1)
head(y)
set.seed(1, sample.kind="Rounding")

indexes <- createResample(y, 10)
mean(a)
a <- c(quantile(y[indexes$Resample01],0.75),
quantile(y[indexes$Resample02],0.75),
quantile(y[indexes$Resample03],0.75),
quantile(y[indexes$Resample04],0.75),
quantile(y[indexes$Resample05],0.75),
quantile(y[indexes$Resample06],0.75),
quantile(y[indexes$Resample07],0.75),
quantile(y[indexes$Resample08],0.75),
quantile(y[indexes$Resample09],0.75),
quantile(y[indexes$Resample10],0.75))

mean(a)
sd(a)

#Q4 v2

set.seed(1, sample.kind="Rounding")
y <- rnorm(100, 0, 1)
set.seed(1, sample.kind="Rounding")
B <- 10
  boot <- replicate(B, {
    index <- createResample(y, 1)
    quantile(y[index$Resample1], 0.75)
  })
  
mean(boot)
sd(boot)

#Q5
set.seed(1, sample.kind="Rounding")
y <- rnorm(100, 0, 1)
set.seed(1, sample.kind="Rounding")
B <- 10000
boot <- replicate(B, {
  index <- createResample(y, 1)
  quantile(y[index$Resample1], 0.75)
})

mean(boot)
sd(boot)
