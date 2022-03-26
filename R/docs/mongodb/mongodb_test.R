# mongodb
# install.packages("mongolite")
source("~/github/sample/R/docs/photo_files/photo_compare.R")

# connecting to: mongodb://localhost:27017/?gssapiServiceName=mongodb

?mongo

# mongodb://test22:testpw22@my-mongo:27017/mydb

mongo_uri = "mongodb://test22:testpw22@localhost:27017/mydb"

payment = mongo("payment", db = "mydb", url = mongo_uri)
classEvent = mongo("classEvent", db = "mydb", url = mongo_uri)

payment$find() %>% 
  as_tibble()

classEvent$find() %>% 
  as_tibble()


p = payment$find() %>% 
  as_tibble() %>% 
  filter(delYn != T) %>% 
  select('paymentDate', 'delYn', 'memberIdInfo') %>% 
  unnest(cols = c('memberIdInfo')) %>% 
  select('paymentDate', name, `_id`, delYn) %>% 
  rename(memberId = `_id`) %>% 
  mutate(paymentMonth = str_sub(paymentDate, 1, 7)) 
  
# summarise 후에 group_by 를 또 하지 않도록 .group 파라메터가 있음.
# keep : summarise 처리후, 기존 group_by 정보를 유지
# drop : summarise 처리후, group_by 정보를 삭제.
# drop_last : summarise 처리후, group_by 컬럼중 마지막 컬럼만 삭제함. 다음 summarise를 편하게 하기 위해 있는 듯.
c  = classEvent$find() %>% 
  as_tibble() %>% 
  filter(memberId != 'reservation') %>% 
  mutate(classMonth = str_sub(classDate, 1, 7)) %>% 
  select(classMonth, memberId, title) %>% 
  group_by(classMonth, memberId) %>% 
  summarise(max_title = max(title), .groups = "drop") 
c
p %>% anti_join(c, by=c("paymentMonth" = "classMonth","memberId"))

c %>% anti_join(p, by=c("classMonth" = "paymentMonth","memberId"))


classEvent$find() %>% 
  str


