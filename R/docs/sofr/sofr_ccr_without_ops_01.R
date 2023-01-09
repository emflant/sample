library(tidyverse)
library(lubridate)
library(readxl)

remove(list = ls())
# as.Date(19137, origin = "1970-01-01")
v_prev_interest_date = "2022-06-16" # 이전 이자징수일.
v_next_interest_date = "2022-06-22" # 다음 이자징수일.

# difftime(v_next_interest_date, v_prev_interest_date, units = "days")
# ymd(v_next_interest_date) - ymd(v_prev_interest_date)
# ymd(v_prev_interest_date)
# interval(ymd(v_next_interest_date), ymd(v_prev_interest_date))
# as.integer(as.Date(v_next_interest_date) - as.Date(v_prev_interest_date))

# v_start_date = "2022-05-23"
# v_end_date = "2022-06-05"
v_spread_rate = 0.009 # 가산금리
##########################################################
# https://www.newyorkfed.org/markets/reference-rates/sofr
# 에서 엑셀로 다운로드 한다.
sofr_rate = read_excel("~/data/sofr_rate.xlsx") %>% 
  janitor::clean_names() %>% 
  mutate(effective_date = as.Date(effective_date, format = "%m/%d/%Y"),
         rate = rate_percent / 100) %>% 
  select(effective_date, rate_type, rate) %>% 
  filter(!is.na(effective_date)) %>% 
  arrange(effective_date) %>% 
  mutate(date = lead(effective_date, 5))


sofr_rate %>% print(n = Inf)
##########################################################

sofr_ccr_1 = tibble(date = seq.Date(as.Date(v_prev_interest_date), 
                                    as.Date(v_next_interest_date) - 1, by = "day"),
                    wday = wday(date, label = T)) %>% 
  left_join(sofr_rate, by = c("date"), keep = T)  %>% 
  select(date = date.x, wday, effective_date, rate_type, rate) %>% 
  fill(effective_date:rate) %>% 
  group_by(effective_date) %>% 
  mutate(n1 = n(), # 비영업일 가중치
         n2 = row_number()) %>% 
  ungroup() %>% 
  mutate(n3 = ifelse(n2 == 1, n1, 0)) %>% 
  mutate(n4 = cumsum(n3)) %>% 
  mutate(rate_day = rate * n3 / 360) %>% 
  mutate(ccr_day = cumprod(1 + rate_day) - 1) %>% 
  mutate(ccr_year = ccr_day * 360 / n4) %>% 
  mutate(interests_rate = ccr_year + v_spread_rate)  # 가산율이 0.9% 일때,


sofr_ccr_1
##########################################################

sofr_ccr_1 %>% 
  mutate(across(rate_day:interests_rate, num, digits = 7)) %>% 
  select(date, wday, effective_date, rate, interests_rate)

# A tibble: 14 × 13
# date       wday  effective_date rate_type   rate    n1    n2    n3    n4  rate_day   ccr_day  ccr_year interest_rate
# <date>     <ord> <date>         <chr>      <dbl> <int> <int> <dbl> <dbl> <num:.7!> <num:.7!> <num:.7!>     <num:.7!>
# 1 2022-05-23 Mon   2022-05-23     SOFR      0.0078     1     1     1     1 0.0000217 0.0000217 0.0078000     0.0168000
# 2 2022-05-24 Tue   2022-05-24     SOFR      0.0078     1     1     1     2 0.0000217 0.0000433 0.0078001     0.0168001
# 3 2022-05-25 Wed   2022-05-25     SOFR      0.0078     1     1     1     3 0.0000217 0.0000650 0.0078002     0.0168002
  