docker run --rm -ti --network oracle-xe-net \
	oracle/database:18.4.0-xe \
	sqlplus sys/1@//my-oracle-xe:1521/xepdb2 as sysdba
