library(gcookbook)
library(tidyverse)

ce = cabbage_exp %>%
  arrange(Date, desc(Cultivar)) %>% 
  group_by(Date) %>% 
  mutate(label_1 = cumsum(Weight) - 0.5 * Weight) %>% 
  mutate(label_2 = sum(Weight))

ggplot(ce, aes(x = Date, y = Weight,fill = Cultivar)) +
  geom_col(width = 0.5) +
  geom_text(aes(label = Weight), position = position_stack(vjust = 0.5)) +
  geom_text(aes(y = label_2, label = label_2), vjust = -0.7) + 
  ylim(0, max(ce$label_2) * 1.1) + 
  theme_minimal() +
  scale_fill_brewer(palette = "Blues")

ggsave("./test/ggplot/save_ggplot_barchart_vertical.png", width = 6, height = 4, dpi = 320, units = "in",
       bg = "white")