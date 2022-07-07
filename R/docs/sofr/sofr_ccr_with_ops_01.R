library(tidyverse)
library(lubridate)
library(readxl)

remove(list = ls())
# as.Date(19137, origin = "1970-01-01")
v_prev_interest_date = "2022-05-31" # 이전 이자징수일.
v_next_interest_date = "2022-06-13" # 다음 이자징수일.
# v_end_date = as.Date(v_next_interest_date) - 1 # 이자계산종료일


# difftime('2022-06-01', v_prev_interest_date, units = "days")
# difftime(v_next_interest_date, v_prev_interest_date, units = "days")

# v_start_date = "2022-05-31" # 이자계산시작일.

v_spread_rate = 0.009
##########################################################
# https://www.newyorkfed.org/markets/reference-rates/sofr
# 에서 엑셀로 다운로드 한다.
tb_sofr_rate = read_excel("~/data/sofr_rate.xlsx") %>% 
  janitor::clean_names() %>% 
  mutate(effective_date = as.Date(effective_date, format = "%m/%d/%Y"),
         rate = rate_percent / 100) %>% 
  select(effective_date, rate_type, rate) %>% 
  filter(!is.na(effective_date)) %>% 
  arrange(effective_date) %>% 
  mutate(date = lead(effective_date, 5))
# tb_sofr_rate %>% print(n = Inf)
##########################################################

tb_lookback = tibble(date = seq.Date(as.Date(v_prev_interest_date), as.Date(v_next_interest_date), by = "day"),
       wday = wday(date, label = T)) %>% 
  left_join(tb_sofr_rate, by = c("date"), keep = T)  %>% 
  select(effective_date) 
  
# tb_lookback
v_lookback_prev_interest_date = tb_lookback %>% head(1) %>% pull(effective_date)
v_lookback_next_interest_date = tb_lookback %>% tail(1) %>% pull(effective_date)

sofr_ccr_with_ops1 = tibble(date = seq.Date(as.Date(v_lookback_prev_interest_date), 
                                            as.Date(v_lookback_next_interest_date) - 1, by = "day"),
                            wday = wday(date, label = T)) %>% 
  left_join(tb_sofr_rate, by = c("date" = "effective_date"), keep = T) %>% 
  # mutate(weighted_date = effective_date, .after = wday) %>% 
  select(date = date.x, wday:rate) %>% 
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
  mutate(interest_rate = ccr_year + v_spread_rate)  



##########################################################
sofr_ccr_with_ops1
sofr_ccr_with_ops1 %>% 
  mutate(across(rate_day:interest_rate, num, digits = 7)) %>% 
  print(n = Inf)

v_interest_rate = sofr_ccr_with_ops1 %>% pull(interest_rate) %>% tail(1)
v_interest_days = sofr_ccr_with_ops1 %>% nrow()
v_principal_amount = 100000000
  

v_principal_amount * v_interest_rate * v_interest_days / 360

##########################################################

library(dbplyr)
library(RPostgres)
library(DBI)

con <- dbConnect(RPostgres::Postgres(),dbname = 'mydb', 
                 host = 'localhost', 
                 port = 5433, # or any other port specified by your DBA
                 user = 'postgres',
                 password = '1111')

dbListTables(con)
