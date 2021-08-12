source('./source/docs/card_statement/shcard.R')
source('./source/docs/card_statement/sscard.R')
library(RPostgres)

con <- dbConnect(RPostgres::Postgres(),dbname = 'mydb', 
                 host = 'my-postgres', # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'
                 port = 5432, # or any other port specified by your DBA
                 user = 'postgres',
                 password = '1111')



# dbListTables(con)

card_result = sh_card_result() %>% 
  union_all(ss_card_result())
card_result
sh_card_result()

# 소문자만 허용되는가?
dbWriteTable(con, "card_dtl", card_result, overwrite = T)
dbDisconnect(con)


516 + 6868992
