pressure

ggplot(pressure, aes(temperature, pressure))+
  geom_line()

?BOD
factor(BOD$Time)
ggplot(BOD, aes(factor(Time), demand))+
  geom_col()


a = c('A', 'B', 'C')
a = c(1, 2, 3, 1,2,3)
b = c(10, 15, 18, 4,7,9)
c = c(1,1,1,2,2,2)
c = c('가','가','가', '나','나','나')

t = tibble(a,b,c)
t
?ggplot
ggplot(t, aes(x = a,y = b, group = c))+
  geom_col()

  