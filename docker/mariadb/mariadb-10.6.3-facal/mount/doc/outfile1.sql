SELECT 'card_cd', 'pay_date', 'details', 'pay_amt'
UNION ALL
SELECT * FROM bd_card_dtl 
  INTO OUTFILE './exportdata/card_dtl.csv'
  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n'
;
