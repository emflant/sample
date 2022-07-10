# ggplot(rent_sanfrancisco1, aes(year)) +
#   geom_density() 
  

# ggplot(rent_sanfrancisco1, aes(year)) +
#   geom_density(n = 1024, colour = "#B22727", fill = "#B22727") 
  
# ggplot(rent_sanfrancisco1, aes(year)) +
#   geom_density(aes(year, ..count..), n = 1024, colour = "#F8CB2E", fill = "#F8CB2E",
#                adjust = 2) +
#   theme_void(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 10) +
#   theme(
#     legend.position = "none",
#     title = element_text(colour = "gray30"),
#     axis.text.x = element_text(margin = margin(0.2,0,0,0,"cm"), size = 12, colour = "gray30"),
#     plot.margin = margin(.7,1,1,1,"cm"),
#     plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA")
#   )

library(tidyverse)
library(ggtext)
library(patchwork)
rent <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-07-05/rent.csv')

rent_sanfrancisco1 = rent %>% filter(city == 'san francisco') %>% select(year) 


g_density = function(in_adjust = 1, in_colour = "#FFB562", in_caption = F){
  ggplot(rent_sanfrancisco1, aes(year)) +
    geom_density(aes(year, ..count..), n = 1024, colour = in_colour, fill = in_colour, 
                 # alpha = 0.3, 
                 adjust = in_adjust) +
    scale_x_continuous(limits = c(1998, 2021)) +
    labs(title = paste0("adjust = ", in_adjust)) +
    theme_void(base_family = "AppleSDGothicNeo-ExtraBold", base_size = 10) +
    theme(
      legend.position = "none",
      title = element_text(colour = "gray30"),
      axis.text.x = element_text(margin = margin(0.2,0,0,0,"cm"), size = 12, colour = "gray30"),
      plot.margin = margin(.7,1,.7,1,"cm"),
      plot.background = element_rect(fill = "#F1F0EA", color = "#F1F0EA")
    )
  
  if(in_caption){
    last_plot() +
      labs(caption = "twitter @sourcebox7") +
      theme(plot.caption = element_text(colour = "gray30", size = 10,
                                        hjust = 0.95,
                                        margin = margin(0.7,0,0,0,"cm"))
            # plot.margin = margin(.7,1,.5,1,"cm")
            )
  }

  last_plot()
}
# g_caption
# g_caption = ggplot() +
#   labs(caption = "twitter : @sourcebox7") +
#   theme_void(base_family = "AppleSDGothicNeo-Bold", base_size = 10) +
#   theme(plot.caption = element_text(colour = "gray30", size = 12))





g_density(2, in_colour = "#C65D7B", in_caption = T)
# g_histogram(.3)
ggsave(paste0("./test/ggplot/save_ggplot_density_01_2.png"),
       plot = g_density(2, in_colour = "#1C658C"),
       width = 6, height = 4, dpi = 320, units = "in")

ggsave(paste0("./test/ggplot/save_ggplot_density_01_3.png"),
       plot = g_density(2, in_colour = "#C65D7B"),
       width = 6, height = 4, dpi = 320, units = "in")

ggsave(paste0("./test/ggplot/save_ggplot_density_01_4.png"),
       plot = g_density(in_colour = "#495371"),
       width = 6, height = 4, dpi = 320, units = "in")

# <img src='./test/ggplot/images/logo-twitter-png-5872.png'>
v_colour = "#495371"
g_density(.5, v_colour)+
  g_density(1, v_colour)+
  g_density(3,v_colour) +
  plot_layout(ncol = 1) +
  plot_annotation(caption = "@sourcebox7",
                  theme = theme(plot.caption = element_text(color = "gray30", 
                                                            family = "Menlo", 
                                                            hjust = 0.95, 
                                                            size = 8,
                                                            margin = margin(0,0,0.5,0,"cm")),
                                plot.background = element_rect(fill = "#F1F0EA", color = NA)))
  
ggsave(paste0("./test/ggplot/save_ggplot_density_01_union1.png"),
       width = 6, height = 6, dpi = 320, units = "in")




###############################3

v_colour = "#495371"
g_density(.5, v_colour)+
  g_density(1, v_colour)+
  g_density(3,v_colour) +
  plot_layout(ncol = 1) +
  plot_annotation(caption = "<span style='border: 1px solid black;'> <img src='./test/ggplot/images/logo-twitter-png-5872.png' width='10' height='10' style='border: 1px solid black;'> @sourcebox7 </span>",
                  theme = theme(plot.caption = element_markdown(color = "gray30", 
                                                            family = "Menlo", 
                                                            hjust = 0.95,
                                                            margin = margin(0,0,0.5,0,"cm"),
                                                            size = 10),
                                plot.background = element_rect(fill = "#F1F0EA", color = NA)))


ggsave(paste0("./test/ggplot/save_ggplot_density_01_union1.png"),
       width = 6, height = 6, dpi = 320, units = "in")
