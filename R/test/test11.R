


basel3.capital()
mean(1:5)
var(1:5)

return_rate <- c(0.2238, -0.0456, 0.0956, -0.0131, -0.0442, -0.0509, 0.0487, -0.1534, -0.1208, 0.0875)
# 평균수익률
mean(return_rate)

# 분산
var(return_rate)

sd(return_rate)
sum(return_rate)

ex2 <- data.frame(bas_ym = c("2007.07","2007.08","2007.09","2007.10","2007.11","2007.12","2008.01","2008.02","2008.03","2008.04"), return_rate_a = c(0.2238, -0.0456, 0.0956, -0.0131,-0.0442, -0.0509,0.0487,-0.1534, -0.1208, 0.0875), return_rate_b = c(0, -0.0545,-0.0128, -0.0389,-0.0337,0.0279,0.3244,0.0169,0.1944,-0.0697))
plot(ex2$return_rate_a, ex2$return_rate_b)

l <- lm(ex2$return_rate_a ~ ex2$return_rate_b)

abline(l)


library(tibble)
t_ex2 <- as_tibble(ex2)
t_ex2

summary(t_ex2)

head(t_ex2)

# install.packages("tidyverse")

library(tidyverse)

t_ex2_gather <- t_ex2 %>%
    gather(`return_rate_a`, `return_rate_b`, key = "stock", value = "rate")
head(t_ex2_gather)

t_ex2_gather %>%
    spread(key = stock, value = rate)


t_ex4 <- t_ex2_gather %>%
    spread(key = bas_ym, value = rate)

table5

install.packages("pryr")
library(pryr)
mem_used()


x1 <- c("Dec", "Apr", "Jan", "Mar")
x2 <- c("Dec", "Apr", "Jam", "Mar")

sort(x1)
month_levels <- c(
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)
y1 <- factor(x1, levels = month_levels)
y1
sort(y1)
y2 <- factor(x2, levels = month_levels)
y2
y2 <- parse_factor(x2, levels = month_levels)


factor(x1)
unique(x1)
factor(x1, levels = unique(x1))
x1 %>% factor() %>% fct_inorder(ordered = TRUE)
