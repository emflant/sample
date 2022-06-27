poll <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-05-31/poll.csv')
reputation <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-05-31/reputation.csv')

poll = poll %>% janitor::clean_names()

poll_industry = poll %>% 
  filter(year == 2021) %>% 
  group_by(industry) %>% 
  summarise(n_total = sum(replace_na(change,0))) %>% 
  filter(n_total != 0) %>% 
  mutate(pos = n_total >= 0) %>% 
  mutate(hjust = ifelse(pos, -0.7, 1.5)) 

# poll_industry
ggplot(poll_industry, aes(reorder(industry, n_total), n_total, fill = pos)) +
  geom_col() +
  geom_text(aes(x = industry, y = n_total, label = n_total), 
            hjust = poll_industry$hjust, colour = "gray30", size = 4) +
  coord_flip() +
  scale_y_continuous(limits = c(-100, 140)) 

ggplot(poll_industry, aes(reorder(industry, n_total), n_total, fill = pos)) +
  geom_col() +
  geom_text(aes(x = industry, y = n_total, label = n_total), 
            hjust = poll_industry$hjust, colour = "gray30", size = 4,
            family = "AppleSDGothicNeo-ExtraBold") +
  coord_flip() +
  scale_y_continuous(limits = c(-100, 140)) +
  scale_fill_manual(values = c("#ED6663", "#4E89AE")) +
  theme_void(base_family = "AppleSDGothicNeo-Bold") +
  theme(
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), 
    plot.margin = margin(1,1,1,1, "cm"),
    legend.position = "none",
    axis.text.y = element_text(hjust = 1, colour = "gray30")
  )

ggsave(paste0("./test/ggplot/tidytuesday_20220531.png"), 
       width = 6, height = 6, dpi = 320, units = "in")
