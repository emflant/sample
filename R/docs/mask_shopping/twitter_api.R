# install.packages("rtweet")
library(rtweet)
library(lubridate)
rt <- search_tweets(
  "마스크", n = 5, include_rts = FALSE
)

rt %>% select(created_at, urls_url) %>% 
  mutate(p1 = unlist(purrr::map(urls_url, dplyr::first))) %>% 
  mutate(p2 = purrr::map_chr(urls_url, dplyr::first)) %>% 
  mutate(p3 = sapply(urls_url, dplyr::first))

str_extract("수출길 막히자 국내 유통하려 한 ‘마스크 사재기’ 판매자 2명 적발 https://t.co/zmMA0sOHs2", "http\\.+")
rt$urls_url
rt$created_at
rt %>% 
  filter(lang == "ko") %>% 
  filter(!is.na(urls_url)) %>% 
  filter(!str_detect(urls_url, "youtu.be")) %>% 
  filter(created_at > ymd("2020-02-28")) %>%
  mutate(murl = str_extract(text, 'http[:graph:]+')) %>% 
  mutate(urls_url_first = map(urls_url, dplyr::first)) %>% 
  select(created_at, murl, text, urls_url_first)

rt %>%
  filter(lang == "ko") %>% 
  filter(!is.na(urls_url)) %>% 
  filter(!str_detect(urls_url, "youtu.be")) %>% 
  select(user_id, status_id, created_at, text, urls_url)

str(aa)
aa$text
length(aa$urls_url)
aa$urls_url[2]
ffffff
identity

array()
vector()
unlist
sapply(aa$urls_url, identity)
aa$urls_url

b = list(c(1,2),3,4)
b
ff = function(v_list){
  v_list[1]
}

lapply(b, ff)


# ctrl/window/alt/space/alt/fn/?/ctrl
# control/command/option/space/option/?/?/control

# lapply()



