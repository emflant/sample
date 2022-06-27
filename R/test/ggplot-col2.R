library(tidyverse)
# scale_fill_brewer(palette = "PuRd")

tb = tibble(x = 1:5, 
            y = sample(200:300, 5), 
            l = c("서울", "경기", "강원", "충청", "제주")) 

ggplot(tb, aes(x, y)) + 
  geom_col(width = 0.6, fill = "#fec44f") +
  geom_text(aes(x = x, y = y, label = y), vjust = -0.7, family = "BMDoHyeon-OTF") + 
  scale_y_continuous(expand = expansion(mult = 0), limits = c(0, max(tb$y) * 1.2)) +
  scale_x_continuous(breaks = tb$x, labels = tb$l) +
  theme_void(base_family = "BMDoHyeon-OTF") +
  theme(
    axis.line.x = element_line(size = 1.2), 
    axis.text.x = element_text(margin = margin(.3,0,0,0, "cm"), size = 13),
    plot.margin = margin(.3,1,.7,1, "cm"),
    legend.position = "none") 

ggsave("./test/ggplot/save_ggplot_col2.png", width = 6, height = 4, dpi = 320, units = "in",
       bg = "white")
