f02 <- function(x,y){
  x+y
}

f02(1,2)

formals(f02)

body(f02)

environment(f02)

str(f02)

f01 <- function(x) {
  sin(1 / x ^ 2)
}

typeof(f01)

# function composition

square <- function(x) x^2
deviation <- function(x) x - mean(x)

x <- runif(100)

deviation(x)

sqrt(mean(square(deviation(x))))


library(magrittr)

x %>%
  deviation() %>%
  square() %>%
  mean() %>%
  sqrt()


# Lexical scoping
x <- 10
g01 <- function () {
  x <- 20
  x
}

x <- 1
g04 <- function() {
  y <- 2
  i <- function() {
    z <- 3
    c(x, y, z)
  }
  i()
}
g04()



x <- 10
y <- 20

g05 <- function() {
  y <- 2
  function() {
    c(x, y)
  }
}

g05()()
g06 <- g05()
g06()


g07 <- function(x) x + 1
g08 <- function() {
  g07 <- function(x) x + 100
  g07(10)
}
g08()

g07(10)

str(ls())


# Errors

j05 <- function() {
  stop("I'm an error")
  return(10)
}

j05()

cat(1,2,3, sep = "")

getwd()

force(j05)

