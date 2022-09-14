rent <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-07-05/rent.csv')
  

rent %>% distinct(city) %>% print(n = 300)
rent_berkeley = rent %>% 
  filter(city == 'marin') %>% 
  group_by(year) %>% 
  summarise(count = n()) %>% 
  arrange(year)

rent_berkeley

# ggplot(rent_sanfrancisco, aes(year, count, fill = count)) +
#   geom_col() +
#   theme(legend.position = "none")
# 
# ggplot(rent_sanfrancisco, aes(year, count, fill = count)) +
#   geom_col() +
#   annotate(geom = "text", x = 2004, y = 19654, label =19654, 
#            size = 4.5, vjust = -.7) +
#   scale_x_continuous(breaks = c(2000, 2004, 2018)) +
#   scale_y_continuous(limits = c(0, max(rent_sanfrancisco$count) * 1.1)) +
#   theme(legend.position = "none")

ggplot(rent_berkeley, aes(year, count, fill = count)) +
  geom_col() +
  scale_x_continuous(breaks = c(2000, 2012, 2018)) +
  scale_y_continuous(limits = c(0, max(rent_berkeley$count) * 1.2),
                     expand = expansion(c(0.00,0))) +
  # scale_fill_gradient(low = "#FFC4C4", high = "#A10035" ) +
  scale_fill_gradient(low = "#E8F9FD", high = "#0AA1DD" ) +
  # scale_fill_gradient(low = "#85F4FF", high = "#42C2FF" ) +
  # scale_fill_gradient(low = "#C8C6C6", high = "#4B6587" ) +
  # scale_fill_gradient(low = "#FAD9A1", high = "#F37878" ) +
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 13) +
  # labs(x = "") +
  annotate(geom = "text", x = 2004, y = 19654, label = "19,654건", 
           size = 4.5, vjust = -.7,
           family = "AppleSDGothicNeo-ExtraBold") +
  theme(
    legend.position = "none",
    # axis.line.x = element_line(colour = "#F9F9C5", size = .7), 
    # axis.title = element_blank(),
    axis.text.x = element_text(margin = margin(0.2,0,0,0,"cm"), size = 10),
    plot.margin = margin(0.5,1,1,1,"cm"),
    # plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6
    # axis.title.x = element_text(margin = margin(1,0,0,0,"cm"), )
  )


ggsave(paste0("./test/ggplot/save_ggplot_line_2.png"), 
       width = 6, height = 4, dpi = 320, units = "in")

