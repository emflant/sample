options("scipen" = 100)

norm_graph <- function (mean=0, sd=1, lb=NA, ub=NA, xpos = -0.02){
    
    x <- seq(-4,4,length=1000) * sd + mean
    hx <- dnorm(x,mean,sd)
    
    plot(x, hx, type="n", xlab="Values", ylab="", axes=FALSE)
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
        title(main = "Normal Distribution")
        axis(1, at=seq(-4, 4, 1), pos=xpos) 
    }
    
}
