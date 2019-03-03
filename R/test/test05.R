
library(ggplot2)
source('~/risk2.R', encoding = 'UTF-8')


fv_list <- get_fv_list(p_0 = 50000, i = 0.1, n = seq(0, 100))
# head(fv_list)
# str(fv_list)
# summary(fv_list)

fv_list$p_0 <- as.factor(fv_list$p_0)
fv_list$i <- as.factor(fv_list$i)

str(fv_list)
summary(fv_list)


ggplot(data=fv_list, aes(x=n, y=fv, group=i, colour = i)) +
    geom_line() + 
    theme_light() +         # 테마
    # scale_x_reverse() +     # x축 desc 처리.
    # geom_point() +          # point 표시 추가.
    coord_cartesian(xlim = c(0, 10), ylim = c(0, 250000))
##########################################################################


fv_list <- NULL

is.null(fv_list)

for (i in c(0.1,0.2,0.3)){
    fv_list_temp <- get_fv_list(p_0 = 50000, i = i, n = seq(0, 100))
    if(is.null(fv_list)){
        print(i)
        fv_list <- fv_list_temp
    } else {
        print(head(fv_list_temp))
        fv_list <- rbind(fv_list, fv_list_temp)
    }
}

fv_list_temp
fv_list$p_0 <- as.factor(fv_list$p_0)
fv_list$i <- as.factor(fv_list$i)
summary(fv_list)
fv_list

ggplot(data=fv_list, aes(x=n, y=fv, group=i, colour = i)) +
    geom_line() + 
    theme_light() +         # 테마
    # scale_x_reverse() +     # x축 desc 처리.
    # geom_point() +          # point 표시 추가.
    coord_cartesian(xlim = c(0, 10), ylim = c(0, 1000000))


##########################################################################

pv_list <- NULL

is.null(pv_list)

for (i in c(0.1,0.2,0.3)){
    pv_list_temp <- get_pv_list(p_n = 50000, i = i, n = seq(0, 100))
    if(is.null(pv_list)){
        print(i)
        pv_list <- pv_list_temp
    } else {
        print(head(pv_list_temp))
        pv_list <- rbind(pv_list, pv_list_temp)
    }
}

pv_list
pv_list$p_n <- as.factor(pv_list$p_n)
pv_list$i <- as.factor(pv_list$i)
summary(pv_list)


ggplot(data=pv_list, aes(x=n, y=pv, group=i, colour = i)) +
    geom_line() + 
    theme_light() +         # 테마
    scale_x_reverse() +     # x축 desc 처리.
    # geom_point() +          # point 표시 추가.
    coord_cartesian(xlim = c(0, 10), ylim = c(0, 50000))

# 검증.
get_fv(p_0 = 50000, i = 0.3, n = 10) / 50000 # 13.78585
50000 / get_pv(p_n = 50000, i = 0.3, n = 10) # 13.78585
