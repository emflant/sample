plot(1,2)
plot(c(1,2), c(1,5))

cars
plot(cars)
plot(cars$speed, cars$dist)

plot(dist ~ speed, data= cars)


plot(c(1,5), c(1,10), type = "n")
lines(c(1,2), c(1,5))
lines(c(1,2,3), c(2,4,8))



###############################



rates <- seq(0.06, 0.1,by = 0.0001)
range(rates)
# get_bond_pv(1000000, 0.08,0.081,6)
md <- get_duration(1000000, 0.08, 0.08, 6)$md
pv_list <- c()
pv_list2 <- c()
for(r in rates){
    pv_list <- c(pv_list, sum(get_bond_pv(1000000, 0.08, r,6)$pv))
    pv_list2 <- c(pv_list2, 1000000 - md * (r - 0.08) * 1000000)
}
# data.frame(r = rates, pv = pv_list)
# print(append)
# append(1:5, 0:1, after = 3)
plot(range(rates), range(pv_list), type = "n")
lines(x = rates, y = pv_list, col = "red")
lines(x= rates, y= pv_list2, col = "blue")
