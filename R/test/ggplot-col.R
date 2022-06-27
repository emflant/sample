library(tidyverse)

# install.packages("extrafont")
# library(extrafont)
# font_import()

sample(seq(5,25, 5))
tb = tibble(x = 1:5, 
            y = c(10,15,5,25,20), 
            l = c("가", "나", "다", "라", "마")) %>% 
  mutate(z = max(y) == y)

# tb

ggplot(tb, aes(x, y, fill = factor(z))) + 
  geom_col(width = 0.6) +
  coord_cartesian(xlim = c(.7,5.3), clip = "off") +
  scale_x_continuous(breaks = tb$x, labels = tb$l) +
  scale_y_continuous(expand = expansion(mult = 0), breaks = seq(0,25,5)) + 
  theme_void(base_family = "AppleSDGothicNeo-Regular") +
  theme(
    axis.line.x = element_line(size = 1.2), 
    axis.text.x = element_text(margin = margin(.3,0,0,0, "cm"), size = 15,
                               family = "AppleSDGothicNeo-ExtraBold"),
    axis.text.y = element_text(margin = margin(0,.3,0,0, "cm"), size = 12),
    panel.grid.major.y = element_line(size = 0.3, colour = "grey"),
    plot.title = element_text(margin = margin(0,0,0.7,0,"cm"), hjust = -0.09),
    plot.margin = margin(1,1,.7,1, "cm"),
    legend.position = "none"
  ) + 
  annotate("text", x = 0.16, y = 28, label = "(단위)",
           family = "AppleSDGothicNeo-Regular", size = 3.7) +
  scale_fill_manual(values = c("#7bccc4", "#2b8cbe"))

# ggsave("~/Downloads/result.png", bg = "white")
ggsave("./test/ggplot/save_ggplot_col.png", width = 6, height = 4, dpi = 320, units = "in",
       bg = "white")
# scale_fill_brewer(palette = "PuRd")