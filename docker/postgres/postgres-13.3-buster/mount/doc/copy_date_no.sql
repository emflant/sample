COPY no_card_dtl
FROM '/var/lib/postgresql/my-data/exportdata/card_dtl.csv'
DELIMITER ','
QUOTE '"'
CSV HEADER;
