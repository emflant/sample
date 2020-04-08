
getwd()

source(file = file.path(getwd(), "docs/account_management/01_import_tidy.R"), encoding = "UTF-8")
e = get_cards()

e$all

e$all
e$all %>% 
  summarise(n = n(), sum = sum(amount))

remarks = e$all %>% group_by(remarks) %>% 
  summarise(n = n()) %>% 
  select(n, remarks) %>% 
  arrange(desc(n), remarks)

remarks %>% write_excel_csv(path = file.path(getwd(), "docs/account_management/data/remarks_mapping.csv"))
read_csv(file = file.path(getwd(), "docs/account_management/data/remarks_mapping_add.csv"), col_types = "icc")

e$all_add = e$all %>% left_join(read_csv(file = file.path(getwd(), "docs/account_management/data/remarks_mapping_add.csv"), col_types = "icc")  , by = "remarks") %>% 
  select(card_name:amount, class, n, remarks)

e$all_add

# 부분별 소비금액
e$all_add %>% 
  group_by(class) %>% 
  summarise(amount = sum(amount)) %>% 
  arrange(desc(amount))

e$all_add %>% 
  filter(class == "기타", str_detect(remarks, "네이버파이낸셜")) %>% 
  arrange(desc(amount))

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



