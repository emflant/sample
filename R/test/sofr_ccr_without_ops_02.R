library(tidyverse)
library(lubridate)
library(readxl)

remove(list = ls())
# as.Date(19137, origin = "1970-01-01")
v_prev_interest_date = "2022-05-23" # 이전 이자징수일.
v_next_interest_date = "2022-06-05" # 다음 이자징수일.
# v_start_date = "2022-05-23"
# v_end_date = "2022-06-05"
v_spread_rate = 0.009
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
  select(date = date.x, wday, weighted_date = date.y, effective_date, rate_type, rate) %>% 
  fill(weighted_date:rate) %>% 
  group_by(weighted_date) %>% 
  mutate(n1 = n(), # 비영업일 가중치
         n2 = row_number()) %>% 
  ungroup() %>% 
  mutate(n3 = ifelse(n2 == 1, n1, 0)) %>% 
  mutate(n4 = cumsum(n3)) %>% 
  mutate(rate_day = rate * n3 / 360) %>% 
  mutate(ccr_day = cumprod(1 + rate_day) - 1) %>% 
  mutate(ccr_year = ccr_day * 360 / n4) %>% 
  mutate(interests_rate = ccr_year + v_spread_rate)  # 가산율이 0.9% 일때,


##########################################################

sofr_ccr_1 %>% 
  mutate(across(rate_day:interests_rate, num, digits = 7)) %>% 
  print(n = Inf)
  