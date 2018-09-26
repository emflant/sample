  
# install.packages("ggplot2")

# alt-shift - k : 단축키설명이 나옴.
Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
par(family="NanumGothic")

library(tidyverse)
library(ggplot2)
library(nycflights13)
flights

filter(flights, month == 12 | month == 11)
27258 + 28125
sqrt(2) ^ 2 == 2
near(sqrt(2) ^ 2, 2)
     


arrange(flights, desc(year), month, day)



select (flights, year, month, day)

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

summarise(flights, delay = mean(dep_delay))

by_dest <- group_by(flights, dest)

by_dest
delay  <- summarise(by_dest, 
                    count = n(),
                    dist = mean(distance, na.rm = TRUE),
                    delay = mean(arr_delay, na.rm = T)
                    )

delay
delay <- filter(delay, count > 20, dest != "HNL")

ggplot(data = delay, mapply = aes(x = dist, y = delay)) 



delays <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")
delays

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay)) %>%
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
    
  )


filter(delays, n == 0)


ggplot(data = delays, mapping = aes(x=delay)) +
  geom_freqpoly(binwidth = 10)

ggplot(data = delays, mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)

delays %>% 
  filter(n > 20) %>% 
  ggplot(mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)


flights
