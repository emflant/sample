select details, sum(pay_amt) from card_dtl group by details order by sum(pay_amt) desc
limit 20;
