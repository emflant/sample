library(tidyverse)
library(rvest)
library(lubridate)
library(RMariaDB)


ss_card_list = function(input_list){
  input_list %>% html_elements(xpath = '/html/body/table/tbody/tr') %>% 
    map_chr(toString) %>% 
    enframe(name = NULL) %>%
    filter(str_detect(value, "\\d{8}")) %>% 
    mutate(value2 = map(value, read_html)) %>% 
    select (value2) %>% 
    mutate(value3 = map(value2, html_elements, "td")) %>% 
    mutate(value4 = map(value3, html_text2)) %>% 
    mutate(value5 = map_chr(value4, str_c, collapse = "|")) %>% 
    separate(value5, sep = "\\|", into = paste0("v",as.character(c(1:14)))) %>% 
    select(v1, v3, v10)
}

ss_card_result = function(){
  map(list(read_html("~/data/card/downloads/samsungcard_20210122.xls"),
           read_html("~/data/card/downloads/samsungcard_20210222.xls"),
           read_html("~/data/card/downloads/samsungcard_20210322.xls"),
           read_html("~/data/card/downloads/samsungcard_20210422.xls"),
           read_html("~/data/card/downloads/samsungcard_20210522.xls"),
           read_html("~/data/card/downloads/samsungcard_20210622.xls"),
           read_html("~/data/card/downloads/samsungcard_20210722.xls"),
           read_html("~/data/card/downloads/samsungcard_20210822.xls")), ss_card_list) %>% 
    reduce(union_all) %>% 
    mutate(v71 = as.numeric(str_replace_all(v10, ",", ""))) %>% 
    mutate(v70 = if_else(is.na(v71), 0, v71)) %>%  
    mutate(v80 = ymd(v1)) %>%
    mutate(v90 = 'SS') %>% # samsung card
    select(v90, v80, v3, v70) %>% 
    rename(card_cd = v90, pay_date = v80, details = v3, pay_amt = v70)
}
