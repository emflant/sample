LOAD DATA LOCAL INFILE
'/var/lib/mysql/exportdata/card_dtl.csv' into table bd_card_dtl 
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES
;
