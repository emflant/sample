
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
  filter(yeogmyeong == '건대입구', gubun == '하차') %>% 
  mutate(date = ymd(naljja), .before = "naljja") %>% 
  mutate(wday = wday(date, label = T), .after = "date") %>% 
  mutate(ym = as.character(naljja, format = "%Y-%m"), .after = "wday") %>% 
  # filter(wday != "Sun", wday != "Sat") %>% 
  left_join(holiday, by = "date", keep = T) %>% 
  group_by(ym, hoseon) %>% 
  mutate(cnt = n(), .after = "ym") %>% 
  ungroup() %>% 
  select(-naljja, -yeogbeonho, -yeonbeon)
subway2

subway3 = subway2 %>% 
  pivot_longer(cols = starts_with("x"), names_to = "times") %>% 
  group_by(yeogmyeong, ym, cnt, date.x, wday, date.y, gubun) %>% 
  summarise(total = sum(value), .groups = "drop") %>% 
  mutate(week = week(date.x), .after = "date.y")
subway3 %>% print(n = 35) 

subway3 %>% filter(week >= 12, week < 15) %>% print(n = Inf)
  
# v_date = subway3 %>% pull(naljja) %>% head(1)
ggplot(subway3, aes(date.x, total, group = 1)) +
  geom_line()


subway3_week = subway3 %>% 
  group_by(yeogmyeong, week) %>% 
  summarise(date = min(date.x), total = sum(total), .groups = "drop") %>% 
  head(-1)

subway3_week

ggplot(subway3_week, aes(date, total)) +
  geom_line() + 
  geom_smooth(method = lm, se = F) 

ggplot(subway3_week, aes(date, total)) +
  # geom_line(alpha = .5, colour = "red", size = 1) +
  geom_line(colour = "gray20", size = .7, alpha = .8) + 
  geom_smooth(method = lm, #method.args = list(degree = 2),
              se = T, formula = y ~ x, size = 1.2,
              colour = "#197163", fill = "#197163",
              alpha = 0.3) +
  scale_y_continuous(limits = c(200000, 450000), 
                     breaks = seq(200000, 450000, 50000), 
                     labels = as.character(seq(20, 45, 5))) +
  theme_minimal(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 13) +
  theme(plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"),
        panel.grid = element_blank(),
        panel.grid.major.y = element_line(colour = "gray80"),
        axis.title = element_blank(),
        plot.margin = margin(.7,1,.7,1,"cm"),)

################################################################
g_smooth = function(in_method, in_colour1, in_colour2){
  ggplot(subway3_week, aes(date, total)) +
    # geom_line(alpha = .5, colour = "red", size = 1) +
    geom_line(colour = "gray20", size = .7, alpha = .7) + 
    geom_smooth(method = in_method, #method.args = list(degree = 2),
                se = T, formula = y ~ x, size = 1, alpha = 0.5,
                # colour = "#0AA1DD", fill = "#79DAE8", # 43658B
                colour = in_colour1, fill = in_colour2) +
    scale_y_continuous(limits = c(200000, 450000), 
                       breaks = seq(200000, 450000, 50000), 
                       labels = as.character(seq(20, 45, 5))) +
    labs(title = paste0("method = ", in_method)) +
    theme_minimal(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 12) +
    theme(plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"),
          panel.grid = element_blank(),
          panel.grid.major.y = element_line(colour = "gray80"),
          axis.title = element_blank(),
          plot.margin = margin(.7,1,.7,1,"cm"),
          plot.title = element_text(size = 11))
}

g_smooth("lm","#1C658C", "#79DAE8") +
g_smooth("loess","#91091E", "#F37878") +
  plot_layout(ncol = 1) +
  plot_annotation(title = "[ggplot2 - geom_smooth]",
                  caption = "twitter @sourcebox7",
                  theme = theme(plot.background = element_rect(fill = "#F1F0EA", color = NA),
                                plot.title = element_text(family = "AppleSDGothicNeo-ExtraBold",
                                                          margin = margin(0.5,0,0,0,"cm")),
                                plot.caption = element_text(color = "gray30", 
                                                            family = "Menlo", 
                                                            hjust = 0.98, 
                                                            size = 8,
                                                            margin = margin(0,0,0.5,0,"cm"))))


ggsave(paste0("./test/ggplot/save_ggplot_subway_05.png"),
       width = 6, height = 6, dpi = 320, units = "in")

# ggplot(subway3_week, aes(date, total)) +
#   # geom_line(alpha = .5, colour = "red", size = 1) +
#   geom_line(colour = "#FD5F00", size = 1, alpha = .3) + 
#   geom_smooth(method = "loess", method.args = list(degree = 2),
#               se = T, formula = y ~ x, 
#               colour = "#005792", fill = "#005792",
#               alpha = 0.3) +
#   scale_y_continuous(limits = c(200000, 450000), 
#                      breaks = seq(200000, 450000, 50000), 
#                      labels = as.character(seq(20, 45, 5))) +
#   theme_minimal(base_family = "AppleSDGothicNeo-ExtraBold") +
#   theme(plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"),
#         panel.grid = element_blank(),
#         panel.grid.major.y = element_line(colour = "gray80"),
#         axis.title = element_blank(),
#         plot.margin = margin(.7,1,.7,1,"cm"),)


# spline()
# (z <- poly(1:10, 3))

