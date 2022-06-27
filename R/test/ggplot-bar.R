library(tidyverse)
library(gcookbook) # Load gcookbook for the climate data set

climate_sub <- climate %>%
  filter(Source == "Berkeley" & Year >= 1900) %>%
  mutate(pos = Anomaly10y >= 0)

climate_sub

ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) +
  geom_col(position = "identity")


  
 
ggplot(mpg, aes(x = drv, fill = factor(cyl))) + 
  geom_bar() +
  scale_fill_brewer(palette = "YlGnBu")


ggplot(mpg, aes(x = hwy)) + 
  geom_bar(fill = "#9ebcda") + 
  theme_minimal() + 
  theme(axis.title.x = element_text()) +
  labs(x = "hwy")

ggplot(mpg, aes(x = hwy)) + 
  geom_bar(fill = "#9ebcda") + 
  theme_void() +
  scale
  scale_y_continuous(expand = expansion(c(0,0.5))) +
  theme(axis.line.x = element_line(size = 1))

ggplot(diamonds, aes(carat)) +
  geom_histogram(bins = 200)
ggplot(mpg, aes(hwy)) +
  geom_histogram(bins = 30, binwidth = 10)

LETTERS[1:5]
seq(5, 25, 5)

