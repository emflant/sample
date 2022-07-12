

subway = read_excel(path = "~/data/ggplot2/subway_20220531.xlsx")
holiday = tibble(date = c("2022-01-31", "2022-02-01", "2022-02-02", "2022-03-01", "2022-03-09", "2022-05-05")) %>% 
  mutate(date = ymd(date), code = "h")
holiday
subway1 = subway %>% janitor::clean_names() 

tb_time = subway1 %>% 
  filter(yeogmyeong == '건대입구', gubun == '하차',
         naljja == as.Date('2022-01-01'), hoseon == 2) %>%  
  pivot_longer(cols = starts_with("x"), names_to = "time") %>% 
  distinct(time) %>% 
  mutate(time_dbl = 6:24) %>% 
  print()

subway2 = subway1 %>% 
  filter(yeogmyeong == '건대입구', gubun == '하차',
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

subway2
ggplot(subway2,aes(x = times, y = after_stat(count))) +
  geom_bar(aes(fill = holiday), alpha = .5) +
  geom_density(adjust = 1.5) +
  scale_x_continuous(limits = c(5,25), breaks = seq(6,24,6)) +
  scale_fill_manual(values = c("#4E89AE", "#ED6663")) +
  facet_grid(week ~ wday) +
  labs(title = paste0("'22.5월 ", subway2 %>% pull(yeogmyeong) %>% head(1), "역 유동인구 시간별 추이"),
       caption = "twitter @sourcebox7") +
  theme_minimal(base_family = "AppleSDGothicNeo-Bold", base_size = 8) +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        legend.position = "none",
        panel.grid.major.y = element_line(colour = "gray80"),
        axis.title = element_blank(),
        plot.title = element_text(margin = margin(0,0,.5,0, "cm"),
                                  hjust = -.09),
        plot.margin = margin(.7,1,.7,1,"cm"),
        plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA")) 


ggsave(paste0("./test/ggplot/save_ggplot_bar_02_facet.png"),
       width = 6, height = 4, dpi = 320, units = "in")
