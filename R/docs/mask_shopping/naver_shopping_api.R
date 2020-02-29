# Client ID : 6An8vcWeL6KiEbtHVtVs
# Client Secret : WCDfuTUsrC

# curl "https://openapi.naver.com/v1/search/shop.xml?query=%EB%A7%88%EC%8A%A4%ED%81%AC&display=10&start=1&sort=sim" \
# -H "X-Naver-Client-Id: 6An8vcWeL6KiEbtHVtVs" \
# -H "X-Naver-Client-Secret: WCDfuTUsrC" -v
library(tidyverse)
library(xml2)
library(curl)

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


# mask.shopping_list() %>% 
#   print(n = Inf)
#   
# mask.shopping_list() %>% 
#   filter(str_detect(title, "대형|메디쉴드|애니쉴드|퓨리어스|PURIOUS|이지팜")) %>% 
#   mutate(title = str_sub(title, 0, 30)) %>% 
#   select(lprice, title, link, image)

aa = mask.shopping_list(text = "kf94") %>%
  filter(str_detect(title, "대형|메디쉴드|애니쉴드|퓨리어스|PURIOUS|이지팜")) %>%
  filter(!str_detect(title, "유아용")) %>% 
  mutate(url = paste0("![](", image, ")[", title, "](", link, ") 개당 ", price_per_one_mask, "원")) %>% 
  select(url) %>% 
  pull(url)
str(aa)

str_c(aa, "<br/><br/>", sep = "", collapse = "")

mask.shopping_list(text = "kf94", sort = "date") %>%
  filter(str_detect(title, "대형|메디쉴드|애니쉴드|퓨리어스|PURIOUS|이지팜")) %>%
  filter(!str_detect(title, "유아용|기저귀")) %>% 
  mutate(count_word = str_extract(title, "\\d+(매|p|P)")) %>% 
  mutate(count = ifelse(is.na(count_word), 1, as.numeric(str_extract(count_word, "\\d+")))) %>%
  mutate(price_per_one_mask = lprice / count) %>%
  select(title, lprice, count, price_per_one_mask, link, image) %>% 
  arrange(price_per_one_mask, lprice) %>% 
  mutate(url = paste0("![](", image, ")[", title, "](", link, ") 개당 ", price_per_one_mask, "원")) %>% 
  select(url) %>% 
  pull(url) %>% 
  str_c("<br/><br/>", sep = "", collapse = "")


