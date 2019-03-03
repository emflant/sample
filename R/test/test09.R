# install.packages("mlbench")
# library(help="mlbench")  ,.m, C
library(mlbench)
data(Ozone)
plot(Ozone$V8, Ozone$V9, type = "p")

plot(Ozone$V8, Ozone$V9, 
     type = "p", # p/l/b/o/n
     xlab = "Sandburg Temperature",
     ylab = "El Monte Temperature",
     main = "Ozone", 
     pch = 1, # 점의 종류 
     cex = 1, # 점의 크기
     col="#FF0000",
     xlim = c(0, 100),
     ylim = c(0, 90)
     )

cars
plot(cars)
lines(lowess(cars))


plot(cars)
abline(a=-5, b=3.5, col="red")
abline(h=mean(cars$dist), lty=2)
abline(v=mean(cars$speed), lty=2)

curve(sin, 0, 2*pi)

# 
m <- lm(dist ~ speed, data = cars) # Linear Models
m
plot(cars, xlim = c(0,30))
abline(m)
# interval=c("none", "confidence", "prediction")
p <- predict(m, interval="confidence")
p <- predict(m, interval="prediction")
p


iris$Sepal.Width
median(iris$Sepal.Width)
boxplot(iris$Sepal.Width)
boxplot(iris$Sepal.Width, notch = TRUE) # 중앙값에 대한 신뢰 구간이 오목하게 그려진다
boxstats <- boxplot(iris$Sepal.Width)
boxstats2 <- boxplot(iris$Sepal.Width, notch = TRUE)
boxstats
boxstats$stats
# [1,]  2.2  lower whisker
# [2,]  2.8  lower hinge 제1사분위수(25%에 해당하는 값)
# [3,]  3.0  median 중앙값(75%에 해당하는 값)
# [4,]  3.3  upper hinge  제3사분위수(75%에 해당하는 값)
# [5,]  4.0  upper whisker

sv <- subset(iris, Species=="setosa" | Species=="versicolor")
sv$Species <- factor(sv$Species)
boxplot(Sepal.Width ~ Species, data=sv, notch=TRUE)

# freq 지정하지 않는 경우, 구간별 데이터의 개수(즉, 빈도)
hist(iris$Sepal.Width) 

# freq=FALSE면 다음 코드에서 보다시피 각 구간의 확률 밀도가 그려진다. 
hist(iris$Sepal.Width, freq=FALSE) 
# 확률 밀도므로 막대 너비의 합이 1이 된다.
h <- hist(iris$Sepal.Width, freq=FALSE) 
sum(h$density) * 0.2  # h$breaks를 보면 막대의 너비가 0.2임을 알 수 있다.


lines(density(iris$Sepal.Width))
