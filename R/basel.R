basel3.capital <- function () {
    
    elements_of_capital <- c("Common Equity Tier1", "Additional Tier1", "Tier1", "Tier2", "Tier1+Tier2")
    limit_and_minima <- c(4.5, 1.5, 6, 2, 8)
    
    print("Elements of capital")
    data.frame(elements_of_capital, limit_and_minima)
}

