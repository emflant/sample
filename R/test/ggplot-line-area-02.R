library(tidyverse)
# scale_fill_brewer

set.seed(200)
tb = tibble(x = 0:48, y = runif(48 + 1, min = 0, max = x^2+10)) %>% 
  mutate(z = (cumsum(y) + 800) / 15)

# v_color = c(rep(c("black", NA), 4), "black")
# v_color = rep("black", 9)
# seq(0,48,6)
# v_label = seq(0,48,6)
x_labels = tibble(pos = seq(0, 48, 6)) %>% 
  mutate(b = c(NA, rep(2019:2022, each = 2 ))) %>% 
  group_by(b) %>% 
  mutate(c = row_number(b)) %>% 
  mutate(d = is.na(c) | c == 2) %>% 
  mutate(colour = ifelse(d == F, "black", NA)) %>% 
  mutate(text = ifelse(d == F, paste0("'", str_sub(as.character(b), 3)) , ""))
x_labels
# v_color = c("black", NA, "black", NA, "black", NA, "black", NA, "black")
# v_label = c("", "'2019", "", "'20", "", "'21", "", "'22", "")

ggplot(tb, aes(x,z)) +
  geom_line(size = 1, color = "#54278f") +
  geom_area(aes(x,z), fill = "#54278f", alpha = 0.4) +
  scale_x_continuous(limits = c(0, 53), 
                     breaks = x_labels$pos,
                     labels = x_labels$text,
                     expand = expansion(0)) +
  scale_y_continuous(breaks = seq(0,1500, 300), limits = c(0,1500),
                     position = "right", expand = expansion(c(0, 0.05))) + # 5%가 디폴트값.
  theme_minimal(base_family = "BMDoHyeon-OTF", base_size = 12) +
  theme(
    panel.grid =  element_blank(),
    # panel.grid.major.x = element_line(colour = c(NA, rep(c(NA, "#d9d9d9"),4))),
    panel.grid.major.y = element_line(colour = c("#bdbdbd"), size = 0.3),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    plot.margin = unit(c(1,1,.5,.7), units = "cm"),
    axis.ticks.x = element_line(color = v_color),
    axis.ticks.length.x = unit(0.2,"cm"),
    axis.line.x = element_line(),
    axis.text.x = element_text(margin = margin(0.2,0,0,0, unit = "cm")), 
    axis.text.y.right = element_text(hjust = 1, vjust = -0.8,
                                     margin = unit(c(0,0,0,-1), "cm")),
    plot.background = element_rect(fill = "#FDF1E6")
  )


ggsave(paste0("./test/ggplot/save_ggplot_line_area-02.png"), 
       width = 6, height = 4, dpi = 320, units = "in")


