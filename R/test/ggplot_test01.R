install.packages("lobstr")
library(tidyverse)
library(ggplot2)
mpg

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()


ggplot(mpg, aes(cty, hwy)) +
  geom_point()

economics
ggplot(economics, aes(date, unemploy)) + geom_line()

mpg

ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point()

state.x77



diff(c(51014, 51245, 51446, 51635, 51811, 51973, 
       52123, 52261, 52388, 52504, 52609, 52704))

t1 = tibble(연도 = paste0(as.character(2015:2026), '-01-01'),
              인구수 = c(1014, 1245, 1446, 1635, 1811, 1973, 
                      2123, 2261, 2388, 2504, 2609, 2704))
t1
# A tibble: 12 × 2
# 연도       인구수
# <chr>       <dbl>
# 1 2015-01-01   1014
# 2 2016-01-01   1245
# 3 2017-01-01   1446
# 4 2018-01-01   1635
# 5 2019-01-01   1811
ggplot(t1, aes(x = 연도, y = 인구수, group = 1)) + 
  geom_line()
ggplot(t1, aes(x = 연도, y = 인구수, group = 1)) + 
  geom_line() +
  scale_x_discrete(breaks = c('2015-01-01', '2021-01-01', '2026-01-01'))


t2 = tibble(연도 = 2015:2026,
              인구수 = c(1014, 1245, 1446, 1635, 1811, 1973, 
                      2123, 2261, 2388, 2504, 2609, 2704))
t2 %>% head
# A tibble: 6 × 2
# 연도 인구수
# <int>  <dbl>
# 1  2015   1014
# 2  2016   1245
# 3  2017   1446
# 4  2018   1635
# 5  2019   1811
# 6  2020   1973
ggplot(t2, aes(x = 연도, y = 인구수)) + 
  geom_line()
ggplot(t2, aes(x = 연도, y = 인구수)) + 
  geom_line() +
  scale_x_continuous(breaks = seq(2015, 2026, 2))



t3 = tibble(연도 = as.Date(paste0(as.character(2015:2026), '-01-01')),
              인구수 = c(1014, 1245, 1446, 1635, 1811, 1973, 
                      2123, 2261, 2388, 2504, 2609, 2704))
t3 %>% head
# A tibble: 6 × 2
# 연도       인구수
# <date>      <dbl>
# 1 2015-01-01   1014
# 2 2016-01-01   1245
# 3 2017-01-01   1446
# 4 2018-01-01   1635
# 5 2019-01-01   1811
# 6 2020-01-01   1973
ggplot(t3, aes(x = 연도, y = 인구수)) + 
  geom_line()

ggplot(t3, aes(x = 연도, y = 인구수)) + 
  geom_line() +
  scale_x_continuous(breaks = as.Date(c('2015-01-01', '2022-01-01')))

t = tibble(x = c(4,5,6), y = c(50, 30, 40))
ggplot(t, aes(x, y))+
  geom_line()

ggplot(t, aes(x, y))+
  geom_line() +
  scale_x_continuous(limits = c(1,10), breaks = seq(1,10,0.5))

ggplot(t, aes(x, y))+
  geom_line() +
  coord_cartesian(xlim = c(1,10)) +
  scale_x_continuous(breaks = seq(1,10,0.5))

ggplot(t, aes(x, y))+
  geom_line() +
  scale_x_continuous(limits = c(4.5, 5.5))

ggplot(t, aes(x, y))+
  geom_line() +
  coord_cartesian(xlim = c(4.5, 5.5))

ggplot(t, aes(x, y))+
  geom_line() +
  coord_cartesian(xlim = c(4.5,5.5)) + 
  scale_x_continuous(breaks = seq(4.7, 5.3, 0.1))

coord_cartesian(ylim = c(10, 35))
geom_path
df = data.frame(x = c(1,2,3), y = c('a', 'b', 'c'))

for(i in df$x){
  if(i > 1){
    print(df[i,])  
  }
}



t = tibble(x = c(2,3,4), y = c(150, 30, 140))
ggplot(t, aes(x, y))+
  geom_line() +
  coord_cartesian(xlim = c(1,10)) + 
  scale_x_continuous(breaks = 1:10)



a = 
for(i in c(30, 40, 50)){
  print(i)
}
