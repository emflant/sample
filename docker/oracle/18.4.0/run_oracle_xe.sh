docker run --rm --name my-oracle-xe \
	--network oracle-xe-net \
	-p 1521:1521 -p 5500:5500 \
	-e ORACLE_PWD=1 \
	-v $PWD/mount/data:/opt/oracle/oradata \
	oracle/database:18.4.0-xe
