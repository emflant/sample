x <- rnorm(10, 10, 1)
x <- density(x)
x

mean(x)

plot(x)

# https://thebook.io/006723/ch07/01-1/
# http://hsm-edu.tistory.com/263
# https://www.statmethods.net/advgraphs/probability.html
# https://brunch.co.kr/magazine/studymoney

# 평균 0, 표준 편차 10인 정규 분포로부터 난수 100개
rnorm(100, 0, 10)
d <- density(rnorm(100, 0, 10))

# 밀도 그림(density)
plot(density(rnorm(100, 0, 10)))


# 단순 임의 추출(sample)
# REPLACE : 복원 추출 여부
# 한 번 뽑힌 데이터가 다시 뽑힐 수 있는 경우를 복원 추출, 한 번 뽑힌 데이터는 다시 뽑힐 수 없는 경우를 비복원 추출이라 한다.
sample(c("f", "b"), 100, replace = TRUE)

ss <- factor(sample(c("f", "b"), 10000, replace = TRUE), levels = c("f", "b"))
summary(ss)
plot(ss)

# 가중치 추가하여 
summary(sample(1:3, 500, replace=TRUE, prob=c(10, 30, 60)))
help(Distributions)

dnorm(0, sd=5)
dnorm(0, sd=5)
dnorm(170, mean = 170, sd = 5)

plot(seq(-10,10, by = 0.01), dnorm(seq(-10,10, by = 0.01), mean=0, sd=10))


dnorm(0)*sqrt(2*pi)
pi

options("scipen" = 100)

# 정규분포 변수 
# rnorm : 평균과 표준 편차를 인자로 받아 정규 분포 난수를 n 개 발생시키는 함수
# 평균 170cm , 표준편차 5 cm 인경우 정규분포를 따르는 100개 난수를 발생.
rnorm(100, 170, 5)
dd <- density(rnorm(100, 170, 5))
# density 는 리스트(list) 객체로 담겨있음.
dd$x
dd$y
dd$bw
dd$n
plot(density(rnorm(100000, 170, 5)))

# 확률 밀도 함수(정규분포표에서 y 축의 값)
# 정규분포표에서 150 cm 가 갖는 확률 밀도값(y축값)
dnorm(x = 150, mean = 170, sd = 5)

# 누적분포함수(확률변수이하 값을 가질 확률)
# 확률변수 185 cm 이하 값을 가질 확률
pnorm(q = 185, mean = 170, sd = 5, lower.tail = TRUE)  # 0.9986501
pnorm(q = 185, mean = 170, sd = 5, lower.tail = FALSE) # 0.001349898


# 분위수함수(Quantile)
# 확률값에 맞는 확률변수를 역으로 산출함. pnorm 함수의 역함수.
qnorm(p = 0.95, mean = 170, sd = 5, lower.tail = TRUE) # 178.2243
qnorm(p = 0.95, mean = 170, sd = 5, lower.tail = FALSE) # 161.7757


#########################################################
pnorm(q = 3, mean = 0, sd = 1)
pnorm(q = -3, mean = 0, sd = 1)
pnorm(q = 3, mean = 0, sd = 1) - pnorm(q = -3, mean = 0, sd = 1)



1 - qnorm(pnorm(q = 3, mean = 0, sd = 1) - pnorm(q = -3, mean = 0, sd = 1),
      mean = 0, sd = 1)

pnorm(q = -3, mean = 0, sd = 1) * 2

qnorm(pnorm(q = -3, mean = 0, sd = 1) * 2, mean = 0, sd = 1)
pnorm(q = 170-5, mean = 170, sd = 5, lower.tail = TRUE) # 0.1586553
pnorm(q = 170+5, mean = 170, sd = 5, lower.tail = TRUE) # 0.8413447

pnorm(q = 170+5, mean = 170, sd = 5, lower.tail = TRUE) -
    pnorm(q = 170-5, mean = 170, sd = 5, lower.tail = TRUE)

# 정규분포의 각 표준편차 구간에 대한 확률.
# 
get_pnorm <- function (mean, sd, n){
    p <- pnorm(q = mean + n * sd, mean = mean, sd = sd, lower.tail = TRUE) -
        pnorm(q = mean - n * sd, mean = mean, sd = sd, lower.tail = TRUE)
    desc <- paste(mean - n * sd, "~", mean + n * sd, 
                   " 사이의 확률", sep = "")
    data.frame(mean, sd, n, p, desc)
}

get_pnorm(170, 5, n = 1:3)

x <- seq(-4,4,length.out = 100)
x
y <- dnorm(x)
y


degf <- c(1, 3, 8, 3000)
colors <- c("red", "blue", "darkgreen", "gold", "black")
labels <- c("df=1", "df=3", "df=8", "df=30", "normal")

plot(x, y, type="l", lty=2, xlab="x value",
     ylab="Density", main="Comparison of t Distributions")

# The Student t Distribution 
for (i in 1:4){
    lines(x, dt(x,degf[i]), lwd=2, col=colors[i])
}

legend("topright", inset=.05, title="Distributions",
       labels, lwd=2, lty=c(1, 1, 1, 1, 2), col=colors)

# df (degrees of freedom) 값이 높을수록 정규분포와 동일해진다.
dt(0,30000000)
dnorm(0)






mean=100; sd=15
lb=80; ub=120

x <- seq(-4,4,length=100) * sd + mean
hx <- dnorm(x,mean,sd)

plot(x, hx, type="n", xlab="IQ Values", ylab="",
     main="Normal Distribution", axes=FALSE)
lines(x, hx)
i <- x >= lb & x <= ub
x[i]
c(lb,x[i],ub)
c(0,hx[i],0)
polygon(c(lb,x[i],ub), c(0,hx[i],0), col="gray")

area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
area
result <- paste("P(",lb,"< IQ <",ub,") =",
                signif(area, digits=3))

mtext(result,3)
axis(1, at=seq(40, 160, 20), pos=0) 




mean=0; sd=1
lb=-3; ub=3

x <- seq(-4,4,length=1000) * sd + mean
hx <- dnorm(x,mean,sd)

plot(x, hx, type="n", xlab="Values", ylab="",
     main="Normal Distribution", axes=FALSE)
lines(x, hx)
i <- x >= lb & x <= ub

polygon(c(lb,x[i],ub), c(0,hx[i],0), col="gray")

area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
result <- paste("P(",lb,"< u <",ub,") =",
                signif(area, digits=3))
mtext(result,3)
axis(1, at=seq(-4, 4, 1), pos=0) 




qnorm(1-0.025, 0, 1) # 1.959964


mean=0; sd=1
lb=1.96; ub=4

x <- seq(-4,4,length=1000) * sd + mean
hx <- dnorm(x,mean,sd)

plot(x, hx, type="n", xlab="Values", ylab="",
     main="Normal Distribution", axes=FALSE)
lines(x, hx)
i <- x >= lb & x <= ub

polygon(c(lb,x[i],ub), c(0,hx[i],0), col="gray")

area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
result <- paste("P(",lb,"< u <",ub,") =",
                signif(area, digits=3))
mtext(result,3)
axis(1, at=c(-4, 0, 1.96, 4), pos=0) 

# 허용수준 2.5 %
norm_graph(lb = 1.96, ub=4)

# 허용수준 1%
qnorm(0.99) # 2.326348 = 2.33
norm_graph(lb = 2.33, ub=4)

norm_graph(lb = -4, ub=4)
