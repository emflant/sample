# command + option+r : 전체실행
# command + enter : 라인실행
library(help="base")

install.packages("plotrix")

Sys.setlocale("LC_CTYPE","ko_KR.UTF-8")
Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
par(family="NanumGothic")

par()$family

# http://www.mind-mining.co.kr/2016/05/using-r-mac.html
install.packages("extrafont")
library(extrafont)
font_import() 
par(family="NanumGothic")
# par(family="AppleSDGothicNeo")


x <- c(80, 85, 30)
x <- x + 1
x
x <- c(1,"A", 2)
x
x <- x + 1


x <- seq(4,29, by=3)
x

x[3]
x <- 4:10

x[x>=2 & x <= 20]

x[3:5]
x

sum(x)
mean(x)
middle(x)
mid(x)
var(x)
sd(x)
sqrt(x)
length(x)

n <- NULL
is.null(n)

y<-c(1,2,3,NA,5)
y
z<- 10/0
z


a<- array(1:3, dim=c(3,2))
a
a <- array(1:6, dim=c(2,3))
a

b <- matrix(1:6, nrow=2, byrow = TRUE)
b


v1 <- c(1,2,3,4)
v2 <- c(5,6,7,8)
v3 <- c(9,10,11,12)

vs <- rbind(v1,v2,v3)
vs

vs <- cbind(v1,v2,v3)
vs

colnames(vs) <- c("1열", "2열", "3열")
vs



"홍길동"


d <- data.frame(성명=c("홍길동", "손오공"), 나이=c(20,30), 주소=c("서울", "부산"))
d

d <- cbind(d, 학과=c("비즈", "경영"))
d <- NULL

summary(d)

d <- rbind(d, data.frame(성명=c("가나다"), 나이=c(22), 주소=c("태백")))

d[1,2]
d[,2]
d[-1,]
d[1]


py <- c(9,15,20,5)

pie(py, main = "lkj 부서별")



barplot(py, col=rainbow(length(py)))

.libPaths()


gender


aa <- factor(c("이름3", "이름2", "이름1"), levels = c("이름1", "이름2", "이름3"), ordered = TRUE)
str(aa)
levels(aa)
nlevels(aa)

summary(aa)
str(dat)
str(cars)
summary(cars)


ss <- factor(sample(c("f", "b"), 10000, replace = TRUE), levels = c("f", "b"))
summary(ss)
install.packages("tidyverse")
yinstall.packages("ggplot2")

library(ggplot2)
d <- ggplot(diamonds, aes(x, y)) + xlim(4, 10) + ylim(4, 10)
d + geom_bin2d()
