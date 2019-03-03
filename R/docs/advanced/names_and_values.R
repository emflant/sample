options("scipen" = 100)
runif(3)

df <- data.frame(runif(3), runif(3))
df

names(df) <- c(1,2)
df

x <- runif(1e6)

y <- list(x,x,x)

a <- c(1,5,3,2)
b <- a
b[[1]] = 10
b
a
# install.packages('lobstr')

library(lobstr)

x <- c(1,2,3)
y <- x
lobstr::obj_addr(x)
lobstr::obj_addr(y)

# copy-on-modify
y[[3]] <- 4

lobstr::obj_addr(x)
lobstr::obj_addr(y) # create a new object

base::tracemem(x)
x
y
1:10


f <- function(a, b=0){
  a ^ 2 + b + 0.234
}

f(2,3 )
x <- c(1,2,3)

cat(tracemem(x), "\n")
z <- f(x)
 
untracemem(x)

TRUE && FALSE
1 && 1

length(c(1,2,3))

rep(1,4)

# Non-Linear Minimization
nlm(f,a <- 2, b <- 1)
seq_along(1:10)

print(nlm)



l1 <- list(1,c(2,1),data.frame(x = c(1,5,6), y = c(2,4,3)))
l2 <- l1
l1

l1[3][[1]]

lobstr::obj_addr(l1)
lobstr::obj_addr(l2)

l2[[3]] = 4

lobstr::ref(l1, l2)

runif(10)

# data frames

d1 <- data.frame(x = c(1,5,6), y = c(2,4,3))
lobstr::ref(d1)
d1[,1]
obj_size(letter)
lobstr::obj_size(y)

v <- c(1,2,3)
v[[2]]

v[2]


list_data <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2),
                  list("green",c(4,233)))
list_data[3]

list_data[[3]][[2]][1] + 1

x <-data.frame(matrix(runif(5*1e4),ncol = 5))

medians <- vapply(x, median, numeric(1))
medians



lobstr::mem_used()
gc() 
lobstr::mem_used()


a <- matrix(1:6, nrow = 2, ncol = 3)
a


b <- array(1:6, c(2,3))
b

c <- 1:6
dim(c) <- c(2,3)
c

str(c)


x <- factor(c('a', 'b', 'b', 'a'))
x

typeof(x)

attributes(x)

table(x)


grade <- ordered(c())

today <- Sys.Date()
today

attributes(today)

l1 <- list(
  1:3,
  "a",
  c(TRUE, FALSE, TRUE),
  c(2.3, 4.7)
)
l1

str(l1)

mtcars

lobstr::obj_size(mtcars)
l2 <- list(mtcars, mtcars, mtcars, mtcars)
str(l2)

letters

df1 <- data.frame(x = 1:3, y = letters[1:3])
df1
typeof(df1)

attributes(df1)


x <- NULL
attr(x, "y") <- 1

x <- c(3)
attr(x, "y") <- 1
str(x)

