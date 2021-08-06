select card_cd
     , lpad(format(sum(pay_amt),0),18, ' ') sum_amt
  from card_dtl
 group by card_cd
-- order by sum(pay_amt) asc
