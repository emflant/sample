
runif(1e3)

randomise <- function(f) f(runif(1e3))
randomise(mean)
dunif(runif(20))


u <- runif(20)
u
punif(u)
dunif(u)

# 0~5 구간의 전체 확률을 1 이라고 하면,
# 밑변이 5, 높이가 0.2 인 직사각형 모양의 함수가 된다.
# 그래서 3일때의 확률은 0.2로 리턴된다.
dunif(3,0,5) # 0.2

# 0~5 사이의 균등분포 관계라면,
# 
punif(1,0,5) # 0~1 까지 나올 확률은 0.2. (적분된 넓이)
punif(2,0,5) # 0.4
punif(5,0,5) # 0~5 까지 나올 확률은 전체의 경우이므로 1

# 나올 확률이 0.2인 x값의 위치.
qunif(0.2,0,5) # 1
qunif(0.4,0,5) # 2
qunif(1,0,5) # 5




# map()
library(purrr)

triple <- function(x) x* 3
triple(49)
map_dbl(1:3, triple)

# 함수가 리턴값이 복수개이면, 리스트형태로 리턴해야함.
pair <- function(x) c(x,x)
map_dbl(1:3, pair)
map(1:3, pair)

# 
unique(c(1,1,1,2,56,2))

head(mtcars)

unique(mtcars$mpg)
length(unique(mtcars$mpg))

# 동일한 의미.
map_dbl(mtcars, function(x) length(unique(x)))
map_dbl(mtcars, ~ length(unique(.x)))

as_mapper(~ length(unique(.x)))

map(1:3, ~ runif(2))



str(split(mtcars, mtcars$cyl))
