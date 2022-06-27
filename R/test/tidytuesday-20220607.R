library(patchwork)
library(tidyverse)
pride_aggregates <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-06-07/pride_aggregates.csv')


pride = pride_aggregates %>% 
  janitor::clean_names() %>% 
  filter(company != 'Grand Total') %>% 
  mutate(company = fct_reorder(company, total_contributed, .desc = T)) %>%
  mutate(max_yn = max(total_contributed) == total_contributed) %>% 
  mutate(total = round(total_contributed / 1000, 1)) %>%
  head()
pride

factor(pride$company)
reorder(pride$company, pride$total_contributed)

ggplot(pride, aes(x = reorder(company, -total_contributed), y = total_contributed, fill = max_yn)) + 
  geom_col(width = 0.7) + 
  geom_text(aes(x = company, y = total_contributed, label = total), 
            vjust = -0.7, colour = "gray30", size = 4,
            family = "AppleSDGothicNeo-ExtraBold") +
  scale_y_continuous(expand = expansion(c(0, 0.05)), 
                     limits = c(0, max(pride$total_contributed) * 1.1)) +
  scale_fill_manual(values = c("#F77E21", "#D61C4E")) +
  theme_void(base_family = "AppleSDGothicNeo-ExtraBold") + 
  theme(
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6 F1F0EA
    plot.margin = margin(1,1,1,1, "cm"),
    legend.position = "none",
    axis.text.x = element_text(margin = margin(3,0,0,0, "mm"),
                               colour = "gray30", size = 11)
  )

# ggplot(pride, aes(x = reorder(company, -total_contributed), y = total_contributed, fill = max_yn)) + 
#   geom_col(width = 0.7) 

ggsave(paste0("./test/ggplot/tidytuesday_20220607.png"), 
       width = 6, height = 4, dpi = 320, units = "in")
