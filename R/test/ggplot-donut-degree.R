library(tidyverse)
library(patchwork)

my_chart = function(v_start){
  v_text_size = 8
  v_title_size = 10
  ggplot(mtcars, aes(x = 1, fill = factor(cyl))) +
    geom_bar() +
    coord_polar(theta = "y", start = v_start * pi / 180) +
    xlim(c(-5, 1.5)) +
    scale_fill_brewer(palette = "Purples", type = "seq") + # Purples
    theme_minimal(base_family = "Monaco") +
    labs(title = paste0("start = ", v_start, " * pi / 180")) + 
    theme(axis.title.x = element_blank(),
          axis.text.x = element_text(size = v_text_size),
          axis.text.y = element_blank(),
          axis.title.y = element_blank(),
          legend.position = "none",
          plot.title = element_text(size = v_title_size, hjust = 0.5,
                                    margin = margin(0.3, 0, 0.3, 0, unit = "cm")))
}

g1 = my_chart(0)
g2 = my_chart(90)
g3 = my_chart(180)
g4 = my_chart(270)

g1 + g2 + g3 + g4 +
  plot_layout(ncol = 2)


ggsave("./test/ggplot/save_ggplot_donut_degree.png", width = 6, height = 6, dpi = 320, bg = "white")
