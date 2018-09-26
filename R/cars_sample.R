str(cars)
cars

plot(cars$speed, cars$dist, main="속도와 제동거리"
     , xlab="속도(mph)", ylab = "제동거리(ft)", pch=1, col="red")
help(plot)


install.packages("wordcloud")
install.packages("RColorBrewer")


library("wordcloud")
library("RColorBrewer")


pal2 <- brewer.pal(8, "Dark2")

x <- c("국민", "신한국사회", "민족")
y <- c(15,13,3)

wordcloud(x,y,colors = pal2)

