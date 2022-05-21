library(gcookbook)
library(tidyverse)

ce = cabbage_exp %>%
  arrange(Date, desc(Cultivar)) %>% 
  group_by(Date) %>% 
  mutate(label_1 = cumsum(Weight) - 0.5 * Weight) %>% 
  mutate(label_2 = sum(Weight)) 

ggplot(ce, aes(x = Weight, y = fct_rev(Date) , fill = Cultivar)) +
  geom_col(width = 0.5) +
  geom_text(aes(x = label_1, label = Weight), vjust = -3) +
  geom_text(aes(x = label_2, label = label_2), hjust = -0.2) + 
  xlim(0, max(ce$label_2) * 1.1) +
  labs(y = "Date")

# Date 는 factor 이기 때문에, reorder 사용하기 위해서는 별도의 order 기준값으로 한 case
# ce %>% mutate(order1 = as.numeric(str_sub(Date, 2)))
# ggplot(ce, aes(x = Weight, y = reorder(Date, -order1) , fill = Cultivar))