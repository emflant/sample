seq1 <- seq(0, 5)
list1 <- get_pv(15000, 0.1, seq(0, 5))
list1

install.packages("ggplot2")
library(ggplot2)

df1 <- data.frame(pn = 50000, i = 0.1, n=seq(0, 100),
                 pv=get_pv(50000, 0.1, seq(0, 100)))
df1
ggplot(data=df1, aes(x=n, y=pv)) +
    geom_line() + scale_x_reverse() + # geom_point()
    coord_cartesian(xlim = c(0, 100), ylim = c(0, 50000))

df2 <- data.frame(pn = 50000, i = 0.2, n=seq(0, 100),
                  pv=get_pv(50000, 0.2, seq(0, 100)))
df3 <- data.frame(pn = 50000, i = 0.3, n=seq(0, 100),
                  pv=get_pv(50000, 0.3, seq(0, 100)))

df9 <- rbind(df1, df2, df3) 
df9

ggplot(data=df9, aes(x=n, y=pv, group=i, colour = i)) +
    geom_line() + scale_x_reverse() + theme_light() + # geom_point()
    coord_cartesian(xlim = c(0, 20), ylim = c(0, 50000))

