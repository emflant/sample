

subway = read_excel(path = "~/data/ggplot2/subway_20220531.xlsx")
holiday = tibble(date = c("2022-01-31", "2022-02-01", "2022-02-02", "2022-03-01", "2022-03-09", "2022-05-05")) %>% 
  mutate(date = ymd(date), code = "h")
holiday
subway1 = subway %>% janitor::clean_names() 
subway1
tb_time = subway1 %>% 
  filter(yeogmyeong == '', gubun == '하차',
         naljja == as.Date('2022-05-01')) %>%  
  pivot_longer(cols = starts_with("x"), names_to = "time") %>% 
  distinct(time) %>% 
  mutate(time_dbl = 6:24) %>% 
  print()

subway1 %>% 
  filter(yeogmyeong == '까치산') 

subway2 = subway1 %>% 
  filter(yeogmyeong == '까치산', gubun == '하차',
         naljja >= as.Date('2022-05-01') ) %>% 
  group_by(naljja, yeogmyeong) %>% 
  summarise_at(.vars = vars(x06si_ijeon:x23si_ihu), sum) %>% 
  pivot_longer(cols = starts_with("x"), names_to = "time") %>% 
  left_join(tb_time, by = "time") %>% 
  mutate(times = map2(time_dbl, value, rep),
         naljja = ymd(naljja)) %>% 
  mutate(wday = wday(naljja, label = T), .after = "naljja") %>% 
  mutate(week = epiweek(naljja), .after = "wday") %>% 
  unnest_longer(times) %>% 
  left_join(holiday, by = c("naljja"="date")) %>% 
  mutate(holiday = code=="h"|wday =="Sat"|wday == "Sun") %>% 
  mutate(holiday = !is.na(holiday)) %>% 
  print(n = 100)

###############################################################

# subway2 %>% 
#   mutate(time_str = as.character(time_dbl / 3 + 4))
# print(n = 3) 


subway2 %>% select(-value, -code) %>% 
  filter(naljja == "2022-05-13") %>% 
  mutate(time_str =  as.character(time_dbl / 3 + 4)) %>% 
  ggplot(aes(times, fill = ..count..)) +
  geom_histogram(binwidth = 3) +
  scale_x_continuous(breaks = seq(6,24,6)) +
  # scale_fill_brewer() +
  scale_fill_gradient(low = "#FEB139", high = "#D61C4E") +
  # scale_fill_hue(h = c(0, 100)) +
  theme_void() +
  theme(legend.position = "none",
        plot.margin = margin(1,1,1,1,"cm"))


###############################################################

subway3 = subway2 %>% select(-time, -value, -code)
ggplot(subway3,aes(x = times)) +
  geom_histogram(aes(fill = ..count..), alpha = 1, binwidth = 6) +
  # geom_bar(aes(fill = holiday), alpha = .5) +
  # geom_density(adjust = 1.5) +
  scale_x_continuous(breaks = seq(6,24,6)) +
  # scale_y_continuous(breaks = seq(10000,50000, 10000)) +
  # scale_fill_gradient(low = "#79DAE8", high = "#0AA1DD") +
  scale_fill_gradient(low = "#E7AB79", high = "#B25068") +
  # scale_fill_gradient(low = "#E7AB79", high = "#B25068") +
  facet_grid(week ~ wday) +
  labs(title = paste0("'22.5월 ", subway2 %>% pull(yeogmyeong) %>% head(1), "역 유동인구 시간별 추이"),
       caption = "twitter @sourcebox7") +
  theme_minimal(base_family = "AppleSDGothicNeo-Bold", base_size = 10) +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        legend.position = "none",
        # axis.text.y = element_blank(),
        panel.grid.major.y = element_line(colour = "gray80", size = 0.3),
        axis.title = element_blank(),
        plot.title = element_text(margin = margin(0,0,.5,0, "cm"),
                                  hjust = 0.5),
        plot.caption = element_text(color = "gray30", 
                                    family = "Menlo", 
                                    hjust = 1, 
                                    size = 6,
                                    margin = margin(.5,0,0,0,"cm")),
        plot.margin = margin(.7,1,.7,1,"cm"),
        plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA")) 


ggsave(paste0("./test/ggplot/save_ggplot_bar_04_facet2.png"),
       width = 8, height = 6, dpi = 320, units = "in")



