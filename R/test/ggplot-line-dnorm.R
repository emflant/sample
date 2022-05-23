library(tidyverse)

ggplot(tibble(x = c(-4,4)), aes(x)) +
  geom_area(stat = "function", fun = dnorm, fill = 4, alpha = 0.5, xlim = c(-2,0)) +
  geom_function(fun = dnorm, n = 1001) +
  theme_minimal() 
