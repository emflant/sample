mean(seq(1:5))
var(seq(1:5))

sum((1:5-mean(1:5))^2)/(5-1) # 분모로 n-1이 사용됨을 확인할 수 있음


sd(seq(1:5))


m <- lm(dist ~ speed, data = cars) # Linear Models
m

# 회귀 계수: coef(model)
# 선형 회귀 모델의 절편이 -17.579095, speed에 대한 기울기가 3.932409
coef(m)

# 적합된 값: fitted(model)
# cars 데이터의 각 speed 값에 대해 모델에 의해 예측된 dist
# -17.57095 + 3.932409 × cars$speed
fitted(m)[1:4]
fm <- fitted(m)  


# 잔차: residuals(model)
# 선형 회귀 모델을 작성한 다음 모델로부터의 구한 예측값과 실제 값 사이의 차이를 잔차 라고 함.
residuals(m)[1:4]

# 적합된 값과 잔차의 합은 실제 데이터 값과 같다
cars$dist[1:4] == fitted(m)[1:4] + residuals(m)[1:4]

coef(m) # -17.579095 3.932409
confint(m)
confint(m, level = 0.9)

# 주 매개변수들의 분산-공분산 행렬
vcov(m)
diag(vcov(m))
sqrt(diag(vcov(m)))

level <- 0.95
cf <- coef(m)
cf
pnames <- names(cf)
pnames
parm <- pnames
a <- (1 - level)/2
a
a <- c(a, 1 - a)
# pct <- format.perc(a, 3)
fac <- qnorm(a)
fac
c(length(parm), 2L)
ci <- array(NA, dim = c(length(parm), 2L))
ses <- sqrt(diag(vcov(m)))[parm]

cf[parm] + ses %o% fac

ci[] <- cf[parm] + ses %o% fac
ci

(- 31.167850 + 3.990340) / 2 -3.990340 # -17.5791
(4.767853 - 3.096964) / 2 + 3.096964 # 3.932408
confint.default
getAnywhere(confint.lm)

# 선형 회귀의 회귀 계수 β0, β1, ..., βp는 최소 제곱법(Method of Least Square)으로 추정한다. 
# 최소 제곱법이란 제곱의 합이 최소가 되도록 값을 정하는 방법으로, 
# 선형 회귀에서는 오차의 제곱 합 이 최소가 되도록 회귀 계수를 정한다
deviance(m)


# 새로운 데이터에 대한 예측값은 predict()로 구할 수 있다
predict(m, newdata=data.frame(speed=3))

predict(m, newdata=data.frame(speed=c(3)), interval="confidence")
# fit       lwr      upr
# 1 -5.781869 -17.02659 5.462853

# 2.5 %    97.5 %
# (Intercept) -31.167850 -3.990340
# speed         3.096964  4.767853

# (Intercept)       speed 
# -17.579095    3.932409 
-17.579095 + 3.932409 * 3 # -5.781868

-31.167850 + 3.096964 * 3
