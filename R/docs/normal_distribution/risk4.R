options("scipen" = 100)

norm_graph <- function (mean=0, sd=1, lb=NA, ub=NA, xpos = -0.02){
    
    # length 를 100 정도로 작게하면, 나중에 범위지정할때, lb, ub 의 
    # x 값에 대비하는 y 값이 오차가 심해져서 세로로 일직선으로 보이는게 아니라
    # 약간 비스듬하게 그려지니 1000 이상이 그나마 나은 듯 하다.
    x <- seq(-4,4,length=1000) * sd + mean
    hx <- dnorm(x,mean,sd)
    
    plot(x, hx, type="n", xlab="Values", ylab="", axes=FALSE)
    lines(x, hx)
    
    if(!is.na(lb) && !is.na(ub)){
        
        i <- x >= lb & x <= ub
        
        polygon(c(lb,x[i],ub), c(xpos,hx[i],xpos), col="#FFFFCC")
        
        area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
        result <- paste("P(",lb,"< u <",ub,") =",
                        signif(area, digits=3) * 100, "%")
        mtext(result,3)
        axis(1, at=c(-4, 0, lb, ub), pos=xpos) 
    } else {
        title(main = "Normal Distribution")
        axis(1, at=seq(-4, 4, 1), pos=xpos) 
    }
    
}
