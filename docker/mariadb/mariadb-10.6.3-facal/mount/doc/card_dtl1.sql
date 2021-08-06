select pay_date, lpad(format(sum(pay_amt),0),10, ' ') sum_amt
  from card_dtl
 group by pay_date
 order by sum(pay_amt) asc
