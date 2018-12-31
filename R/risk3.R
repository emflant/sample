options("scipen" = 100)

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

get_duration <- function(f, c, i, n){
    bond_list <- get_bond_pv(f,c,i,n)
    bond_list$pv_n <- bond_list$pv * bond_list$n
    duration = sum(bond_list$pv_n) / sum(bond_list$pv)
    modified_duration = duration / (1 + i)
    pv <- sum(bond_list$pv)
    result = list(d = duration, 
                  md = modified_duration, 
                  pv = pv, 
                  list = bond_list)
    result
}

# get_irr2 <- function

get_irr <- function (f, c, n, pv) {
  i = 10 # 1,000 % 에서부터 search
  i_gap = i
  count = 0
  limit = 2 # 0.01 원 차이까지 구함
  
  while(TRUE){
    # print(i)
    count <- count + 1
    i_gap <- i_gap / 2
    bond_pv_temp = sum(get_bond_pv(f, c, i, n)$pv)
    gap <- pv - bond_pv_temp
    # print(bond_pv_temp)
    if(abs(gap) < 1 / 10 ** limit){ # 1억분의 1 의 오차.
      break;
    } else if (count > 1000) {
      print("limit over")
      break;
    } else if(gap > 0) {
      i <- i - i_gap
    } else {
      i <- i + i_gap
    }
  }
  
  data.frame(internal_rate = i,
             face_amount=f, coupon_rate = c, 
             period = n, input_present_value = pv,
             # calculate_present_value = bond_pv_temp,
             gap = gap,loop_count = count)
}



norm_graph <- function (mean=0, sd=1, lb=NA, ub=NA, xpos = -0.02){
    
    x <- seq(-4,4,length=1000) * sd + mean
    hx <- dnorm(x,mean,sd)
    
    plot(x, hx, type="n", xlab="Values", ylab="",
         main="Normal Distribution", axes=FALSE)
    lines(x, hx)
    
    if(!is.na(lb) && !is.na(ub)){
        i <- x >= lb & x <= ub
        
        polygon(c(lb,x[i],ub), c(xpos,hx[i],xpos), col="gray")
        
        area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
        result <- paste("P(",lb,"< u <",ub,") =",
                        signif(area, digits=3) * 100, "%")
        mtext(result,3)
        axis(1, at=c(-4, 0, lb, ub), pos=xpos) 
    } else {
        axis(1, at=seq(-4, 4, 1), pos=xpos) 
    }
    
}
