create table card_pay_type as 
select card_cd, details, count(*) cnt 
  from card_dtl
 group by card_cd, details
;
