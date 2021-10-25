
# 주1회 80000(60분), 10000(90분)
# 주2회 120000(60분)
# 주3회 180000(60분)
library(tidyverse)

# 월수업료로 시간당 수업료 역계산.
read_csv("~/github/datafiles/kids_art.csv", show_col_types = T) %>% 
  mutate(total_mins = times_per_week * 4 * mins_per_class) %>% 
  mutate(amount_per_hour = monthly_amount / (times_per_week * 4) / (mins_per_class / 60)) %>% 
  mutate(v1 = 1:n()) 

# 시간당 수업료로 월 수업료 계산.
read_csv("~/github/datafiles/kids_art2.csv", show_col_types = T) %>% 
  mutate(total_mins = times_per_week * 4 * mins_per_class) %>% 
  mutate(monthly_amount = hour_amount * (times_per_week * 4) * (mins_per_class / 60)) %>% 
  mutate(v1 = 1:n()) 

