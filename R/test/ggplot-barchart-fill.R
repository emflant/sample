library(tidyverse)
# rep(1:5, each = 3)

set.seed(1239834)
tb = tibble(x = rep(1:5, each = 3), 
            y = sample(20:70, 15), 
            z = rep(LETTERS[1:3], 5))
tb

# ggplot(tb, aes(x,y, fill = factor(z))) +
#   geom_col(position = "fill", width = 0.6) +
#   coord_cartesian(xlim = c(0.5,5.5), clip = "off") +
#   scale_x_continuous(breaks = 1:5, labels = c("가", "나", "다", "라", "마"))

ggplot(tb, aes(x,y, fill = z)) +
  geom_col(width = 0.6) +
ggplot(tb, aes(x,y, fill = z)) +
  geom_col(position = "fill", width = 0.6)

ggsave(paste0("./test/ggplot/save_ggplot_bar_fill_before.png"), 
       width = 12, height = 4, dpi = 320, units = "in")


ggplot(tb, aes(x,y, fill = z)) +
  geom_col(position = "fill", width = 0.6)

ggsave(paste0("./test/ggplot/save_ggplot_bar_fill_before2.png"), 
       width = 6, height = 4, dpi = 320, units = "in")

ggplot(tb, aes(x,y, fill = z)) +
  geom_col(position = "fill", width = 0.6) + 
  coord_cartesian(xlim = c(0.5,5.5), clip = "off") +
  scale_x_continuous(breaks = 1:5, labels = c("가", "나", "다", "라", "마")) +
  scale_y_continuous(expand = expansion(0),
                     labels = seq(0,100,25)) +
  scale_fill_manual(values = c("#9ecae1", "#4292c6", "#08519c"))+
  theme_minimal(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 13) +
  theme(
    plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA"), ##FBF1E6 F1F0EA
    axis.title = element_blank(),
    legend.title = element_blank(),
    plot.margin = margin(1,0.5,0.7,1, "cm"),
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(colour = c("#bdbdbd"), size = 0.3),
    axis.line.x = element_line(size = 0.7),
    axis.text.x = element_text(size = 14,
                               margin = margin(3,0,0,0, "mm")),
    axis.text.y = element_text(hjust = 0.5, family = "AppleSDGothicNeo-Bold")
  ) +
  annotate("text", x = -0, y = 1.1, label = "(%)",
           family = "AppleSDGothicNeo-Medium", size = 4)
  


ggsave(paste0("./test/ggplot/save_ggplot_bar_fill.png"), 
       width = 6, height = 4, dpi = 320, units = "in")
