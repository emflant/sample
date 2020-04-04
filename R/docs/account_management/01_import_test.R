
getwd()

source(file = file.path(getwd(), "docs/account_management/01_import_tidy.R"), encoding = "UTF-8")
e = get_cards()

e$all %>% 
  summarise(n = n(), sum = sum(amount))

e$all %>% 
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
