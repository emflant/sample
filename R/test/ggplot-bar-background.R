library(tidyverse)

set.seed(3)
tb = tibble(y = sample(30:100, 8)) %>% 
  arrange(y) %>% 
  mutate(x = rep(1:4, each = 2), z = rep(c("1", "2"), 4))

ggplot(tb, aes(x, y, fill = z)) + 
  geom_col(position = "dodge", width = 0.7) + 
  scale_fill_manual(values = c("#365384", "#A8CBDC"), 
                    breaks = c("2", "1"),
                    labels = c("A타입", "B타입")) +
  coord_flip() +
  scale_x_continuous(breaks = 4:1,
                     labels = c('가', '나', '다', '라'))+
  theme_minimal(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 13) + #BMDoHyeon-OTF
  theme(
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6
    axis.title = element_blank(),
    axis.text.y = element_text(size = 14),
    plot.margin = margin(2,1.5,0.8,1, unit = "cm"),
    legend.position = c(0.88, 1.12),
    legend.direction = "horizontal",
    legend.title = element_blank(),
    legend.text = element_text(family = "AppleSDGothicNeo-SemiBold",
                               margin = margin(0,3,0,-1, unit = "mm")),
    legend.key.width = unit(1, "cm"),
    panel.grid = element_blank(),
    panel.grid.major.x = element_line(colour = c("#bdbdbd"), size = 0.3)
  )
  

ggsave(paste0("./test/ggplot/save_ggplot_bar_background.png"), 
       width = 6, height = 4, dpi = 320, units = "in")
