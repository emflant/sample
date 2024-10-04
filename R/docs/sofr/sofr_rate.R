library(tidyverse)
library(lubridate)
library(readxl)

tb_sofr_rate = read_excel("~/data/sofr_rate.xlsx") %>% 
  janitor::clean_names() %>% 
  mutate(effective_date = as.Date(effective_date, format = "%m/%d/%Y"),
         rate = rate_percent / 100) %>% 
  select(effective_date, rate_type, rate) %>% 
  filter(!is.na(effective_date)) %>% 
  arrange(effective_date) 
# tb_sofr_rate %>% print(n = Inf)
tb_sofr_rate

##########################################################

library(RPostgres)
library(DBI)



con <- dbConnect(RPostgres::Postgres(),
                 dbname = 'mydb', 
                 host = 'localhost', 
                 port = 5433, 
                 user = 'postgres',
                 password = '1111')

dbListTables(con)

dbWriteTable(con, 
             "sofr_rate", 
             value = tb_sofr_rate)

dbWriteTable(con, 
             Id(schema = "app01", table = "sofr_rate"), 
             value = tb_sofr_rate, overwrite = T)
