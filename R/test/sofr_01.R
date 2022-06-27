library(tidyverse)
library(lubridate)
library(readxl)
# as.Date(19137, origin = "1970-01-01")
start_date = as.Date("2022-05-31")
end_date = as.Date("2022-06-12")

##########################################################
sofr_rate = read_excel("~/data/sofr_rate.xlsx") %>% 
  janitor::clean_names() %>% 
  mutate(date = as.Date(effective_date, format = "%m/%d/%Y"),
         rate = rate_percent / 100) %>% 
  select(date, rate_type, rate) %>% 
  arrange(date)
sofr_rate
##########################################################


##########################################################
# https://www.newyorkfed.org/aboutthefed/holiday_schedule
tb_holiday = tibble(date = as.Date(c("2022-01-01", "2022-01-17", "2022-02-21", "2022-05-30", 
                                     "2022-06-19", "2022-07-04", "2022-09-05", "2022-10-10", 
                                     "2022-11-11", "2022-11-24", "2022-12-25")),
                    holiday = c("New Year's Day", "Birthday Of Martin Luther King, Jr.",
                                "Washington's Birthday", "Memorial Day",
                                "Juneteenth National Independence Day",
                                "Independence Day", "Labor Day", "Columbus Day",
                                "Veterans Day", "Thanksgiving Day", "Christmas Day"))
tb_holiday
##########################################################



##########################################################
# as.Date("06/23/2022", format = "%m/%d/%Y")
tb_sofr = tibble(date = seq.Date(as.Date("2022-05-23"), as.Date("2022-06-05"), by = "day"),
                 wday = wday(date, label = T)) %>% 
  left_join(tb_holiday, by = c("date")) %>% 
  mutate(holiday_yn = wday %in% c("Sat", "Sun") | !is.na(holiday)) %>% 
  mutate(interest_period = date >= start_date & date <= end_date) %>% 
  mutate(banking_day = ifelse(holiday_yn == F, date, 0)) %>% 
  mutate(max_banking = cummax(banking_day)) %>% 
  mutate(banking_dt = as.Date(max_banking, origin = "1970-01-01")) %>% 
  select(date, wday, holiday, banking_dt) %>% 
  left_join(sofr_rate, by = c("banking_dt" = "date")) %>% 
  group_by(banking_dt) %>% 
  mutate(n1 = n(), # 비영업일 가중치
         n2 = row_number()) %>% 
  ungroup() 

tb_sofr
##########################################################

##########################################################
tb_sofr1 = tb_sofr %>% 
  mutate(n3 = row_number()) %>% #누적일수
  mutate(day_rate = num(rate / 360, digits = 10)) %>% 
  mutate(prod_rate1 = num(cumprod(1 + day_rate) - 1, digits = 10)) %>% 
  mutate(prod_rate2 = num(prod_rate1 * 360 / n3, digits = 10)) %>% 
  mutate(result = prod_rate2 + 0.009) %>% # 가산율이 0.9% 일때,
  print(n = Inf)
##########################################################

##########################################################
tb_sofr2 = tb_sofr %>% 
  filter(n2 == 1) %>% 
  mutate(n3 = cumsum(n1)) %>% 
  mutate(day_rate = num(rate * n1 / 360, digits = 10)) %>% 
  mutate(prod_rate1 = num(cumprod(1 + day_rate) - 1, digits = 10)) %>% 
  mutate(prod_rate2 = num(prod_rate1 * 360 / n3, digits = 10)) %>% 
  mutate(result = prod_rate2 + 0.009) %>% # 가산율이 0.9% 일때,
  print(n = Inf)
##########################################################

##########################################################
tb_sofr3 = tb_sofr %>% 
  mutate(n3 = ifelse(n2 == 1, n1, 0)) %>% 
  mutate(n4 = cumsum(n3)) %>% 
  mutate(day_rate = num(rate * n3 / 360, digits = 10)) %>% 
  mutate(prod_rate1 = num(cumprod(1 + day_rate) - 1, digits = 10)) %>% 
  mutate(prod_rate2 = num(prod_rate1 * 360 / n4, digits = 10)) %>% 
  mutate(result = prod_rate2 + 0.009) %>% # 가산율이 0.9% 일때,
  print(n = Inf)
##########################################################