library(lobstr)

x = c(1,2,3)
y = x

obj_addr(x)

obj_addr(y)

y[[3]] = 4

tracemem(x)
y = x
tracemem(y)
y[[3]] = 4L

y[[3]] = 5L

x= list(1:3, "a", 4:6)
ref(x)

x = list(1:2, 1:3, 1:4)
lapply(x, dplyr::last)
sapply(x, dplyr::last)

ti = tibble(
  x = 1:3,
  y = list(1:2, 1:3, 1:4)
)
# https://kuduz.tistory.com/1090
ti %>% mutate(y, map_dbl(y, dplyr::first)) 
ti %>% mutate(y, map_dbl(y, dplyr::last)) 

ti %>% mutate(y, )


library(purrr)

iden = function(p){
  p[3]
}

nth(1:10, 5)
first(integer())

head(c(1,2,3), 3)
