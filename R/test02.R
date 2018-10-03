seq(1, 20, by=2)
seq(0, 1, length.out = 10)
seq(0.1, 1, length.out = 10)

x <- seq(1,10)
y <- 1000000 * (1 + 0.1) ^ x
y

print(1.498372983749, digits = 7)
prettyNum(5000000000000, big.mark = ",", trim = TRUE)

# FV (future value : 미래가치)
# p 원금, i 이자율s
get_fv <- function (p_0, i, n){
    fv <- p * (1 + i) ^ n
    fv
}

format(get_fv(1000000, 0.1, seq(1,10)), big.mark = ",", trim = TRUE)

get_fv(1000000, 0.1, 5)
format(get_fv(20000000, 0.07, 15), big.mark = ",", trim = TRUE)


# PV (현재가치, present value)
# i : 할인율
# p_n : 미래가치
# n : 기간
get_pv <- function (p_n, i, n) {
    pv <- p_n / (1 + i) ^ n
    pv
}

seq(10,1)

get_pv(100000, 0.1, seq(10,0))




