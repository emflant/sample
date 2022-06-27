# Either ISO-8601 date or year/week works!

library(tidyverse)
# tuesdata <- tidytuesdayR::tt_load('2022-06-14')
# tuesdata <- tidytuesdayR::tt_load(2022, week = 24)
# drought <- tuesdata$drought
# drought <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-06-14/drought.csv')
drought_fips <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-06-14/drought-fips.csv')


# drought_fips = drought_fips %>% janitor::clean_names()
tidy_data_20221614 = function(drought_fips){
  drought_fips1 = drought_fips %>% 
    janitor::clean_names() %>%  
    mutate(year = substr(date, 0,4)) %>% 
    group_by(state, year) %>% 
    summarise(dsci = max(dsci), .groups = "drop") %>% 
    mutate(id = row_number()) 
  
  xgrid = with(drought_fips1, 
               seq(min(id), max(id), length = (length(id) - 1) * 50 + 1))
  
  approx_year = with(drought_fips1, approx(id, year, xgrid))
  approx_dsci = with(drought_fips1, approx(id, dsci, xgrid))
  
  tibble(id = floor(approx_year$x), 
                         year2 = approx_year$y, 
                         dsci2 = approx_dsci$y) %>% 
    left_join(drought_fips1, by = "id") %>% 
    mutate(year3 = lead(year2, n = 1)) %>% 
    mutate(pos = year3 - year2) %>% 
    filter(pos >= 0)
}

drought_fips2 = tidy_data_20221614(drought_fips)


ggplot(drought_fips2, aes(x = year2, y = dsci2, group = 1, colour = dsci2))+
  geom_line(size = 2) +
  geom_point(size = 1.5) +
  scale_colour_gradient(low = "yellow", high = "red", na.value = NA, 
                        breaks = c(0,500), name = "DSCI")+
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold") +
  facet_wrap( ~ state) +
  labs(title = "Drought Conditions in the US") + 
  theme(
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6 F1F0EA
    plot.margin = margin(2,2,2,2, "cm"),
    legend.box.margin = margin(0,0,1,1, "cm"),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(0.6, "cm"),
    legend.position = c(0.89,-0.0),
    legend.title = element_text(size = 18, colour = "gray30",
                                margin = margin(-0.3,0.1,0,0, "cm")),
    legend.direction = "horizontal",
    legend.text = element_text(size = 12, margin = margin(0,0,0,0,"cm")),
    plot.title = element_text(hjust = 0.5, size = 25,
                              margin = margin(0,0,1.5,0, "cm")),
    panel.spacing.y = unit(7,"mm"),
    strip.text.x = element_text(size = 18, colour = "gray30",
                                margin = margin(0,0,3,0, "mm"))
  )


ggsave(paste0("./test/ggplot/tidytuesday_20220614-big.png"), 
       width = 12, height = 12, dpi = 320, units = "in")
