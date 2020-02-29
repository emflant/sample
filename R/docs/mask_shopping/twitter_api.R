# install.packages("rtweet")
library(rtweet)

# rt %>% head %>% View
# colnames(rt)


# rt %>% 
#   filter(!str_detect(urls_url, "youtu.be")) 
# 
# aa = rt %>% 
#   filter(!is.na(urls_url)) %>% 
#   head %>% 
#   mutate(text = str_sub(text, 0, 30)) %>% 
#   select(text, urls_url)

rt <- search_tweets(
  "kf94", type = "recent", n = 1000, include_rts = FALSE
)

rt %>% head(10)  %>% 
  select(created_at) %>% 
  filter(created_at > ymd("2020-02-29"))


rt %>% 
  filter(lang == "ko") %>% 
  filter(!is.na(urls_url)) %>% 
  filter(!str_detect(urls_url, "youtu.be")) %>% View

rt %>% 
  filter(lang == "ko") %>% 
  filter(!is.na(urls_url)) %>% 
  filter(!str_detect(urls_url, "youtu.be")) %>% 
  filter(created_at > ymd("2020-02-28")) %>%
  select(created_at, text)

rt %>%
  filter(lang == "ko") %>% 
  filter(!is.na(urls_url)) %>% 
  filter(!str_detect(urls_url, "youtu.be")) %>% 
  select(user_id, status_id, created_at, text, urls_url)

str(aa)
aa$text
length(aa$urls_url)
aa$urls_url[2]

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
