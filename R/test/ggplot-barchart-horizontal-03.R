library(tidyverse)
# scale_fill_brewer(palette = "PuRd")

tb = tibble(x = 2017:2022, y = sample(50:150, 6)) %>% 
  mutate(z = max(y) == y)
tb

ggplot(tb, aes(x, y, fill = z)) +
  geom_col(width = 0.6) +
  geom_text(aes(x = x, y = y, label = y), hjust = -0.5, family = "BMJUAOTF") + 
  scale_x_continuous(breaks = tb$x) + 
  scale_y_continuous(limits = c(0, max(tb$y) * 1.1)) +
  coord_flip() + 
  theme_void(base_family = "BMDoHyeon-OTF") + 
  theme(
    axis.text.y = element_text(),
    plot.margin = unit(c(.3,1,.3,1), "cm"),
    legend.position = "none"
  ) +
  scale_fill_manual(values = c("#a6bddb", "#0570b0"))

file.copy("./test/ggplot/save_ggplot_col3.png", 
          to = paste0("./test/ggplot/20220604/save_ggplot_col3_", 
                      format(Sys.time(), "%Y%m%d_%H%M%S"), ".png"))

ggsave(paste0("./test/ggplot/save_ggplot_col3.png"), 
       width = 6, height = 4, dpi = 320, units = "in", bg = "white")


# ggsave(paste0("./test/ggplot/20220604/save_ggplot_col3_", 
#               format(Sys.time(), "%Y%m%d_%H%M%S"), ".png"), 
#        width = 6, height = 4, dpi = 320, units = "in", bg = "white")

# ggsave(here::here("temp", paste0("deforestation-", format(Sys.time(), "%Y%m%d_%H%M%S"), ".png")), 
# dpi = 320, width = 9, height = 6)