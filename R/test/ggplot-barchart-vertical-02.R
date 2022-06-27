
library(tidyverse)
# scale_fill_brewer


# a = factor(1:7, labels = )

font_size = function(value){
  if(value > 30){
    5
  } else if(value > 20){
    4
  } else {
    3
  }
}


tb = tibble(
  x = rep(1:7, 2),
  y = c(c(41, 26, 26, 24, 23, 19, 16), c(3, 9, 8,8, 12, 15, 18)),
  z = rep(factor(1:2, labels = c("Under 15 Years", "Over 65 Years")), each = 7)
) %>% 
  mutate(s = map_dbl(y, font_size))
tb %>% head

ggplot(tb, aes(x,y, fill = z)) +
  geom_text(aes(x = x, y = y, label = paste0(y, "%"), color = z), 
            vjust = -0.7, 
            position = position_dodge(width = 0.5),
            family = "AppleSDGothicNeo-ExtraBold",
            size = tb$s) +
  geom_col(position = position_dodge(0.5), width = 0.3)  +
  scale_x_continuous(breaks = 1:7, 
                     labels = c("AFRICA", "WORLD", "LATIN", "ASIA", "OCEANIA", "NORTH\nAMERICA", "EUROPE")) +
  scale_y_continuous(breaks = seq(10,50,10), limits = c(0,50),
                     labels = paste0(seq(10,50,10), "%"),
                     expand = expansion(c(0,0.05)))

ggplot(tb, aes(x,y, fill = z)) +
  geom_text(aes(x = x, y = y, label = paste0(y, "%"), color = z), 
            vjust = -0.8, 
            position = position_dodge(width = 0.6),
            family = "AppleSDGothicNeo-ExtraBold",
            size = tb$s) +
  geom_col(position = position_dodge(0.6), width = 0.3) +
  scale_x_continuous(breaks = 1:7, 
                     labels = c("AFRICA", "WORLD", "LATIN", "ASIA", "OCEANIA", "NORTH\nAMERICA", "EUROPE")) +
  scale_y_continuous(breaks = seq(10,50,10), limits = c(0,50),
                     labels = paste0(seq(10,50,10), "%"),
                     expand = expansion(c(0,0.05))) +
  scale_fill_manual(values = c("#ACD848", "#000000")) +
  scale_color_manual(values = c("#ACD848", "#000000")) +
  labs(title = "SELECT AGE GROUPS",
       subtitle = "by continent") +
  theme_minimal(base_family = "AppleSDGothicNeo-Medium", base_size = 13) + 
  theme(
    plot.background = element_rect(fill = "#f5f5f5", color = "#f5f5f5"), ##FBF1E6 F1F0EA
    plot.margin = margin(1,1,1,1, "cm"),
    plot.title = element_text(family = "AppleSDGothicNeo-Bold",
                              hjust = 0.5, size = 13),
    plot.subtitle = element_text(hjust = 0.5, size = 10, colour = "#A9A9A9"),
    axis.title = element_blank(),
    legend.title = element_blank(),
    legend.text = element_text(size = 8),
    legend.key.size = unit(3, "mm"),
    legend.position = c(0.8,0.85),
    legend.direction = "horizontal",
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(colour = "#d9d9d9", size = 0.3),  #ECECEC
    axis.line.x = element_line(colour = "#505050"),
    axis.text.x = element_text(size = 8,
                               family = "AppleSDGothicNeo-Heavy",
                               margin = margin(2,0,0,0, "mm")),
    axis.text.y = element_text(colour = "#AEAEAE", size = 8)
  )

ggsave(paste0("./test/ggplot/save_ggplot_barchart_vertical_02.png"), 
       width = 6, height = 4, dpi = 320, units = "in")

