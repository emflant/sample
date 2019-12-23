docker run --name my-mariadb \
	--network mariadb-net \
	-p 3306:3306 \
	-e MYSQL_ROOT_PASSWORD=root_pw \
	-e MYSQL_DATABASE=test \
	-e MYSQL_USER=maria_user \
	-e MYSQL_PASSWORD=maria_pw \
	-v mariadb-data-vol:/var/lib/mysql \
	-v $PWD/mount/config:/etc/mysql/conf.d \
	-d mariadb-1
