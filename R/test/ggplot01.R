library(tidyverse)
library(gcookbook)
uspopchange

upc = uspopchange %>% arrange(desc(Change)) %>% 
  slice(1:10)
upc

ggplot(upc, aes(Abb, Change, fill=Region))+
  geom_col() + theme_minimal()

ggplot(upc, aes(Abb, Change, fill=Region))+
  geom_col() + theme_minimal()+
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    # panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(colour = "black", size = 0.4, lineend = "square"),
    axis.text.x = element_text(angle = 0, margin = margin(0.3, 0, 0, 0, "cm")),
    axis.text.y = element_text(angle = 0, margin = margin(0, 0.3, 0, 0.3, "cm")),
    axis.title.x = element_text(angle = 0, vjust = 0.5, margin = margin(0.3, 0, 0.3, 0, "cm")),
    axis.title.y = element_text(angle = 0, vjust = 0.5, margin = margin(0, 0.3, 0, 0.3, "cm"))
  )+ 
  scale_y_continuous(expand = c(0,0), breaks = seq(0, 40, 3)) +
  scale_x_discrete(expand = c(0,0.7)) +xlab("State") 

