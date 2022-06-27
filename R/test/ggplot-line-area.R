library(tidyverse)

set.seed(100)
tb = tibble(x = 0:40, y = runif(41, min = 0, max = x^2+10)) %>% 
  mutate(z = (cumsum(y) + 800) / 15)
tb
# 
# ggplot(tb, aes(x,z)) +
#   geom_line(size = 1)
# 
# ggplot(tb, aes(x,z)) +
#   geom_line(size = 1, color = "#b30000") +
#   geom_area(aes(x,z), fill = "#b30000", alpha = 0.5)

ggplot(tb, aes(x,z)) +
  geom_line(size = 1, color = "#b30000") +
  geom_area(aes(x,z), fill = "#b30000", alpha = 0.5) +
  scale_x_continuous(limits = c(0, 45), 
                     breaks = seq(0,40,10),
                     labels = c("2019", " 20 ", " 21 ", " 22 ", ""),
                     expand = expansion(0)) +
  scale_y_continuous(breaks = seq(0,1000,200), limits = c(0,1000),
                     position = "right", expand = expansion(c(0, 0.05))) + # 5%가 디폴트값.
  theme_minimal(base_family = "PTMono-Bold", base_size = 13) +
  theme(
    panel.grid =  element_blank(),
    panel.grid.major.y = element_line(colour = "#d9d9d9"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    plot.margin = unit(c(1,1,.5,.7), units = "cm"),
    axis.ticks.x = element_line(),
    axis.ticks.length.x = unit(0.2,"cm"),
    axis.line.x = element_line(),
    axis.text.x = element_text(margin = margin(0.2,0,0,0, unit = "cm"),
                               hjust = -1.2), 
    axis.text.y.right = element_text(hjust = 1, vjust = -1,
                                     margin = unit(c(0,0,0,-1), "cm"))
  )


ggsave(paste0("./test/ggplot/save_ggplot_line_area.png"), 
       width = 6, height = 4, dpi = 320, units = "in", bg = "white")


