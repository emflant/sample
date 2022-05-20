library(tidyverse)
library(readxl)
# install.packages("extrafont")
# library(extrafont)
sh_2205 = read_excel("~/data/card/excel/sh_202205.xlsx")

sh_2205 %>% 
  group_by(대분류) %>% 
  summarise(금액 = sum(이용금액)) %>% 
  arrange(desc(금액)) %>% 
  ggplot(aes(x = reorder(대분류, -금액), y = 금액, fill = 대분류)) + # 
  geom_bar(stat = "identity") +
  scale_y_continuous(breaks = seq(0, 2000000, 100000), 
                     label = as.character(seq(0, 200, 10))) + 
  labs(
    x = "지출구분", 
    y = "(만원)", 
    title = "신한카드(22.5월)",
    subtitle = "지출 용도별 신용카드 사용금액"
  ) + 
  # theme_grey(base_family = "AppleGothic") +
  # theme_minimal(base_family = "AppleGothic") +
  theme(
    # panel.grid.major.y = element_blank(),
    text = element_text(family = "AppleGothic"),
    panel.grid.minor.y = element_blank(),
    axis.text.x = element_text(angle = 0, margin = margin(0.3, 0, 0, 0, "cm")),
    axis.text.y = element_text(angle = 0, margin = margin(0, 0.3, 0, 0.1, "cm")),
    axis.title.x = element_text(angle = 0, vjust = 0.5, margin = margin(0.3, 0, 0.3, 0, "cm")),
    axis.title.y = element_text(angle = 0, vjust = 1, margin = margin(0, 0, 0, 0.3, "cm"))
  ) 
# scale_fill_brewer(palette = "green") + 
# NanumGothic
# theme_minimal(base_family = "NanumGothic")




# ver2
# install.packages("ggtext")
library(ggtext)

sh_2205 %>% 
  group_by(대분류) %>% 
  summarise(금액 = sum(이용금액)) %>% 
  arrange(desc(금액)) %>% 
  ggplot(aes(x = 금액, y = reorder(대분류, 금액), fill = 대분류)) + # 
  geom_bar(stat = "identity") +
  scale_x_continuous(breaks = seq(0, 2000000, 100000), 
                     label = as.character(seq(0, 200, 10))) + 
  labs(
    x = "(만원)", 
    y = "구분",
    fill = '지출구분',
    title = "신용카드(22.5월)",
    subtitle = "지출 용도별 신용카드 사용금액"
  ) + 
  # theme_grey(base_family = "AppleGothic") +
  # theme_bw() + 
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_markdown(),
    # panel.grid.major.y = element_blank(),
    text = element_text(family = "AppleGothic"),
    panel.grid.minor.y = element_blank(),
    axis.text.x = element_text(angle = 0, margin = margin(0.3, 0, 0, 0, "cm")),
    axis.text.y = element_text(angle = 0, margin = margin(0, 0.3, 0, 0.1, "cm")),
    axis.title.x = element_text(angle = 0, hjust = 1, margin = margin(0.3, 0, 0.3, 0, "cm")),
    axis.title.y = element_text(angle = 0, vjust = 0.5, margin = margin(0, 0, 0, 0.3, "cm"))
  ) 


