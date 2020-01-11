docker run --rm -ti --network oracle-xe-net \
	oracle/database:18.4.0-xe \
	sqlplus pdbadmin/1@//my-oracle-xe:1521/XEPDB1
