seq1 <- seq(0, 5)
list1 <- get_pv(15000, 0.1, seq(0, 5))
list1

# install.packages("ggplot2")
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
head(df9)
str(df9)


# 기존에는 num 형식이었으나, 그래프에서 범례표시를 위해, factor 로 전환.
# 'data.frame':	303 obs. of  4 variables:
#     $ pn: num  50000 50000 50000 50000 50000 50000 50000 50000 50000 50000 ...
# $ i : num  0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 ...
# $ n : int  0 1 2 3 4 5 6 7 8 9 ...
# $ pv: num  50000 45455 41322 37566 34151 ...
df9$i <- as.factor(df9$i)

# 변경ㅎ
# 'data.frame':	303 obs. of  4 variables:
#     $ pn: num  50000 50000 50000 50000 50000 50000 50000 50000 50000 50000 ...
# $ i : Factor w/ 3 levels "0.1","0.2","0.3": 1 1 1 1 1 1 1 1 1 1 ...
# $ n : int  0 1 2 3 4 5 6 7 8 9 ...
# $ pv: num  50000 45455 41322 37566 34151 ...
str(df9)

ggplot(data=df9, aes(x=n, y=pv, group=i, colour = i)) +
    geom_line() + 
    theme_light() +         # 테마
    scale_x_reverse() +     # x축 desc 처리.
    # geom_point() +          # point 표시 추가.
    coord_cartesian(xlim = c(0, 10), ylim = c(0, 50000))
    

