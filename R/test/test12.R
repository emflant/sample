
matA=matrix(data=c(0,0.05,0.6,0.8,0.8,0,0,0,0,0.9,0,0,0,0,0.95,0), 
            ncol=4, nrow=4, byrow=T);

N0=matrix(data=c(50,50,50,50), nrow=4);

m1
m3 = m1 %*% t(m1)
m3
solve(m1, m3)
matA %*% N0

m1 = matrix(1:16, ncol = 4)
m1 / 10

m1 = matrix(1:12, ncol = 4)
m1
t(m1)

a<-c(10,2,6,7,8,9,8,7)
a>=8
ifelse(a >= 8, 'a', 'b')
ifelse

set.seed(12322)
a = sample(1:10, 10)
a
# [1]  6  7  9  1  8  2  5  3  4 10

character(10)
# [1] "" "" "" "" "" "" "" "" "" ""
numeric(10)
# [1] 0 0 0 0 0 0 0 0 0 0
integer(10)
# [1] 0 0 0 0 0 0 0 0 0 0
logical(10)
# [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE



b = character(length(a))
b = NULL

b

for(i in seq_along(a)){
  
  if(a[i] >= 9){
    b[i] = "A"
  }else if(a[i] >= 5){
    b[i] = "B"
  }else{
    b[i] = "C"
  }
}
b

# b = NULL
b = rep("C", length(a))

b
b[a >= 5] = rep('B', length(which(a >= 5)))
b
b[a >= 9] = rep('A', length(which(a >= 9)))
b

tibble(a) %>% 
  mutate(a1 = 'C') %>% 
  mutate(a1 = ifelse(a >= 5, 'B', a1)) %>% 
  mutate(a1 = ifelse(a >= 9, 'A', a1))

tibble(a) %>% 
  mutate(a1 = ifelse(a < 5, 'C', NA)) %>% 
  mutate(a2 = ifelse(is.na(a1) & a < 9, 'B', NA)) %>% 
  mutate(a3 = ifelse(is.na(a1) & is.na(a2), 'A', NA))

tibble(a) %>% 
  mutate(a0 = ifelse(a >= 0, "C", ""), 
         a5 = ifelse(a >= 5, "B", ""), 
         a9 = ifelse(a >= 9, "A", "")) %>% 
  mutate(result = str_sub(str_c(a9, a5, a0), 0, 1))

b = tibble(x = c(1,2,3), y = c("C", "B", "A"))

c = tibble(a) %>% 
  mutate(a0 = ifelse(a >= 0, 1, 0), 
         a5 = ifelse(a >= 5, 1, 0), 
         a9 = ifelse(a >= 9, 1, 0)) %>% 
  mutate(a_sum = a0 + a5 + a9)  %>% 
  left_join(b, by = c("a_sum" = "x"))


for(i in c(0,5,9)){
  b[a >= i] = rep()
}



which(a >= 7)
which(LETTERS == "R")
if(a>=8){
  print("A")
}else if(a>=5){
  print("B")
}else{
  print("C")
}

table(sample(1:2, 100, replace = T))

table(b)

library(stats)
rpois(100, 5)


tidyr::uni
separate_rows

tibble(x = c(2022, 2022, 2022, 2021, 2021),
       y = c("텔레비전", "티비", "휴대폰", "휴대폰", "마우스"),
       z = y) %>% 
  pivot_wider(names_from = y, values_from = z) %>% 
  unite(-x, col = "zz", na.rm = T, sep = ",")
  

x = 1:10
x
x > 5

x[c(T, FALSE, T)]
