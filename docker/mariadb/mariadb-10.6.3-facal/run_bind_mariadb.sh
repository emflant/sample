docker run --name my-mariadb \
	--network my-net \
	-p 3306:3306 \
	-e MYSQL_ROOT_PASSWORD=root_pw \
	-e MYSQL_DATABASE=test \
	-e MYSQL_USER=maria_user \
	-e MYSQL_PASSWORD=maria_pw \
	-e MYSQL_HISTFILE=/doc/.mysql_history_`date +%Y%m%d%H%M` \
	-v $PWD/mount/data:/var/lib/mysql \
	-v $PWD/mount/config:/etc/mysql/conf.d \
	-v $PWD/mount/doc:/doc \
	-v ~/data:/data \
	-d mariadb-2
