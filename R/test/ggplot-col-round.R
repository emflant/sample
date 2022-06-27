library(tidyverse)

# install.packages("extrafont")
# library(extrafont)
# font_import()

sample(200:240, 5)

sample(seq(5,25, 5))
tb = tibble(x = 1:5, 
            y = sample(200:240, 5), 
            l = c("서울", "경기", "강원", "충청", "제주")) 

tb
ggplot(tb, aes(x, y)) +
  geom_col(width = 0.6)

ggplot(tb, aes(x, y)) + 
  theme_void(base_family = "AppleSDGothicNeo-Regular") +
  # geom_chicklet(radius = grid::unit(15, 'mm')) +
  geom_col(width = 0.6, fill = "#fec44f") +
  geom_text(aes(y = y, label = y), vjust = -0.7, family = "BMDoHyeon-OTF") + 
  coord_cartesian(xlim = c(.7,5.3), clip = "off") +
  scale_x_continuous(breaks = tb$x, labels = tb$l) +
  scale_y_continuous(expand = expansion(mult = 0)) + 
  
  theme(
    axis.line.x = element_line(size = 1.2), 
    axis.text.x = element_text(margin = margin(.3,0,0,0, "cm"), size = 13,
                               family = "BMDoHyeon-OTF"),
    # axis.text.y = element_text(margin = margin(0,.3,0,0, "cm"), size = 12),
    # panel.grid.major.y = element_line(size = 0.3, colour = "grey"),
    plot.title = element_text(margin = margin(0,0,0.7,0,"cm"), hjust = -0.09),
    plot.margin = margin(1,1,.7,1, "cm"),
    legend.position = "none"
  ) 

# ggsave("~/Downloads/result.png", bg = "white")
ggsave("./test/ggplot/save_ggplot_col_round.png", width = 6, height = 4, dpi = 320, units = "in",
       bg = "white")
scale_fill_brewer(palette = "PuRd")
