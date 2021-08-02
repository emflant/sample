library(readxl)
library(tidyverse)
library(lubridate)
library(ggthemes)
library(jsonlite)
library(RMariaDB)
library(DBI)


con = dbConnect(RMariaDB::MariaDB(), host = "127.0.0.1",
                dbname = "test", username = "root", 
                password = "root_pw", port = 3306)

dbDisconnect(con)

dbListTables(con)
dbRemoveTable(con, "mask_tweets")

dbWriteTable(con, "mask_tweets", aa, append = T)
# dbWriteTable(con, "mask_tweets", aa1, append = T)
bb = dbReadTable(con, "mask_tweets")

bb = bb %>% as_tibble()

lobstr::obj_size(bb)

###############################################
aa1 = aa %>% count(status_id)
bb1 = bb %>% count(status_id)

aa1 %>% 
  full_join(bb1, by = "status_id")

aa1 %>% 
  full_join(bb1, by = "status_id") %>% 
  filter(is.na(n.y)) %>% 
  inner_join(aa, by = "status_id")

###############################################


aa = aa %>% group_by(status_id) %>% 
  mutate(rn = row_number()) %>% 
  ungroup()

bb = bb %>% group_by(status_id) %>% 
  mutate(rn = row_number()) %>% 
  ungroup()

aa %>% 
  full_join(bb, by = c("status_id", "rn")) %>% 
  filter(rn == 1) %>% 
  filter(is.na(user_id.y))
###############################################

