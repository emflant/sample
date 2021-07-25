

library(tidyverse)
library(rvest)

sh_card_202102 = read_html("~/data/card/result_html_202103.html")

sh_card_202102 %>% html_elements(xpath =  "/html/body/div[2]/div[2]/div[3]/table[2]/tbody/tr") 

# 제외해야할 대상파악
sh_card_202102 %>% html_elements(xpath =  "/html/body/div[2]/div[2]/div[3]/table[2]/tbody/tr") %>% 
  map_chr(toString) %>% 
  enframe(name = NULL) %>% 
  print(n = Inf)

sh_card_202102 %>% html_elements(xpath =  "/html/body/div[2]/div[2]/div[3]/table[2]/tbody/tr") %>% 
  head(-4) %>% 
  html_elements('td') %>% 
  html_text2() %>% 
  str_trim() %>% 
  matrix(ncol = 11, byrow = T) %>% 
  as_tibble() %>% 
  mutate(V12 = as.numeric(str_replace(V6, ",", ""))) %>% 
  select(V1, V3, V12) 

  
# "html_table()" can convert html text to tibble 
sh_card_202102 %>% html_element(xpath =  "/html/body/div[2]/div[2]/div[3]/table[2]") %>% 
  html_table() %>% print(n = Inf)
  

sh_card_202102 %>% html_element("tbody") %>% 
  html_elements("td") %>% 
  html_text() %>% 
  str_trim() %>% 
  matrix(ncol=11, byrow = T)
  
?html_nodes
