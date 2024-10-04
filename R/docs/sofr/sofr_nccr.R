library(tidyverse)
library(lubridate)
library(readxl)


# a = as.double(Sys.time())
# Sys.time()
# as_datetime(a, tz = "Asia/Seoul")
remove(list = ls())
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

sofr_rate %>% head(10)

read_csv("~/data/sofr_rate.csv") %>% 
  janitor::clean_names() %>% 
  mutate(effective_date = as.Date(effective_date, format = "%m/%d/%Y"),
         rate = rate_percent / 100) %>% 
  select(effective_date, rate_type, rate) %>% 
  filter(!is.na(effective_date)) %>% 
  arrange(effective_date) %>% 
  mutate(date = lead(effective_date, 5))

##########################################################
# c(1,2, NA) %>% is.na()
# 
##########################################################
# https://www.newyorkfed.org/aboutthefed/holiday_schedule
# tb_holiday = tibble(date = as.Date(c("2022-01-01", "2022-01-17", "2022-02-21", "2022-05-30", 
#                                      "2022-06-19", "2022-07-04", "2022-09-05", "2022-10-10", 
#                                      "2022-11-11", "2022-11-24", "2022-12-25")),
#                     holiday = c("New Year's Day", "Birthday Of Martin Luther King, Jr.",
#                                 "Washington's Birthday", "Memorial Day",
#                                 "Juneteenth National Independence Day",
#                                 "Independence Day", "Labor Day", "Columbus Day",
#                                 "Veterans Day", "Thanksgiving Day", "Christmas Day"))
# tb_holiday
##########################################################


##########################################################
# NCCR
##########################################################

v_loan_amount = 25364062.44
v_prev_interest_date = "2022-03-31" # 이전 이자징수일.
v_next_interest_date = "2022-04-22" # 다음 이자징수일.
# v_start_date = "2022-03-31"
# v_end_date = "2022-04-21"



tb_nccr = tibble(seq = as.integer(Sys.time()), date = seq.Date(as.Date(v_prev_interest_date), 
                                          as.Date(v_next_interest_date) - 1, by = "day"),
                 wday = wday(date, label = T)) %>% 
  left_join(sofr_rate, by = c("date")) %>% 
  fill(effective_date, rate_type, rate) %>% 
  group_by(effective_date) %>% 
  mutate(n1 = n(), # 비영업일 가중치
         n2 = row_number()) %>% 
  ungroup() %>% 
  mutate(n3 = ifelse(n2 == 1, n1, 0)) %>% 
  mutate(n4 = cumsum(n3)) %>% 
  mutate(rate_day = rate * n3 / 360) %>% 
  mutate(prod_rate1 = cumprod(1 + rate_day) - 1) %>% 
  mutate(prod_rate2 = prod_rate1 * 360 / n4) %>% # nccr-round4 이면 백분율을 감안하면 6자리임.
  mutate(ccr_year = round(as.double(prod_rate2), 6)) %>% # nccr-round4 이면 백분율을 감안하면 6자리임.
  mutate(ccr_day = ccr_year * n4 / 360) %>%
  mutate(prev_ccr_day = lag(ccr_day, 1, default = 0)) %>% 
  mutate(nccr_day = ccr_day - prev_ccr_day) %>% 
  mutate(nccr_interest = round(v_loan_amount * nccr_day, 2)) %>% 
  # select(seq:rate, n1:rate_day, ccr_year, ccr_day, nccr_day, nccr_interest) %>% 
  print(n = Inf)
tb_nccr
# tb_nccr %>% 
#   write_excel_csv(file = "~/data/result_nccr.csv")



tb_nccr %>% 
  select(seq:rate, n3, n4, rate_day, ccr_year, ccr_day, nccr_day, nccr_interest) %>% 
  mutate(across(rate_day:nccr_day, num, digits = 7)) %>%
  mutate(nccr_interest = num(nccr_interest, digits = 2)) %>%
  print(n = Inf)

##########################################################


library(dbplyr)
library(RPostgres)
library(DBI)

# con <- dbConnect(RPostgres::Postgres())
con <- dbConnect(RPostgres::Postgres(),dbname = 'mydb', 
                 host = 'localhost', 
                 port = 5433, # or any other port specified by your DBA
                 user = 'postgres',
                 password = '1111')

##########################################################

dbListTables(con)



## round 처리를 하지 않으면, 부동소수점 오류가 발생.
## round 를 해서 정제된 데이터 insert 처리.
sofr_rate1 = sofr_rate %>% 
  mutate(rate = round(rate, digits = 4))  

sofr_rate1 %>% print(n = Inf)
dbRemoveTable(con, "sofr_rate")
dbWriteTable(con, "sofr_rate", sofr_rate1)

dbRemoveTable(con, "sofr_nccr")
dbRemoveTable(con, "sofr_nccr_inr")

dbReadTable(con, "sofr_rate") %>% 
  as_tibble()

dbWriteTable(con, "sofr_nccr", tb_nccr)
dbWriteTable(con, "sofr_nccr_inr", tb_nccr)


##########################################################


# SELECT LEVEL FROM GENERATE_SERIES(1,10) LEVEL;
# level
# -------
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10
# (10 rows)

# mydb=# select GENERATE_SERIES(1,10) seq;
#   seq
# -----
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10
# (10 rows)

v_start_date = "2022-03-31"
v_end_date = "2022-04-21"
# select generate_series( '2022-03-31'::date , '2022-04-21'::date, '1 day'::interval)::date
# generate_series
# -----------------
# 2022-03-31
# 2022-04-01
# 2022-04-02
# 2022-04-03
# 2022-04-04
# 2022-04-05
# 2022-04-06
# 2022-04-07
# 2022-04-08
# 2022-04-09
# 2022-04-10
# 2022-04-11
# 2022-04-12
# 2022-04-13
# 2022-04-14
# 2022-04-15
# 2022-04-16
# 2022-04-17
# 2022-04-18
# 2022-04-19
# 2022-04-20
# 2022-04-21
# (22 rows)



as.double(Sys.time())
