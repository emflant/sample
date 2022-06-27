library(tidyverse)

color_test = function(bar_colors, bg_color = "white", ft_color = "black"){
  set.seed(3)
  tb = tibble(y = sample(30:100, 8)) %>% 
    arrange(y) %>% 
    mutate(x = rep(1:4, each = 2), z = rep(c("1", "2"), 4))
  
  ggplot(tb, aes(x, y, fill = z)) + 
    geom_col(position = position_dodge(), width = 0.7) + 
    scale_fill_manual(
      values = bar_colors,
      breaks = c("2", "1"),
      labels = c("A타입", "B타입")) +
    coord_flip() +
    scale_x_continuous(breaks = 4:1,
                       labels = c('가', '나', '다', '라'))+
    theme_minimal(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 13) + #BMDoHyeon-OTF
    theme(
      plot.background = element_rect(fill = bg_color, color = bg_color), ##FBF1E6
      axis.title = element_blank(),
      axis.text.x = element_text(color = ft_color),
      axis.text.y = element_text(size = 14, color = ft_color),
      plot.margin = margin(2,1.5,0.8,1, unit = "cm"),
      legend.position = c(0.88, 1.12),
      legend.direction = "horizontal",
      legend.title = element_blank(),
      legend.text = element_text(family = "AppleSDGothicNeo-SemiBold", colour = ft_color,
                                 margin = margin(0,3,0,-1, unit = "mm")),
      legend.key.width = unit(1, "cm"),
      panel.grid = element_blank(),
      panel.grid.major.x = element_line(colour = c("gray90"), size = 0.3)
    ) 
}

color_test(c("#92B4EC", "#FFE69A"))
color_test(c("#ECB390", "#94B49F"))
color_test(c("#8CC0DE", "#F4BFBF"))
color_test(c("#3BACB6", "#B3E8E5"), ft_color = "gray30")
color_test(c("#3BACB6", "#B3E8E5"), "gray20", "white")


 
ggsave(paste0("./test/ggplot/save_ggplot_color_01.png"), 
       width = 6, height = 4, dpi = 320, units = "in")
