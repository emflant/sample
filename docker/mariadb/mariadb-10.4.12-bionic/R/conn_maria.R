library(readxl)
library(tidyverse)
library(lubridate)
library(ggthemes)
library(jsonlite)
library(RMariaDB)
library(DBI)

# Sys.getenv()
con = dbConnect(RMariaDB::MariaDB(), host = "127.0.0.1",
                dbname = "test", username = "root", 
                password = "root_pw", port = 3306)
dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbDisconnect(con)

dbReadTable(con, "employees")

# res = dbSendQuery(con, "select * from mtcars where cyl = 4")
# dbFetch(res)
# dbClearResult(res)
samsungcard_201912
samsungcard_201912 = read_excel("/Volumes/PhotoDisk/30_workspace/data/samsungcard_20191222.xlsx")
samsungcard_201912 = samsungcard_201912 %>% 
  # rename("총할부금액" = `총 할부금액`) %>%
  mutate("이용일" = ymd(이용일)) %>% 
  mutate(이용금액=as.numeric(str_replace(이용금액, ",", ""))) %>% 
  mutate(혜택금액=as.numeric(str_replace(혜택금액, ",", ""))) %>% 
  mutate(카드종류="삼성카드") %>% 
  select(이용일, 카드종류, 가맹점, 이용금액,혜택금액)
  
dbRemoveTable(con, "samsungcard")
dbWriteTable(con, "samsungcard", samsungcard_201912)

res = dbSendQuery(con, "select * from samsungcard")
dbFetch(res)
dbClearResult(res)
dbListTables(con)
dbRemoveTable(con, "samsungcard")


hanacard_201912 = read_excel("/Volumes/PhotoDisk/30_workspace/data/hanacard_201912.xlsx")
hanacard_201912 = hanacard_201912 %>%
  mutate("이용일" = ymd(str_c("2019/", 이용일)))  %>% 
  mutate(카드종류="하나카드") %>% 
  mutate(이용금액=as.numeric(str_replace(이용금액, ",", ""))) %>% 
  mutate(혜택금액=as.numeric(str_replace(혜택금액, ",", ""))) %>% 
  select(이용일, 카드종류, 가맹점, 이용금액,혜택금액)
dbWriteTable(con, "samsungcard", hanacard_201912, append=T)
  
