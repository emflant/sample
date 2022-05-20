install.packages("lobstr")
library(tidyverse)
library(ggplot2)
mpg

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()+
  theme_bw()


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



library(readxl)
install.packages("extrafont")
library(extrafont)
font_import()
theme_set(theme_grey(base_family='NanumGothic'))

sh_2205 = read_excel("~/data/card/excel/sh_202205.xlsx")
sh_2205
a = sh_2205 %>% 
  group_by(지출구분) %>% 
  summarise(금액 = sum(이용금액)) %>% 
  arrange(desc(금액))

a = sh_2205 %>% 
  group_by(대분류) %>% 
  summarise(금액 = sum(이용금액)) %>% 
  arrange(desc(금액))

ggplot(a, aes(지출구분, 금액, fill = 지출구분)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(breaks = seq(0, 500000, 50000)) + 
  # scale_fill_brewer(palette = "green") + 
  theme_minimal(base_family = "NanumGothic")


sh_2205 %>% 
  group_by(대분류) %>% 
  summarise(금액 = sum(이용금액)) %>% 
  arrange(desc(금액)) 

library(tidyverse)
library(readxl)
# install.packages("extrafont")
# library(extrafont)
sh_2205 = read_excel("~/data/card/excel/sh_202205.xlsx")

sh_2205 %>% 
  group_by(대분류) %>% 
  summarise(금액 = sum(이용금액)) %>% 
  arrange(desc(금액)) %>% 
  ggplot(aes(x = reorder(대분류, -금액), y = 금액, fill = 대분류)) + # 
  geom_bar(stat = "identity") +
  scale_y_continuous(breaks = seq(0, 2000000, 100000), 
                     label = as.character(seq(0, 200, 10))) + 
  labs(
    x = "지출구분", 
    y = "(만원)", 
    colour = "지출구분",
    title = "신한카드(22.5월)",
    subtitle = "지출분류별 신용카드 사용금액"
  ) + 
  # theme_grey(base_family = "AppleGothic") +
  # theme_minimal(base_family = "AppleGothic") +
  theme(
    # panel.grid.major.y = element_blank(),
    text = element_text(family = "AppleGothic"),
    panel.grid.minor.y = element_blank(),
    axis.text.x = element_text(angle = 0, margin = margin(0.3, 0, 0, 0, "cm")),
    axis.text.y = element_text(angle = 0, margin = margin(0, 0.3, 0, 0.1, "cm")),
    axis.title.x = element_text(angle = 0, vjust = 0.5, margin = margin(0.3, 0, 0.3, 0, "cm")),
    axis.title.y = element_text(angle = 0, vjust = 1, margin = margin(0, 0, 0, 0.3, "cm"))
  ) 
  # scale_fill_brewer(palette = "green") + 
   # NanumGothic
  # theme_minimal(base_family = "NanumGothic")




df <- data.frame(x = 1:3, y = c(3,1,2) * 2)
df
seq(min(df$x), max(df$x), length = 50)
with(df, seq(min(x), max(x), length = 50))
xgrid = with(df, seq(min(x), max(x), length = 50))
with(df, approx(x, y, xgrid))

xgrid = with(df, seq(min(x), max(x), length = 50))
interp <- data.frame(
  x = xgrid,
  y = approx(df$x, df$y, xout = xgrid)$y
)
ggplot(interp, aes(x, y, colour = y)) + 
  geom_line(size = 2) +
  geom_point(data = df, size = 5)

approx(df$x, y = df$y, xout = xgrid)
ggplot(df, aes(x, y, colour = colour)) +
  geom_line(size = 2) +
  geom_point(size = 6)


mpg$hwy
ggplot(mpg, aes(class, fill = drv)) + 
  geom_bar()

#https://blog.albertkuo.me/post/2022-01-04-reordering-geom-col-and-geom-bar-by-count-or-value/



tb = tibble(a = c("1","1", "2", "2"), 
            b = c("x", "y","x", "y"), 
            c = c(100,200, 30, 45))

ggplot(tb, aes(x = c, y = a, fill = b)) +
  geom_bar(stat = "identity")

library(gcookbook)
cabbage_exp

ggplot(cabbage_exp, aes(x = Weight, y = Date)) +
  geom_col(width = 0.5)
  

cabbage_exp %>%
  arrange(Date, desc(Cultivar)) %>% 
  group_by(Date) %>% 
  mutate(suma = sum(Weight))

ce = cabbage_exp %>%
  arrange(Date, desc(Cultivar)) %>% 
  group_by(Date) %>% 
  mutate(label_y = cumsum(Weight) - 0.5 * Weight) %>% 
  mutate(label_num = 1:n()) %>% 
  mutate(label_ytop = ifelse(label_num ==1, sum(Weight), NA))
  
ce = cabbage_exp %>%
  arrange(Date, desc(Cultivar)) %>% 
  group_by(Date) %>% 
  mutate(label_1 = cumsum(Weight) - 0.5 * Weight) %>% 
  mutate(label_2 = sum(Weight))

ce
ggplot(ce, aes(x = Weight, y = Date,fill = Cultivar)) +
  geom_col(width = 0.5) +
  geom_text(aes(x = label_1, label = Weight), vjust = -3) +
  geom_text(aes(x = label_2, label = label_2), hjust = -0.2) + 
  xlim(0, max(ce$label_2) * 1.1)
  

ggplot(ce, aes(x = Weight, y = Date,fill = Cultivar)) +
  geom_col(width = 0.5) +
  geom_text(aes(x = label_1, label = Weight), colour = "white") +
  geom_text(aes(x = label_2, label = label_2), hjust = -0.2) + 
  xlim(0, max(ce$label_2) * 1.1)

position_stack()
ggplot(ce, aes(x = Weight, y = Date,fill = Cultivar)) +
  geom_col(width = 0.5) +
  geom_text(aes(label = Weight), position = position_stack(vjust = 0.5), colour = "white") +
  geom_text(aes(x = label_2, label = label_2), hjust = -0.2) + 
  xlim(0, max(ce$label_2) * 1.1)


ggplot(ce, aes(x = Date, y = Weight,fill = Cultivar)) +
  geom_col(width = 0.5) +
  geom_text(aes(label = Weight), position = position_stack(vjust = 0.5)) +
  geom_text(aes(y = label_2, label = label_2), vjust = -0.7) + 
  ylim(0, max(ce$label_2) * 1.1) + 
  theme_minimal() +
  scale_fill_brewer(palette = "Blues")


tb = 데이터 %>%
  group_by(topic) %>% 
  mutate(label_total = sum(n))

ggplot(tb, aes(x = topic, y = n, fill = region)) +
  geom_col(width = 0.5) +
  geom_text(aes(label = n), position = position_stack(vjust = 0.5), vjust = -3) +
  geom_text(aes(x = label_total, label = label_total), hjust = -0.2) + 
  xlim(0, max(ce$label_total) * 1.1)
