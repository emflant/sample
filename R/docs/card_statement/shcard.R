library(tidyverse)
library(rvest)


sh_card_list = function(input_list){
  input_list %>% html_elements(xpath =  "/html/body/div[2]/div[2]/div[3]/table[2]/tbody/tr") %>% 
    map_chr(toString) %>% 
    enframe(name = NULL) %>% 
    filter(str_detect(value, "^<tr>\\n<td>\\d{2}\\.\\d{2}\\.\\d{2}")) %>% 
    mutate(value2 = map(value, read_html)) %>% 
    select (value2) %>% 
    mutate(value3 = map(value2, html_elements, "td")) %>% 
    mutate(value4 = map(value3, html_text2)) %>% 
    mutate(value5 = map_chr(value4, str_c, collapse = "|")) %>% 
    separate(value5, sep = "\\|", into = paste0("v",as.character(c(1:11)))) %>% 
    select(v1, v3, v6)
}

sh_care_result = map(list(read_html("~/data/card/result_html_202102.html"),
     read_html("~/data/card/result_html_202103.html"),
     read_html("~/data/card/result_html_202104.html"),
     read_html("~/data/card/result_html_202105.html"),
     read_html("~/data/card/result_html_202106.html"),
     read_html("~/data/card/result_html_202107.html")), sh_card_list) %>% 
  reduce(union_all) %>% 
  mutate(v7 = as.numeric(str_replace(v6, ",", ""))) %>% 
  select(v1,v3,v7) 

sh_care_result

sh_care_result %>% 
  group_by(v3) %>% 
  summarise(cnt = n(), sum_amt = sum(v7)) %>% 
  arrange(desc(sum_amt))




