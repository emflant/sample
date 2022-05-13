seq(1, 20, by=2)
seq(0, 1, length.out = 10)
seq(0.1, 1, length.out = 10)

x <- seq(1,10)
y <- 1000000 * (1 + 0.1) ^ x
y

print(1.498372983749, digits = 7)
prettyNum(5000000000000, big.mark = ",", trim = TRUE)

# FV (future value : 미래가치)
# p 원금, i 이자율s
get_fv <- function (p_0, i, n){
    fv <- p * (1 + i) ^ n
    fv
}

format(get_fv(1000000, 0.1, seq(1,10)), big.mark = ",", trim = TRUE)

get_fv(1000000, 0.1, 5)
format(get_fv(20000000, 0.07, 15), big.mark = ",", trim = TRUE)


# PV (현재가치, present value)
# i : 할인율
# p_n : 미래가치
# n : 기간
get_pv <- function (p_n, i, n) {
    pv <- p_n / (1 + i) ^ n
    pv
}

seq(10,1)

get_pv(100000, 0.1, seq(10,0))

seq(3, 11, 2)

for(i in seq(5)){
  n = i * 2 + 1
  print(rep(n,i))
}

seq(1, 10)
rep(3, 10)


for(i in seq(5)){
  n <- i * 2 + 1
  print(rep(n, i))
}

as.list(seq(5)) %>% 
  map(print)

as.list(1:5 * 2 + 1, all.names = T)
as.list(x = 1:5 * 2 + 1) %>% 
  map(rep, x)
enframe(1:5, name = NULL, value = 'c0') 

enframe(1:5, name = NULL, value = 'c0') %>% 
  mutate(c1 = c0 * 2 + 1) %>% 
  mutate(c2 = map2(c1, c0, rep))

enframe(1:5, name = NULL, value = 'c0') %>% 
  mutate(c1 = c0 * 2 + 1) %>% 
  mutate(c2 = map2(c1, c0, rep)) %>% 
  pull(c2) %>% 
  map(print) %>% 
  invisible()

x %>% map(print) %>% 
  print()

rep(9, 9)

vector(5)

letters
seq_along(letters)

for(i in seq_along(1:9)){
  print(rep(i,i))
}

enframe(letters) %>% 
  mutate(t1 = map2(value, name, rep)) %>% 
  pull(t1) %>% 
  map(print) %>% 
  invisible()

?seq_along
seq_along(letter)

as.matrix(1:10, 2)

matrix(c(0.05, 0.15, 0.0, 0.10, 0.25, 0.25, 0, 0.1, 0.1))
matrix(c(0.05, 0.15, 0.0, 0.10, 0.25, 0.25, 0, 0.1, 0.1), nrow = 3)
matrix(c(0.05, 0.15, 0.0, 0.10, 0.25, 0.25, 0, 0.1, 0.1), nrow = 3, byrow = T)

m = matrix(c(0.05, 0.15, 0.0, 0.10, 0.25, 0.25, 0, 0.1, 0.1), 
       nrow = 3,
       dimnames = list(c('row-name-1', 'row-name-2', 'row-name-3'), 
                       c('col-name-1', 'col-name-2', 'col-name-3')))
d = list(c(1,2,3), c(10,20,30))

m = matrix(c(0.05, 0.15, 0.0, 0.10, 0.25, 0.25, 0, 0.1, 0.1), nrow = 3)
m
apply(m, 2, mean)


m[, c(1,3)]

m[c(1,3),]

x=sample(1:100,1)

if (x<50){
  print('L') 
} else {
  print('H')
}

x = sample(100,20)
x
x %% 2
x < 5

x1 = sample(100,20)
cat('짝수의 개수 :', length(x1[x1 %% 2 == 0]))
cat('홀수의 개수 :', length(x1[x1 %% 2 != 0]))


x2 = sample(100,30)
cat('50 이상인 수를 분류 :', x2[x2 >= 50])
cat('50 이상인 수들의 합 :', sum(x2[x2 >= 50]))



length(x %% 2 == 0)


n = scan(what="",n=7)
print(n)

x = 1:100
x[x %% 7 == 0]

ex_count

a = c("가가")
b = c("가가", '가가오', '나나', '포', '보')
ta = as_tibble(a) %>% 
  rename(word = value)
tb = as_tibble(b) %>% 
  rename(word = value)

ta[['word']] %in% tb[['word']] # TRUE 
ta
tb
##########################################3

n = 0 
tot = 0

while(n < 10){
  young <- sample(c('왼쪽', '오른쪽'), 1, prob = c(0.5, 0.5))
  chul <- sample(c('왼쪽', '오른쪽'), 1, prob = c(0.5, 0.5))
  
  if(young == chul){
    print(paste('young 승리 :', young, chul))
    n <- n + 1
  }
  tot <- tot + 1
}
print(paste('총 게임수 :', tot))
##########################################3

young <- sample(c('왼쪽', '오른쪽'), 100, replace = T, prob = c(0.5, 0.5))
chul <- sample(c('왼쪽', '오른쪽'), 100, replace = T, prob = c(0.5, 0.5))

tibble(young, chul) %>%
  mutate(n = seq(n())) %>% 
  mutate(t1 = young == chul) %>% 
  mutate(t2 = if_else(t1 == T, 1, 0)) %>% 
  mutate(t3 = cumsum(t2)) %>% 
  filter(t2 == 1, t3 == 10) # 10번째 이긴 row 선택.

cumsum(1:10)
cumprod(1:100)
1*2*3*4


###########################3

제품 = c('TV', '냉장고', '세탁기')
가격 = c(210, 150, 98)
판매량 = c(20, 32, 12)
t1 = data.frame(제품, 가격, 판매량)
t1
t1[,c('제품', '가격')]



apply(df1[c('가격','판매량')], 2, mean)

############################



a = c(6, 2, 5)

sort(a)
# [1] 2 5 6

diff(sort(a))
# [1] 3 1

append(sort(a), 0, after = 0)

sort(a) - append(sort(a), 0, after = 0)[1:3]

cumsum()

cummin(c(3:1, 2:0, 4:2))
cummin(c(1,2,3))

append(a, 5, 0)
       
#############################


options("scipen" = 100)

x <- seq(-4,4,length=1000)
hx <- dnorm(x,0,1)
x
hx
plot(x, hx, type="l", xlab="Values", ylab="", axes=FALSE)
title(main = "Normal Distribution")
axis(1, at=seq(-4, 4, 1), pos=-0.02) 
mtext('result',3)

set.seed(12347)
sample()
setwd('~/')
getwd()
norm_graph <- function (sd = 1, mean = 0, lb=NA, ub=NA, xpos = -0.02){
  
  x <- seq(-4,4,length=1000) * sd + mean
  hx <- dnorm(x,mean,sd)
  
  plot(x, hx, type="l", xlab="Values", ylab="", axes=FALSE)
  # lines(x, hx)
  
  if(!is.na(lb) && !is.na(ub)){
    
    i <- x >= lb & x <= ub
    
    polygon(c(lb,x[i],ub), c(xpos,hx[i],xpos), col="#FFFFCC")
    
    area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
    result <- paste("P(",lb,"< u <",ub,") =",
                    signif(area, digits=3) * 100, "%")
    mtext(result,3)
    axis(1, at=c(-4, 0, lb, ub), pos=xpos) 
  } else {
    title(main = "Normal Distribution")
    axis(1, at=seq(-4, 4, 1), pos=xpos) 
  }
  
}

norm_graph(sd = 1, mean = 0.4)
###########################

dd = data.frame(class = rep(1, 10), id = 1:10, 
                math = c(30, 100, 95, 75, 80, 85, 50, 0, 60, 85), 
                eng = c(40, 95, 90, 80, 90, 90, 70, 30, 80,85))
nrow(dd[dd$math >= 80,])
dd[order(dd$math, decreasing = T),]
dd[order(dd$eng),]
dd[dd$math >= 80 & dd$eng >= 85,]
nrow(dd[dd$math >= 80 & dd$eng >= 85,])



######################
library(tidyverse)
library(readxl)

read_excel('~/data/aa.xlsx', col_names = F) %>% 
  slice(1:2) %>% 
  summarise(aa = paste(...1, collapse = "-"))

read_excel('~/data/aa.xlsx', col_names = F) %>% 
  slice(1:2) %>% 
  summarise_all(paste, collapse = "-")

read_excel('~/data/aa.xlsx', col_names = F)

read_excel('~/data/aa.xlsx', col_names = paste0('c', c(1:7)))
t5
t0 = read_excel('~/data/aa.xlsx', col_names = paste0('c', c(1:7)))
t1 = t0 %>% 
  slice(1:2) %>% 
  summarise_all(paste, collapse = "-")
t2 = t0 %>% 
  slice(-(1:2)) 
t3 = t1 %>% union_all(t2)
colnames(t3) = t3 %>% slice(1)
t4 = t3 %>% slice(-1)


t4

t5 = t4 %>% 
  pivot_longer(-1, names_to = '구분', values_to = '수치') %>% 
  rename('학생' = '년도-A') %>% 
  separate('구분', sep = '-', into = c('년도', '종류'))

t5 %>% pivot_wider(names_from = '종류', values_from = '수치') %>% 
  select(년도, 학생, 평균, 백분위, 표준편차) %>% 
  arrange(년도, 학생)

paste(c('2', '3'), collapse = "")

str_c(c('1', '2'))



if((label_data %% 2) == 1) {
  label_data_1 <- 1
} else {
  label_data_1 <- 0
}

5%%3
intToBits(10)

z <- as.raw(5)
z 
showBits(z)



x <- "A test string"
x <- "한글"
(y <- charToRaw(x))
rawToBits(y)

intToBits(4)

length(intToBits(4))

strtoi

intToUtf8(11)
bin

library(R.util)

class(intToBits(10))


intToBinary(10)

intToBits(10)

str(intToBits(10))

a1 = rev(as.integer(intToBits(10)))

as.integer(intToBits(10))

a1 = rev(as.integer(intToBits(10)))
paste0(a1, collapse = '')

a2 = as.character((a1))
paste0(a2, collapse = '')
a3 = paste0(a2, collapse = '-')
a3
paste0(c(1,2,3), collapse = '')

map(c(12, 584, 143, 98, 5), intToBits)
tibble(a = c(12, 584, 143, 98000, 5))


intToBinary = function (i) {
  i %>% 
    intToBits() %>% 
    as.integer() %>% 
    rev() %>% 
    as.character() %>% 
    paste0(collapse = '')
}

enframe(c(12, 584, 143, 980023, 5, 192483929), name = NULL) %>% 
  mutate(binary = map_chr(value, intToBinary)) 



##################

x = seq(-4,4,length=1000)
hx <- dnorm(x,mean = 0.4,sd = 1)

plot(x, hx, type="l", xlab="Values", ylab="", axes=FALSE)
axis(1, at=seq(-4, 4, 1), pos= 0) 

xpos = 0
lb = -4
ub = 4
i = x >= lb & x <= ub
lb_hx <- dnorm(lb,mean = 0.4,sd = 1)
ub_hx <- dnorm(ub,mean = 0.4,sd = 1)
# polygon(x[i], hx[i], col="#FFFFCC")
polygon(c(lb,lb,x[i],ub, ub), c(xpos,lb_hx,hx[i],ub_hx, xpos), col="#FFFFCC")
c(xpos,lb_hx,hx[i],ub_hx, xpos)


set.seed(12347)
s = round(rnorm(25, mean = 0.4, sd = 1), 1)
points(s, rep(0, 25))



norm_graph <- function (sd = 1, mean = 0, lb=NA, ub=NA, xpos = -0.02){
  
  x <- seq(-4,4,length=1000) * sd + mean
  hx <- dnorm(x,mean,sd)
  
  plot(x, hx, type="l", xlab="Values", ylab="", axes=FALSE)
  # lines(x, hx)
  
  if(!is.na(lb) && !is.na(ub)){
    
    i <- x >= lb & x <= ub
    
    polygon(c(lb,x[i],ub), c(xpos,hx[i],xpos), col="#FFFFCC")
    
    area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
    result <- paste("P(",lb,"< u <",ub,") =",
                    signif(area, digits=3) * 100, "%")
    mtext(result,3)
    axis(1, at=c(-4, 0, lb, ub), pos=xpos) 
  } else {
    title(main = "Normal Distribution")
    axis(1, at=seq(-4, 4, 1), pos=xpos) 
  }
  
}

as.character(2015:2026)

diff(c(51014, 51245, 51446, 51635, 51811, 51973, 
  52123, 52261, 52388, 52504, 52609, 52704))

t1 = tibble(x = as.character(2015:2026),
       y = c(51014, 51245, 51446, 51635, 51811, 51973, 
             52123, 52261, 52388, 52504, 52609, 52704))
t1
ggplot(t1, aes(x, y)) + geom_line()


# x라는 벡터의 객체들의 조건에 따라 y라는 벡터에 객체를 저장하고 싶습니다.
# 예를 들어서 x의 첫 번째 객체가 90 이상이면 y의 첫 번째 객체가 S로 저장되었으면 합니다.
# 이미 벡터 y에는 NA라는 객체가 저장되어 있습니다.
# 
# 이 경우 코드를 어떻게 짜야 할까요?

x = c(145,223,36)
y = c(NA)
if(x[1] > 90){
  y[1] = x[1]
}
print(y)
# [1] 145



# 이렇게 작성하고 coffee를 확인하면 
# 아 어 오
# 10 3020 30

coffee<-c(10,20,30)
names(coffee)<-c("아","어","오")
coffee[2]<-coffee[2]+3000
coffee


is.numeric("111")
is.numeric("aa")
as.numeric("aa")

a = c(10,10,10, 'a', 'b', 'c', 20, 30, 'd')
# [1] "10" "10" "10" "a"  "b"  "c"  "20" "30" "d"

as.numeric(a)
# [1] 10 10 10 NA NA NA 20 30 NA

is.na(as.numeric(a))
# [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE

a[is.na(as.numeric(a))]
# [1] "a" "b" "c" "d"


df = data.frame(keyword = c(10,10,10, 'a', 'b', 'c', 20, 30, 'd'))
df
grep("[a-z]", df$keyword)
grepl("\\d+", df$keyword)
df$num = as.numeric(df$keyword)
df
is.na(df$num)
df[is.na(df$num),]


grep("\\d+", df$keyword)
# [1] 1 2 3 7 8

grep("\\d+", df$keyword, value = T)
# [1] "10" "10" "10" "20" "30"

df[grep("\\d+", df$keyword), ]

grepl("\\d+", df$keyword)
# [1]  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE

df$keyword[]

df[grepl("\\d+", df$keyword), ]
# [1] "10" "10" "10" "20" "30"

gregexec("\\d+", df$keyword)

enframe(c(0,10,10, 'a', 'b', 'c', 20, 30, 'd'), name = NULL) %>% 
  mutate(num = grepl("\\d+", value)) %>% 
  filter(num == T)


grepl("\\d+", value)

enframe(c(0,10,10, 'a', 'b', 'c', 20, 30, 'd'), name = NULL) %>% 
  mutate(num = as.numeric(value)) %>% 
  filter(is.na(num))

install.packages("KoNLP")
library(tidytext)
library(dplyr)
library(janeaustenr)
# 새 데이터프레임 <- 기존데이터프레임 %>% 
#   unnest_tokens(input = value, output = word, token = extractNoun)
# If a function, should take a character vector and 
# return a list of character vectors of the same length.
unnest_tokens
d <- tibble(txt = prideprejudice)
d
d %>%
  unnest_tokens(word, txt)
d %>% 
  unnest_tokens(output = word, input = txt, token = "words")
d %>%
  unnest_tokens(sentence, txt, token = "sentences")

d %>%
  unnest_tokens(word, txt, token = str_c, pattern = " ")

stringr::str_split(c('alkj b slkdjf', 'skljf b slfffskdjf'), pattern = ' ')

stringr::str_c(c('alkj b slkdjf', 'skljf b slfffskdjf'), pattern = ' ')
d
list(1,2,c(1,2))



d <- matrix(1:9, ncol=3)
d[2,1] = NA
d[3,3] = NA
d



set.seed(2022)
week
days_of_the_week <- c("Sunday", "Monday", "Tuesday", "Wednesday", 
                      "Thursday", "Friday", "Saturday")
sales <- data.frame("dayOfMonth" = rep(1:28, 12),
                    "month" = rep(month.name, each = 28),
                    "weekday" = rep(days_of_the_week, 12*4),
                    "paintings" = round(rnorm(28*12, c(sample(1:28, 7)))))

head(sales, 7)

sales %>%
  group_by(weekday) %>%
  summarise(weekdaySales = mean(paintings)) %>%
  ggplot() +
  labs(title = "Mean Weekly Painting Sales by Day of the Week",
       x = "Day of the Week",
       y = "Mean Painting Sales") + 
  scale_fill_brewer(palette = "Set2") +
  geom_bar(aes(x = factor(weekday, days_of_the_week), y = weekdaySales, 
               fill = weekday), stat = "identity", show.legend = FALSE)


Oxboys
data(Oxboys, package = "nlme")
head(Oxboys)

?Oxboys
Oxboys %>% 
  ggplot(aes(age, height, group = Subject)) +
  geom_line()


ggplot(Oxboys, aes(age, height, group = Subject)) +
  geom_line() +
  geom_smooth(method = "lm", se = F)

ggplot(Oxboys, aes(age, height)) +
  geom_line(aes(group = Subject)) +
  geom_smooth(method = "lm", se = F, size = 3)

head(Oxboys)
ggplot(Oxboys, aes(x = Occasion, y = height)) +
  geom_boxplot() +
  geom_line(aes(group = Subject), colour = "#3366FF", alpha = 0.5)
