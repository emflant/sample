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

aa1 = aa[1,]

aa1$text = "@____m__oo__n_02 문월님ㅠㅠㅠ 어떻게 그렇게 말을 아름답게 하시는 거에요?? 마스크를 끼라는 흔하디흔한 말이 정말 특별해진 듯한 느낌이에요.\n내일 마스크 끼고! 시내에 나가서! 투게더 바닐라맛을 들고 돌아와! 맛있게 먹고 있다는 트윗을 작성할 수 있기를!"

aa1

dbListTables(con)
dbRemoveTable(con, "mask_tweets")
aa$text[1]
dbWriteTable(con, "mask_tweets", aa, append = T)
dbWriteTable(con, "mask_tweets", aa1, append = T)
dbReadTable(con, "mask_tweets")

dbremo


select * from 