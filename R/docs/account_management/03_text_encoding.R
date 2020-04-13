


y <- charToRaw(x)
y
rawToBits(y)
length(y)
length(rawToBits(y))
11111111


x <- "한글"
Encoding(x) <- "bytes"
print(x) # [1] "\\xed\\x95\\x9c\\xea\\xb8\\x80"

Encoding(x) <- "UTF-8"
print(x) # [1] "한글"

Encoding(x) <- "latin1"
print(x) # [1] "í•œê¸€"





x = "abc"
Encoding(x) <- "bytes"
Encoding(x) # [1] "unknown"
print(x) # [1] "abc"

Encoding(x) <- "UTF-8"
Encoding(x) # [1] "unknown"
print(x) # [1] "abc"

Encoding(x) <- "latin1"
Encoding(x) # [1] "unknown"
print(x) # [1] "abc"



# 한글 바이트수, 
x <- "한글"
charToRaw(x) # [1] ed 95 9c ea b8 80
length(charToRaw(x)) # [1] 6

lengthb = function(chr){
  length(charToRaw(chr))
}

combine = function(remarks, blank_count){
  blank = str_c(rep(' ', blank_count), collapse = "")
  paste0(remarks, blank)
}

str_c(rep(' ', 20), collapse = "")
act.select() %>% head() %>% 
  mutate(blank_count = 46- map_int(remarks, lengthb)) %>% 
  mutate(result = map2_chr(remarks, blank_count, combine)) %>% 
  select(result, amount)
  
