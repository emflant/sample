library(gcookbook)
library(tidyverse)

ce = cabbage_exp %>%
  arrange(Date, desc(Cultivar)) %>% 
  group_by(Date) %>% 
  mutate(label_1 = cumsum(Weight) - 0.5 * Weight) %>% 
  mutate(label_2 = sum(Weight))

ggplot(ce, aes(x = Weight, y = Date,fill = Cultivar)) +
  geom_col(width = 0.5) +
  geom_text(aes(x = label_1, label = Weight), vjust = -3) +
  geom_text(aes(x = label_2, label = label_2), hjust = -0.2) + 
  xlim(0, max(ce$label_2) * 1.1)
