#install.packages("DBI")
#install.packages("RMariaDB")
#install.packages("DBI")
#update.packages("DBI")
#devtools::install_github("r-dbi/DBI")
#devtools::install_github("r-dbi/RMariaDB")

library(readxl)
library(tidyverse)
library(lubridate)
library(ggthemes)
library(jsonlite)

library(RMariaDB)
library(DBI)
Sys.getenv()
con = dbConnect(RMariaDB::MariaDB(), host = "127.0.0.1",
                dbname = "test", username = "root", 
                password = "root_pw", port = 3306)
dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)


res = dbSendQuery(con, "select * from mtcars where cyl = 4")
dbFetch(res)
dbClearResult(res)
# dbRemoveTable(con, "mtcars")
#######################################################

samsungcard_201911 = read_excel("/Volumes/PhotoDisk/30_workspace/data/samsungcard_20191222.xlsx")
samsungcard_201911 = samsungcard_201911 %>% 
  rename("총할부금액" = `총 할부금액`)
samsungcard_201911 %>% View
dbWriteTable(con, "samsungcard", samsungcard_201911)

res = dbSendQuery(con, "select * from te_limit where `고객` = '1000038'")
dbFetch(res)
dbClearResult(res)
dbListTables(con)
dbRemoveTable(con, "samsungcard")

