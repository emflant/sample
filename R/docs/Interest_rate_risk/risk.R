# FV (future value : 미래가치)
# p 원금, i 이자율s
get_fv <- function (p_0, i, n){
    fv <- p_0 * (1 + i) ^ n
    fv
}

# PV (현재가치, present value)
# i : 할인율
# p_n : 미래가치
# n : 기간
get_pv <- function (p_n, i, n) {
    pv <- p_n / (1 + i) ^ n
    pv
}

# 채권 현재가치
# f : 액면가(face value)
# c : 표면이자율(coupon rate)
# i : 할인율(시장이자율)
# n : 기간
get_bond_pv <- function(f, c, i, n){
    c_amt = f * c # 이자지급액
    c_pv_list <- get_pv(c_amt, i, seq(1, n))
    # print(c_pv_list)
    result <- sum(c_pv_list) + get_pv(f, i, n)
    result
}
