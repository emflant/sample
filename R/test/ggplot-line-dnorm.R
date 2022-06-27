library(tidyverse)
# qnorm(0.93)
# pnorm(1) # <= x   
# dnorm(0.1) # x축값 기준으로 정규분포표 y 값을 리턴.

# x축의 값을 입력하면, 확률밀도함수의 f(x) 의 값을 리턴.
dnorm(1) # [1] 0.2419707  --> y 값을 뜻함.

# x축의 값을 입력하면, x값이하의 f(x)의 적분값(확률밀도함수의 넓이)를 리턴
pnorm(1) # [1] 0.8413447  --> x <= 1 이하인 면적, 84.13%을 뜻함.

# f(x)의 적분값(확률밀도함수의 넓이)를 입력하면, x값를 역으로 리턴
qnorm(0.8413447) # [1] 0.9999998  --> 약 x = 1 이 리턴됨.

# ggplot(tibble(x = c(-4,4)), aes(x)) +
#   geom_area(stat = "function", fun = dnorm, fill = 4, 
#             alpha = 0.5, xlim = c(qnorm(0.93),-4)) +
#   geom_function(fun = dnorm, n = 1001) +
#   theme_minimal()

# 너무 x축 하고 딱 붙어있다보니 임의로 0.02 y 값을 이동했다.
my_fun = function(i){
  dnorm(i) + 0.02
}

# ggplot(tibble(x = c(-4,4)), aes(x)) +
#   geom_area(stat = "function", fun = my_fun, fill = 4, 
#             alpha = 0.5, xlim = c(qnorm(0.93),-4)) +
#   geom_function(fun = my_fun, n = 1001) +
#   scale_x_continuous(breaks = qnorm(0.93), labels = "x", 
#                      expand = expansion(0)) +
#   scale_y_continuous(expand = expansion(mult = c(0, 0.05))) + 
#   theme_minimal()


ggplot(tibble(x = c(-4,4)), aes(x)) +
  geom_area(stat = "function", fun = my_fun, fill = 4, 
            alpha = 0.5, xlim = c(qnorm(0.93),-4)) +
  geom_function(fun = my_fun, n = 1001) +
  scale_x_continuous(breaks = qnorm(0.93), labels = "x", 
                     expand = expansion(0)) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) + # 0.05 가 디폴트임.
  theme_minimal() +
  labs(y = "", sec.y = "") + 
  theme(axis.text.y = element_blank(),
        axis.text.x = element_text(size = 15),
        axis.title.x = element_blank(),
        axis.title.y.left = element_text(margin = margin(0, .3, 0, 0, "cm")),
        axis.title.y.right = element_text(margin = margin(0, .3, 0, 0, "cm")),
        panel.grid = element_blank(),
        axis.ticks.x = element_line(),
        axis.ticks.length.x = unit(3, "mm"),
        axis.line.x = element_line()) +
  annotate(geom = "curve", x = 2, y = 0.3, xend = 0, yend = 0.25,
           curvature = .3, arrow = arrow(length = unit(3, "mm"))) +
  annotate(geom = "text", x = 2.4, y = 0.3, label = "F(x)", size = 5) +
  annotate(geom = "text", x = -3.6, y = 0.29, label = "확률 밀도 함수",
           hjust = "left", family = "Apple SD Gothic Neo", size = 4.3) +
  annotate("segment", x = -2, xend = -0.9, 
           y = 0.29, yend = 0.29, size = 0.6, 
           arrow = arrow(angle = 30, length = unit(0.3,"cm"))) +
  annotate("segment", x = qnorm(0.93), xend = qnorm(0.93), 
           y = my_fun(qnorm(0.93)), yend = 0, size = 0.6, 
           arrow = arrow(angle = 20, ends = "both", length = unit(0.3,"cm"), type = "closed")) +
  annotate(geom = "curve", x = 3, y = 0.17, xend = qnorm(0.93), yend = 0.07, 
           curvature = -0.3, arrow = arrow(length = unit(3, "mm"))) +
  annotate(geom = "text", x = 3, y = 0.2, label = "f(x)", size = 4.5)

ggsave("./test/ggplot/save_ggplot_norm.png", width = 6, height = 4, dpi = 320, bg = "white")