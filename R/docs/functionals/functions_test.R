library(purrr)

randomise <- function(f) f(runif(1e3))
randomise(mean)

triple = function(x) x * 3

map(1:3, triple)

map_dbl(1:3, triple)

seq_along(map_dbl(1:3, triple))
mtcars[2]
map_chr(mtcars, typeof)

(1:3)[[2]]
vector("list", length(mtcars))
mtcars[[1]]

map_dbl(mtcars, function(x) length(unique(x)))
map_dbl(mtcars, ~ length(unique(.y)))


n_data = tribble( ~max, ~seq, 3, 1:3, 4, 1:4, 5, 1:5)

length(1:10)
iris
iris %>% group_by(Species)
iris %>% group_by(Species) %>% nest()
n_iris <- iris %>% group_by(Species) %>% nest()
n_iris$data[[2]]
n_iris %>% mutate(n = map(data, dim))

iris %>% 
  mutate(nn = map(Sepal.Length, function(x) x + 1 ))

iris %>% 
  mutate(nn = Sepal.Length + 1)
