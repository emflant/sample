#install.packages("DBI")
install.packages("RMariaDB")
install.packages("DBI")

library(RMariaDB)
library(DBI)
Sys.getenv()
con = dbConnect(RMariaDB::MariaDB(), host = "127.0.0.1",
                dbname = "test", username = "root", 
                password = "root_pw", port = 3306)
dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbGetQuery(con, "SHOW TABLES")
res = dbSendQuery(con, "SHOW TABLES")
res = dbSendQuery(con, "select * from mtcars where cyl = 4")
dbFetch(res)
dbClearResult(res)

dbRemoveTable(con, "mtcars")
