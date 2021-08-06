select date_format(pay_date, '%Y-%m') pay_ym
     , lpad(format(sum(pay_amt),0),12, ' ') sum_amt
  from card_dtl
 group by date_format(pay_date, '%Y-%m')
-- order by sum(pay_amt) asc
