source('D:/workspace/sample/R/risk3.R', encoding = 'UTF-8')
options("scipen" = 100)
get_bond_pv(10000000, 0.07, 0.1, 5)
sum(get_bond_pv(10000000, 0.07, 0.1, 5)$pv)

# 무이표채(zero-coupon bond)
get_bond_pv(10000000, 0, 0.1, 10)
