source('./source/docs/card_statement/shcard.R')
source('./source/docs/card_statement/sscard.R')

con = dbConnect(RMariaDB::MariaDB(), host = "my-mariadb",
                dbname = "test", username = "root", 
                password = "root_pw", port = 3306)

# dbListTables(con)

card_result = sh_card_result() %>% 
  union_all(ss_card_result())

sh_card_result()

# 소문자만 허용되는가?
dbWriteTable(con, "card_dtl", card_result, overwrite = T)
dbDisconnect(con)
