# tidyverse_update()
source(file = file.path(getwd(), "docs/account_management/01_import_tidy.R"), encoding = "UTF-8")
e = get_cards()
e$all_add = e$all %>% left_join(read_csv(file = file.path(getwd(), "docs/account_management/data/remarks_mapping_add.csv"), col_types = "icc")  , by = "remarks") %>% 
  select(card_name:amount, class, remarks)
e$all_add
act.select()
act.select() %>% 
  arrange(desc(amount)) %>% 
  filter(amount > 10000) %>% 
  print(n = 50)

b = as.numeric(Sys.time())
b == 1586621750
act.select() %>% 
  filter(str_detect(remarks, '풀무원푸드앤컬처'), !(amount %in% c(5000, 15000))) %>% print(n = Inf)
act.select() %>% 
  mutate(amount1 = !amount)
aa
aa = act.select() %>% 
  filter(str_detect(remarks, '풀무원푸드앤컬처')) %>% 
  mutate(cls1 = "주유비")
aa = act.select() %>% 
  filter(str_detect(remarks, '(주)서울에너지')) %>% 
  mutate(cls1 = "롯데마트", cls2 = "코로나대비 먹을걸 사러갔으나 동난게 하나도 없어서 민망")
act.update(aa)
act.select() %>% 
  filter(str_detect(remarks, '서울에너지'))
act.all() %>% 
  filter(timestamp == 1586621557)

act.all() %>% 
  filter(str_detect(remarks, '서울에너지'), timestamp == 1586621556)
# https://m.blog.naver.com/ktri8888/220332158495
# 마스터만 저장.
account_details = mongo("account_details", db = "account", 
                    url = "mongodb://localhost:27017")
# 이력 저장.
account_details_hist = mongo("account_details_hist", db = "account", 
                        url = "mongodb://localhost:27017")

account_details$find('{} ')%>% as_tibble() %>% 
  arrange(card_name, issue_year, issue_month, seq)

as.numeric(Sys.time())
as.numeric(Sys.time())
as.numeric(now())
as_datetime(1586618308, tz = "Asia/Seoul")
timestamp()
as.numeric(date())
as.numeric(Sys.Date())
now(tzone = "Asia/Seoul")
now(tzone = "America/New_York")
as.numeric(now(tzone = "Asia/Seoul"))
as.numeric(now(tzone = "America/New_York"))
1586618308/60/60/24/365
account_details_hist$find('{} ')%>% as_tibble() %>% 
  filter(str_detect(remarks, '대교')) %>% 
  mutate(cls1 = "눈높이") %>% 
  mutate(cls2 = NA)

# account_details_hist$insert(account_details$find('{} '))
account_details_hist$find()%>% as_tibble()
account_details_hist$drop()


aa = account_details$find('{} ')%>% as_tibble() %>% 
  mutate(timestamp = as.numeric(Sys.time())) %>% 
  select(timestamp, card_name:cls2)
# account_details_hist$insert(aa)

# 마지막이력기준으로 조회.
hist = account_details_hist$find() %>% as_tibble() %>% 
  group_by(card_name, issue_year, issue_month, seq) %>% 
  arrange(desc(timestamp)) %>% 
  mutate(hist_seq = row_number()) %>% 
  ungroup() %>% 
  filter(hist_seq == 1) %>% 
  select(timestamp:seq, issue_date:cls2)

hist %>% 
  filter(str_detect(remarks, '대교'))
aft_hist = hist %>% 
  filter(str_detect(remarks, '대교')) %>% 
  mutate(cls1 = "눈높이", cls2 = NA)

# insert 처리시 timestamp 갱신.
account_details_hist$insert(aft_hist %>% mutate(timestamp = as.numeric(Sys.time())))

account_details_hist$find() %>% as_tibble() %>% 
  filter(str_detect(remarks, '대교'))


# account_details$insert(e$all_add)
# account_details$drop()
account_details$drop()
account_details$find('{ "amount" : 372870 }') %>% as_tibble()
aa = account_details$find() %>% as_tibble() %>% 
  mutate(cls1 = NA, cls2 = NA) %>%
  arrange(desc(amount))
aa %>% write_t(file.path(getwd(), "docs/account_management/data/aa.csv"))
aa =  read_csv(file.path(getwd(), "docs/account_management/data/aa.csv"))
account_details$insert(aa)
aa %>% write_tsv(file.path(getwd(), "docs/account_management/data/aa.tsv"))
# aa[1,c("cls1", "cls2")] = c("장난감", "크리스마스선물,맥포머스")
# aa[2,c("class", "cls1", "cls2")] = c("외식", "호텔부페", "청담쪽호텔")
aa %>% view()
e$all_add %>% 
  arrange(desc(amount)) %>%
  group_by(pay_date, amount) %>% 
  select(pay_date, amount, remarks) %>% 
  filter(amount > 100000)

  

account_details$find() %>% as_tibble()
e$all_add
e$all_add %>% 
  summarise(n = n(), sum = sum(amount))

remarks = e$all %>% group_by(remarks) %>% 
  summarise(n = n()) %>% 
  select(n, remarks) %>% 
  arrange(desc(n), remarks)
remarkshghghhjhjjh
remarks %>% write_excel_csv(path = file.path(getwd(), "docs/account_management/data/remarks_mapping.csv"))
read_csv(file = file.path(getwd(), "docs/account_management/data/remarks_mapping_add.csv"), col_types = "icc")


e$all_add 
e$all_add %>% 
  arrange(desc(amount)) %>% 
  print(n = 20)

# 부분별 소비금액
e$all_add %>% 
  group_by(class) %>% 
  summarise(amount = sum(amount)) %>% 
  arrange(desc(amount))

a = e$all_add %>% 
  filter(class == "쇼핑") %>% 
  arrange(desc(amount))
a
a[1,c("pay_date")] = ymd("20191211")
a[a$amount == 170200,]
# a[a$remarks == "쿠팡(쿠페이) 쿠팡(쿠페이)",8 ] = 2
# a$remarks == "쿠팡(쿠페이) 쿠팡(쿠페이)"
e$all %>% left_join(remarks_add, by = "remarks") %>% 
  select(class,amount,remarks) %>% 
  group_by(class) %>% 
  mutate(amount = sum(amount)) %>% 
  arrange(class,remarks) %>% 
  distinct() %>% 
  mutate(n = row_number()) %>% ungroup() %>% 
  pivot_wider(names_from = n, values_from = remarks)
  

e$all %>% left_join(remarks_add, by = "remarks") %>% 
  group_by(class) %>% 
  summarise(amount = sum(amount)) %>% 
  arrange(desc(amount))

remarks %>% 
  mutate(class = "식대")
  mutate(str_detect())


a = e$all %>% 
  group_by(issue_year, issue_month) %>% 
  summarise(amount = sum(amount))

e$all %>% 
  group_by(remarks) %>% 
  summarise(cnt = n(), amount = sum(amount)) %>% 
  select(cnt, amount, remarks) %>% 
  arrange(desc(amount)) %>% 
  print(n = 20)

e$all %>% 
  summarise(n = n(), sum = sum(amount))

e$all %>% 
  filter(str_detect(remarks, '홀릭홀릭')) %>% 
  arrange(pay_date)

qplot(mtcars$wt, mtcars$mpg)
qplot(wt, mpg, data = mtcars)
ggplot(mtcars, aes(x = wt, y = mpg))+
  geom_point()


a

ggplot(a, aes(x = issue_month, y = amount))+geom_line()
ggplot(a, aes(x = issue_month, y = amount)) + 
  geom_bar(stat = "identity")


ggplot(a, aes(x = issue_month, y = amount)) + 
  geom_col()

ggplot(a, aes(x = issue_month)) +
geom_histogram()



