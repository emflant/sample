source('D:/workspace/sample/R/risk3.R', encoding = 'UTF-8')
options("scipen" = 100)
get_bond_pv(10000000, 0.07, 0.1, 5)
sum(get_bond_pv(10000000, 0.07, 0.1, 5)$pv)  # 8862764

# 무이표채(zero-coupon bond)
get_bond_pv(10000000, 0, 0.1, 10)

# 8000000
# 9900000
sum(get_bond_pv(10000000, 0.07, 0.1, 5)$pv)
abs(-1)

i = 100
i_gap = i
bond_pv = 8000000
count = 0
limit = 8

while(TRUE){
    count <- count + 1
    
    i_gap <- i_gap / 2
    bond_pv_temp = sum(get_bond_pv(10000000, 0.07, i, 5)$pv)
    gap <- bond_pv - bond_pv_temp
    # print(bond_pv_temp)
    if(abs(gap) < 1 / 10 ** limit){ # 1억분의 1 의 오차.
        print(i)
        break;
    } else if (i < 1 / 10 ** limit || i > 10 ** limit) {
        print("limit over")
        break;
    } else if(gap > 0) {
        i <- i - i_gap
    } else {
        i <- i + i_gap
    }
}

i # 0.1263585
count
i_gap

