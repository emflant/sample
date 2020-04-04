library(tidyverse)
library(rvest)
library(lubridate)
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
    mutate(파일명 = file_name) %>% 
    filter(!is.na(이용금액))
  
  # colnames(samsungcard) = col_name
  samsungcard
}

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
    mutate(파일명 = file_name) %>% 
    filter(!is.na(이용총액))
}

get_hanacard = function(file_name){
  file_path = file.path(getwd(), "docs", "account_management", "data", "hanacard", file_name)
  hanacard_html = read_html(file_path)
  
  col_name = hanacard_html %>% html_node(xpath = "/html/body/div[1]/div[1]/table/tbody/tr[2]/td/table/tbody/tr[2]/td/table/tbody/tr/td[3]/table/tbody/tr[4]/td/table/tbody/tr[5]/td/table/tbody/tr[2]/td/table/tbody/tr[1]") %>% 
    html_children() %>% html_text()
  col_name = c(col_name[1:4], c("회차", "원금", "수수료"), col_name[6:9])
  
  # trd1 = aa$value[5]
  # trd1 %>% read_html() 
  # trd1 %>% read_html() %>% html_node(xpath = "/html/body/tr")
  # trd1 %>% read_html() %>% html_node(xpath = "/html/body/tr") %>% html_children() %>% html_text(trim = T) %>% str_c(collapse = "|")
  
  hanacard = hanacard_html %>% html_node(xpath = "/html/body/div[1]/div[1]/table/tbody/tr[2]/td/table/tbody/tr[2]/td/table/tbody/tr/td[3]/table/tbody/tr[4]/td/table/tbody/tr[5]/td/table/tbody/tr[2]/td/table/tbody") %>% 
    html_children() %>% as.character() %>% enframe(name = NULL) %>% 
    mutate(count = str_count(value, "</td>")) %>% 
    filter(count == 11) %>% 
    mutate(html = map(value, read_html)) %>% 
    mutate(html_node = map(html, html_node, xpath = "/html/body/tr")) %>% 
    mutate(html_children = map(html_node, html_children)) %>% 
    mutate(html_text = map(html_children, html_text, trim = T)) %>% 
    mutate(text = map_chr(html_text, str_c, collapse = "|")) %>% 
    select(text) %>% 
    separate(text, into = col_name, sep = "\\|")
  
  hanacard %>% 
    mutate_all(str_trim) %>% 
    mutate_all(na_if, "") %>% 
    mutate(파일명 = file_name) %>% 
    filter(!is.na(이용금액))
}

get_cards = function(){
  e = new.env()
  
  e$sscard = get_samsungcard("samsungcard_20200122.xls") %>% 
    bind_rows(get_samsungcard("samsungcard_20200222.xls")) %>% 
    bind_rows(get_samsungcard("samsungcard_20200322.xls"))
  
  e$ltcard = get_lottecard("20200123.xls") %>% 
    bind_rows(get_lottecard("20200223.xls")) %>% 
    bind_rows(get_lottecard("20200323.xls"))
  
  e$hncard = get_hanacard("hanacard_detail_20200121.html") %>% 
    bind_rows(get_hanacard("hanacard_detail_20200221.html")) %>% 
    bind_rows(get_hanacard("hanacard_detail_20200321.html"))
  
  e$all = (e$sscard %>% 
             mutate(이용금액 = as.numeric(str_replace_all(이용금액, '[:punct:]', ''))) %>% 
             mutate(결제일 = ymd(str_extract(파일명, '\\d{8}')), 이용일 = ymd(이용일), 카드종류 = "samsung") %>% 
             select(카드종류, 결제일, 이용일, 이용금액, 가맹점)) %>% 
    union_all(e$hncard %>% 
                mutate(이용금액 = as.numeric(str_replace_all(이용금액, '[:punct:]', ''))) %>% 
                mutate(결제일 = ymd(str_extract(파일명, '\\d{8}')), 카드종류 = "hana") %>% 
                mutate(이용일 = ymd(paste0(str_sub(결제일,1,4), '/', 이용일자))) %>% 
                mutate(이용일 = if_else(결제일 < 이용일, 이용일 - years(1), 이용일)) %>% 
                rename(가맹점 = `이용가맹점(은행)`) %>% 
                select(카드종류, 결제일, 이용일, 이용금액, 가맹점)) %>% 
    union_all(e$ltcard %>% 
                mutate(이용금액 = as.numeric(str_replace_all(이용총액, '[,원]', ''))) %>% 
                mutate(결제일 = ymd(str_extract(파일명, '\\d{8}')), 카드종류 = "lotte") %>% 
                mutate(이용일 = ymd(이용일)) %>% 
                rename(가맹점 = `이용가맹점`) %>% 
                select(카드종류, 결제일, 이용일, 이용금액, 가맹점)) %>% 
    mutate(결제년도 = year(결제일), 결제월 = month(결제일)) %>% 
    rename(card_name = 카드종류, issue_year = 결제년도,
           issue_month = 결제월, issue_date = 결제일, 
           pay_date = 이용일, amount = 이용금액, remarks = 가맹점) %>% 
    select(card_name, issue_year, issue_month, issue_date, pay_date, amount, remarks)
    
  
  return(e)  
}