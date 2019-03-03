

x <- c(2.1, 4.2, 3.3, 5.4)

x[1]
x[2:3]

x[c(4,1)]
x[c(1,4)]


order(x)
x[order(x)]

x[c(1,1)]

# negative integers omit elements at the specified positions.
x[-c(1,3)]
x[-c(3,1)]

x[c(T,F)]
x[c(T,F,T,F)]

x[0]
length(x)
letters[1:length(x)]

y <- setNames(x, letters[1:4])
y
str(y)
y[c("d", "c", "a")]
factor("b")




a <- matrix(1:9, nrow = 3)
colnames(a) <- LETTERS[1:3]

str(a)

a[1:2,]
a[c(1,3), c("B", "A")]
a[c(T,F,T), c("B", "A")]

a[0, ]
a[0, -2]


vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")
vals[c(1,15)]


select <- rbind(
  c(1,1),
  c(3,1),
  c(2,4)
)

vals[select]



x <- list(1:3, "a", 4:6)

str(x)
x
x[1]
x[1][1]

x[[2]]


a <- lapply(mtcars, as.integer)
a
str(a)

mtcars[] <- lapply(mtcars, as.integer)
mtcars
str(a)
is.data.frame(mtcars)



grades <- c(1,2,2,3,1)
info <- data.frame(
  grade = 3:1,
  desc = c("Excellent", "Good", "Poor"),
  fail = c(F, F, T)
)

info
info$grade
# info$grade 벡터의 index 정보가 리턴.
id <- match(grades, info$grade)
info[id, ]


# Random Samples
df <- data.frame(x = c(1,2,3,1,2), y = 5:1, z = letters[1:5])
nrow(df)
sample(nrow(df))
df[sample(nrow(df)), ]

df[sample(nrow(df), 3), ]

# error
df[sample(nrow(df), 6), ]

df[sample(nrow(df), 6, replace = T), ]

# Ordering
x <- c("b", "c", "a")
order(x) # returns 3,1,2
x[order(x)] # returns a,b,c

df2 <- df[sample(nrow(df)), 3:1]
df2

order(df2$x)
df2[order(df2$x),]


var <- "cyl"
head(mtcars)
str(mtcars)

mtcars$cyl
mtcars[[var]]

x <- list(abc = 1)
x

x$a

# $ does partial matching. 
options(warnPartialMatchDollar = TRUE)


# lookup tables
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u = NA)
lookup

lookup[c(1,2,1,1)]

lookup[c("f", "m", "m", "f")]
lookup[x]

# if you don't want names in the result, use unname() to remove them.
unname(lookup[x])


x <- sample(10) < 4
x
which(x)


rep_len(F, 20)

rep(T,20)
