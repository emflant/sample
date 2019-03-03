library(tidyverse)
library(modelr)

Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
Sys.getlocale()
ggplot(sim1, aes(x, y)) + 
  geom_point()


models <- tibble(
  a1 = runif(250, -20, 40),
  a2 = runif(250, -5, 5)
)

ggplot(sim1, aes(x, y)) + 
  geom_abline(aes(intercept = a1, slope = a2), data = models, alpha = 1/4) +
  geom_point() 

# a 는 (절편, 기울기) 의 vector 
# data 의 x 값만 써서, 모델의 y 값을 산출하는 function
model1 <- function(a, data) {
  a[1] + data$x * a[2]
}

model1(c(7, 1.5), sim1)


measure_distance <- function(mod, data) {
  diff <- data$y - model1(mod, data)
  sqrt(mean(diff ^ 2))
}
measure_distance(c(7, 1.5), sim1)


sim1_dist <- function(a1, a2) {
  measure_distance(c(a1, a2), sim1)
}

models <- models %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))
models


ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(
    aes(intercept = a1, slope = a2, colour = -dist), 
    data = filter(models, rank(dist) <= 10)
  )
models
ggplot(models, aes(a1, a2))
ggplot(models, aes(a1, a2)) +
  geom_point(data = filter(models, rank(dist) <= 10), size = 4, colour = "red") +
  geom_point(aes(colour = -dist))


expand.grid(
  a1 = seq(-5, 20, length = 25),
  a2 = seq(1, 3, length = 25)
)

grid <- expand.grid(
  a1 = seq(-5, 20, length = 25),
  a2 = seq(1, 3, length = 25)
) %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))

grid %>% 
  ggplot(aes(a1, a2)) +
  geom_point(data = filter(grid, rank(dist) <= 10), size = 4, colour = "red") +
  geom_point(aes(colour = -dist)) 


ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(
    aes(intercept = a1, slope = a2, colour = -dist), 
    data = filter(grid, rank(dist) <= 10)
  )


gr
best <- optim(c(0, 0), measure_distance, data = sim1)
best
ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(intercept = best$par[1], slope = best$par[2])

sim1
sim1_mod <- lm(y ~ x, data = sim1)
sim1_mod$coefficients[1]
coef(sim1_mod)

stats::

# optimize
f <- function (x, a) (x - a)^2
f(5,2)
optimize
xmin <- optimize(f, c(0, 1), tol = 0.0001, a = 1/3)
xmin

# https://magesblog.com/post/2013-03-12-how-to-use-optim-in-r/

dat=data.frame(x=c(1,2,3,4,5,6), 
               y=c(1,3,5,6,8,12))

min.RSS <- function(data, par) {
  with(data, sum((par[1] + par[2] * x - y)^2))
}

(result <- optim(par = c(0, 100), fn = min.RSS, data = dat))
