
source(file = file.path(getwd(), "docs/account_management/01_import_tidy.R"), encoding = "UTF-8")

daily_sms_raw = read_lines(file = file.path(getwd(), "docs/account_management/data/daily_sms/hana_20200404")) %>% 
  enframe(name = NULL) %>% 
  filter(value != "[Web발신]") %>% 
  mutate(name1 = str_detect(value, "^하나2")) %>% 
  mutate(rnum = row_number()) %>% 
  mutate(seq = cumsum(name1 == T)) %>% 
  mutate(class = case_when(rnum %% 2 == 1 ~ "message", rnum %% 2 == 0 ~ "hashtag")) %>% 
  select(seq, class, value)

daily_sms = daily_sms_raw %>% 
  pivot_wider(names_from = class, values_from = value)
daily_sms %>% 
  mutate(msg = (str_extract(message, ":.+$") %>% str_sub(start = 5L))) %>% 
  select(seq, msg, hashtag) %>% 
  separate(hashtag, into = letters[1:5], sep = "#", extra = "merge", fill = "right") %>% 
  pivot_longer(cols = a:e, names_to = "class", values_to = "hashtag") %>% 
  mutate(hashtag = na_if(hashtag, "")) %>% 
  filter(!is.na(hashtag)) %>% 
  group_by(seq) %>% 
  mutate(cnt = row_number()) %>% 
  select(seq, msg, cnt, hashtag) %>% 
  ungroup() %>% 
  distinct(hashtag)


read_delim(file = file.path(getwd(), "docs/account_management/data/daily_sms/hashtag_class"), delim = "|", col_types = "cc") %>% 
  mutate_all(str_trim) %>% 
  separate(class, into = letters[1:5], sep = "#", extra = "merge", fill = "right") 
  
  
  

             