# 복리이자요소. CVIF
get_cvif <- function (i, n) {
    data.frame(i = i, n = n, cvif = (1 + i) ^ n)
}


# FV (future value : 미래가치)
# p 원금, i 이자율s
# FV list 데이터 생성.
get_fv <- function (p_0, i, n){
    fv_table <- get_cvif(i, n)
    fv_table$p_0 <- p_0
    fv_table$fv <- fv_table$p_0 * fv_table$cvif
    fv_table
}

# PVIF (현가이자요소)
# PV (현재가치, present value)
# i : 할인율
# p_n : 미래가치
# n : 기간
get_pvif <- function (i, n) {
    data.frame(i = i, n = n, pvif = 1 / (1 + i) ^ n)
}

# PV list 데이터 생성.
get_pv <- function (p_n, i, n){
    pv_table <- get_pvif(i, n)
    pv_table$p_n <- p_n
    pv_table$pv <- pv_table$p_n * pv_table$pvif
    pv_table
}

# 채권 현재가치
# f : 액면가(face value)
# c : 표면이자율(coupon rate)
# i : 할인율(시장이자율)
# n : 기간
# 채권가격 = 이자의 현재가치(C x pvifa(i,n)) + 액면가의 현재가치(F x pvif(i,n))
get_bond_pv <- function(f, c, i, n){
    c_amt = f * c # 이자지급액
    c_pv_list <- get_pv(c_amt, i, seq(1,n))
    f_pv_list <- get_pv(f, i, n)
    result <- rbind(c_pv_list, f_pv_list)
    result
}

get_irr <- function (f, c, n, pv) {
    
}
