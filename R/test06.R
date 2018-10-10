source('D:/workspace/sample/R/risk3.R', encoding = 'UTF-8')
options("scipen" = 100)
options("digits" = 7)
get_bond_pv(10000000, 0.07, 0.1, 5)
sum(get_bond_pv(10000000, 0.07, 0.1, 5)$pv)  # 8862764

# 무이표채(zero-coupon bond)
get_bond_pv(10000000, 0, 0.1, 10)

# 8000000
# 9900000
sum(get_bond_pv(10000000, 0.07, 0.1, 5)$pv)


# 10000000
get_irr(10000000, 0.05, 10, 11000000)


