
library(tidyverse)
head(mpg)


ggplot(data=mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))


seq(1, 10)
sample(10)


summary(factor(sample(c(0,1), 100, replace = T)))
        

gss_cat


runif(10)

rnorm(100)

library(readxl)
readxl_example()
readxl_example("clippy.xls")


head(iris)

str(iris)


?mtcars

pairs(mtcars, main = "mtcars data")
coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)


ls()


sum(1:10000)


d <- matrix(1:9 , ncol = 3)
d
apply(d, 1, sum) # 행방향 합
apply(d, MARGIN = 2, FUN = sum) # 열방향 합

head(iris[, 1:4])

apply(iris[, 1:4],2, sum)


r <- lapply(1:3, function(x) { x*2 })
r
unlist(r)


unlist(lapply(list(a = 1:3, b = 4:6), mean))
