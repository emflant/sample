
library(readr)
library(stringr)
library(tidyverse)

# lead(1:10, 1)
# lag(1:10, 1)


# log_gdebi = read_lines(file = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/log_gdebi.txt")
# 
# log_gdebi %>% 
#   enframe(name = NULL)
# 
# log_gdebi_dependency_order = log_gdebi %>% 
#   enframe(name = NULL) %>% 
#   filter(str_detect(value, '^Preparing to unpack')) %>% 
#   mutate(deb_file_name = str_sub(str_extract(value, ".+\\.deb"), start = 25)) %>% 
#   mutate(command = str_c("dpkg", "-i", deb_file_name, sep = " "))
# 
# 
# write_lines(log_gdebi_dependency_order$command, path = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/install_gdebi.txt")




# log_rbase = read_lines(file = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/log_install_rbase.txt")
# log_rbase_dependency_order = log_rbase %>% 
#   enframe(name = NULL) %>% 
#   filter(str_detect(value, '^Preparing to unpack')) %>% 
#   mutate(deb_file_name = str_sub(str_extract(value, ".+\\.deb"), start = 25)) %>% 
#   mutate(command = str_c("dpkg", "-i", deb_file_name, sep = " "))
# log_rbase_dependency_order


# write_lines(log_rbase_dependency_order$command, path = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/install_rbase.sh")
# 
# file_l = list.files(path = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/apt-pkg-rbase")
# file_l = file_l %>% 
#   enframe(name = NULL) 
# str_locate(file_l$value, "\\_")[,1]
# 
# 
# file_2 = file_l %>% 
#   mutate(yn = str_detect(value, "_.+")) %>% 
#   mutate(idx = str_locate(value, "_")[,1]) %>% 
#   mutate(pkg = str_sub(value, 0, idx-1))


  
# depend_rbase = read_lines(file = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/apt-pkg-rbase/depend_rbase2.txt")
# depend_2 = depend_rbase %>% 
#   enframe(name = NULL)
# 
# depend_rbase
# 
# depend_rbase %>% 
#   enframe(name = NULL) %>% 
#   mutate(command = str_c("dpkg -i", value, sep = " "))
# 
# depend_rbase = depend_rbase %>% 
#   enframe(name = NULL)
# 
# command1 = depend_2 %>% 
#   left_join(file_2, by = c("value" = "pkg")) %>% 
#   mutate(command = str_c("dpkg -i ", value.y)) %>% 
#   select (command)
# 
# 
# write_lines(command1$command, path = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/apt-pkg-rbase/install_rbase.sh")

# r-api-3 as it has no candidate
# liblapack.so.3 as it has no candidate
# libblas.so.3 as it has no candidate
# debconf-2.0 as it has no candidate


########################


# log_rbase = read_lines(file = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/apt-pkg-rbase/log_rbase.txt")
# commands = log_rbase %>% 
#   enframe(name = NULL) %>% 
#   filter(str_detect(value, "Preparing to unpack .../")) %>% 
#   mutate(temp1 = str_sub(value, 25)) %>% 
#   mutate(end_pos = str_locate(temp1, "\\.deb")[,2]) %>% 
#   mutate(pkg_name = str_sub(temp1, 0, end_pos)) %>% 
#   # select(pkg_name) %>% 
#   mutate(command = str_c("dpkg -i ", pkg_name)) %>% 
#   mutate(idx = 1:length(commands$command)) %>% 
#   select(command, idx)
# 
# write_lines(commands$command, path = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/apt-pkg-rbase/install_rbase.sh")
# 
# commands
# commands %>% 
#   filter(str_detect(command, "libc"))
# 30:50
# commands %>% 
#   filter(idx %in% 30:40)

rbase_rdepends = read_lines(file = "/Volumes/PhotoDisk/30_workspace/sample/vagrant/bento-ubuntu-16.04-i386/rbase_dep.txt")
rbase_rdepends %>% 
  enframe(name = NULL) %>% 
  mutate(main_row = !str_detect(value, "^ ")) %>% 
  mutate(main_pkg = ifelse(main_row, value, NA)) %>% 
  fill(main_pkg) %>% 
  mutate(depend_pkg = str_extract(value, "(?<=Depends:\\s)\\S*"))

rbase_pkg = rbase_rdepends %>% 
  enframe(name = NULL) %>% 
  mutate(main_row = !str_detect(value, "^ ")) %>% 
  mutate(main_pkg = ifelse(main_row, value, NA)) %>% 
  fill(main_pkg) %>% 
  mutate(depend_pkg = str_extract(value, "(?<=Depends:\\s)\\S*")) %>% 
  add_count(main_pkg)


v_rbase  = rbase_pkg %>% 
  filter(is.na(depend_pkg)) %>% 
  pull(main_pkg)
v_rbase
# seq_along(v_rbase)
# length(v_rbase)
mtx_rbase = matrix(0, nrow = length(v_rbase), ncol = length(v_rbase))
rownames(mtx_rbase) = v_rbase
colnames(mtx_rbase) = v_rbase
mtx_rbase

x <- 1:9
x %o% x

# 
aa = outer(month.abb, 1999:2003, FUN = "paste")
aa
as.vector(t(aa))
paste(month.abb, 1999)
str_c(month.abb, 1999:2000)

( M <- matrix(1:6, ncol = 2) )
kronecker(4, M)
# mtx_rbase[c("r-recommended","r-cran-boot"), c("r-base", "r-base-core")] = 1
# mtx_rbase[, c("r-base", "r-base-core")] 
m_rbase = rbase_pkg %>% 
  filter(!is.na( depend_pkg)) %>% 
  select(main_pkg, depend_pkg) %>% 
  as.matrix()
m_rbase
mtx_rbase
mtx_rbase[m_rbase] = 1
mtx_rbase

write_excel_csv(as_tibble(mtx_rbase, rownames = "id"), path = "/Volumes/PhotoDisk/30_workspace/mtx_rbase.csv")

rbase_pkg %>% 
  filter(!is.na( depend_pkg)) %>% 
  select(main_pkg, depend_pkg) %>% 
  filter(main_pkg == "r-base")

library(keras)
array_reshape()
# 
# v_main = rbase_pkg %>% 
#   filter(!is.na( depend_pkg)) %>% 
#   select(main_pkg, depend_pkg) %>% 
#   pull(main_pkg)
# 
# v_depend = rbase_pkg %>% 
#   filter(!is.na( depend_pkg)) %>% 
#   select(main_pkg, depend_pkg) %>% 
#   pull(depend_pkg)
# 
# v_main
# v_depend
# 
# mtx_rbase[v_main, v_depend]  = 1
# View(mtx_rbase)
# mtx_rbase
# as_tibble(mtx_rbase, rownames = NA)




















fill(c(1, NA, 3, NA, NA, 2))
lag(1:10)
rbase_rdepends %>% 
  enframe(name = NULL) %>% 
  mutate(first = !str_detect(value, "^ ")) %>% 
  mutate(master_pkg = ifelse(first == TRUE, value, NA)) %>% 
  mutate(depend_pkg = ifelse(first == F, str_trim(value), NA)) %>% 
  fill(master_pkg) %>% 
  mutate(cnt = count(master_pkg))

aa %>% 
  count(master_pkg) %>% 
  filter(n == 2)
mtcars %>% add_tally(cyl)
mtcars %>% group_by(cyl) %>% tally()
mtcars %>% add_tally(disp)
mtcars %>% count(cyl)
mtcars %>% tally(cyl)

summarise()
mtcars %>% 
  add_column(new = 1:32)

glimpse(mtcars)
str(mtcars)
x <- c(5, 1, 3, 2, 2, NA)
row_number(x)
dense_rank(x)
percent_rank(x)
ntile(x, 2)
min_rank(x)
mutate(mtcars, row_number(cyl))


x=data.frame(nick=c('a','a','b','b','b','c'), p_time=1:6)
x

x %>%
  group_by(nick) %>% 
  mutate(n_row = row_number()) %>% 
  add_tally(p_time, name = "n") %>% 
  ungroup() %>% 
  add_tally(p_time, name = "n1") %>% 
  mutate(rate = n / n1) %>% 
  mutate(rate2 = ifelse(n_row == 1, rate, 0)) %>% 
  add_tally(rate2, name = "sum")





rbase_pkg = rbase_rdepends %>% 
  enframe(name = NULL) %>% 
  mutate(main_row = !str_detect(value, "^ ")) %>% 
  mutate(main_pkg = ifelse(main_row, value, NA)) %>% 
  fill(main_pkg) %>% 
  mutate(depend_pkg = str_extract(value, "(?<=Depends:\\s)\\S*")) %>% 
  add_count(main_pkg)




aa1 = rbase_pkg %>% 
  filter(!is.na( depend_pkg)) %>% 
  select(main_pkg, depend_pkg) %>% 
  group_by(main_pkg) %>% 
  mutate(rnum = row_number())
aa1
aa1 %>% 
  filter(rnum == 1)


for(i in 1:462){
  aa1[i,1]
}

x = list(a = c(1,2,3), b=c(3,4))

x$a
x$'a'
s = 'a'

x
x[[s]] = append(x[[s]], 5)
c(x[[s]], 5)
x[[s]] = c(x[[s]], 5)

append
append(1:5, 0:1, after = 3)
map2()

df <- data.frame(
  x = 1:3 + 0.1,
  y = 3:1 - 0.1,
  z = letters[1:3]
)

plus <- function(x, y) x + y
map2(df$x, df$y, plus)
str(df$x)

reduce(1:4, list)
str(reduce(1:4, list))
glimpse(reduce(1:4, list))
list(list(1),2)


a <- 1:3
a
attr(a, "x") = "abcdef"
str(a)
attr(a, "x")[[1]]

attr(a, "y") = 4:6
attr(a, "y")[[3]] = 7

str(a)

str(attributes(a))

attr_getter()

x <- 1:10
attr(x,"dim") <- c(2)
x

v <- c(1, 2, 3)
v[[6]] = 4
v


matrix(2, nrow = 4, byrow = T)

as.matrix()
