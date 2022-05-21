library(gcookbook)
library(tidyverse)

ce = cabbage_exp %>%
  arrange(Date, desc(Cultivar)) %>% 
  group_by(Date) %>% 
  mutate(label_1 = cumsum(Weight) - 0.5 * Weight) %>% 
  mutate(label_2 = sum(Weight))

ggplot(ce, aes(x = Weight, y = reorder(Date, label_2), fill = Cultivar)) +
  geom_col(width = 0.5) +
  geom_text(aes(label = Weight), position = position_stack(vjust = 0.5), colour = "white") +
  geom_text(aes(x = label_2, label = label_2), hjust = -0.2) + 
  xlim(0, max(ce$label_2) * 1.1) +
  labs(y = "Date",
       title = "ggplot 막대그래프",
       subtitle = "특정 필드를 기준으로 stacked bar 차트 예제\n- weight 가 높은 순으로 내림차순") + 
  theme_bw(base_family = "Apple SD Gothic Neo", base_size = 12)
  # theme_bw(base_family = "NanumGothic")


