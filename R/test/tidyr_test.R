library(tidyverse)

x = tibble(
  x = 1:100,
  y = x^2,
  z = y^2
)
x %>% 
  print(n = Inf, width = 2)


mean_income <- tribble( 
  ~country, ~`2001`, ~`2002`, ~`2003`, ~`2004`, ~`2005`, 
  "Numenor", 123456, 132654, 321646, 324156, 325416, 
  "Westeros", 314256, 432165, 546123, 465321, 561423, 
  "Narnia", 432156, 342165, 564123, 543216, 465321, 
  "Gondor", 531426, 321465,235461, 463521,561423,
  "Laputa", 14235, 34125,45123, 51234, 54321
)
mean_income %>% 
  gather(key="year",
         value = "income", 
         "2001", "2002", "2003", "2004", "2005")

mean_income %>% 
  gather(key="year",
         value = "income", 
         "2001":"2005")


mean_income %>% 
  gather(key="year",
         value = "income", 
         "2001":"2002", "2003":"2005") %>% 
  print(n = Inf)

mean_income %>% 
  gather(key="year",
         value = "income", -country) %>% 
  print(n = Inf)

tidy_income = mean_income %>% 
  gather(key = "year",
         value = "income", 
         tidyselect::starts_with("2")) # 2 로 시작하는 컬럼명.

tidy_income %>% 
  spread(key = "year",
         value = "income")

tbl = tribble(
  ~date,
  "11/5",
  "4/7",
  "21/12"
)
tbl %>% 
  separate(date, into = c("day", "month"), remove = F)


tbl = tribble( ~date,
               "11th of month 5", 
               "4th of month 7", 
               "21st of month 12"
)
tbl %>% 
  separate(date, into = c("day", "month"),
           sep = "([a-zA-Z]|\\s)+")


crossing(a = 1:4, b = c(11,13))


## functional programming 
## One of the most straightforward functional programming

