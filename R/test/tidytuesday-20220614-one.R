# Either ISO-8601 date or year/week works!

library(tidyverse)
# tuesdata <- tidytuesdayR::tt_load('2022-06-14')
# tuesdata <- tidytuesdayR::tt_load(2022, week = 24)
# drought <- tuesdata$drought
drought <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-06-14/drought.csv')
drought_fips <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-06-14/drought-fips.csv')



################################################
drought_fips1 = drought_fips %>% 
  janitor::clean_names() %>%  
  mutate(year = substr(date, 0,4)) %>% 
  group_by(state, year) %>% 
  summarise(dsci = max(dsci), .groups = "drop") 
# drought_fips1
# drought_fips1 %>% 
#   add_row(state = "CA", year = "1999", dsci = 100, .before = 1)


drought_fips1_ca = drought_fips1 %>% 
  filter(state == "CA") %>% 
  add_row(state = "CA", year = "1999", dsci = 102, .before = 1) %>% 
  add_row(state = "CA", year = "2023", dsci = 487) %>% 
  mutate(id = row_number())


# drought_fips1_ca %>% print(n = Inf)
n_x_size = 50
xgrid = with(drought_fips1_ca, 
             seq(min(id), max(id), length = (length(id) - 1) * 50 + 1))

approx_year = with(drought_fips1_ca, approx(id, year, xgrid))
approx_dsci = with(drought_fips1_ca, approx(id, dsci, xgrid))

drought_fips2_ca_x = tibble(id = floor(approx_year$x), year2 = approx_year$y, dsci2 = approx_dsci$y) %>% 
  left_join(drought_fips1_ca, by = "id") %>% 
  select(state, year2, dsci2)

drought_fips2_ca_x 

n_divide = 1

drought_fips2_ca_x_y = drought_fips2_ca_x %>% 
  mutate(b = dsci2 %/% n_divide) %>%
  mutate(b1 = dsci2 - b * n_divide) %>%
  mutate(e = map2(n_divide, b, rep)) %>% 
  unnest_longer(e) %>% 
  select(year2, e) %>% 
  group_by(year2) %>% 
  mutate(f = cumsum(e))

# drought_fips2_ca_x_point = drought_fips2_ca_x %>% 
#   head(-5) %>% 
#   tail(-5)
# drought_fips2_ca_x %>% tail(5)
# drought_fips2_ca_x_point %>% tail(5)
ggplot(drought_fips2_ca_x, aes(x = year2, y = dsci2)) +
  # geom_col(data = drought_fips2_ca_x_y, aes(x = year2, y = e, fill = f), width = 0.02) +
  geom_line(aes(colour = dsci2), size = 2) +
  geom_point(aes(colour = dsci2), size = 1) +
  scale_x_continuous(limits = c(2000, 2022), breaks = c(2000, 2022),
                     expand = c(0.0,0.0)) +
  scale_y_continuous(limits = c(100, 520), expand = c(0,0)) +
  # scale_colour_manual(breaks = c(0,500), values = c(0,500)) +
  # coord_cartesian(xlim = c(2000, 2022), expand = F) +
  # scale_fill_gradient(low = "yellow", high = "red", na.value = NA, limits = c(0,500)) +
  scale_colour_gradient(low = "yellow", high = "red", na.value = NA, 
                        limits = c(0,500), breaks = c(0, 500)) + # limits = c(0,500), breaks = c(0,500)
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold") +
  labs(title = "Drought Conditions of California") +
  theme(plot.margin = margin(1,1,1,1,"cm"),
        plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6 F1F0EA
        plot.title = element_text(margin = margin(0,0,.5,0, "cm")),
        axis.line.x = element_line(size = .5, colour = "gray30"),
        axis.ticks.x = element_line(size = .5),
        axis.ticks.length.x = unit(3, "mm"),
        axis.text.x = element_text(margin = margin(5,0,0,0,"mm")),
        legend.title = element_blank(),
        legend.margin = margin(0,0,0,1, "cm"))



ggsave(paste0("./test/ggplot/tidytuesday_20220614_line-3.png"), 
       width = 8, height = 4, dpi = 320, units = "in")

###############################################

drought_fips2


drought_fips2 %>% 
  mutate(year3 = lead(year2, n = 1)) %>% 
  mutate(pos = year3 - year2) %>% 
  print(n = 1200)
drought_fips2_f = drought_fips2 %>% 
  mutate(year3 = lead(year2, n = 1)) %>% 
  mutate(pos = year3 - year2) %>% 
  filter(pos >= 0, state == "AK")
drought_fips2_f
ggplot(drought_fips2_f, aes(x = year2, y = dsci2, group = 1, colour = dsci2))+
  geom_line(size = 0.7) +
  geom_point(size = 0.05) +
  geom_area() +
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


ggsave(paste0("./test/ggplot/tidytuesday_20220614_one.png"), 
       width = 6, height = 4, dpi = 320, units = "in")

#############################################

drought_fips2_f

tibble(x = c(1,2,3,1,2,2), 
       y = c(1,1,1,1,1,1)) %>% 
  group_by(x) %>% 
  mutate(z = cumsum(y)) %>% 
  ggplot(aes(x,y, fill = z)) +
  geom_col() +
  scale_fill_gradient(low = "yellow", high = "red", na.value = NA)


tibble(x = sample(1:100, 10000, replace = T), 
       y = rep(1, 10000)) %>% 
  group_by(x) %>% 
  mutate(z = cumsum(y)) %>% 
  ggplot(aes(x,y, fill = z)) +
  geom_col(width = 1) +
  scale_fill_gradient(low = "yellow", high = "red", na.value = NA)


tibble(x = rep(c(1,2,3), 100), y = rep(c(1,1,1), 100), z = rep(1:100, each = 3)) %>% 
  ggplot(aes(x,y, fill = z)) +
  geom_col() +
  scale_fill_gradient(low = "yellow", high = "red", na.value = NA)


##############################################
tb_0 = tibble(x = c("A", "B", "C", "A", "B", "C", "A", "B", "C"),
       y = c(1,1,1,1,1,1,1,1,1),
       z = c(1,1,1,2,2,2,3,3,3))
tb_0
ggplot(tb_0, aes(x = x, y = y, fill = z)) +
  geom_col(width = 0.7) +
  scale_fill_gradient(low = "yellow", high = "red", na.value = NA) + 
  theme_minimal()

ggsave(paste0("./test/ggplot/tidytuesday_20220614_one_0.png"), 
       width = 6, height = 4, dpi = 320, units = "in")
##############################################

tb_n = 1
  
tb = tibble(x = c("A", "B", "C"), y = c(7.1,4.2,9)) %>% 
  mutate(b = y %/% tb_n) %>%
  mutate(b1 = y - b * tb_n) %>%
  mutate(d = map2(tb_n, b, rep)) %>% 
  mutate(e = map2(d,b1,append)) %>% 
  unnest_longer(e) %>% 
  select(x, e) %>% 
  group_by(x) %>% 
  mutate(f = cumsum(e)) %>% 
  ungroup()
tb

ggplot(tb, aes(x = x, y = e, fill = f)) +
  geom_col(width = 0.7) +
  scale_fill_gradient(low = "yellow", high = "red", na.value = NA) + 
  theme_minimal()


ggsave(paste0("./test/ggplot/tidytuesday_20220614_one_1.png"), 
       width = 6, height = 4, dpi = 320, units = "in")


##############################################



tb_n = 0.01

tb = tibble(x = c("A", "B", "C"), y = c(7.1,4.2,9)) %>% 
  mutate(b = y %/% tb_n) %>%
  mutate(b1 = y - b * tb_n) %>%
  mutate(d = map2(tb_n, b, rep)) %>% 
  mutate(e = map2(d,b1,append)) %>% 
  unnest_longer(e) %>% 
  select(x, e) %>% 
  group_by(x) %>% 
  mutate(f = cumsum(e)) %>% 
  ungroup()

ggplot(tb, aes(x = x, y = e, fill = f)) +
  geom_col(width = 0.7) +
  scale_y_continuous(expand = expansion(c(0,0.05))) +
  scale_fill_gradient(low = "#A0D995", high = "#4CACBC", na.value = NA) + 
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold") +
  theme(plot.margin = margin(1,1,1,1,"cm"),
        plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6 F1F0EA
        axis.line.x = element_line(size = .5, colour = "gray30"),
        axis.text.x = element_text(margin = margin(5,0,0,0,"mm")),
        legend.title = element_blank()
        )

ggsave(paste0("./test/ggplot/tidytuesday_20220614_one_f.png"), 
       width = 6, height = 4, dpi = 320, units = "in")

##############################################

max(drought_fips2_ak_f$dsci)
drought_fips2_ak_ff = drought_fips2_ak_f %>% 
  select(year2, dsci2) %>% 
  mutate(b = dsci2 %/% 1) %>%
  mutate(b1 = dsci2 - b * 1) %>%
  mutate(d = map2(1, b, rep)) %>% 
  mutate(e = map2(d,b1,append)) %>% 
  unnest_longer(e) %>% 
  select(year2, e) %>% 
  group_by(year2) %>% 
  mutate(f = cumsum(e))
drought_fips2_ak_ff
ggplot(drought_fips2_ak_ff, aes(x = year2, y = e, fill = f)) +
  geom_col(width = 0.02) +
  coord_cartesian(ylim = c(100, 380)) +
  scale_fill_gradient(low = "yellow", high = "red", na.value = NA) +
  theme_void()


##############################################

drought_fips2
drought_fips2_ff = drought_fips2 %>% 
  select(year2, dsci2, state) %>% 
  mutate(b = dsci2 %/% 10) %>%
  mutate(b1 = dsci2 - b * 10) %>%
  mutate(d = map2(10, b, rep)) %>% 
  mutate(e = map2(d,b1,append)) %>% 
  unnest_longer(e) %>% 
  select(state, year2, e) %>% 
  group_by(year2, state) %>% 
  mutate(f = cumsum(e))

drought_fips2_ff
ggplot(drought_fips2_ff, aes(x = year2, y = e, fill = f)) +
  geom_col(width = 0.02) +
  coord_cartesian(ylim = c(100, 380)) +
  facet_wrap( ~ state) +
  scale_fill_gradient(low = "yellow", high = "red", na.value = NA) +
  theme_void()

