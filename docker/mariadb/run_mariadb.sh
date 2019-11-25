docker run --name mariadb \
	-e MYSQL_ROOT_PASSWORD=root_pw \
	-e MYSQL_DATABASE=maria_db \
	-e MYSQL_USER=maria_user \
	-e MYSQL_PASSWORD=maria_pw \
	-v $WORKSPACE/sample/docker/mariadb/mount:/var/lib/mysql \
	-d mariadb-1
