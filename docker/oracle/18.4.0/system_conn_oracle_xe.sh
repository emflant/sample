docker run --rm -ti --network oracle-xe-net \
	oracle/database:18.4.0-xe \
	sqlplus system/1@//my-oracle-xe:1521/XE 
