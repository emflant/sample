library(tidyverse)
# install.packages("extrafont")
library(extrafont)
font_import(pattern = "Nanum")
fonttable()
mpg


ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point()


ggplot(mpg, aes(displ, hwy, color = class))+
  geom_point()


ggplot(mpg, aes(displ, hwy))+
  geom_point(color = "blue")

ggplot(mpg, aes(displ, hwy))+
  geom_point(aes(color = "blue"))


ggplot(mpg, aes(displ, hwy))+
  geom_point()+
  facet_wrap(~class)


df <- data.frame(
  가 = c(3, 1, 5), 
  나 = c(2, 4, 6), 
  label = c("a","b","c")
)

df <- data.frame(
  x = c(1, 2, 1, 2, 1.5),
  y = c(1, 1, 2, 2, 1.5),
  text = c('좌측하단', "우측하단", "좌측상단", "우측상단", "가운데")
)

ggplot(data=df, aes(x, y)) +
  geom_text(aes(label = text), vjust="inward", hjust="inward") +
  ggtitle('예제의 제목 - 못생긴 기본 폰트',
          '예제의 소제목')
theme_set(theme_grey(base_family='NanumGothic'))


df <- data.frame(
  x = c(1, 2, 1, 2, 1.5),
  y = c(1, 1, 2, 2, 1.5),
  text = c("좌측하단", "우측하단", "좌측상단", "우측상단", "가운데")
)

ggplot(data=df, aes(x, y)) +
  geom_text(aes(label = text), vjust="inward", hjust="inward") +
  ggtitle('예제의 제목 - 못생긴 기본 폰트',
          '예제의 소제목')


iris %>% 
  ggplot(aes(x=Sepal.Length, y=Petal.Length, color=Species)) +
  geom_point()+
  labs(title="붓꽃 데이터 한글 글꼴 적용", color="붓꽃 종류") +
  theme_minimal(base_family = "Nanum Pen Script") +
  theme(legend.position = "top")
