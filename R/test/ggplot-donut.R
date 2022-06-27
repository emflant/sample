library(tidyverse)

v_title_size = 17
v_text_size = 11

ggplot(mtcars, aes(x = 1, fill = factor(cyl))) +
  geom_bar() +
  coord_polar(theta = "y", start = 0 * pi / 180) +
  xlim(c(-4, 1.5)) +
  theme_minimal(base_family = "Apple SD Gothic Neo") + 
  labs(fill = "Number of cylinders", title = "Motor Trend Car Road Tests") +
  theme(axis.text.y = element_blank(),
        axis.text.x = element_text(size = v_text_size),
        legend.text = element_text(size = v_text_size),
        legend.title = element_text(size = v_text_size), 
        legend.position = "bottom",
        legend.margin = margin(-.7,0,0.3,5, unit = "cm"),
        legend.key.size = unit(.5, "cm"),
        plot.title = element_text(size = v_title_size, hjust = 0.5,
                                  margin = margin(.7, 0, 0.3, 0, unit = "cm")),
        axis.title.x = element_blank(),
        axis.title.y = element_blank()) +
  scale_fill_brewer(palette = "PuRd")

ggsave("./test/ggplot/save_ggplot_donut.png", width = 6, height = 4, dpi = 320, units = "in",
       bg = "white")