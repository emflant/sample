#install.packages("DBI")
install.packages("RMariaDB")
install.packages("DBI")
update.packages("DBI")
devtools::install_github("r-dbi/DBI")
devtools::install_github("r-dbi/RMariaDB")

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

te_limit = read_excel("/Volumes/PhotoDisk/30_workspace/data/TE_LIMIT_20191213.xlsx")
dbWriteTable(con, "te_limit", te_limit)

res = dbSendQuery(con, "select * from te_limit where `고객` = '1000038'")
dbFetch(res)
dbClearResult(res)
dbRemoveTable(con, "te_limit")

