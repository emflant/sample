library(tidyverse)
library(rvest)
# "samsungcard_20200122.xls" 엑셀파일인거 같지만, 내용은 html 임. 그래서 rvest 로 데이터 추출.

get_samsungcard = function(file_name){
  
  file_path = file.path(getwd(), "docs", "account_management", "data", "samsungcard", file_name)
  samsungcard_html = read_html(file_path)
  
  col_name = samsungcard_html %>% html_node(xpath = "/html/body/table/thead/tr") %>% 
    html_children() %>% html_text()
  
  samsungcard = samsungcard_html %>% html_node(xpath = "/html/body/table/tbody") %>% 
    html_children() %>% html_children() %>% html_text() %>% 
    matrix(ncol = 14, byrow  = T) %>% as_tibble(.name_repair = ~ col_name) %>% 
    mutate_all(str_trim) %>% 
    mutate_all(na_if, "") %>% 
    mutate(파일명 = file_name)
  
  # colnames(samsungcard) = col_name
  samsungcard
}

all = get_samsungcard("samsungcard_20200122.xls") %>% 
  bind_rows(get_samsungcard("samsungcard_20200222.xls")) %>% 
  bind_rows(get_samsungcard("samsungcard_20200322.xls"))
all %>% filter(str_detect(가맹점,""))  





get_lottecard = function(file_name){
  file_path = file.path(getwd(), "docs", "account_management", "data", "lottecard", file_name)
  
  lottecard_html = read_html(file_path)
  
  col_name = lottecard_html %>% html_node(xpath = "/html/body/table[2]/thead/tr[1]") %>% 
    html_children() %>% html_text()
  
  col_name = c(col_name[1:6], c("원금", "수수료", "적립종류"), col_name[9:12])
  
  lottecard = lottecard_html %>% html_node(xpath = "/html/body/table[2]/tbody") %>% 
    html_children() %>% html_children() %>% html_text() %>% 
    matrix(ncol = 13, byrow  = T) %>% as_tibble(.name_repair = ~ col_name) %>% 
    mutate_all(str_trim) %>% 
    mutate_all(na_if, "") %>% 
    mutate(파일명 = file_name)
}


all_lotte = get_lottecard("20200123.xls") %>% 
  bind_rows(get_lottecard("20200223.xls")) %>% 
  bind_rows(get_lottecard("20200323.xls"))


all_lotte
