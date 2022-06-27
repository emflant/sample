# Either ISO-8601 date or year/week works!

library(tidyverse)
# tuesdata <- tidytuesdayR::tt_load('2022-06-14')
# tuesdata <- tidytuesdayR::tt_load(2022, week = 24)
# drought <- tuesdata$drought
drought <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-06-14/drought.csv')
drought_fips <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-06-14/drought-fips.csv')


# drought_fips = drought_fips %>% janitor::clean_names()

drought_fips1 = drought_fips %>% 
  janitor::clean_names() %>%  
  mutate(year = substr(date, 0,4)) %>% 
  group_by(state, year) %>% 
  summarise(dsci = max(dsci), .groups = "drop") 
drought_fips1
 


################################################
ggplot(drought_fips1, aes(x = year, y = dsci, group = 1))+
  geom_line() +
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold") +
  facet_wrap( ~ state) +
  theme(
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6 F1F0EA
    plot.margin = margin(1,1,1,1, "cm"),
    legend.position = "none"
  )


################################################
drought_fips1 = drought_fips1 %>% 
  mutate(id = row_number())
drought_fips1
xgrid = with(drought_fips1, 
             seq(min(id), max(id), length = (length(id) - 1) * 50 + 1))

approx_year = with(drought_fips1, approx(id, year, xgrid))
approx_dsci = with(drought_fips1, approx(id, dsci, xgrid))

drought_fips2 = tibble(id = floor(approx_year$x), year2 = approx_year$y, dsci2 = approx_dsci$y) %>% 
  left_join(drought_fips1, by = "id") 

drought_fips2


################################################
drought_fips2_ak = drought_fips2 %>% filter(state == "AK")


drought_fips2_ak %>% 
  mutate(year3 = lead(year2, n = 1)) %>% 
  mutate(pos = year3 - year2) %>% 
  print(n = Inf)
drought_fips2_ak_f = drought_fips2_ak %>% 
  mutate(year3 = lead(year2, n = 1)) %>% 
  mutate(pos = year3 - year2) %>% 
  filter(pos >= 0)

ggplot(drought_fips2_ak_f, aes(x = year2, y = dsci2, group = 1, colour = dsci2))+
  geom_line(size = 1) +
  # scale_colour_gradient(low = "yellow", high = "red", na.value = NA)+
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold") +
  theme(
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"),
    plot.margin = margin(1,1,1,1, "cm")
  )

ggsave(paste0("./test/ggplot/tidytuesday_20220614.png"), 
       width = 6, height = 4, dpi = 320, units = "in")

###############################################

drought_fips2


drought_fips2 %>% 
  mutate(year3 = lead(year2, n = 1)) %>% 
  mutate(pos = year3 - year2) %>% 
  print(n = 1200)
drought_fips2_f = drought_fips2 %>% 
  mutate(year3 = lead(year2, n = 1)) %>% 
  mutate(pos = year3 - year2) %>% 
  filter(pos >= 0)

ggplot(drought_fips2, aes(x = year2, y = dsci2, group = 1, colour = dsci2))+
  geom_line(size = 0.7) +
  geom_point(size = 0.4) +
  scale_colour_gradient(low = "yellow", high = "red", na.value = NA, 
                        breaks = c(0,500), name = "DSCI")+
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold") +
  facet_wrap( ~ state) +
  labs(title = "Drought Conditions in the US") + 
  theme(
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6 F1F0EA
    plot.margin = margin(1,1,1,1, "cm"),
    legend.box.margin = margin(0,0,1,1, "cm"),
    legend.key.size = unit(0.2, "cm"),
    legend.key.width = unit(0.4, "cm"),
    legend.position = c(0.81,-0.07),
    legend.title = element_text(size = 8, margin = margin(-0.3,0.1,0,0, "cm")),
    legend.direction = "horizontal",
    legend.text = element_text(size = 8, margin = margin(0,0,0,0,"cm")),
    plot.title = element_text(hjust = 0.5,
                              margin = margin(0,0,1,0, "cm")),
    panel.spacing.y = unit(1,"mm")
  )


ggsave(paste0("./test/ggplot/tidytuesday_20220614.png"), 
       width = 6, height = 4, dpi = 320, units = "in")
