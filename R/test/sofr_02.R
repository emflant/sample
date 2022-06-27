library(tidyverse)
library(lubridate)
library(readxl)
# as.Date(19137, origin = "1970-01-01")
# start_date = as.Date("2022-05-31")
# end_date = as.Date("2022-06-12")

##########################################################
# https://www.newyorkfed.org/markets/reference-rates/sofr
# 에서 엑셀로 다운로드 한다.
sofr_rate = read_excel("~/data/sofr_rate.xlsx") %>% 
  janitor::clean_names() %>% 
  mutate(effective_date = as.Date(effective_date, format = "%m/%d/%Y"),
         rate = rate_percent / 100) %>% 
  select(effective_date, rate_type, rate) %>% 
  arrange(effective_date) %>% 
  mutate(date = lead(effective_date, 5))
sofr_rate
##########################################################


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
v_start_date = "2022-03-31"
v_end_date = "2022-04-21"

tb_nccr = tibble(date = seq.Date(as.Date(v_start_date), as.Date(v_end_date), by = "day"),
       wday = wday(date, label = T)) %>% 
  left_join(sofr_rate, by = c("date")) %>% 
  fill(effective_date, rate_type, rate) %>% 
  group_by(effective_date) %>% 
  mutate(n1 = n(), # 비영업일 가중치
         n2 = row_number()) %>% 
  ungroup() %>% 
  mutate(n3 = ifelse(n2 == 1, n1, 0)) %>% 
  mutate(n4 = cumsum(n3)) %>% 
  mutate(rate_day = num(rate * n3 / 360, digits = 10)) %>% 
  mutate(prod_rate1 = cumprod(1 + rate_day) - 1) %>% 
  mutate(prod_rate2 = prod_rate1 * 360 / n4, digits = 10) %>% # nccr-round4 이면 백분율을 감안하면 6자리임.
  mutate(ccr_year = num(round(as.double(prod_rate2), 6), digits = 10)) %>% # nccr-round4 이면 백분율을 감안하면 6자리임.
  mutate(ccr_day = ccr_year * n4 / 360) %>% 
  select(date, effective_date, rate, n3, n4, rate_day, ccr_year, ccr_day) %>% 
  mutate(prev_ccr_day = lag(ccr_day, 1, default = 0)) %>% 
  mutate(nccr_day = (ccr_day - prev_ccr_day)) %>% 
  mutate(nccr_interest = num(v_loan_amount * nccr_day, digits = 2)) %>% 
  print(n = Inf)


tb_nccr %>% 
  write_excel_csv(file = "~/data/result_nccr.csv")
