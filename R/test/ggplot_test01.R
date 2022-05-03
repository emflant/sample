library(ggplot2)
mpg

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()


ggplot(mpg, aes(cty, hwy)) +
  geom_point()

economics
ggplot(economics, aes(date, unemploy)) + geom_line()

mpg

ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point()
