library(tidyverse)
library(rvest)
library(excel)

col_name = read_html("~/data/samsungcard_20210122.html") %>% 
  html_nodes(xpath = "/html/body/table/thead/tr") %>% 
  html_children()  %>% html_text()

read_html("~/data/samsungcard_20210122.html") %>% 
  html_nodes(xpath = "/html/body/table/tbody/tr") %>% 
  html_children() %>% html_text() %>% 
  matrix(ncol = 14, byrow  = T) %>% as_tibble(.name_repair = ~ col_name) %>% 
  filter(str_trim(이용일) != "") %>% 
  mutate(...51 = str_replace(원금, pattern = ",", replacement = "") %>% as.double()) %>% 
  mutate(...52 = sum(...51)) %>% 
  mutate(...53 = ...51 / ...52 * 100) %>% 
  select(이용일, 가맹점, 이용금액 = ...51, 월합계 = ...52, 비중 = ...53) 

read_html("~/data/samsungcard_20210122.html") %>% 
  html_nodes(xpath = "/html/body/table/tbody/tr") %>% 
  html_children() %>% html_text() %>% 
  matrix(ncol = 14, byrow  = T) %>% as_tibble(.name_repair = ~ col_name) %>% 
  filter(str_trim(이용일) != "") %>% 
  mutate(...51 = str_replace(원금, pattern = ",", replacement = "") %>% as.double()) %>% 
  group_by(이용일) %>% 
  mutate(...52 = sum(...51)) %>%
  mutate(...53 = ...51 / ...52 * 100) %>% 
  select(이용일, 가맹점, 이용금액 = ...51, 일합계 = ...52, 비중 = ...53) %>% 
  View()
