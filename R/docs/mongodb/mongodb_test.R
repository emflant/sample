# mongodb
# install.packages("mongolite")
source("~/github/sample/R/docs/photo_files/photo_compare.R")

# connecting to: mongodb://localhost:27017/?gssapiServiceName=mongodb

?mongo

# mongodb://test22:testpw22@my-mongo:27017/mydb

mongo_uri = "mongodb://test22:testpw22@localhost:27017/mydb"

payment = mongo("payment", db = "mydb", url = mongo_uri)
classEvent = mongo("classEvent", db = "mydb", url = mongo_uri)

tb_payment = payment$find() %>% 
  as_tibble()
tb_payment %>% str
# paymentType 1.현금 2.제로페이 3.신용카드

th_payment_cd = tibble(paymentType = c('1','2','3'),
                       paymentTypeNm = c('현금', '제로페이', '신용카드'))
th_payment_cd

tb_member = tb_payment %>% 
  pull(memberIdInfo) %>% as_tibble() %>% 
  select(memberId = '_id', name) %>% 
  distinct(memberId, name)
  
tb_payment2 = tb_payment %>% 
  filter(delYn == F) %>% 
  left_join(tb_member) %>% 
  left_join(th_payment_cd) %>% 
  mutate(paymentDate = ymd(paymentDate)) %>% 
  select(name, paymentDate, paymentTypeNm, cashReceiptYn, amount) %>% 
  filter(paymentDate >= ymd('2022-01-01'), paymentDate < ymd('2023-01-01')) %>% 
  arrange(paymentDate) 
  

tb_payment2 %>% 
  write_excel_csv(file="~/data/creart_2022.csv")

tb_payment2 %>% 
  filter(paymentTypeNm == "제로페이") %>% 
  mutate(sum = sum(amount))

tb_payment2
tb_payment2 %>% 
  mutate(mm = month(paymentDate)) %>% 
  filter(paymentTypeNm == "현금", cashReceiptYn == T) %>% 
  group_by(mm) %>% 
  summarise(sum = sum(amount)) %>% 
  mutate(cs = cumsum(sum))

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


