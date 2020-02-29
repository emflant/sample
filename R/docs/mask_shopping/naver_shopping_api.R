# curl "https://openapi.naver.com/v1/search/shop.xml?query=%EB%A7%88%EC%8A%A4%ED%81%AC&display=10&start=1&sort=sim" \
# -H "X-Naver-Client-Id: 6An8vcWeL6KiEbtHVtVs" \
# -H "X-Naver-Client-Secret: WCDfuTUsrC" -v
library(tidyverse)
library(xml2)
library(curl)

# This book was written in bookdown inside RStudio. 
# The website is hosted with netlify, 
# and automatically updated after every commit by travis-ci. 
# The complete source is available from GitHub. 

# 식품의약품안전평가원_의약외품 제품 허가정보
# https://www.data.go.kr/dataset/15028967/openapi.do
# sort : sim (유사도순), date (날짜순), asc(가격오름차순) ,dsc(가격내림차순)
mask.shopping_list = function(text = "마스크", sort = "sim"){
  h = new_handle()
  handle_setheaders(h, "X-Naver-Client-Id" = "6An8vcWeL6KiEbtHVtVs",
                    "X-Naver-Client-Secret" = "WCDfuTUsrC")
  
  text = URLencode(text)
  
  
  api_url = paste0("https://openapi.naver.com/v1/search/shop.xml?query=", text, 
                   "&display=", 100,
                   "&start=", 1,
                   "&sort=", sort)
  
  req = curl_fetch_memory(api_url, handle = h)
  
  result = rawToChar(req$content) %>% 
    read_xml() %>%
    xml_find_all(".//item") %>% 
    xml_children() %>% 
    xml_text(trim = T) %>% 
    matrix(ncol = 8, byrow = T)
  
  
  col_name = rawToChar(req$content) %>% 
    read_xml() %>%
    xml_find_first(".//item") %>% 
    xml_children %>% 
    xml_name
  
  colnames(result) = col_name
  
  result %>% as_tibble() %>% 
    mutate(lprice = as.numeric(lprice))
}
mask.shopping_page = function (){
  result = mask.shopping_list(text = "kf94", sort = "date") %>%
    filter(str_detect(title, "대형|숨쉬고|매일편한|더이룸|메디|뉴네퓨어|휴안청플러스|매직브라이트|깨끗한나라|르에어|더존|톡톡버디|숨프리|내츄럴하모니|블루인더스|에어퀸|늘푸른|제로베이|메디쉴드|애니쉴드|퓨리어스|PURIOUS|이지팜|크린탑|동아")) %>%
    filter(!str_detect(title, "유아용|기저귀|어린이")) %>% 
    mutate(count_word = str_extract(title, "\\d+(매|p|P|장|개)")) %>% 
    mutate(count = ifelse(is.na(count_word), 1, as.numeric(str_extract(count_word, "\\d+")))) %>%
    mutate(price_per_one_mask = round(lprice / count)) %>%
    select(title, lprice, count, price_per_one_mask, link, image) %>% 
    arrange(price_per_one_mask, lprice) %>% 
    mutate(url = paste0("![](", image, ")<br/>[", title, "](", link, ") 전체 : ", lprice, "원 (" ,
                        "개당 ", price_per_one_mask, "원)")) %>% 
    select(url) %>% 
    pull(url) %>% 
    str_c("<br/><br/><br/><br/><br/><br/>", sep = "", collapse = "")
  
  page = '---
title: "R Notebook"
output: html_notebook
---'
  page = paste(page, "\n\n", date(), "\n\n", result)
  write_file(page, path = file.path(getwd(), "docs/mask_shopping/mask_page.Rmd"))
  rmarkdown::render(file.path(getwd(), "docs/mask_shopping/mask_page.Rmd"))
}

# mask.shopping_page()

