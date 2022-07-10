library(tidyverse)
library(patchwork)
rent <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-07-05/rent.csv')


rent_sanfrancisco1 = rent %>% filter(city == 'san francisco') %>% select(year) 
rent_sanfrancisco1
# scale_fill_gradient(low = "#FAD9A1", high = "#F37878" )

# ggplot(rent_sanfrancisco1) +
#   geom_histogram(aes(year), binwidth = 1, show.legend = F) +
#   theme_minimal()
# ggplot(rent_sanfrancisco1) +
#   geom_histogram(aes(x = year, y = ..count..), binwidth = 1, show.legend = F) +
#   theme_minimal()
# 
# ggplot(rent_sanfrancisco1) +
#   geom_histogram(aes(x = year, fill = ..count..), binwidth = 1, show.legend = F) +
#   theme_minimal()

# ggplot(rent_sanfrancisco1) +
#   geom_histogram(aes(year, fill = ..count..), binwidth = 1, show.legend = F, colour = "gray100") +
#   scale_fill_gradient(low = "#9FE8FA", high = "#26BAEE" ) +
#   theme_minimal()
# 
# ggplot(rent_sanfrancisco1) +
#   geom_histogram(aes(year, y = ..density.., fill = ..density..), binwidth = 1, show.legend = F) +
#   scale_fill_gradient(low = "#9FE8FA", high = "#26BAEE" ) +
#   theme_minimal()


ggplot(rent_sanfrancisco1) +
  geom_histogram(aes(year, fill = ..count..), 
                 binwidth = 1, show.legend = F,) +
  stat_bin(geom = "text", aes(year, label = ifelse(..count.. == max(..count..), ..count.., "")),
           binwidth = 1, colour = "#73A9AD", vjust = -0.5,
           family = "AppleSDGothicNeo-ExtraBold", size = 5) +
  # stat_bin(geom = "text", aes(year),
  #          binwidth = 5,
  #          label = c(NA,2,3,NA,5),
  #          colour = "#73A9AD",
  #          vjust = -0.5) +
  # scale_color_manual(values = c(NULL,"#73A9AD")) +
  # scale_fill_gradient(low = "#9FE8FA", high = "#26BAEE" ) +
  scale_fill_gradient(low = "#C4DFAA", high = "#73A9AD" ) +
  # scale_x_continuous(breaks = c(2000, 2004, 2018)) +
  scale_y_continuous(expand = expansion(c(0, 0.15))) +
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 13) +
  # labs(x = "") +
  # annotate(geom = "text", x = 2004, y = max(..density..), label = "19,654건",
  #          size = 4.5, vjust = -.7,
  #          family = "AppleSDGothicNeo-ExtraBold") +
  theme(
    legend.position = "none",
    axis.text.x = element_text(margin = margin(0.2,0,0,0,"cm"), size = 10),
    plot.margin = margin(0.5,1,1,1,"cm"),
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6
    # axis.title.x = element_text(margin = margin(1,0,0,0,"cm"), )
  )

ggplot(rent_sanfrancisco1) +
  geom_histogram(aes(year, fill = ..count..), 
                 binwidth = 5,
                 # bins = in_binwidth,
                 show.legend = F) +
  stat_bin(geom = "text", aes(year, label = ifelse(..count.. == max(..count..), 
                                                   formatC(..count.., format="f", big.mark=",", digits = 0), "")),
           binwidth = 5, colour = "gray30", vjust = -0.5,
           family = "AppleSDGothicNeo-ExtraBold", size = 6) +
  scale_fill_gradient(low = "#C4DFAA", high = "#73A9AD" ) +
  scale_y_continuous(expand = expansion(c(0, 0.25))) +
  labs(title = paste0("* binwidth = ",in_binwidth)) +
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 12) +
  theme(
    legend.position = "none",
    axis.text.x = element_text(margin = margin(0.2,0,0,0,"cm"), size = 12, colour = "gray30"),
    plot.margin = margin(1,1,1,1,"cm"),
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA")
  )

g_histogram = function(in_binwidth) {
  ggplot(rent_sanfrancisco1) +
    geom_histogram(aes(year, fill = ..count..), 
                   binwidth = in_binwidth,
                   show.legend = F) +
    stat_bin(geom = "text", aes(year, label = ifelse(..count.. == max(..count..), 
                                                     formatC(..count.., format="f", big.mark=",", digits = 0), "")),
             binwidth = in_binwidth, colour = "gray30", vjust = -0.5,
             family = "AppleSDGothicNeo-ExtraBold", size = 6) +
    scale_fill_gradient(low = "#C4DFAA", high = "#73A9AD" ) +
    scale_y_continuous(expand = expansion(c(0, 0.25))) +
    labs(title = paste0("* binwidth = ",in_binwidth)) +
    theme_void(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 12) +
    theme(
      legend.position = "none",
      axis.text.x = element_text(margin = margin(0.2,0,0,0,"cm"), size = 12, colour = "gray30"),
      plot.margin = margin(1,1,1,1,"cm"),
      plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA")
    )
}

# g_histogram(.3)
# ggsave(paste0("./test/ggplot/save_ggplot_histogram_1_3.png"),
#        width = 6, height = 4, dpi = 320, units = "in")

g_histogram(.5) + 
  g_histogram(1) + 
  g_histogram(2) +
  g_histogram(5) +
  g_histogram(10) +
  g_histogram(20) +
  plot_layout(ncol = 3) &
  theme(plot.background = element_rect(fill = "#F1F0EA"))

ggsave(paste0("./test/ggplot/save_ggplot_histogram_1_union.png"), 
       width = 12, height = 8, dpi = 320, units = "in")

#############################################

rent_sanfrancisco2 = rent_sanfrancisco1 %>% 
  add_row(year = 2019)

ggplot(rent_sanfrancisco1, aes(year)) +
  geom_density(n = 1024, colour = "#73A9AD", fill = "#73A9AD", 
               alpha = 0.5, size = 1,
               adjust = 1) +
  # scale_x_continuous(limits = c(1995, 2023)) +
  theme_minimal()


ggplot(rent_sanfrancisco1, aes(year)) +
  geom_density(aes(year, ..count..), n = 1024, colour = "#73A9AD", fill = "#73A9AD", 
               # alpha = 0.3, 
               adjust = 2) +
  scale_x_continuous(limits = c(1998, 2021)) +
  theme_minimal()

g_density = function(in_adjust){
  ggplot(rent_sanfrancisco1, aes(year)) +
    geom_density(aes(year, ..count..), n = 1024, colour = "#73A9AD", fill = "#73A9AD", 
                 # alpha = 0.3, 
                 adjust = in_adjust) +
    scale_x_continuous(limits = c(1998, 2021)) +
    theme_minimal()
}



ggplot(rent_sanfrancisco2, aes(year)) +
  # geom_density() +
  stat_density(n = 1024) +
  theme_minimal()

rent1 = rent %>% 
  filter(city == 'san francisco') %>% 
  select(date)


ggplot(rent1, aes(date, fill = date > 0)) +
  geom_density(colour = NA) +
  theme_bw()

rent
ggplot(rent, aes(year)) +
  geom_density() +
  theme_bw()

rent %>% filter(year == 2007)
rent %>% filter(city == 'san francisco') %>% 
  distinct(year) %>% nrow()

rent_sanfrancisco1 = rent %>% filter(city == 'san francisco')

rent_sanfrancisco2 = rent %>% filter(city == 'san francisco') %>% 
  group_by(year) %>% 
  summarise(cnt = n()) %>% 
  print()

pull(rent_sanfrancisco2, cnt)
rent_sanfrancisco1

ggplot(rent_sanfrancisco1) +
  geom_histogram(aes(year, fill = ..count..), binwidth = 1, show.legend = F) +
  theme_minimal()

ggplot(rent_sanfrancisco1) +
  geom_density(aes(year, y = ..density..)) +
  theme_minimal()


ggplot(rent_sanfrancisco1, aes(x = year)) +
  geom_histogram(aes(y = ..density.., fill = ..count..), binwidth = 1, show.legend = F) +
  geom_density(show.legend = F) 
