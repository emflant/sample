
library(lubridate)
library(readxl)
subway = read_excel(path = "~/data/ggplot2/subway_20220531.xlsx")
holiday = tibble(date = c("2022-01-31", "2022-02-01", "2022-02-02", "2022-03-01", "2022-03-09", "2022-05-05")) %>% 
  mutate(date = ymd(date))
holiday

subway1 = subway %>% 
  janitor::clean_names() 
subway1
subway2 = subway1 %>% 
  filter(yeogmyeong == '건대입구') %>% 
  mutate(date = ymd(naljja), .before = "naljja") %>% 
  mutate(wday = wday(date, label = T), .after = "date") %>% 
  mutate(ym = as.character(naljja, format = "%Y-%m"), .after = "wday") %>% 
  filter(wday != "Sun", wday != "Sat") %>% 
  anti_join(holiday, by = "date") %>% 
  group_by(ym, gubun, hoseon) %>% 
  mutate(cnt = n(), .after = "ym") %>% 
  select(-naljja, -yeogbeonho, -yeonbeon)
subway2
subway2 %>% 
  filter(ym == "2022-01")
subway3 = subway2 %>% 
  pivot_longer(cols = starts_with("x"), names_to = "times") %>% 
  group_by(yeogmyeong, ym, cnt, date, wday, gubun) %>% 
  summarise(total = sum(value), .groups = "drop") %>% 
  filter(gubun == "하차")
subway3
# v_date = subway3 %>% pull(naljja) %>% head(1)
ggplot(subway3, aes(date, total)) +
  geom_line()

subway4 = subway3 %>% 
  group_by(ym) %>% 
  mutate(total_month = sum(total)) %>% 
  mutate(total_day = total_month / cnt) %>% 
  distinct(ym, cnt, total_day)

ggplot(subway4, aes(ym, total_day, group = 1)) +
  geom_line()
ymd(v_date) %>% date

as.character(v_date, format = "%Y-%m")
subway4
subway4 = subway3 %>% 
  mutate(ym = as.character(naljja, format = "%Y-%m")) %>% 
  group_by(yeogmyeong, ym, gubun) %>% 
  summarise(total = sum(total), .groups = "drop")
# remove(subway4)
ggplot(subway4, aes(x = ym, y = total)) +
  geom_line(aes(group = gubun, colour = gubun)) +
  theme_bw(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 10)
